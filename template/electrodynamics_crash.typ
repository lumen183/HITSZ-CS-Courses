#import "../lib.typ": *
#show: conf
#show table: set align(center)

#default-cover(
  title: [电动力学期末突击讲义],
  subtitle: [考前压缩版：公式、题型、例题与应试方法],
)

#default-outline()

#pagebreak()
= 考前总览：先拿分，再深入

#introduction[麦克斯韦方程组][边界条件][分离变量法][镜像法][平面波][推迟势][洛伦兹变换]

== 复习优先级

#conclusion[三轮突击策略][
  #table(
    columns: 4,
    table.header[轮次][目标][必须会][做题方式],
    [第一轮 2小时], [建立公式地图], [麦克斯韦方程、边界条件、波方程、洛伦兹变换], [只背结构，不纠结推导],
    [第二轮 4小时], [掌握题型套路], [静电边值、镜像法、平面波反射折射、相对论时空题], [每类题做一题标准解],
    [第三轮 2小时], [补易错点], [符号、单位、法向方向、相位、伽马因子], [看错题和结论框],
  )
]

#note[应试总原则][
  1. 先写控制方程：静电写泊松/拉普拉斯，静磁写矢势方程，波动写亥姆霍兹方程，相对论写洛伦兹变换。\
  2. 再写边界条件：法向、切向、是否有自由面电荷/面电流。\
  3. 最后代入对称性或边界条件求常数。考试给分通常按这个顺序给。
]

== 一页公式地图

#theorem[麦克斯韦方程组：微分形式与积分形式][
  真空或宏观介质中常用形式：

  $ nabla dot bold(D) = rho_f $
  $ nabla times bold(E) = - partial bold(B) / partial t $
  $ nabla dot bold(B) = 0 $
  $ nabla times bold(H) = bold(J)_f + partial bold(D) / partial t $

  对应积分形式：

  $ integral_S bold(D) dot d bold(S) = Q_f $
  $ integral_C bold(E) dot d bold(l) = - d / d t integral_S bold(B) dot d bold(S) $
  $ integral_S bold(B) dot d bold(S) = 0 $
  $ integral_C bold(H) dot d bold(l) = I_f + d / d t integral_S bold(D) dot d bold(S) $
]

#property[边界条件速记][
  法向看通量，切向看环量：

  - 电位移法向：$hat(n) dot (bold(D)_2 - bold(D)_1) = sigma_f$
  - 电场切向：$hat(n) times (bold(E)_2 - bold(E)_1) = 0$
  - 磁感应强度法向：$hat(n) dot (bold(B)_2 - bold(B)_1) = 0$
  - 磁场强度切向：$hat(n) times (bold(H)_2 - bold(H)_1) = bold(K)_f$

  方向约定：$hat(n)$ 从区域 1 指向区域 2。写反会导致符号全错。
]

#conclusion[题型-公式对照表][
  #table(
    columns: 3,
    table.header[题型][第一行该写什么][核心套路],
    [静电边值], [$nabla^2 phi = -rho / epsilon$ 或 $nabla^2 phi = 0$], [分离变量或镜像法，先定边界],
    [导体静电], [$bold(E)=0$ 于导体内部，导体表面等势], [电荷在表面，场线垂直表面],
    [静磁矢势], [$nabla^2 bold(A) = -mu bold(J)$], [选库仑规范 $nabla dot bold(A)=0$],
    [平面波], [$bold(k) dot bold(E)_0 = 0$, $bold(B)=1/omega bold(k) times bold(E)$], [三者互相垂直，右手系],
    [反射折射], [切向 $E,H$ 连续], [写入射、反射、透射波，解振幅比],
    [相对论], [$gamma = 1 / sqrt(1-beta^2)$], [先判同地/同时，再用洛伦兹变换],
  )
]

#pagebreak()
= 数学准备：矢量分析和场论

#introduction[散度][旋度][高斯定理][斯托克斯定理][常用坐标系]

== 必背算子意义

#definition[散度与旋度][
  - 散度 $nabla dot bold(A)$：衡量场在一点的源强，静电中 $nabla dot bold(E)=rho/epsilon_0$。
  - 旋度 $nabla times bold(A)$：衡量场在一点的环流强度，静电场 $nabla times bold(E)=0$，感生电场一般不为 0。
  - 梯度 $nabla phi$：标量场增长最快方向。静电中 $bold(E)=-nabla phi$。
]

#theorem[两个积分定理][
  高斯定理：
  $ integral_V nabla dot bold(A) d V = integral_S bold(A) dot d bold(S) $

  斯托克斯定理：
  $ integral_S (nabla times bold(A)) dot d bold(S) = integral_C bold(A) dot d bold(l) $

  用法：看到闭合曲面积分优先想到散度；看到闭合回路积分优先想到旋度。
]

#property[矢量恒等式速记][
  #table(
    columns: 2,
    table.header[恒等式][考试用途],
    [$nabla times (nabla phi) = 0$], [由标势定义静电场],
    [$nabla dot (nabla times bold(A)) = 0$], [由矢势自动满足 $nabla dot bold(B)=0$],
    [$nabla times (nabla times bold(A)) = nabla(nabla dot bold(A)) - nabla^2 bold(A)$], [推矢势波动方程],
    [$nabla^2 (1/r) = -4 pi delta(bold(r))$], [格林函数和点电荷势],
  )
]

#example[用高斯定理判断点电荷电场][
  点电荷 $q$ 位于原点，利用对称性求真空中电场。
]

#solution[
  以原点为球心取半径 $r$ 的球面，电场沿径向且大小处处相同：

  $ integral_S bold(E) dot d bold(S) = E 4 pi r^2 = q / epsilon_0 $

  得

  $ bold(E) = q / (4 pi epsilon_0 r^2) hat(r) $

  考试写法：先写对称性，再写高斯面，最后写方向。只写大小容易丢方向分。
]

== 应试提醒

#conclusion[数学准备高频坑][
  1. $nabla times bold(E)=0$ 只对静电场成立；随时间变化的磁场会产生有旋电场。\
  2. 闭合曲面法向默认向外；介质边界法向要按题设区域方向。\
  3. 拉普拉斯方程的解不是随便猜，必须由边界条件确定。
]

#pagebreak()
= 电磁现象的普遍规律

#introduction[电荷守恒][麦克斯韦方程组][介质方程][边界关系][能量和能流]

== 电荷守恒与连续性方程

#theorem[连续性方程][
  电荷守恒的微分形式：

  $ partial rho / partial t + nabla dot bold(J) = 0 $

  稳恒电流条件：

  $ nabla dot bold(J) = 0 $

  含义：如果某处电流净流出为正，则该处电荷密度随时间减小。
]

== 介质中的宏观场

#definition[极化与磁化][
  - 电极化强度 $bold(P)$：单位体积电偶极矩。
  - 磁化强度 $bold(M)$：单位体积磁偶极矩。
  - 电位移：$bold(D)=epsilon_0 bold(E)+bold(P)$。
  - 磁场强度：$bold(H)=bold(B)/mu_0 - bold(M)$。

  线性各向同性介质中：
  $bold(D)=epsilon bold(E)$，$bold(B)=mu bold(H)$。
]

#property[束缚电荷与束缚电流][
  #table(
    columns: 3,
    table.header[对象][体密度][面密度],
    [束缚电荷], [$rho_b = -nabla dot bold(P)$], [$sigma_b = bold(P) dot hat(n)$],
    [束缚电流], [$bold(J)_b = nabla times bold(M)$], [$bold(K)_b = bold(M) times hat(n)$],
  )

  应试判断：题目问自由源就用 $bold(D), bold(H)$；题目问总场或真实力就回到 $bold(E), bold(B)$。
]

== 能量与能流

#theorem[坡印廷定理][
  电磁场能量密度：
  $ u = 1/2 (bold(E) dot bold(D) + bold(B) dot bold(H)) $

  坡印廷矢量：
  $ bold(S) = bold(E) times bold(H) $

  能量守恒结构：
  场能减少 = 对电流做功 + 向外流出的能流。
]

#example[平行板电容器的能量密度][
  面积为 $A$、间距为 $d$ 的平行板电容器中充满真空，电压为 $U$，求场能。
]

#solution[
  忽略边缘效应，板间电场 $E=U/d$。真空中能量密度：

  $u = 1/2 epsilon_0 E^2 = 1/2 epsilon_0 (U/d)^2$

  体积为 $A d$，所以

  $W = u A d = 1/2 epsilon_0 A U^2 / d$

  又 $C=epsilon_0 A/d$，因此 $W=1/2 C U^2$。考试中可用该题检验能量密度公式。
]

#problem[边界条件快题][
  两介质交界面无自由面电荷、无自由面电流，写出四个边界关系。
]

#solution[
  无自由源时 $sigma_f=0, bold(K)_f=0$，所以：

  $hat(n) dot (bold(D)_2-bold(D)_1)=0$
  $hat(n) times (bold(E)_2-bold(E)_1)=0$
  $hat(n) dot (bold(B)_2-bold(B)_1)=0$
  $hat(n) times (bold(H)_2-bold(H)_1)=0$

  若是导体表面静电问题，还要补一句：导体内部 $bold(E)=0$，表面为等势面。
]

#pagebreak()
= 静电场：边值问题是大头

#introduction[标势][泊松方程][唯一性定理][分离变量法][镜像法][格林函数]

== 标势与泊松方程

#definition[静电标势][
  静电场无旋：
  $nabla times bold(E)=0$

  因此可令：
  $bold(E) = -nabla phi$

  代入高斯定律得泊松方程：
  $nabla^2 phi = -rho / epsilon$

  无电荷区域：
  $nabla^2 phi = 0$
]

#theorem[唯一性定理][
  静电边值问题中，只要区域内电荷分布给定，并且边界上给定电势 $phi$，或给定法向电场 $partial phi / partial n$，则区域内解唯一。

  考试价值：镜像法和分离变量法求出的势，只要满足方程和边界条件，就不用再证明它是唯一正确解。
]

== 分离变量法

#property[分离变量四步法][
  1. 选坐标：看边界形状，平面选直角，球面选球坐标，圆柱选柱坐标。\
  2. 写通解：拉普拉斯方程分离后保留满足有限性的项。\
  3. 套边界：用边界电势确定系数。\
  4. 求电场：$bold(E)=-nabla phi$，不要忘记方向。
]

#example[接地平面与点电荷的镜像法][
  点电荷 $q$ 位于无限大接地导体平面 $z=0$ 上方 $z=a$ 处，求 $z>0$ 区域的电势。
]

#solution[
  镜像电荷取 $-q$，放在 $z=-a$。对 $z>0$：

  $ phi(bold(r)) = q / (4 pi epsilon_0) (1 / r_+ - 1 / r_-) $

  其中

  $ r_+ = sqrt(x^2 + y^2 + (z-a)^2) $
  $ r_- = sqrt(x^2 + y^2 + (z+a)^2) $

  检查边界：在 $z=0$，有 $r_+=r_-$，故 $phi=0$，满足接地平面条件。由唯一性定理，该解正确。
]

#problem[镜像法应试题][
  电荷 $q$ 距接地无限导体平面距离为 $a$，求电荷受到的力。
]

#solution[
  原问题中导体对电荷的作用等效为镜像电荷 $-q$ 对 $q$ 的库仑力。两电荷距离为 $2a$：

  $ F = 1 / (4 pi epsilon_0) q^2 / (2a)^2 = q^2 / (16 pi epsilon_0 a^2) $

  方向指向导体平面，即吸引。矢量写法可写为 $bold(F) = - q^2 / (16 pi epsilon_0 a^2) hat(z)$，其中 $hat(z)$ 指向上方。
]

== 格林函数法

#definition[格林函数思想][
  格林函数是单位点源的响应。静电中常用：

  $nabla^2 G(bold(r), bold(r)') = - delta(bold(r)-bold(r)') / epsilon_0$

  自由空间格林函数：

  $G = 1 / (4 pi epsilon_0 |bold(r)-bold(r)'|)$

  考试若只问思想：把任意电荷分布看成许多点电荷叠加。
]

#conclusion[静电场必会题型][
  #table(
    columns: 3,
    table.header[题型][关键条件][拿分句式],
    [导体静电平衡], [导体内部 $bold(E)=0$], [表面等势，电场垂直表面],
    [镜像法], [接地平面/接地球面/介质平面], [构造镜像电荷，使边界势满足条件],
    [分离变量], [矩形、球形、柱形边界], [保留有限项，利用正交性求系数],
    [电容], [$C=Q/U$], [先求电势差，再由定义求电容],
  )
]

#pagebreak()
= 静磁场：矢势、磁标势与磁矩

#introduction[矢势][库仑规范][磁标势][磁偶极矩][超导体]

== 矢势与静磁方程

#definition[磁矢势][
  因为 $nabla dot bold(B)=0$，可令：

  $bold(B)=nabla times bold(A)$

  取库仑规范 $nabla dot bold(A)=0$，静磁场中：

  $nabla^2 bold(A) = -mu_0 bold(J)$

  解的形式类似静电势：

  $bold(A)(bold(r)) = mu_0 / (4 pi) integral bold(J)(bold(r)') / |bold(r)-bold(r)'| d V'$
]

#theorem[毕奥-萨伐尔定律][
  电流元产生的磁感应强度：

  $d bold(B) = mu_0 / (4 pi) I d bold(l)' times hat(R) / R^2$

  常见结果：
  - 无限长直导线：$B = mu_0 I / (2 pi r)$
  - 圆电流中心：$B = mu_0 I / (2 R)$
]

#definition[磁标势][
  在无自由电流区域，$nabla times bold(H)=0$，可令：

  $bold(H) = -nabla phi_m$

  注意：磁标势只适用于无电流区域。绕电流一圈时磁场环流不为零，不能全局定义单值磁标势。
]

== 磁偶极矩

#property[磁偶极矩][
  平面小电流环磁偶极矩：

  $bold(m) = I bold(S)$

  远区磁场与电偶极场形式相似：

  $bold(B) = mu_0 / (4 pi r^3) (3 (bold(m) dot hat(r)) hat(r) - bold(m))$

  在外磁场中的力矩：

  $bold(N) = bold(m) times bold(B)$
]

#example[无限长直导线磁场][
  用安培环路定理求无限长直导线外距离 $r$ 处的磁场。
]

#solution[
  取以导线为轴的圆形安培环路。由对称性，$bold(B)$ 沿切向且大小处处相同：

  $ integral_C bold(B) dot d bold(l) = B 2 pi r = mu_0 I $

  所以

  $ B = mu_0 I / (2 pi r) $

  方向由右手螺旋定则确定。考试中必须写出“方向由右手定则确定”，否则只得到大小。
]

#problem[磁介质边界题][
  两磁介质分界面无自由面电流，磁导率分别为 $mu_1, mu_2$。若界面两侧磁场强度与法线夹角为 $theta_1, theta_2$，求折射关系。
]

#solution[
  无自由面电流：
  $H_(1t)=H_(2t)$

  磁感应强度法向连续：
  $B_(1n)=B_(2n)$，即 $mu_1 H_(1n)=mu_2 H_(2n)$。

  由 $tan theta = H_t / H_n$ 得：

  $ tan theta_1 / tan theta_2 = mu_1 / mu_2 $

  若题目用 $bold(B)$ 与法线夹角，关系会倒过来。先看角是对 $H$ 还是对 $B$ 定义。
]

#conclusion[静磁场易错点][
  1. $bold(B)$ 的法向连续，$bold(H)$ 的切向在无自由面电流时连续。\
  2. 磁标势不能跨越有电流穿过的区域全局使用。\
  3. 磁偶极矩方向由右手定则确定，不是面积矢量任意方向。
]

#pagebreak()
= 电磁波传播：平面波、界面、导体、波导

#introduction[波动方程][平面波][反射折射][导体中传播][波导]

== 真空与介质中的平面波

#theorem[电磁波波动方程][
  无源均匀介质中：

  $nabla^2 bold(E) - mu epsilon partial^2 bold(E) / partial t^2 = 0$
  $nabla^2 bold(B) - mu epsilon partial^2 bold(B) / partial t^2 = 0$

  波速：

  $v = 1 / sqrt(mu epsilon)$

  真空中 $c=1/sqrt(mu_0 epsilon_0)$。
]

#property[单色平面波结构][
  设
  $bold(E)=bold(E)_0 cos(bold(k) dot bold(r) - omega t)$

  则：
  - $bold(k) dot bold(E)_0 = 0$
  - $bold(k) dot bold(B)_0 = 0$
  - $bold(B)_0 = 1/omega bold(k) times bold(E)_0$
  - $E_0 / H_0 = sqrt(mu / epsilon)$，称为波阻抗

  记忆：$bold(E), bold(H), bold(k)$ 两两垂直且成右手系。
]

== 反射和折射

#theorem[法拉第边界推出的相位匹配][
  平面波入射到平面界面时，界面上任意时刻相位必须匹配，因此：

  $omega_i = omega_r = omega_t$

  切向波矢相等：

  $k_i sin theta_i = k_r sin theta_r = k_t sin theta_t$

  得到反射定律和折射定律：

  $theta_r = theta_i$
  $n_1 sin theta_i = n_2 sin theta_t$
]

#definition[垂直入射反射透射系数][
  波阻抗 $eta = sqrt(mu/epsilon)$。电场振幅反射系数：

  $r = E_r / E_i = (eta_2 - eta_1) / (eta_2 + eta_1)$

  电场振幅透射系数：

  $t = E_t / E_i = 2 eta_2 / (eta_2 + eta_1)$

  若两介质 $mu$ 近似相同，也可用折射率 $n$ 表示：$r=(n_1-n_2)/(n_1+n_2)$。
]

== 导体中传播与趋肤深度

#property[良导体中的趋肤效应][
  良导体中电磁波振幅按深度衰减：

  $E(z) = E_0 exp(-z / delta) cos(k z - omega t)$

  趋肤深度：

  $delta = sqrt(2 / (omega mu sigma))$

  频率越高、电导率越大、磁导率越大，趋肤深度越小。
]

#example[平面波的磁场方向][
  真空中平面波沿 $+z$ 方向传播，电场为 $bold(E)=E_0 cos(k z - omega t) hat(x)$。求磁场。
]

#solution[
  平面波满足

  $bold(B)=1/omega bold(k) times bold(E)$

  其中 $bold(k)=k hat(z)$，故

  $bold(B)=k/omega E_0 cos(k z - omega t) hat(y)$

  真空中 $k/omega=1/c$，所以

  $bold(B)=E_0/c cos(k z - omega t) hat(y)$

  方向检查：$hat(x) times hat(y)=hat(z)$，能流沿 $+z$，正确。
]

#problem[垂直入射快算][
  电磁波从真空垂直入射到折射率为 $n$、磁导率近似为 $mu_0$ 的介质，求电场反射系数。
]

#solution[
  当 $mu_1 approx mu_2$ 时，波阻抗 $eta=eta_0/n$。代入

  $r=(eta_2-eta_1)/(eta_2+eta_1)$

  得

  $r=(eta_0/n - eta_0)/(eta_0/n + eta_0) = (1-n)/(1+n)$

  若 $n>1$，反射电场反相。
]

#conclusion[电磁波章节拿分点][
  #table(
    columns: 3,
    table.header[考点][必写公式][易错点],
    [平面波方向], [$bold(B)=1/omega bold(k) times bold(E)$], [叉乘顺序不能反],
    [折射定律], [$n_1 sin theta_i = n_2 sin theta_t$], [角度相对法线，不是界面],
    [垂直入射], [$r=(eta_2-eta_1)/(eta_2+eta_1)$], [用波阻抗最稳],
    [导体传播], [$delta=sqrt(2/(omega mu sigma))$], [振幅衰减不是能量衰减],
    [波导], [截止频率以下不传播], [相速度可大于 $c$，群速度小于 $c$],
  )
]

#pagebreak()
= 势、推迟势、辐射和动量

#introduction[规范变换][洛伦兹规范][推迟势][电偶极辐射][电磁场动量]

== 标势、矢势与规范

#definition[电磁势][
  一般电磁场可写为：

  $bold(B)=nabla times bold(A)$

  $bold(E)=-nabla phi - partial bold(A) / partial t$

  规范变换：

  $bold(A)' = bold(A) + nabla psi$

  $phi' = phi - partial psi / partial t$

  变换后 $bold(E), bold(B)$ 不变。
]

#theorem[洛伦兹规范与达朗贝尔方程][
  洛伦兹规范：

  $nabla dot bold(A) + 1/c^2 partial phi / partial t = 0$

  势满足波动方程：

  $nabla^2 phi - 1/c^2 partial^2 phi / partial t^2 = -rho / epsilon_0$

  $nabla^2 bold(A) - 1/c^2 partial^2 bold(A) / partial t^2 = -mu_0 bold(J)$
]

== 推迟势

#definition[推迟势][
  电磁作用以有限速度传播，远处此刻看到的是源在推迟时刻的状态：

  $t_r = t - |bold(r)-bold(r)'| / c$

  真空中：

  $phi(bold(r),t)=1/(4 pi epsilon_0) integral rho(bold(r)',t_r) / |bold(r)-bold(r)'| d V'$

  $bold(A)(bold(r),t)=mu_0/(4 pi) integral bold(J)(bold(r)',t_r) / |bold(r)-bold(r)'| d V'$
]

== 电偶极辐射

#property[电偶极辐射定性结论][
  对振荡电偶极矩 $bold(p)(t)$：
  - 辐射场远区随 $1/r$ 衰减。
  - 辐射功率与偶极矩二阶时间导数平方成正比。
  - 角分布满足 $sin^2 theta$：沿偶极轴方向为零，垂直偶极轴方向最强。

  考试若不要求推导，记住“横波、远区 $1/r$、$sin^2 theta$”。
]

#theorem[电磁动量][
  电磁场动量密度：

  $bold(g)=bold(S)/c^2$

  真空中也可写为：

  $bold(g)=epsilon_0 bold(E) times bold(B)$

  辐射压来自电磁波携带动量。完全吸收时压强 $p=I/c$，完全反射时 $p=2I/c$。
]

#example[推迟时间判断][
  观察点与源点距离为 $R$。若观察时刻为 $t$，源的哪个时刻决定观察点的势？
]

#solution[
  推迟时刻为

  $t_r = t - R/c$

  势函数中源项必须写成 $rho(bold(r)', t_r)$ 或 $bold(J)(bold(r)', t_r)$。若题目给的是正弦源，例如 $p(t)=p_0 cos omega t$，远处相位应写成 $cos omega (t-R/c)$。
]

#problem[辐射方向判断][
  沿 $z$ 轴振荡的电偶极子在哪个方向辐射最强？哪个方向为零？
]

#solution[
  电偶极辐射角分布正比于 $sin^2 theta$，其中 $theta$ 是观察方向与偶极轴的夹角。

  - $theta=pi/2$ 时最强，即垂直 $z$ 轴的赤道平面最强。
  - $theta=0$ 或 $pi$ 时为零，即沿 $+z$ 和 $-z$ 轴方向无辐射。
]

#conclusion[势与辐射章节易错点][
  1. 规范变换不改变物理场，不要把 $phi, bold(A)$ 当成唯一可观测量。\
  2. 推迟势中的距离是源点到场点的距离。\
  3. 近区场衰减可有 $1/r^3, 1/r^2$，真正辐射远区主项是 $1/r$。
]

#pagebreak()
= 狭义相对论：变换、四维形式与电动力学不变性

#introduction[洛伦兹变换][时空效应][四矢量][场变换][相对论力学]

== 洛伦兹变换

#definition[标准洛伦兹变换][
  $S'$ 系相对 $S$ 系沿 $+x$ 方向以速度 $v$ 运动。令

  $beta = v/c$
  $gamma = 1 / sqrt(1-beta^2)$

  则

  $x' = gamma (x - v t)$
  $t' = gamma (t - v x / c^2)$
  $y'=y$
  $z'=z$

  逆变换把 $v$ 换成 $-v$。
]

#property[三个经典效应][
  #table(
    columns: 3,
    table.header[效应][公式][判断关键],
    [同时的相对性], [$Delta t' = gamma (Delta t - v Delta x / c^2)$], [不同地点的同时事件，别的系一般不同时],
    [长度收缩], [$L = L_0 / gamma$], [测运动物体长度，必须在本系同时测两端],
    [时间膨胀], [$Delta t = gamma Delta tau$], [$Delta tau$ 是同一地点发生的固有时],
  )
]

== 四维形式

#definition[四矢量速记][
  四维坐标：
  $x^mu = (c t, x, y, z)$

  固有时间：
  $d tau = d t / gamma$

  四速度：
  $U^mu = gamma(c, bold(v))$

  四动量：
  $p^mu = (E/c, bold(p))$

  能量动量关系：
  $E^2 = p^2 c^2 + m^2 c^4$
]

== 电磁场变换

#theorem[沿 $x$ 方向 boost 的场变换结构][
  平行于运动方向的场分量不变：

  $E'_x=E_x$，$B'_x=B_x$

  垂直分量会混合：

  $E'_y = gamma(E_y - v B_z)$
  $E'_z = gamma(E_z + v B_y)$
  $B'_y = gamma(B_y + v E_z / c^2)$
  $B'_z = gamma(B_z - v E_y / c^2)$

  记忆：电场和磁场不是两个孤立对象，而是同一个电磁场张量在不同参考系下的分量。
]

#example[时间膨胀快题][
  某粒子在自身参考系寿命为 $tau_0$，实验室中以速度 $v$ 运动。实验室测得寿命是多少？
]

#solution[
  粒子自身参考系中，产生和衰变发生在同一地点，所以 $tau_0$ 是固有时。

  实验室测得时间：

  $t = gamma tau_0 = tau_0 / sqrt(1-v^2/c^2)$

  应试判断句：同一粒子的一生在粒子静止系同地发生，因此该时间是固有时。
]

#problem[长度收缩陷阱][
  一根杆在自身静止系长度为 $L_0$，沿杆方向相对实验室以速度 $v$ 运动。实验室测得杆长是多少？为什么必须“同时”测两端？
]

#solution[
  实验室测得运动杆长度：

  $L = L_0 / gamma$

  长度是同一参考系中两端位置坐标之差，因此实验室必须在同一实验室时刻记录杆两端位置。若不同时测量，两端坐标差混入了杆的运动距离，不是长度。
]

#conclusion[相对论答题模板][
  1. 先写 $beta, gamma$。\
  2. 标出哪个量是固有长度/固有时。\
  3. 若涉及两个事件，列 $Delta x, Delta t$，再代洛伦兹变换。\
  4. 电磁场题先分解为平行和垂直运动方向的分量。
]

#pagebreak()
= 考前最后一页：高频问答与检查清单

#problemset[
  #problem[
    *为什么静电场可以引入标势？*\
    写出理由和标势定义。
  ]

  #solution[
    静电场满足 $nabla times bold(E)=0$，无旋场可以表示为某个标量函数的梯度，因此定义
    $bold(E)=-nabla phi$。
    负号表示电场方向是电势下降最快方向。
  ]

  #problem[
    *位移电流项为什么重要？*\
    说明麦克斯韦在安培环路定律中加入 $partial bold(D)/partial t$ 的物理意义。
  ]

  #solution[
    位移电流项使安培环路定律与电荷守恒相容，并允许变化电场产生磁场。加入后可推出电磁波方程，说明电磁扰动能以有限速度传播。
  ]

  #problem[
    *镜像法为什么成立？*\
    用唯一性定理解释镜像法。
  ]

  #solution[
    镜像法在求解区域外放置虚构电荷，使求解区域内的势满足泊松/拉普拉斯方程，并满足真实边界条件。由唯一性定理，该构造出的解就是真实区域内唯一解。
  ]

  #problem[
    *平面波中 $bold(E)$、$bold(B)$、传播方向有什么关系？*\
    写出方向关系和大小关系。
  ]

  #solution[
    三者两两垂直，$bold(E) times bold(H)$ 指向传播方向。真空中 $B=E/c$，介质中 $E/H=sqrt(mu/epsilon)$。
  ]

  #problem[
    *什么是推迟势？*\
    写出推迟时间并说明物理意义。
  ]

  #solution[
    推迟时间 $t_r=t-R/c$。观察点在时刻 $t$ 的势由源在较早时刻 $t_r$ 的状态决定，体现电磁相互作用以光速传播。
  ]

  #problem[
    *如何判断相对论题中的固有时？*\
    给出判断标准。
  ]

  #solution[
    固有时是两个事件发生在同一惯性系同一地点时，该系钟测得的时间间隔。看到“粒子自身寿命”“钟自己的两次读数”，通常就是固有时。
  ]
]

#conclusion[最后检查清单][
  #table(
    columns: 2,
    table.header[检查项][考场动作],
    [法向方向], [边界题先画 $hat(n)$，再写跳跃条件],
    [单位和常数], [真空写 $epsilon_0, mu_0$；介质写 $epsilon, mu$],
    [导体条件], [静电导体内部 $E=0$，表面等势],
    [波的方向], [用 $bold(E) times bold(H)$ 检查传播方向],
    [相对论], [先找固有时/固有长，再套公式],
    [解题完整度], [控制方程 + 边界条件 + 通解/构造 + 常数 + 结论],
  )
]
