function removal = total_takeoff_distance
%   First  edition : 13-Apr-2015 11:31:58
%   Lasted edition : 13-Apr-2015 11:31:58
%   Lasted modify  : Huang,Kuan-Lin
%
% DESCRIPTION
%   This is a file to compute takeoff distance for fixed-wing UAV.
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

global SizH LenH CouF CouH
global rho_inf h_inf g_inf T_inf
global W S_fw S_bw b_fw b_bw AR_fw AR_bw e_fw e_bw
global P eta_p
global T_Req

CL_max = 1.3079 ;
T_max  = 2.7*9.81;
% compute S_g
S_g1 = 1.21 * ( W(1,1) / ( S_fw +S_bw) );
S_g2 = g_inf(1,1) * rho_inf * CL_max * (T_max / W(1,1) );
S_g = S_g1 / S_g2 ;


% compute S_a
h_ob = 0.2;
V_stall = 11.5969 ;% at sealevel
R = ( ( 1.15 * V_stall ) ^2 ) / (g_inf(1,1) * ( 1.19 - 1 ) );
thi_ob = acos ( 1 - ( h_ob / R ) ) ;
S_a = R * sin( thi_ob ) ;

% takeoff distance = S_g + S_a
total_takeoff_distance = S_g + S_a

% total_takeoff_distance >= 80
% 
% total_takeoff_distance <= 80