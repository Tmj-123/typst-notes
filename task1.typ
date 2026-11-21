#import "@local/modern-cug-report:0.1.3": *
#show: doc => template(doc, footer: "CUG水文气象学2026", header: "公式推导")

= 静力平衡：从垂直动量方程到压高公式

== 问题

观测表明气压随高度降低。下面从垂直动量方程出发，经尺度分析得到静力平衡，再积分给出气压高度公式。

== 出发点：垂直动量方程

取 $z$ 轴向上，$w$ 为垂直速度，$rho$ 为密度，$phi$ 为纬度。垂直方向受力为
#box-blue[
$ dv(w,t) = -1/rho dv(p,z) - g + 2 Omega u cos phi $ <eq_1>
]
其中 $g$ 为有效重力（已含离心力）。

== 尺度分析

取中纬度天气尺度：$U ~ 10 "m/s"$，$W ~ 0.01 "m/s"$，$L_z ~ 10^4 "m"$，
$T ~ 10^5 "s"$，逐项估计见表 @tab_1。
#box-blue[
#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    stroke: none,
    inset: 5pt,
    [*项*], [*表达式*], [*量级* ($"m/s"^2$)],
    [垂直加速度], [$dv(w,t) ~ W /T$], [$10^(-7)$],
    [重力], [$g$], [$10^(1)$],
    [科氏力垂直分量], [$2 Omega u cos phi$], [$10^(-3)$],
  ),
  caption: [垂直动量方程各项的量级估计],
  kind: table,
) <tab_1>
]
由表 @tab_1，垂直加速度比重力小约八个量级，科氏力垂直分量也小约四个量级，故
#box-blue[
$ dv(w,t) approx 0,  2 Omega u cos phi approx 0  $
]
代入 @eq_1 即得
#box-blue[
$ dv(p,z) = - rho g , $ <eq_2>
]
即*静力平衡*：重力 $rho g$ 被上下表面的气压差所平衡。它只约束垂直方向，空气仍可水平运动。

== 积分形式

代入状态方程 $p = rho R_d T$ 消去 $rho$：
#box-blue[
$ (dif p)/p = - g/(R_d T) dif z  $ <eq_3>
]
  从 $z_1$ 积分到 $z_2$：
#box-blue[
  $ p_2 = p_1 exp(- g/R_d integral_(z_1)^(z_2) (dif z)/T) $ <eq_4>
]
若近似等温，$T = T_0$，定义标高 $H = (R_d T_0)/g$，则
#box-blue[
$ p(z) = p_0 exp(-z/H) $ <eq_5>
]
取 $T_0 = 280 "K"$，得 $H approx 8.2 "km"$：每上升一个标高，气压降为原来的
$1/e approx 36.8%$，$5.5 "km"$ 处约为地面的一半。

对 @eq_3 取对数积分，得*压高公式*
#box-blue[
$ z_2 - z_1 = (R_d overline(T))/g ln(p_1/p_2) , $ <eq_6>
]
其中 $overline(T)$ 为两等压面间的平均虚温。于是 1000–500 hPa 的厚度为
#box-blue[
$ Delta z = (R_d overline(T))/g ln(1000/500) approx 20.3 overline(T) "m/K"  $ <eq-dz>
]
代入 $overline(T) = 270 "K"$ 得 $Delta z approx 5.5 "km"$。厚度正比于平均温度，
天气图上的厚度线即平均温度等值线：暖区厚、冷区薄，是温度平流分析的基础。

== 检验与适用条件

+ *量纲*：$[dv(p,z)] = "Pa/m" = [rho g]$，一致。
+ *极限*：$g -> 0$ 时 $dv(p,z) -> 0$，气压均匀；$T -> 0$ 时 $H -> 0$，
  气压随高度急剧下降，均符合常理。
+ *数值*：$p_0 = 1000 "hPa"$、$H = 8 "km"$ 时，$z = 8 "km"$ 处 $p approx 368 "hPa"$，
  与标准大气（约 356 hPa）接近。

静力平衡要求垂直加速度远小于 $g$，即水平尺度大、垂直运动弱。积雨云、龙卷中
$W$ 可达 $10$–$50 "m/s"$，$dv(w,t)$ 与 $g$ 同量级，静力平衡失效，须用非静力模式。

== 小结

  垂直动量方程 $->$ 尺度分析 $->$ 静力平衡
  $dv(p,z) = -rho g$ $->$ 状态方程 $->$ $p(z)$、$Delta z$


静力平衡把三维问题降为“水平运动 + 垂直静力诊断”，是天气学、地转风、厚度与热成风
分析的共同基础。



