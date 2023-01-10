function removal = uavparameter( InputHeight )
% UAVPARAMETER
%   First  edition : 05-Apr-2015 01:37:56
%   Lasted edition : 12-Apr-2015 00:57:51
%   Lasted modify  : Chang, Wei-Chieh
%
% DESCRIPTION
%   This file is the main file for "UAV-Performance". This is a software
%   which provides performance parameters analysis for fixed-wing unmanned
%   aerial vehicle. But everything is still in developing stage.
%
% COPYRIGHT
%   Copyright 2015 UAV Laboratory, Dept. of Aerospace Engineering, Tamkang
%   University.
%
% AUTHOR INFORMATIONS
%   Chang, Wei-Chieh
%    addischang1991@gmail.com
%   Huang,Kuan-Lin
%     breakfastho@yahoo.com.tw
%   Liu, Yu-Lin
%     lightning.539418@gmail.com


% COUNTER
%   The counter is to declare scale or size for input parameters. It will
%   be helpful while you take integations. If you want to know more detail,
%   please check the parameter explanation in the end of this file.
global SizH LenH CouF CouH
SizH = size( InputHeight );
LenH = length( InputHeight );
CouH = 1;
CouF = 1;


% ATMOSPHERE DATA
%   The standard atmosphere data can be identified by the subfunction stdatm
%   which providing standard atmosphere data computation.
global rho_inf h_inf g_inf a_inf T_inf
atm = stdatm( InputHeight );
h_inf = atm( :, 1 );
g_inf = atm( :, 2 );
T_inf = atm( :, 3 );
a_inf = 331 + 0.6 .* ( 273 - T_inf );
rho_inf = atm( :, 6 );


% SPECIFICATIONS
%   The specification of aircraft which we want to analysis. Those data are
%   necessary for performance analysis. If you want to know more detail,
%   please check the parameter explanation in the end of this file.
global W S_fw S_bw b_fw b_bw AR_fw AR_bw e_fw e_bw
mass = 18.75;
W = mass * g_inf( 1, 1 );
S_fw = 0.8929;
S_bw = 0.8929;
b_fw = 2.5;
b_bw = 2.5;
e_fw = 0.8;
e_bw = 0.8;
Cr_fw = 0.48979;
Cr_bw = 0.48979;
Ct_fw = 0.1959;
Ct_bw = 0.1959;
AR_fw = b_fw^2 / S_fw;
AR_bw = b_bw^2 / S_bw;


% AERODYNAMICS
%   The aerodynamics parameters
global CD_0 CL_max
CD_0 = 0.0125;
CL_max = 1.5;


% PROPULSION
%   The specification engine and propellers. Those parameters will dominate
%   the power aviliable, thrust aviliable. If you want to know more detail,
%   please check the parameter explanation in the end of this file.
global P eta_p
P = 1.7 * 746;
eta_p = 0.8;


% Just return.
removal = rho_inf;

% Parameter explanation
% mass of aircraft : mass
% angle of attack : alpha
% free-stream velocity : V_inf
% lift : L
% drag : D
% moment about the quarter chord : M_0.25c
% moment about the leading edge : M_LE
% density of the ambient air : rho_inf
% reference area : S
% moment : M
% lift coefficient : CL
% drag coefficient : CD
% moment coefficient : CM
% dynamic pressure : q_inf
% geometory height : h_inf
% Reynolds number : Re
% chord length : c
% Mach number : M_inf
% speed of sound : a_inf
% temperature : T_inf
% zero-lift angle of attack : alpha_L0
% lift slope : a_0
% slope of the moment coefficient : m_0
% ski_friction coefficient : CF
% aerodynamic center : CM_ac
% distance between aerodynamic center and quarter_chord : x_ac
% aspect ratio : AR
% taper ratio : lambda
% Mach angle : mu
% weight : W
% thrust : T
% induced drag : D_i
% induced drag coefficient : CD_i
% span efficiency factor : e
% zero-lift parasite drag : D_0
% zero-lift drag coefficient : CD_0
% jet velocity : V_j
% power available : P_A
% propulsive efficiency : eta_p
% power from engine shaft : P
% number of propeller revolutions per second : N
% advance ratio : J
% pitch angle : beta
% weight of fuel burned per unit thrust per unit time : c_t
% Reference area for forward wing : S_fw
% Reference area for backard wing : S_bw
% Span for forward wing : b_fw
% Span for backard wing : b_bw
% Wing root chord for forward wing : Cr_fw
% Wing root chord for backard wing : Cr_bw
% Wing tip chord for forward wing : Ct_fw
% Wing tip chord for backard wing : Ct_bw
% Aspect ratio for forward wing : AR_fw
% Aspect ratio for backard wing : AR_bw
% Efficiency for forward wing : e_fw
% Efficiency for backard wing : e_bw
% Size of input height : SizH
% Length of input height : LenH
% Counter of height : CouH
% Counter of figure : CouF