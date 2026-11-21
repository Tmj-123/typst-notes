#import "@local/modern-cug-report:0.1.3": *
#show: doc => template(doc, footer: "CUG水文气象学2026", header: "")
$
  pdv(p,z) = - rho g
$
$
  pdv(u,x) + pdv(v,y) + pdv(w,z) = 0
$
$
  pdv(u,t) + u pdv(u,x) + v pdv(u,y) + w pdv(u,z) = - 1/rho pdv(p,x) + nu (pdv(u,x,2) + pdv(u,y,2) + pdv(u,z,2))
$
$
  dv(u,xi) = pdv(u,x) + pdv(u,y) + pdv(u,z)
$
$
  p = rho R T
$
$
  pdv(u,x) + pdv(v,y) + pdv(w,p) = 0

$
$ 
  
$
#box-green
#box-red[
  *注意*
]
#beamer-block[
  *注意*
]
= 一级标题
== 二级标题
=== 三级标题
==== 四级标题
'print("Hello, Typst!")'

'''python
print("Hello, Typst!")
'''
$
  p= rho R T
$
$p= rho R T$

1.今天

2.昨天

- today

+ tomorrow
+ yesterday

$y = a x + b$<eq_1>

引用公式#[@eq_1]

#figure（

  #image("c1030f78622a7015b7094fe12339a0e5.png", width: 200pt)
  #caption("Typst Logo")
