#import "../lib.typ": *
#show: conf
#show table: set align(center)

#default-cover(
  title: [电动力学期末复习讲义],
  subtitle: [完整讲义版：按课件章节展开],
)

#default-outline()

#pagebreak()
= 使用说明与全课地图

#introduction[数学工具][麦克斯韦方程][静电边值][静磁场][电磁波][推迟势与辐射][狭义相对论]

== 这份讲义怎么用

#note[定位][
  这是完整讲义版，不是只背公式的速查表。每章都按“概念 - 方程 - 解题方法 - 例题 - 应试提醒”的结构整理，适合考前一到两天系统过课。
]

#conclusion[三种版本的关系][
  #table(
    columns: 4,
    table.header[版本][适用时间][重点][使用方式],
    [考前突击版], [考前半天], [公式、套路、易错点], [快速翻，做最后确认],
    [完整讲义版], [考前 1-3 天], [课程主线、推导和典型题], [按章复习，配合课件回看],
    [公式速查版], [进考场前], [公式和边界条件], [只看表格和框],
  )
]

== 全课主线

#theorem[电动力学的中心结构][
  整门课可以压缩成一句话：给定电荷电流和边界条件，用麦克斯韦方程组求场，并理解场的能量、动量和相对论变换。

  $nabla dot bold(D) = rho_f$
  $nabla times bold(E) = - partial bold(B) / partial t$
  $nabla dot bold(B) = 0$
  $nabla times bold(H) = bold(J)_f + partial bold(D) / partial t$
]

#property[从方程到题型][
  #table(
    columns: 3,
    table.header[物理情形][方程退化][主要题型],
    [静电], [$nabla times bold(E)=0$, $bold(E)=-nabla phi$], [泊松方程、导体边界、镜像法、分离变量],
    [静磁], [$partial_t=0$, $nabla times bold(H)=bold(J)$], [矢势、安培定律、磁标势、磁偶极矩],
    [无源均匀介质], [波动方程], [平面波、反射折射、导体传播、波导],
    [含时源], [势的波动方程], [推迟势、电偶极辐射、电磁动量],
    [高速运动], [洛伦兹协变], [时空变换、四矢量、场变换],
  )
]

#pagebreak()
= 绪论与数学准备

#introduction[矢量代数][梯度散度旋度][积分定理][δ函数][坐标系]

== 矢量场的三个局部量

#definition[梯度][
  标量场 $phi(bold(r))$ 的梯度 $nabla phi$ 指向增长最快方向。静电学中定义

  $bold(E) = - nabla phi$

  负号表示正电荷受力方向是电势下降方向。考试中只要出现“电势”，通常下一步就是用梯度求电场。
]

#definition[散度][
  散度衡量场线从一点发散出来的强度：

  $nabla dot bold(A) = lim_(Delta V -> 0) 1/(Delta V) integral_(Delta S) bold(A) dot d bold(S)$

  电磁学里最重要的散度方程是

  $nabla dot bold(E) = rho / epsilon_0$

  它说电荷是电场的源。
]

#definition[旋度][
  旋度衡量局部环流：

  $nabla times bold(A)$

  静电场无旋：$nabla times bold(E)=0$；感生电场一般有旋：

  $nabla times bold(E) = - partial bold(B) / partial t$
]

== 两个积分定理

#theorem[高斯定理][
  $integral_V nabla dot bold(A) d V = integral_S bold(A) dot d bold(S)$

  解题信号：闭合曲面、通量、球/柱/面对称。
]

#theorem[斯托克斯定理][
  $integral_S (nabla times bold(A)) dot d bold(S) = integral_C bold(A) dot d bold(l)$

  解题信号：闭合回路、环量、感应电动势、安培环路。
]

#property[常用恒等式][
  #table(
    columns: 2,
    table.header[公式][用途],
    [$nabla times (nabla phi)=0$], [静电场可引入标势],
    [$nabla dot (nabla times bold(A))=0$], [磁场可引入矢势],
    [$nabla times (nabla times bold(A))=nabla(nabla dot bold(A))-nabla^2 bold(A)$], [推导矢势方程],
    [$nabla dot (phi bold(A))=nabla phi dot bold(A)+phi nabla dot bold(A)$], [格林公式、能量推导],
    [$nabla^2 (1/r)=-4 pi delta(bold(r))$], [点源格林函数],
  )
]

== δ函数和点源

#definition[三维 δ 函数][
  $delta(bold(r)-bold(r)')$ 的作用是从积分中抽取源点：

  $integral f(bold(r)') delta(bold(r)-bold(r)') d V' = f(bold(r))$

  点电荷密度可写成：

  $rho(bold(r)) = q delta(bold(r)-bold(r)_0)$
]

#example[
  *例：点电荷势函数满足泊松方程*\
  证明 $phi=q/(4 pi epsilon_0 r)$ 对应原点点电荷。
]

#solution[
  利用恒等式 $nabla^2 (1/r)=-4 pi delta(bold(r))$：

  $nabla^2 phi = q/(4 pi epsilon_0) nabla^2 (1/r) = - q/epsilon_0 delta(bold(r))$

  与泊松方程 $nabla^2 phi=-rho/epsilon_0$ 比较，得 $rho=q delta(bold(r))$。
]

== 坐标系选择

#conclusion[坐标系和对称性][
  #table(
    columns: 3,
    table.header[边界/源形状][推荐坐标][典型方法],
    [无限平面、矩形盒], [直角坐标], [分离变量、傅里叶级数],
    [无限长直线、圆柱], [柱坐标], [高斯面/安培环路、贝塞尔型分离变量],
    [球面、点源、球壳], [球坐标], [勒让德多项式、多极展开],
  )
]

#pagebreak()
= 电磁现象的普遍规律

#introduction[电荷守恒][真空方程][介质方程][边界条件][能量守恒]

== 电荷和电流

#definition[电荷守恒][
  电荷守恒的微分形式：

  $partial rho / partial t + nabla dot bold(J) = 0$

  积分形式：

  $d Q_V / d t = - integral_S bold(J) dot d bold(S)$

  稳恒电流满足 $nabla dot bold(J)=0$，电流线不能在空间中断开。
]

#example[
  *例：由安培定律看位移电流的必要性*\
  若只写 $nabla times bold(H)=bold(J)$，说明为什么会和电荷守恒冲突。
]

#solution[
  对两边取散度：

  $nabla dot (nabla times bold(H)) = nabla dot bold(J)$

  左边恒为 0，于是得到 $nabla dot bold(J)=0$。这只允许稳恒电流，不能描述电荷密度随时间变化的情况。

  加入位移电流后：

  $nabla times bold(H)=bold(J)+partial bold(D)/partial t$

  取散度并用 $nabla dot bold(D)=rho$，得

  $0=nabla dot bold(J)+partial rho/partial t$

  正好是连续性方程。
]

== 真空中的麦克斯韦方程

#theorem[真空方程组][
  $nabla dot bold(E)=rho/epsilon_0$
  $nabla times bold(E)=-partial bold(B)/partial t$
  $nabla dot bold(B)=0$
  $nabla times bold(B)=mu_0 bold(J)+mu_0 epsilon_0 partial bold(E)/partial t$

  在无源区 $rho=0, bold(J)=0$，这组方程直接推出电磁波。
]

#proof[
  对法拉第定律取旋度：

  $nabla times (nabla times bold(E)) = - partial / partial t (nabla times bold(B))$

  无源真空中 $nabla dot bold(E)=0$，且 $nabla times bold(B)=mu_0 epsilon_0 partial bold(E)/partial t$，所以

  $-nabla^2 bold(E) = -mu_0 epsilon_0 partial^2 bold(E)/partial t^2$

  即

  $nabla^2 bold(E)-1/c^2 partial^2 bold(E)/partial t^2=0$

  其中 $c=1/sqrt(mu_0 epsilon_0)$。
]

== 介质中的宏观方程

#definition[极化与磁化][
  电极化强度 $bold(P)$ 表示单位体积电偶极矩，磁化强度 $bold(M)$ 表示单位体积磁偶极矩。

  $bold(D)=epsilon_0 bold(E)+bold(P)$

  $bold(H)=bold(B)/mu_0-bold(M)$

  宏观方程只显含自由源：

  $nabla dot bold(D)=rho_f$
  $nabla times bold(H)=bold(J)_f+partial bold(D)/partial t$
]

#property[线性介质][
  线性各向同性介质：

  $bold(D)=epsilon bold(E)$
  $bold(B)=mu bold(H)$

  常用参数：

  $epsilon=epsilon_r epsilon_0$
  $mu=mu_r mu_0$
  $v=1/sqrt(mu epsilon)$
  $n=c/v=sqrt(epsilon_r mu_r)$
]

== 边界条件

#theorem[电磁场边值关系][
  设法向 $hat(n)$ 从介质 1 指向介质 2：

  $hat(n) dot (bold(D)_2-bold(D)_1)=sigma_f$

  $hat(n) times (bold(E)_2-bold(E)_1)=0$

  $hat(n) dot (bold(B)_2-bold(B)_1)=0$

  $hat(n) times (bold(H)_2-bold(H)_1)=bold(K)_f$
]

#example[
  *例：静电导体表面的场*\
  说明导体表面附近电场方向和大小。
]

#solution[
  静电平衡时导体内部 $bold(E)=0$，导体为等势体。表面切向电场必须为 0，否则自由电荷会沿表面运动。

  对导体表面作小柱形高斯面，柱体一半在导体内，一半在外部：

  $E_n A = sigma / epsilon_0 A$

  所以外侧法向电场

  $bold(E)=sigma/epsilon_0 hat(n)$

  方向垂直导体表面。
]

== 能量守恒

#theorem[坡印廷定理][
  能量密度：

  $u=1/2(epsilon E^2 + 1/mu B^2)$

  坡印廷矢量：

  $bold(S)=bold(E) times bold(H)$

  微分形式可理解为：

  场能变化率 + 能流流出率 + 场对电流做功率 = 0。
]

#conclusion[本章应试提醒][
  1. 边界题先画法向，再写四个跳跃关系。\
  2. 问自由电荷/自由电流，用 $bold(D), bold(H)$；问总受力和能量，常回到 $bold(E), bold(B)$。\
  3. 位移电流是电磁波存在的关键。
]

#pagebreak()
= 静电场

#introduction[标势][泊松方程][唯一性定理][分离变量法][镜像法][格林函数][多极展开]

== 标势和泊松方程

#definition[静电势][
  静电条件下 $nabla times bold(E)=0$，故

  $bold(E)=-nabla phi$

  代入 $nabla dot bold(E)=rho/epsilon$ 得

  $nabla^2 phi=-rho/epsilon$

  无电荷区域满足拉普拉斯方程：

  $nabla^2 phi=0$
]

#property[电势的边界条件][
  - 给定导体电势：第一类边界条件，$phi|_S=f$。
  - 给定表面电荷或法向电场：第二类边界条件，$partial phi/partial n|_S=g$。
  - 两介质界面：$phi$ 连续，$epsilon partial phi/partial n$ 的跳跃由自由面电荷决定。
]

== 唯一性定理

#theorem[唯一性定理][
  区域内电荷密度给定，边界上给定电势，静电边值问题解唯一。若给定法向导数，则解差一个常数。
]

#proof[
  设有两个解 $phi_1, phi_2$，令 $u=phi_1-phi_2$。区域内 $nabla^2 u=0$，边界上 $u=0$。

  使用格林第一恒等式：

  $integral_V (nabla u)^2 d V = integral_S u partial u / partial n d S - integral_V u nabla^2 u d V$

  右边为 0，因此 $nabla u=0$，再由边界 $u=0$ 得 $u=0$。所以解唯一。
]

== 分离变量法

#definition[方法流程][
  分离变量法适用于边界规则、区域内满足拉普拉斯方程的问题。

  1. 选择坐标系。\
  2. 令 $phi=X(x)Y(y)Z(z)$ 或球坐标中 $phi=R(r)Theta(theta)Phi(phi_"az")$。\
  3. 得到各方向本征函数。\
  4. 用边界条件和正交性展开系数。\
  5. 求 $bold(E)=-nabla phi$。
]

#example[
  *例：二维矩形区域的分离变量框架*\
  区域 $0<x<a, 0<y<b$ 内无电荷，三边接地，$y=b$ 边给定 $phi(x,b)=V_0 sin(pi x/a)$，求势。
]

#solution[
  解拉普拉斯方程：

  $partial_x^2 phi + partial_y^2 phi=0$

  三边接地要求 $X(0)=X(a)=0$，故

  $X_n=sin(n pi x/a)$

  对应 $Y_n=sinh(n pi y/a)$，因为 $y=0$ 接地。

  通解：

  $phi=sum_(n=1)^infinity A_n sin(n pi x/a) sinh(n pi y/a)$

  边界只含第一项：

  $A_1 sinh(pi b/a)=V_0$

  故

  $phi=V_0 sin(pi x/a) sinh(pi y/a) / sinh(pi b/a)$
]

== 镜像法

#definition[镜像法][
  镜像法把导体或介质边界的影响等效为求解区域外的虚构电荷。只要构造出的电势满足：

  1. 区域内泊松/拉普拉斯方程；\
  2. 真实边界条件；\
  3. 无穷远条件；

  由唯一性定理，它就是正确解。
]

#example[
  *例：点电荷与接地无限平面*\
  点电荷 $q$ 位于 $z=a$，导体平面 $z=0$ 接地，求上半空间电势和受力。
]

#solution[
  放置镜像电荷 $-q$ 于 $z=-a$。上半空间电势：

  $phi= q/(4 pi epsilon_0) (1/r_+ - 1/r_-)$

  $r_+=sqrt(x^2+y^2+(z-a)^2)$

  $r_-=sqrt(x^2+y^2+(z+a)^2)$

  电荷受力等效为镜像电荷作用：

  $F=q^2/(16 pi epsilon_0 a^2)$

  方向指向导体平面。
]

== 格林函数和多极展开

#definition[格林函数法][
  泊松方程的自由空间解：

  $phi(bold(r))=1/(4 pi epsilon_0) integral rho(bold(r)')/|bold(r)-bold(r)'| d V'$

  边界存在时，需要构造满足边界条件的格林函数。
]

#definition[多极展开][
  远处电势可按 $1/r$ 展开：

  单极项：
  $phi_0=1/(4 pi epsilon_0) Q/r$

  电偶极项：
  $phi_1=1/(4 pi epsilon_0) bold(p) dot hat(r) / r^2$

  其中
  $bold(p)=integral rho(bold(r)') bold(r)' d V'$。
]

#problem[
  *电偶极远场题*\
  电偶极矩 $bold(p)=p hat(z)$，写出远区电势，并说明电场大致方向。
]

#solution[
  远区电势：

  $phi=1/(4 pi epsilon_0) p cos theta / r^2$

  电场为 $bold(E)=-nabla phi$，在球坐标中同时有径向和极角方向分量。应试中若不要求完整分量，写出电势和“场线从正电荷出发到负电荷终止，关于偶极轴轴对称”即可。
]

#conclusion[静电场考试方法][
  1. 看到导体，先写“导体等势，内部电场为零”。\
  2. 看到接地平面/球面，优先想镜像法。\
  3. 看到规则区域给边界电势，优先想分离变量。\
  4. 看到远场，优先想多极展开，先判断总电荷是否为零。
]

#pagebreak()
= 静磁场

#introduction[矢势][库仑规范][磁标势][磁偶极矩][磁介质][超导体]

== 矢势和静磁方程

#definition[磁矢势][
  由 $nabla dot bold(B)=0$，可令

  $bold(B)=nabla times bold(A)$

  规范自由度：$bold(A)'=bold(A)+nabla psi$ 不改变 $bold(B)$。

  常取库仑规范：

  $nabla dot bold(A)=0$
]

#theorem[矢势泊松方程][
  静磁场中

  $nabla times bold(B)=mu_0 bold(J)$

  代入 $bold(B)=nabla times bold(A)$：

  $nabla(nabla dot bold(A))-nabla^2 bold(A)=mu_0 bold(J)$

  在库仑规范下：

  $nabla^2 bold(A)=-mu_0 bold(J)$

  解为

  $bold(A)=mu_0/(4 pi) integral bold(J)(bold(r)')/|bold(r)-bold(r)'| d V'$
]

== 安培定律和毕奥-萨伐尔定律

#theorem[毕奥-萨伐尔定律][
  稳恒线电流：

  $bold(B)(bold(r))=mu_0 I/(4 pi) integral d bold(l)' times hat(R) / R^2$

  其中 $bold(R)=bold(r)-bold(r)'$。
]

#example[
  *例：无限长直导线*\
  求距导线 $r$ 处磁场。
]

#solution[
  由对称性磁场沿环向，取圆形安培环路：

  $B 2 pi r=mu_0 I$

  所以

  $B=mu_0 I/(2 pi r)$

  方向由右手螺旋定则决定。
]

== 磁标势

#definition[磁标势的适用条件][
  无自由电流区域满足 $nabla times bold(H)=0$，可引入

  $bold(H)=-nabla phi_m$

  但若区域中有电流穿过，$integral bold(H) dot d bold(l)=I_f$，磁标势无法全局单值。
]

#problem[
  *磁标势判断题*\
  无限长直导线外部空间能否定义全局单值磁标势？
]

#solution[
  不能。虽然导线外局部无电流，局部可令 $bold(H)=-nabla phi_m$，但绕导线一圈：

  $integral bold(H) dot d bold(l)=I$

  若 $phi_m$ 全局单值，闭合环路积分应为 0，矛盾。因此只能局部定义或定义多值势。
]

== 磁偶极矩和磁介质

#definition[磁偶极矩][
  小电流环磁偶极矩：

  $bold(m)=I bold(S)$

  远区磁场：

  $bold(B)=mu_0/(4 pi r^3) (3(bold(m) dot hat(r))hat(r)-bold(m))$

  外磁场中力矩：

  $bold(N)=bold(m) times bold(B)$
]

#property[磁介质边界][
  $B_n$ 连续：

  $hat(n) dot (bold(B)_2-bold(B)_1)=0$

  $H_t$ 跳跃由自由面电流决定：

  $hat(n) times (bold(H)_2-bold(H)_1)=bold(K)_f$

  无自由面电流时 $H_t$ 连续。
]

#example[
  *例：磁场折射关系*\
  无自由面电流，两磁介质磁导率 $mu_1, mu_2$，$bold(H)$ 与法线夹角为 $theta_1, theta_2$，求关系。
]

#solution[
  $H_t$ 连续，$B_n$ 连续：

  $H_(1t)=H_(2t)$

  $mu_1 H_(1n)=mu_2 H_(2n)$

  因 $tan theta=H_t/H_n$，得

  $tan theta_1 / tan theta_2 = mu_1 / mu_2$
]

== 超导体电磁性质

#definition[完全抗磁性][
  理想超导体内部磁感应强度为 0，表现为迈斯纳效应。与普通理想导体不同，超导体不仅保持原有磁通，还会主动排斥磁场。
]

#conclusion[静磁场考试方法][
  1. 有高对称电流，优先安培环路定理。\
  2. 一般电流分布，写矢势泊松方程。\
  3. 无电流区域可以考虑磁标势，但要检查是否能全局单值。\
  4. 边界题记住 $B_n$ 连续、$H_t$ 看自由面电流。
]

#pagebreak()
= 电磁波的传播

#introduction[平面波][极化][反射折射][导体中传播][波导]

== 无源介质中的波动方程

#theorem[波动方程和波速][
  在无源、均匀、线性介质中：

  $nabla^2 bold(E)-mu epsilon partial^2 bold(E)/partial t^2=0$

  $nabla^2 bold(B)-mu epsilon partial^2 bold(B)/partial t^2=0$

  波速：

  $v=1/sqrt(mu epsilon)$

  折射率：

  $n=c/v=sqrt(epsilon_r mu_r)$
]

== 单色平面波

#definition[平面波表示][
  复数表示：

  $bold(E)=bold(E)_0 exp(i(bold(k) dot bold(r)-omega t))$

  实际物理场取实部。色散关系：

  $k=omega sqrt(mu epsilon)$
]

#property[横波关系][
  无源平面波中：

  $bold(k) dot bold(E)_0=0$

  $bold(k) dot bold(B)_0=0$

  $bold(B)_0=1/omega bold(k) times bold(E)_0$

  $E_0/H_0=eta=sqrt(mu/epsilon)$

  其中 $eta$ 是波阻抗。
]

#example[
  *例：由电场写磁场*\
  真空平面波沿 $+z$ 方向传播，$bold(E)=E_0 cos(k z-omega t)hat(x)$，求 $bold(B)$。
]

#solution[
  $bold(k)=k hat(z)$，所以

  $bold(B)=1/omega bold(k) times bold(E)=k/omega E_0 cos(k z-omega t) hat(y)$

  真空中 $k/omega=1/c$，故

  $bold(B)=E_0/c cos(k z-omega t) hat(y)$
]

== 极化

#definition[线极化、圆极化、椭圆极化][
  若电场矢量端点在垂直传播方向的平面内沿直线振动，是线极化；若端点轨迹为圆，是圆极化；一般情况为椭圆极化。

  典型表示：

  $bold(E)=E_x cos(k z-omega t)hat(x)+E_y cos(k z-omega t+delta)hat(y)$

  当 $E_x=E_y$ 且 $delta=plus.minus pi/2$ 时为圆极化。
]

== 反射和折射

#theorem[相位匹配][
  界面上入射波、反射波、透射波相位必须对任意界面点和任意时间匹配。因此：

  $omega_i=omega_r=omega_t$

  $k_i sin theta_i=k_r sin theta_r=k_t sin theta_t$

  得到

  $theta_r=theta_i$

  $n_1 sin theta_i=n_2 sin theta_t$
]

#definition[垂直入射振幅系数][
  波阻抗 $eta=sqrt(mu/epsilon)$。

  电场反射系数：

  $r=(eta_2-eta_1)/(eta_2+eta_1)$

  电场透射系数：

  $t=2 eta_2/(eta_2+eta_1)$

  若 $mu_1 approx mu_2$，则 $r=(n_1-n_2)/(n_1+n_2)$。
]

#problem[
  *垂直入射计算*\
  电磁波从空气垂直入射到折射率 $n=2$ 的非磁介质，求电场反射系数。
]

#solution[
  非磁介质可用

  $r=(n_1-n_2)/(n_1+n_2)$

  空气 $n_1 approx 1$，介质 $n_2=2$：

  $r=(1-2)/(1+2)=-1/3$

  负号表示反射电场相位反转。
]

== 导体中的电磁波

#definition[复波数和趋肤深度][
  导体中欧姆定律 $bold(J)=sigma bold(E)$。良导体中波振幅随深度衰减：

  $E=E_0 exp(-z/delta) cos(k z-omega t)$

  趋肤深度：

  $delta=sqrt(2/(omega mu sigma))$

  频率越高、导电率越大，电磁波越难深入导体。
]

== 波导

#property[波导基本结论][
  金属波导中电磁波只能以特定模式传播。存在截止频率：低于截止频率的波不能沿波导传播。

  常见判断：
  - TEM 波需要两个导体，普通空心矩形波导无 TEM 模。
  - TE 模：$E_z=0, H_z != 0$。
  - TM 模：$H_z=0, E_z != 0$。
]

#conclusion[电磁波考试方法][
  1. 平面波先写 $bold(k) dot bold(E)=0$ 和 $bold(B)=1/omega bold(k) times bold(E)$。\
  2. 界面题先写切向 $E,H$ 连续，再解振幅系数。\
  3. 导体题先判断是否良导体，再套趋肤深度。\
  4. 波导题先判断模式和截止频率。
]

#pagebreak()
= 电磁场的矢势和标势

#introduction[势的定义][规范变换][洛伦兹规范][推迟势][电偶极辐射][电磁动量]

== 一般电磁势

#definition[势的定义][
  由 $nabla dot bold(B)=0$，令

  $bold(B)=nabla times bold(A)$

  代入法拉第定律：

  $nabla times (bold(E)+partial bold(A)/partial t)=0$

  因此存在标势 $phi$：

  $bold(E)=-nabla phi-partial bold(A)/partial t$
]

== 规范变换

#theorem[规范自由度][
  若

  $bold(A)'=bold(A)+nabla psi$

  $phi'=phi-partial psi/partial t$

  则 $bold(E), bold(B)$ 不变。说明势不是唯一的，真正可观测的是场。
]

#property[常用规范][
  #table(
    columns: 3,
    table.header[规范][条件][用途],
    [库仑规范], [$nabla dot bold(A)=0$], [静磁、量子电磁中常见],
    [洛伦兹规范], [$nabla dot bold(A)+1/c^2 partial phi/partial t=0$], [相对论协变、推迟势],
  )
]

== 势的波动方程

#theorem[洛伦兹规范下的达朗贝尔方程][
  在洛伦兹规范下：

  $nabla^2 phi-1/c^2 partial^2 phi/partial t^2=-rho/epsilon_0$

  $nabla^2 bold(A)-1/c^2 partial^2 bold(A)/partial t^2=-mu_0 bold(J)$
]

== 推迟势

#definition[推迟势][
  源点 $bold(r)'$ 到场点 $bold(r)$ 的距离 $R=|bold(r)-bold(r)'|$。场点在时刻 $t$ 的势由源在推迟时刻

  $t_r=t-R/c$

  的状态决定：

  $phi(bold(r),t)=1/(4 pi epsilon_0) integral rho(bold(r)',t_r)/R d V'$

  $bold(A)(bold(r),t)=mu_0/(4 pi) integral bold(J)(bold(r)',t_r)/R d V'$
]

#example[
  *例：振荡源的相位*\
  若源强度正比于 $cos omega t$，远处距离 $R$ 的场相位如何写？
]

#solution[
  远处观察到的是推迟时刻：

  $t_r=t-R/c$

  因此相位写成：

  $cos omega(t-R/c)$

  或等价写成 $cos(omega t-k R)$，其中 $k=omega/c$。
]

== 电偶极辐射

#definition[电偶极辐射图像][
  当电偶极矩 $bold(p)(t)$ 随时间振荡，会向外辐射电磁波。远区辐射场具有：

  - 横波性质；
  - 振幅随 $1/r$ 衰减；
  - 角分布正比于 $sin^2 theta$；
  - 沿偶极轴方向无辐射，垂直偶极轴方向最强。
]

#problem[
  *辐射角分布判断*\
  电偶极子沿 $z$ 轴振荡，哪个方向辐射最强？哪个方向为零？
]

#solution[
  角分布正比于 $sin^2 theta$，$theta$ 为观察方向与 $z$ 轴夹角。

  $theta=pi/2$ 时最大，即赤道平面最强。$theta=0, pi$ 时为 0，即沿偶极轴方向无辐射。
]

== 电磁场动量

#theorem[动量密度和辐射压][
  真空中动量密度：

  $bold(g)=epsilon_0 bold(E) times bold(B)=bold(S)/c^2$

  强度为 $I$ 的光垂直照射：

  完全吸收压强 $p=I/c$。

  完全反射压强 $p=2I/c$。
]

#conclusion[势与辐射考试方法][
  1. 写势时先说明规范。\
  2. 推迟势题一定写 $t_r=t-R/c$。\
  3. 辐射题抓住远区 $1/r$ 和 $sin^2 theta$。\
  4. 动量题用 $bold(S)/c^2$ 和辐射压公式。
]

#pagebreak()
= 狭义相对论

#introduction[实验基础][洛伦兹变换][时空效应][四维形式][场变换][相对论力学]

== 基本原理

#definition[狭义相对论两条基本原理][
  1. 相对性原理：所有惯性系中物理规律形式相同。\
  2. 光速不变原理：真空光速 $c$ 对所有惯性观察者相同。
]

#definition[洛伦兹因子][
  $beta=v/c$

  $gamma=1/sqrt(1-beta^2)$

  只要 $v$ 接近 $c$，所有时间、长度、能量题几乎都会出现 $gamma$。
]

== 洛伦兹变换

#theorem[标准变换][
  $S'$ 相对 $S$ 沿 $+x$ 方向速度 $v$：

  $x'=gamma(x-v t)$

  $t'=gamma(t-v x/c^2)$

  $y'=y$

  $z'=z$

  逆变换把 $v$ 换为 $-v$。
]

#example[
  *例：同时性的相对性*\
  在 $S$ 系中两个事件同时发生，时间差 $Delta t=0$，空间间隔 $Delta x != 0$。求 $S'$ 系时间差。
]

#solution[
  洛伦兹变换给出

  $Delta t'=gamma(Delta t-v Delta x/c^2)$

  代入 $Delta t=0$：

  $Delta t'=-gamma v Delta x/c^2$

  若 $Delta x != 0$，则 $Delta t' != 0$。不同地点的同时事件，在另一惯性系中一般不同时。
]

== 时间膨胀与长度收缩

#property[固有时和固有长][
  #table(
    columns: 3,
    table.header[量][定义][公式],
    [固有时 $Delta tau$], [两个事件在同一参考系同一地点发生时该系测得的时间], [$Delta t=gamma Delta tau$],
    [固有长 $L_0$], [物体自身静止系测得的长度], [$L=L_0/gamma$],
  )
]

#problem[
  *固有时判断*\
  运动粒子自身寿命为 $tau_0$，实验室中速度为 $v$，实验室寿命是多少？
]

#solution[
  粒子产生和衰变在粒子自身参考系同一地点发生，所以 $tau_0$ 是固有时。

  实验室测得：

  $t=gamma tau_0$
]

== 四维形式

#definition[四矢量][
  坐标四矢量：

  $x^mu=(c t, x, y, z)$

  四速度：

  $U^mu=gamma(c, bold(v))$

  四动量：

  $p^mu=(E/c, bold(p))$

  能量动量关系：

  $E^2=p^2 c^2+m^2 c^4$
]

#property[不变量][
  间隔：

  $s^2=c^2 t^2-x^2-y^2-z^2$

  能动量不变量：

  $E^2-p^2 c^2=m^2 c^4$

  考试中“不变量”通常是化简不同参考系计算的钥匙。
]

== 电动力学的相对论不变性

#theorem[沿 $x$ 方向的场变换][
  平行运动方向的分量不变：

  $E'_x=E_x$
  $B'_x=B_x$

  垂直分量混合：

  $E'_y=gamma(E_y-v B_z)$
  $E'_z=gamma(E_z+v B_y)$
  $B'_y=gamma(B_y+v E_z/c^2)$
  $B'_z=gamma(B_z-v E_y/c^2)$
]

#note[物理理解][
  电场和磁场不是两个互不相关的对象。一个参考系中纯电场，换到运动参考系可能同时出现电场和磁场；这正是电动力学和相对论统一的核心。
]

== 相对论力学

#definition[相对论能量动量][
  动量：

  $bold(p)=gamma m bold(v)$

  总能量：

  $E=gamma m c^2$

  静能：

  $E_0=m c^2$

  动能：

  $T=(gamma-1)m c^2$
]

#example[
  *例：高速粒子动能*\
  粒子速度为 $0.8c$，求动能占静能的比例。
]

#solution[
  $beta=0.8$，

  $gamma=1/sqrt(1-0.8^2)=1/sqrt(0.36)=5/3$

  动能：

  $T=(gamma-1)m c^2=(2/3)m c^2$

  所以动能占静能比例为 $2/3$。
]

#conclusion[相对论考试方法][
  1. 先写 $beta$ 和 $gamma$。\
  2. 两事件题列 $Delta x, Delta t$，不要直接套口号。\
  3. 长度题必须强调同一参考系同时测两端。\
  4. 电磁场变换题先把场分解成平行和垂直运动方向的分量。
]

#pagebreak()
= 逐课件详版补充

#introduction[L0 数学准备][L1 普遍规律][L2 静电场][L3 静磁场][L4 电磁波][L5 势和辐射][L6 狭义相对论]

#note[说明][
  本章按 `pdfs/talkemd_1.pdf` 到 `pdfs/talkemd_7.pdf` 的课件顺序补充。前面章节是系统复习版，本章是逐课件覆盖版：尽量把每份课件出现的小节、公式、典型例题和课堂结论都整理成考前可读的形式。
]

== L0 绪论及数学准备：矢量、场论

=== 0-1 矢量运算

#definition[标量积、矢量积、混合积][
  标量积：

  $bold(a) dot bold(b)=a_x b_x+a_y b_y+a_z b_z$

  矢量积：

  $bold(a) times bold(b)=det(mat(hat(i),hat(j),hat(k); a_x,a_y,a_z; b_x,b_y,b_z))$

  混合积：

  $bold(a) dot (bold(b) times bold(c))=bold(b) dot (bold(c) times bold(a))=bold(c) dot (bold(a) times bold(b))$

  混合积满足循环置换，几何意义是平行六面体有向体积。
]

#property[三重矢积和求导法则][
  三重矢积：

  $bold(a) times (bold(b) times bold(c))=(bold(a) dot bold(c))bold(b)-(bold(a) dot bold(b))bold(c)$

  注意它不满足普通交换律。

  求导：

  $d(f bold(a))/d t=f d bold(a)/d t+bold(a) d f/d t$

  $d(bold(a) dot bold(b))/d t=(d bold(a)/d t) dot bold(b)+bold(a) dot (d bold(b)/d t)$

  $d(bold(a) times bold(b))/d t=(d bold(a)/d t) times bold(b)+bold(a) times (d bold(b)/d t)$
]

=== 0-2 场论分析

#definition[场的分类][
  标量场：空间每点对应一个标量，例如电势场、温度场。\
  矢量场：空间每点对应一个矢量，例如电场、磁场、速度场。\
  稳定场：场量不随时间变化；不稳定场：场量随时间变化。
]

#property[方向导数、梯度、散度、旋度][
  方向导数描述标量场沿某方向变化快慢，梯度给出最大增长方向：

  $d phi = nabla phi dot d bold(l)$

  散度对应单位体积净通量：

  $nabla dot bold(A)=lim_(Delta V->0) 1/(Delta V) integral_(Delta S) bold(A) dot d bold(S)$

  旋度对应单位面积环量：

  $(nabla times bold(A)) dot hat(n)=lim_(Delta S->0) 1/(Delta S) integral_(Delta l) bold(A) dot d bold(l)$
]

#theorem[Gauss theorem 与 Stokes theorem][
  高斯定理：

  $integral_V nabla dot bold(A) d V=integral_S bold(A) dot d bold(S)$

  斯托克斯定理：

  $integral_S (nabla times bold(A)) dot d bold(S)=integral_L bold(A) dot d bold(l)$

  考试判断：闭合面用高斯；闭合线用斯托克斯。
]

=== 0-3 正交曲线坐标和 ∇ 运算

#definition[正交曲线坐标的尺度因子][
  若坐标为 $(u_1,u_2,u_3)$，线元可写成

  $d bold(l)=h_1 d u_1 hat(e)_1+h_2 d u_2 hat(e)_2+h_3 d u_3 hat(e)_3$

  其中 $h_i$ 是尺度因子。柱坐标 $(r,theta,z)$ 的尺度因子为 $(1,r,1)$；球坐标 $(r,theta,phi)$ 的尺度因子为 $(1,r,r sin theta)$。
]

#property[柱坐标常用公式][
  对标量 $f(r,theta,z)$：

  $nabla f=hat(r) partial_r f+hat(theta) 1/r partial_theta f+hat(z) partial_z f$

  拉普拉斯：

  $nabla^2 f=1/r partial_r (r partial_r f)+1/r^2 partial_theta^2 f+partial_z^2 f$

  柱对称时只剩 $1/r partial_r(r partial_r f)$。
]

#property[球坐标常用公式][
  对标量 $f(r,theta,phi)$：

  $nabla^2 f=1/r^2 partial_r(r^2 partial_r f)+1/(r^2 sin theta) partial_theta(sin theta partial_theta f)+1/(r^2 sin^2 theta) partial_phi^2 f$

  球对称时：

  $nabla^2 f=1/r^2 d/d r (r^2 d f/d r)$
]

=== 0-4 二阶微分算符和格林定理

#theorem[格林恒等式][
  第一格林恒等式：

  $integral_V (nabla u dot nabla v + u nabla^2 v)d V=integral_S u partial v/partial n d S$

  第二格林恒等式：

  $integral_V (u nabla^2 v-v nabla^2 u)d V=integral_S (u partial v/partial n-v partial u/partial n)d S$

  它们是唯一性定理和格林函数法的基础。
]

#conclusion[L0 应试提醒][
  1. 公式不要只背直角坐标，静电场常用球/柱坐标。\
  2. 看到 $nabla^2(1/r)$，立即想到点源和 δ 函数。\
  3. 三重矢积顺序极易错，推矢势方程时必须用正确恒等式。
]

== L1 第一章：电磁现象的普遍规律

=== 1.1 电荷和电场

#definition[库仑定律与近距作用观点][
  真空中点电荷 $Q$ 在场点产生电场：

  $bold(E)=1/(4 pi epsilon_0) Q bold(r)/r^3$

  另一个电荷 $Q'$ 受力：

  $bold(F)=Q' bold(E)$

  课件强调两种观点：远距作用与近距作用。电动力学采用场作为相互作用媒介。
]

#theorem[高斯定理与静电场旋度][
  积分形式：

  $integral_S bold(E) dot d bold(S)=Q_"in"/epsilon_0$

  微分形式：

  $nabla dot bold(E)=rho/epsilon_0$

  静电场旋度：

  $nabla times bold(E)=0$

  物理意义：电荷是电场的源，静电力线无闭合环流。
]

#example[
  *课件例：均匀带电球*\
  电荷 $Q$ 均匀分布在半径 $a$ 的球内，求电场。
]

#solution[
  球对称。取半径 $r$ 的球面。

  外部 $r>a$：

  $E 4 pi r^2=Q/epsilon_0$

  $bold(E)=Q/(4 pi epsilon_0 r^2)hat(r)$

  内部 $r<a$，包围电荷 $Q_r=Q r^3/a^3$：

  $E 4 pi r^2=Q r^3/(epsilon_0 a^3)$

  $bold(E)=Q r/(4 pi epsilon_0 a^3)hat(r)$

  内部散度为 $rho/epsilon_0$，外部散度为 0，旋度均为 0。
]

=== 1.2 电流和磁场

#definition[电流密度与连续性方程][
  连续电荷运动形成电流密度：

  $bold(J)=rho bold(v)$

  电荷守恒：

  $partial rho/partial t+nabla dot bold(J)=0$

  稳恒条件：$nabla dot bold(J)=0$。
]

#theorem[安培定律和毕奥-萨伐尔定律][
  稳恒电流的磁场满足：

  $nabla times bold(B)=mu_0 bold(J)$

  $nabla dot bold(B)=0$

  线电流磁场：

  $bold(B)=mu_0 I/(4 pi) integral d bold(l)' times hat(R)/R^2$

  电流元相互作用体现磁场的近距作用观点。
]

=== 1.3 麦克斯韦方程组

#theorem[从静场到全电磁场][
  静电：$nabla times bold(E)=0$。\
  感生电场：$nabla times bold(E)=-partial bold(B)/partial t$。\
  稳恒磁场：$nabla times bold(H)=bold(J)$。\
  加入位移电流：$nabla times bold(H)=bold(J)+partial bold(D)/partial t$。

  位移电流项保证安培定律与连续性方程相容。
]

#conclusion[麦克斯韦方程组的物理分工][
  #table(
    columns: 3,
    table.header[方程][源或结构][一句话],
    [$nabla dot bold(D)=rho_f$], [自由电荷], [电荷产生电场通量],
    [$nabla times bold(E)=-partial_t bold(B)$], [变磁场], [变磁场产生涡旋电场],
    [$nabla dot bold(B)=0$], [无磁单极], [磁力线闭合],
    [$nabla times bold(H)=bold(J)_f+partial_t bold(D)$], [电流和变电场], [电流/变电场产生磁场],
  )
]

=== 1.4 介质的电磁性质

#definition[极化、磁化与本构关系][
  电介质：

  $bold(D)=epsilon_0 bold(E)+bold(P)$

  磁介质：

  $bold(H)=bold(B)/mu_0-bold(M)$

  各向同性线性介质：

  $bold(D)=epsilon bold(E)$，$bold(B)=mu bold(H)$。

  各向异性介质中 $D_i=sum_j epsilon_(i j) E_j$，电容率是张量。
]

=== 1.5 电磁场边值关系

#theorem[边值关系完整表][
  $hat(n) dot (bold(D)_2-bold(D)_1)=sigma_f$

  $hat(n) times (bold(E)_2-bold(E)_1)=0$

  $hat(n) dot (bold(B)_2-bold(B)_1)=0$

  $hat(n) times (bold(H)_2-bold(H)_1)=bold(K)_f$

  导体静电边界：$phi|_S="const"$，$epsilon partial phi/partial n=-sigma$（符号依法向约定）。
]

=== 1.6 电磁场的能量和能流

#theorem[能量密度和能流][
  线性介质：

  $u=1/2(bold(E) dot bold(D)+bold(B) dot bold(H))$

  能流密度：

  $bold(S)=bold(E) times bold(H)$

  坡印廷定理描述“场能变化 + 能流流出 + 对电流做功 = 0”。
]

#conclusion[L1 应试提醒][
  L1 的核心不是计算难，而是概念全。考试常问：高斯定理物理意义、位移电流为什么必要、边界条件如何写、坡印廷矢量方向和单位。
]

== L2 第二章：静电场

=== 2.1 静电场标势及其微分方程

#definition[静电基本问题][
  静电条件：$bold(J)=0$，场量不随时间变化。

  方程：

  $nabla times bold(E)=0$，$nabla dot bold(D)=rho$

  均匀介质中：

  $bold(E)=-nabla phi$

  $nabla^2 phi=-rho/epsilon$

  无源区：$nabla^2 phi=0$。
]

#property[电势边值关系][
  介质界面：

  $phi_1|_S=phi_2|_S$

  $epsilon_2 partial phi_2/partial n - epsilon_1 partial phi_1/partial n=-sigma_f$

  导体表面：

  $phi|_S="const"$

  $epsilon partial phi/partial n=-sigma$
]

#theorem[静电能量的两种表示][
  场表示：

  $W=1/2 integral bold(E) dot bold(D) d tau$

  对全空间有限电荷体系：

  $W=1/2 integral rho phi d tau$

  注意 $rho phi$ 不是能量密度；真实能量密度是场能密度。
]

=== 2.2 唯一性定理

#theorem[第一唯一性定理][
  区域内电荷分布和边界电势给定，区域内电势唯一。
]

#theorem[第二唯一性定理][
  若给定每个导体的总电荷以及导体形状和位置，且区域内电荷分布给定，则电场唯一，电势差唯一。
]

#property[唯一性定理的考场用法][
  镜像法、分离变量法、格林函数法的解只要满足：
  1. 区域内方程；
  2. 边界条件；
  3. 无穷远或有限性条件；

  就可由唯一性定理确认正确。
]

=== 2.3 拉普拉斯方程和分离变量法

#definition[直角坐标分离变量][
  $nabla^2 phi=0$，令 $phi=X(x)Y(y)Z(z)$，可将偏微分方程化为常微分方程。边界为零的一侧通常给出 $sin$ 型本征函数；无穷远有限性会排除发散指数项。
]

#definition[球坐标轴对称通解][
  轴对称无源区常用展开：

  $phi(r,theta)=sum_(l=0)^infinity (A_l r^l+B_l/r^(l+1)) P_l(cos theta)$

  球内有限去掉 $B_l$，球外无穷远有限去掉发散的 $A_l r^l$。
]

#example[
  *课件型题：均匀外电场中的导体球*\
  半径 $a$ 的接地导体球置于均匀外电场 $E_0 hat(z)$ 中，写出球外电势形式。
]

#solution[
  无穷远 $phi -> -E_0 r cos theta$，球面 $r=a$ 上 $phi=0$。轴对称只需 $l=1$：

  $phi=(-E_0 r + C/r^2) cos theta$

  由 $phi(a,theta)=0$ 得 $C=E_0 a^3$。

  $phi=-E_0 (r-a^3/r^2) cos theta$
]

=== 2.4 镜象法

#definition[接地球面的镜像法结构][
  点电荷 $q$ 位于接地导体球外，距球心 $a>a_0$，球半径 $a_0$。镜像电荷放在球内同一直线上：

  $b=a_0^2/a$

  $q'=-a_0/a q$

  这样球面上总电势为零。
]

#property[常见镜像模型][
  #table(
    columns: 3,
    table.header[边界][镜像源][要点],
    [接地无限平面], [对称点放 $-q$], [边界电势为 0],
    [绝缘/等势平面变体], [符号依边界条件], [看法向导数或电势],
    [接地导体球], [球内反演点镜像电荷], [$b=a_0^2/a$],
    [介质平面], [等效镜像电荷和透射等效源], [用 $phi$ 连续和 $D_n$ 跳跃],
  )
]

=== 2.5 格林函数法

#definition[格林函数边值问题][
  构造 $G(bold(x),bold(x)')$ 满足

  $nabla^2 G=-delta(bold(x)-bold(x)')/epsilon_0$

  并满足对应边界条件。然后用格林恒等式把体源和边界贡献叠加得到电势。
]

#property[Dirichlet 与 Neumann 边界][
  Dirichlet 边界：边界电势给定，选择 $G|_S=0$。\
  Neumann 边界：边界法向导数给定，选择 $partial G/partial n$ 满足相容条件。
]

#conclusion[L2 应试提醒][
  静电场是大题重点。不要一上来积分库仑定律；有导体和边界时，先建立边值问题，再选唯一性定理支持的方法。
]

== L3 第三章：静磁场

=== 3.1 矢势及其微分方程

#definition[矢势物理意义和规范][
  $bold(B)=nabla times bold(A)$。

  对任意以 $L$ 为边界的曲面：

  $integral_S bold(B) dot d bold(S)=integral_L bold(A) dot d bold(l)$

  所以 $bold(A)$ 的环量等于磁通量。规范变换：

  $bold(A)'=bold(A)+nabla psi$

  常用库仑规范：$nabla dot bold(A)=0$。
]

#theorem[矢势方程与边值关系][
  均匀线性介质中：

  $nabla^2 bold(A)=-mu bold(J)$

  矢势在普通介质界面上连续：

  $bold(A)_2=bold(A)_1$

  旋度相关边值关系由 $bold(B)$ 和 $bold(H)$ 的边界条件给出。
]

#theorem[静磁能量][
  磁场能量：

  $W_m=1/2 integral bold(B) dot bold(H) d V$

  对全空间稳恒电流体系：

  $W_m=1/2 integral bold(A) dot bold(J) d V$
]

=== 3.2 磁标势

#definition[磁标势条件、方程和边界][
  在无自由电流区域：

  $nabla times bold(H)=0$

  可令 $bold(H)=-nabla phi_m$。

  均匀介质中 $nabla dot bold(B)=0$ 给出

  $nabla^2 phi_m=0$

  边界条件来自 $B_n$ 连续和 $H_t$ 连续/跳跃。
]

#property[磁标势与静电标势比较][
  #table(
    columns: 3,
    table.header[项目][静电标势][磁标势],
    [定义条件], [$nabla times bold(E)=0$], [无自由电流区 $nabla times bold(H)=0$],
    [场关系], [$bold(E)=-nabla phi$], [$bold(H)=-nabla phi_m$],
    [源], [电荷], [等效磁荷只是数学工具],
    [全局单值], [通常可全局], [绕电流区域可能多值],
  )
]

=== 3.3 磁多极矩

#definition[矢势多极展开与磁偶极矩][
  远区矢势可展开，最低非零项通常是磁偶极项。电流分布的磁偶极矩：

  $bold(m)=1/2 integral bold(r)' times bold(J)(bold(r)') d V'$

  对线电流小回路：

  $bold(m)=I bold(S)$
]

#property[磁偶极场和磁标势][
  远区：

  $bold(B)=mu_0/(4 pi r^3)(3(bold(m) dot hat(r))hat(r)-bold(m))$

  无电流区域可用磁标势：

  $phi_m=1/(4 pi) bold(m) dot hat(r)/r^2$
]

#definition[静磁屏蔽][
  高磁导率材料可改变磁力线分布，使某区域内磁场减弱。考试通常定性考：磁场更愿意通过高磁导率通道，类似电场中高介电常数介质改变电位移线分布。
]

=== 3.5 超导体的电磁性质

#property[超导体五个关键词][
  1. 超导电性：电阻为零。\
  2. 临界温度、临界磁场、临界电流：超过后破坏超导态。\
  3. 迈斯纳效应：超导体内部排斥磁场。\
  4. 伦敦方程：给出磁场在超导体中的指数衰减。\
  5. 磁通量子化：磁通以 $Phi_0=h/(2e)$ 为单位量子化。
]

#theorem[伦敦穿透深度][
  超导体内磁场满足类似

  $nabla^2 bold(B)=bold(B)/lambda_L^2$

  因而磁场从表面向内指数衰减，$lambda_L$ 称为伦敦穿透深度。
]

#conclusion[L3 应试提醒][
  静磁场的主线是：$bold(B)$ 无源导致矢势，稳恒电流导致矢势泊松方程，无电流区域才可用磁标势。超导体部分重点记概念和定性。
]

== L4 第四章：电磁波的传播

=== 4.1 平面电磁波

#theorem[波动方程、时谐方程和 Helmholtz 方程][
  真空无源区：

  $nabla^2 bold(E)-1/c^2 partial_t^2 bold(E)=0$

  时谐场 $bold(E)(bold(x),t)=bold(E)(bold(x))e^(-i omega t)$ 满足

  $nabla^2 bold(E)+k^2 bold(E)=0$

  $k=omega sqrt(mu epsilon)$

  并且还要满足横波条件 $nabla dot bold(E)=0$。
]

#property[平面波关系、相速度和波阻抗][
  平面波：

  $bold(E)=bold(E)_0 e^(i(bold(k) dot bold(x)-omega t))$

  $bold(k) dot bold(E)=0$，$bold(k) dot bold(B)=0$

  $bold(B)=sqrt(mu epsilon) hat(n) times bold(E)$

  $E/B=1/sqrt(mu epsilon)=v$

  $E/H=sqrt(mu/epsilon)=eta$
]

#theorem[能量和能流][
  平面波平均能流：

  $chevron.l bold(S) chevron.r =1/2 op("Re")(bold(E) times bold(H)^*)$

  真空中电场能量密度和磁场能量密度平均相等，总能流沿传播方向。
]

=== 4.2 介质界面反射和折射

#theorem[反射折射定律][
  相位匹配给出：

  $theta_r=theta_i$

  $n_1 sin theta_i=n_2 sin theta_t$
]

#property[Fresnel 公式的考试版][
  垂直入射：

  $r=(eta_2-eta_1)/(eta_2+eta_1)$

  $t=2 eta_2/(eta_2+eta_1)$

  斜入射需区分 $s$ 偏振和 $p$ 偏振；写题时先画出入射面。$s$ 偏振电场垂直入射面，$p$ 偏振电场在入射面内。
]

#definition[全反射][
  当 $n_1>n_2$ 且入射角超过临界角：

  $sin theta_c=n_2/n_1$

  透射波在第二介质中变为倏逝波，法向不传播能量但界面附近仍有场。
]

=== 4.3 导体中的电磁波

#definition[导体中的传播][
  导体中 $bold(J)=sigma bold(E)$，有效介电响应包含电导项。良导体中波数近似有相等的衰减和相位常数：

  $alpha approx beta approx sqrt(omega mu sigma/2)$

  趋肤深度：

  $delta=1/alpha=sqrt(2/(omega mu sigma))$
]

#property[导体表面阻抗和能量耗散][
  良导体中电场和磁场不再同相，电磁能进入导体后转化为焦耳热。高频电流集中在表面厚度约 $delta$ 的区域内，这就是趋肤效应。
]

=== 4.5 波导

#definition[波导模式][
  波导中场满足导体边界条件，只允许离散模式。\
  TE 模：$E_z=0$；TM 模：$H_z=0$；TEM 模需要双导体结构，空心金属矩形波导无 TEM 模。
]

#property[截止频率、相速度、群速度][
  截止以下不传播。传播常数满足类似：

  $beta^2=k^2-k_c^2$

  相速度 $v_p=omega/beta$ 可大于 $c$，不传递信息；群速度 $v_g=d omega/d beta$ 小于 $c$，且 $v_p v_g$ 在理想波导中有固定关系。
]

#conclusion[L4 应试提醒][
  反射折射大题最容易丢在偏振方向和符号。先画入射面，再写切向场连续。导体传播题先判断“良导体近似”能否用。
]

== L5 第五章：电磁场的矢势和标势

=== 5.1 电磁场的矢势和标势

#definition[用势描述电磁场][
  $bold(B)=nabla times bold(A)$

  $bold(E)=-nabla phi-partial bold(A)/partial t$

  在含时情况下，$phi$ 不再简单等同于势能，但与 $bold(A)$ 一起完整描述电磁场。
]

#theorem[规范变换和规范不变性][
  $bold(A)'=bold(A)+nabla psi$

  $phi'=phi-partial psi/partial t$

  则 $bold(E), bold(B)$ 不变。规范不变性是电磁场理论的重要结构。
]

#property[库仑规范和洛伦兹规范比较][
  库仑规范 $nabla dot bold(A)=0$：$phi$ 描述瞬时库仑作用，$bold(A)$ 保留横向辐射自由度。\
  洛伦兹规范 $nabla dot bold(A)+1/c^2 partial_t phi=0$：势方程对称、协变，适合相对论形式。
]

#theorem[D'Alembert 方程][
  洛伦兹规范下：

  $nabla^2 phi-1/c^2 partial_t^2 phi=-rho/epsilon_0$

  $nabla^2 bold(A)-1/c^2 partial_t^2 bold(A)=-mu_0 bold(J)$
]

=== 5.2 推迟势

#definition[达朗贝尔方程特解和推迟势][
  推迟时刻：

  $t'=t-R/c$

  推迟势：

  $phi(bold(r),t)=1/(4 pi epsilon_0) integral rho(bold(r)',t-R/c)/R d V'$

  $bold(A)(bold(r),t)=mu_0/(4 pi) integral bold(J)(bold(r)',t-R/c)/R d V'$
]

#property[物理意义和 Lorentz 条件][
  推迟势体现电磁相互作用以光速传播。若源满足连续性方程，则推迟势自动满足洛伦兹规范条件。
]

=== 5.3 电偶极辐射

#definition[电偶极辐射的场区][
  近区：准静态项，随 $1/r^3$ 或 $1/r^2$ 衰减。\
  远区：辐射项，随 $1/r$ 衰减，携带能量到无穷远。
]

#property[远区结论][
  对振荡电偶极矩，辐射角分布：

  $d P/d Omega = C sin^2 theta$

  总辐射功率与偶极矩二阶时间导数平方成正比。沿偶极轴方向无辐射，垂直偶极轴方向最强。
]

=== 5.7 电磁场动量

#theorem[动量密度和动量流][
  动量密度：

  $bold(g)=bold(S)/c^2=epsilon_0 bold(E) times bold(B)$

  动量流密度由 Maxwell 应力张量描述；考试常用结论是辐射压：

  吸收 $p=I/c$，反射 $p=2I/c$。
]

#conclusion[L5 应试提醒][
  势函数题写清楚规范。推迟势题写清楚源点、场点、距离 $R$ 和推迟时间。辐射题抓住远区项，别把近区感应场当辐射场。
]

== L6 第六章：狭义相对论

=== 6.0 简介与 6.1 实验基础

#definition[事件、惯性系和伽利略变换][
  事件由 $(x,y,z,t)$ 描述。经典时空观中时间和长度绝对，伽利略变换为：

  $x'=x-v t$，$y'=y$，$z'=z$，$t'=t$

  速度变换为 $bold(u)'=bold(u)-bold(v)$。
]

#property[电磁理论引出的矛盾][
  麦克斯韦方程推出真空光速 $c=1/sqrt(mu_0 epsilon_0)$，与参考系无关；伽利略速度相加却预言不同惯性系测得光速不同。迈克尔逊-莫雷实验未发现以太风，促成狭义相对论。
]

=== 6.2 基本原理与洛伦兹变换

#theorem[相对论基本原理][
  1. 物理规律在所有惯性系中形式相同。\
  2. 真空光速 $c$ 对所有惯性观察者相同。
]

#definition[间隔不变性][
  时空间隔：

  $s^2=c^2 Delta t^2-Delta x^2-Delta y^2-Delta z^2$

  在洛伦兹变换下不变。它取代经典的绝对时间和绝对空间距离。
]

#theorem[洛伦兹变换][
  $x'=gamma(x-v t)$

  $t'=gamma(t-v x/c^2)$

  $y'=y$，$z'=z$

  $gamma=1/sqrt(1-v^2/c^2)$
]

=== 6.3 相对论时空理论

#property[四个标准效应][
  #table(
    columns: 3,
    table.header[效应][公式][判题关键词],
    [同时相对性], [$Delta t'=gamma(Delta t-v Delta x/c^2)$], [异地同时],
    [时间延缓], [$Delta t=gamma Delta tau$], [同地两事件、寿命],
    [长度收缩], [$L=L_0/gamma$], [运动杆、同时测两端],
    [速度变换], [$u'_x=(u_x-v)/(1-u_x v/c^2)$], [高速粒子、光速不变],
  )
]

=== 6.4 四维形式

#definition[四维协变量][
  四维坐标：

  $x^mu=(c t,x,y,z)$

  四维梯度：

  $partial_mu=(1/c partial_t, nabla)$（符号约定依教材）

  四维电流：

  $J^mu=(c rho, bold(J))$

  四维势：

  $A^mu=(phi/c, bold(A))$
]

#property[协变性][
  物理规律的协变性指：换到另一个惯性系后，方程形式保持不变。相对论形式的电动力学就是把麦克斯韦方程写成四维张量方程。
]

=== 6.5 电动力学的相对论不变性

#definition[电磁场张量和不变量][
  电场和磁场合并为电磁场张量 $F^(mu nu)$。两个常见不变量：

  $bold(E) dot bold(B)$

  $E^2-c^2 B^2$（不同单位制下系数形式会变）

  若某系中两不变量满足特定条件，可以判断是否存在纯电场系或纯磁场系。
]

#property[场变换结构][
  沿 $x$ 方向 boost：

  平行分量不变，垂直分量混合。电场和磁场是同一张量的不同分量，参考系改变会把一部分电场“变成”磁场，反之亦然。
]

=== 6.6 相对论力学

#definition[能量动量四矢量][
  $p^mu=(E/c,bold(p))$

  $bold(p)=gamma m bold(v)$

  $E=gamma m c^2$

  $E^2=p^2 c^2+m^2 c^4$

  $T=(gamma-1)m c^2$
]

#theorem[相对论动力学方程和洛伦兹力][
  动力学方程保持形式：

  $d bold(p)/d t=bold(F)$

  带电粒子洛伦兹力：

  $bold(F)=q(bold(E)+bold(v) times bold(B))$

  相对论中加速度通常不再与力平行，计算时优先用动量方程。
]

#conclusion[L6 应试提醒][
  相对论题必须从事件出发。先判固有时/固有长，再套洛伦兹变换。电动力学不变性题要会说“电场和磁场统一为电磁场张量，麦克斯韦方程具有洛伦兹协变性”。
]

#pagebreak()
= 综合应试训练

#introduction[边界条件][镜像法][平面波][推迟势][相对论]

#problemset[
  #problem[
    *题 1：边界条件默写*\
    写出两介质界面处电磁场的四个边界条件，并说明哪些量与自由源有关。
  ]

  #solution[
    $hat(n) dot (bold(D)_2-bold(D)_1)=sigma_f$，与自由面电荷有关。\
    $hat(n) times (bold(E)_2-bold(E)_1)=0$。\
    $hat(n) dot (bold(B)_2-bold(B)_1)=0$。\
    $hat(n) times (bold(H)_2-bold(H)_1)=bold(K)_f$，与自由面电流有关。
  ]

  #problem[
    *题 2：导体接地平面镜像法*\
    点电荷 $q$ 位于接地无限导体平面上方距离 $a$，写出求解区域电势和受力。
  ]

  #solution[
    放镜像电荷 $-q$ 于平面对称点。上半空间电势：

    $phi=q/(4 pi epsilon_0)(1/r_+-1/r_-)$

    受力大小：

    $F=q^2/(16 pi epsilon_0 a^2)$

    方向指向导体平面。
  ]

  #problem[
    *题 3：平面波方向*\
    已知 $bold(E)$ 沿 $x$，波沿 $z$ 正向传播，判断 $bold(B)$ 方向。
  ]

  #solution[
    能流方向为 $bold(E) times bold(H)$。要沿 $+z$，且 $bold(E)$ 沿 $+x$，所以 $bold(H)$ 和 $bold(B)$ 沿 $+y$。
  ]

  #problem[
    *题 4：推迟势概念*\
    为什么势函数中源项要取 $t-R/c$ 时刻？
  ]

  #solution[
    电磁相互作用以光速传播。源在较早时刻的变化经过时间 $R/c$ 才到达观察点，所以观察点时刻 $t$ 的场由源在 $t-R/c$ 的状态决定。
  ]

  #problem[
    *题 5：相对论固有量*\
    区分固有时和固有长的判断方法。
  ]

  #solution[
    固有时：两个事件发生在同一惯性系同一地点时，该系测得的时间。\
    固有长：物体静止系测得的长度。\
    解题时先找“同地”和“静止系”，再套 $Delta t=gamma Delta tau$ 或 $L=L_0/gamma$。
  ]
]

#conclusion[最后总检查][
  #table(
    columns: 3,
    table.header[检查项][常见失分][修正动作],
    [边界条件], [法向方向写反], [先画 $hat(n)$ 再写跳跃],
    [标势], [忘记负号], [永远写 $bold(E)=-nabla phi$],
    [镜像法], [把镜像电荷当真实区域电荷], [只在求解区域外放镜像源],
    [平面波], [叉乘顺序反], [用 $bold(E) times bold(H)$ 检查方向],
    [推迟势], [写成超前时间], [观察时刻减传播时间 $R/c$],
    [相对论], [误认固有量], [先判断同地/静止系],
  )
]
