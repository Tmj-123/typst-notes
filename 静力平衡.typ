#import "@local/modern-cug-report:0.1.3": *
#show: doc => template(doc, header: "第 1 章 编程基础", footer: "水文学 2026")

#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")
#set text(size: 10.5pt)
#set par(leading: 0.72em)

// 教学要点：交叉引用显示为“式 (1)”“表 1”
#show ref: it => {
  let el = it.element
  if el == none { return it }
  let loc = el.location()
  if el.func() == math.equation {
    link(loc, [式 ] + numbering("(1)", ..counter(math.equation).at(loc)))
  } else if el.func() == figure {
    let kind = if el.kind == table { [表] } else { [图] }
    link(loc, kind + [ ] + numbering("1", ..counter(figure.where(kind: el.kind)).at(loc)))
  } else {
    it
  }
}

// 教学要点：用 show 规则为所有行间公式统一加框
#show math.equation.where(block: true): it => align(center, box(
  width: 100%,
  stroke: 0.5pt + luma(110),
  inset: (x: 10pt, y: 5pt),
  radius: 2pt,
  it,
))

= 静力平衡：从垂直动量方程到压高公式

== 问题

观测表明气压随高度降低。下面从垂直动量方程出发，经尺度分析得到静力平衡，再积分给出气压高度公式。

== 出发点：垂直动量方程

取 $z$ 轴向上，$w$ 为垂直速度，$rho$ 为密度，$phi$ 为纬度。垂直方向受力为

$ (dif w)/(dif t) = -1/rho (dif p)/(dif z) - g + 2 Omega u cos phi . $ <eq-mom>

其中 $g$ 为有效重力（已含离心力）。

== 尺度分析

取中纬度天气尺度：$U ~ 10 "m/s"$，$W ~ 0.01 "m/s"$，$L_z ~ 10^4 "m"$，
$T ~ 10^5 "s"$，逐项估计见表 @tab-scale。

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    stroke: none,
    inset: 5pt,
    [*项*], [*表达式*], [*量级* ($"m/s"^2$)],
    [垂直加速度], [$dif w \/ dif t ~ W \/ T$], [$10^(-7)$],
    [重力], [$g$], [$10^(1)$],
    [科氏力垂直分量], [$2 Omega u cos phi$], [$10^(-3)$],
  ),
  caption: [垂直动量方程各项的量级估计。],
  kind: table,
) <tab-scale>

由表 @tab-scale，垂直加速度比重力小约八个量级，科氏力垂直分量也小约四个量级，故

$ (dif w)/(dif t) approx 0, quad 2 Omega u cos phi approx 0 . $

代入 @eq-mom 即得

$ (dif p)/(dif z) = - rho g , $ <eq-hydro>

即*静力平衡*：重力 $rho g$ 被上下表面的气压差所平衡。它只约束垂直方向，空气仍可水平运动。

== 积分形式

代入状态方程 $p = rho R_d T$ 消去 $rho$：

$ (dif p)/p = - g/(R_d T) dif z . $ <eq-sep>

#block(breakable: false)[
  从 $z_1$ 积分到 $z_2$：

  $ p_2 = p_1 exp(- g/R_d integral_(z_1)^(z_2) (dif z)/T ) . $ <eq-int>
]

若近似等温，$T = T_0$，定义标高 $H = (R_d T_0)/g$，则

$ p(z) = p_0 exp(-z/H) . $ <eq-iso>

取 $T_0 = 280 "K"$，得 $H approx 8.2 "km"$：每上升一个标高，气压降为原来的
$1\/e approx 36.8%$，$5.5 "km"$ 处约为地面的一半。

对 @eq-sep 取对数积分，得*压高公式*

$ z_2 - z_1 = (R_d overline(T))/g ln(p_1/p_2) , $ <eq-thick>

其中 $overline(T)$ 为两等压面间的平均虚温。于是 1000–500 hPa 的厚度为

$ Delta z = (R_d overline(T))/g ln(1000/500) approx 20.3 overline(T) "m/K" . $ <eq-dz>

代入 $overline(T) = 270 "K"$ 得 $Delta z approx 5.5 "km"$。厚度正比于平均温度，
天气图上的厚度线即平均温度等值线：暖区厚、冷区薄，是温度平流分析的基础。

== 检验与适用条件

+ *量纲*：$[dif p \/ dif z] = "Pa/m" = [rho g]$，一致。
+ *极限*：$g -> 0$ 时 $dif p \/ dif z -> 0$，气压均匀；$T -> 0$ 时 $H -> 0$，
  气压随高度急剧下降，均符合直觉。
+ *数值*：$p_0 = 1000 "hPa"$、$H = 8 "km"$ 时，$z = 8 "km"$ 处 $p approx 368 "hPa"$，
  与标准大气（约 356 hPa）接近。

静力平衡要求垂直加速度远小于 $g$，即水平尺度大、垂直运动弱。积雨云、龙卷中
$W$ 可达 $10$–$50 "m/s"$，$dif w \/ dif t$ 与 $g$ 同量级，静力平衡失效，须用非静力模式。

== 小结

#align(center)[
  垂直动量方程 $arrow.r.double$ 尺度分析 $arrow.r.double$
  $dif p \/ dif z = -rho g$ $arrow.r.double$ 状态方程 $arrow.r.double$ $p(z)$、$Delta z$
]

静力平衡把三维问题降为“水平运动 + 垂直静力诊断”，是天气学、地转风、厚度与热成风
分析的共同基础。

#pagebreak()

== 附：操作步骤与问题

+ 导入模板，设置页眉页脚；标题用 `=`，自动编号。
+ 公式用 `$ ... $`，`#set math.equation(numbering: "(1)")` 编号，
  `<标签>` 定义、`@标签` 引用，如 @eq-hydro。
+ 表格、图片统一放进 `#figure(...)` 并加 `caption`，正文用 `@标签` 引用，如 @tab-scale。
+ 用 `#show math.equation.where(block: true): ...` 给全部行间公式加框：

```typst
#show math.equation.where(block: true): it => align(center, box(
  width: 100%, stroke: 0.5pt, inset: 6pt, radius: 2pt, it,
))
```

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  [*功能*], [*关键写法*],
  [标题], [`= 一级标题`，自动编号],
  [行间公式], [`$ ... $ <eq>`，编号并加框],
  [引用], [`@eq`、`@tab`，显示“式 (1)”“表 1”],
  [图片], [`#figure(image(...), caption: [...])`],
  [表格], [`#figure(table(...), caption: [...], kind: table)`],
  [代码], [三个反引号包围，首行写语言名],
)

#figure(
  image("figure/phydro.png", width: 62%),
  caption: [静力平衡下气压随高度的指数衰减；点线标出 $500 "hPa"$ 与 $5.5 "km"$。],
) <fig-p>

如 @fig-p 所示，两等压面之间的厚度随平均温度升高而增大，与 @eq-dz 一致。

遇到的问题：直接 `box` 包裹公式会挤压编号位置，改为 `align` 内嵌 `width: 100%`
的 `box` 后编号回到行尾；框与说明文字可能被分页拆开，用 `#block(breakable: false)`
固定为一块；中英混排行距偏紧，用 `#set par(leading: 0.72em)` 微调。
