---
title: 第十三课 MATLAB 数据可视化（二）
date: 2026-11-27
tags:
  - matlab/lecture
  - matlab/visualization
matlab_mirror: true
matlab_source: "F:/MATLAB course/课程讲义/13_MATLAB数据可视化二.md"
matlab_source_sha256: 0165158b630b9da644d8c73f41bc6d61bc25001399afdefecfb8b0a3e3b17329
---

# 第十三课：MATLAB 数据可视化（二）

来源：[[MATLAB/课程资料/原始课件/第十三课 MATLAB数据可视化（二）.pdf|第十三课原件]]，58 页。接续[[MATLAB/课程讲义/12_MATLAB数据可视化一|第十二课]]的采样与对象句柄。本课进到三个尺度：同图比较不同量纲，给三维几何叠加颜色，再让同一图形对象随时间变化。

## 1. 同一横轴，不一定共用纵轴（第 2–8 页）

- **双纵轴。** 第 2、4 页用 `yyaxis left` 和 `yyaxis right` 比较 GDP 与城镇居民人均可支配收入。分别激活一侧再设 `ylabel`、`ylim` 和颜色；图例传入两条对象句柄，避免顺序歧义。原例省略了数据，不把教学合成数据当成历史数据。两条曲线共用年份，但垂直位置不能直接比较；改变左右量程就能改变视觉上的斜率与重合。
- **子图。** `subplot(m,n,k)` 按行编号；`subplot('Position',[left bottom width height])` 用相对图窗的归一化位置。第 6 页先画 $\sin t$、$\sin(10t)$，再画二者逐元素乘积及包络。尺寸规整时用 `tiledlayout` 配 `nexttile`；手工位置保留给确实需要跨格或定制布局的图。
- **读图不是求解。** `[x,y]=ginput(n)` 返回当前轴的**数据坐标**，不是屏幕像素；交互点只能粗定位 $(x+2)^x=2$ 的解。要报数值根，用点击附近的变号区间喂给 `fzero`，再报函数残差。课件显示位数不等于点击精度。

## 2. 将坐标、高度与颜色分开（第 9–23 页）

| 操作 | 对象与意义 |
|---|---|
| `plot3(x,y,z)` | 依次连接三维坐标；第 9 页用 $\sin t,\cos t,\cos2t$ 描线与标记 |
| `[X,Y]=meshgrid(x,y)` | $X,Y$ 大小是“y 点数 × x 点数”；同位置的数组元素组成一对坐标 |
| `surf(X,Y,Z)` / `mesh(X,Y,Z)` | 前者绘制面，后者强调网线；第 11 页叠加 `stem3` 可见采样点，不能把插值看成真实采样 |
| `surf(X,Y,Z,C)` | $Z$ 定高度，$C$ 定颜色；默认 $C=Z$。改变 `CData` 不会使曲面变形 |
| `view(az,el)` / `view([vx vy vz])` | 用方位、仰角或方向向量设视角；不改变数据或物体几何 |
| `colormap(Ax,map)`、`clim(Ax,[a b])`、`colorbar(Ax)` | 分别选色表、设颜色数值区间、说明颜色所代表的值；不同轴可有不同色表 |

**着色不是照明。** `shading faceted` 每面有边，`flat` 面内同色无网线，`interp` 在顶点颜色间插值。`alpha` 或 `FaceAlpha` 控制透明度，0 完全透明，1 不透明。`light` 的 `infinite` 表示平行光，`local` 表示点光源；`lighting flat/gouraud/none` 改的是表面照明，`material` 改环境、漫反射和镜面等参数，不改变原本的 `CData`。本机建议用 `gouraud` 替换旧 `phong`；见 [MathWorks surf 属性](https://www.mathworks.com/help/matlab/ref/surf.html)。

**留洞还是压平？** 第 22 页用 `Z(mask)=NaN` 令相关面片不画；第 23 页设为 0，区域仍然画出，只是移到 $z=0$。比较二者之前保存一份原始 `Z`，不要覆盖随后要分析的数据。

## 3. 等位线、导数着色与体切片（第 29–37 页）

- `contour` 画等值线，`contourf` 填充相邻等值之间的区域。`[C,H]=contourf(X,Y,Z,levels)` 的第一个输出 `C` 是等值线数据矩阵，第二个 `H` 才是图元；标签可用 `clabel(C,H,levels)`。单一高度用 `[v v]`，例如 `[0 0]`。
- 第 31–35 页保持同一几何 $(X,Y,Z)$，分别以高度、横向一阶差分、$\lvert4\,\mathrm{del2}(Z)\rvert$ 着色。若解释成偏导，必须把真实网格间距交给 `gradient`；二维均匀网格可用 `4*del2(Z,hx,hy)` 估计 $\Delta Z$。它是拉普拉斯数值量，不等同于曲面的高斯或平均曲率。对 $pZ$，一阶导随 $p$ 变号，拉普拉斯绝对值随 $\lvert p\rvert$ 缩放；同一序列比较时固定色轴。
- `slice(X,Y,Z,V,xs,ys,zs)` 用平面表示体标量场 $V(x,y,z)$。`meshgrid(x,y,z)` 的数组顺序是 y × x × z。第 36 页的 y、x、z 点数为 17、21、26，四个面为 $x=\pm0.7,y=0,z=0$；位置不落在网格上时要插值。

## 4. 从句柄动画到可复播 GIF（第 24–28、38–53 页）

1. **更新内容。** 课件用 `rotate` 转动物体、`view` 转视角、`comet/comet3` 观察轨迹、`spinmap` 改色表；第 42–44 页则更新两条线的 `XData/YData/ZData`。封闭曲线若重复存首尾点，循环索引宜只用不重复的 $N$ 点，用 `mod(k-1,N)+1` 回到 MATLAB 下标。第 43 页以 `nt=151` 取余却把零替换成 `Nt=150`，会重复索引 150 并漏掉 151；若只保留 150 个不重复的周期点，用 1 基公式可避免这类错位。
2. **编码画面。** 固定图窗尺寸、轴限、色轴；在循环内更新句柄，再 `drawnow`、`getframe`。帧数组含 `cdata` 与 `colormap`，`movie(F,Frames,k,fps)` 可预览；`pause` 只是实时等待，不替代 GIF 帧延时。旋转数据、换相机视角、重排色表是三个不同操作。
3. **先把数据和几何设好，再加表现。** 第 25–28 页把索引图像作为 `CDataMapping='direct'` 的纹理贴球，再用外壳网线展示透视。`hidden off` 改网格遮挡；不是令整个实体变透明。第 45 页旧 `Renderer='zbuffer'` 不要照抄；新版 [Figure 渲染说明](https://www.mathworks.com/help/matlab/ref/matlab.ui.figure.html) 说明显式设置渲染器已无效。
4. **写入文件并回读。** 彩色帧先用 `frame2im`、`rgb2ind` 得到索引阵与颜色表；首帧 `imwrite` 新建、设 `LoopCount` 和 `DelayTime`，其余用 `WriteMode='append'`。参见 [MathWorks imwrite](https://www.mathworks.com/help/matlab/ref/imwrite.html)。回读要确认帧数、画幅和至少两帧有变化；只是一个能打开的静图还没有完成动画。第 47–48 页的中间 `.fig` 文件是教学做法，不是必要步骤。

## 5. 已运行的独立短示范

- [图形对象示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w13_axes_demo.m)：用合成速度和温度对齐时间，再在同一页验证双纵轴、$Z$ 与颜色分离、等位线、三维切片。练习先调色轴，观察几何坐标为何不动。
- [逐帧 GIF 示范](file:///F:/MATLAB%20course/%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81/w13_gif_demo.m)：一条固定正弦线与一个运动标记，逐帧捕获并回读。练习改变帧间延时与帧数，比较动画耗时与流畅度。这不是期末作品。

## 6. 五轮引导路线

| 轮次 | 动手验收 |
|---|---|
| W13.1 / 5 | 配两种单位的纵轴、比较子图；用 `ginput` 取粗略位置后核对 |
| W13.2 / 5 | 对同一采样面切换高度/颜色、着色和光照，比较 NaN 镂空与置零 |
| W13.3 / 5 | 画一条指定高度的等位线及体切片，检查维度和色条单位 |
| W13.4 / 5 | 保持图元句柄，固定画幅，逐帧导出并回读 |
| W13.5 / 5 | 本人完成[不用交的网格自测](file:///F:/MATLAB%20course/%E8%87%AA%E6%B5%8B/%E7%AC%AC%E5%8D%81%E4%B8%89%E8%AF%BE%E5%8F%82%E8%80%83%E7%BB%83%E4%B9%A0/README.md)，再决定期末方向 |

第 54–55 页的独立任务见[期末作业入口](file:///F:/MATLAB%20course/%E4%BD%9C%E4%B8%9A/%E6%9C%9F%E6%9C%AB%E4%BD%9C%E4%B8%9A/README.md)。第 56–57 页的参考练习、课后反馈明确不用交；本单元新增不移动学习进度。

Obsidian 导航：[[MATLAB/README|MATLAB 课程总览]]。
