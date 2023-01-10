function removal = uavclimb
% % UAVPARAMETER
% %   First  edition : 12-Apr-2015 17:04:07
% %   Lasted edition : 12-Apr-2015 17:04:07
% %   Lasted modify  : Huang,Kuan-Lin
% %
% % DESCRIPTION
% %   This is the file calculating the rate of climb and time of climb.
% %
% % COPYRIGHT
% %   Copyright 2015 UAV Laboratory, Dept. of Aerospace Engineering, Tamkang
% %   University.
% %
% % AUTHOR INFORMATIONS
% %   Chang, Wei-Chieh 
% %    addischang1991@gmail.com
% %   Huang,Kuan-Lin 
% %     breakfastho@yahoo.com.tw
% %   Liu, Yu-Lin 
% %     lightning.539418@gmail.com

global SizH LenH CouF CouH
global rho_inf h_inf g_inf T_inf
global W S_fw S_bw b_fw b_bw AR_fw AR_bw e_fw e_bw
global T_Req
global P_Req eta_p P 
global CD_0 CL_max

V_inf = linspace( 5, 35, 25 );

k =  1 / ( pi * e_fw * AR_fw );
T_A = 29.225;

% Rate of climb
RC1 = ( T_A / W( 1,1 ) );
RC2 = ( 0.5 .* rho_inf * (V_inf .^2) .* ( ( S_fw + S_bw ) / W(1,1 ) ) * CD_0 );
RC3 = W(1,1) * 2 * k ./ ( ( S_fw + S_bw ) .* rho_inf * V_inf.^2 );

RC = V_inf .* ( RC1 - RC2(1,:) - RC3(1,:));
figure( CouF )
CouF = CouF + 1;
plot(V_inf, RC, V_inf, ones( size( RC ) ), '-.r');
title('R/C');
xlabel('Velocity (m/s)')
ylabel('R/C')
grid on

% max climb angle
T_max =29.225;
CL_CD_max = 10;
max_climb_thi = asin((T_max/W) - (1/CL_CD_max));

%V_thi_max
V_thi_max = ( 4* ( W(1,1)/ (S_fw +S_bw) *k)) /( rho_inf * eta_p * (P/W(1,1)) );
V_thi_max = V_thi_max(1,1)


% max rate of climb
 [ a b ] = max(RC);
 disp( [ ' Max rate of climb  ' num2str( a( 1, CouH ) ) ' while '...
          num2str( V_inf( 1, b ) ) '(m/s). ' ])

% time to climb

% climb_T_min = dh/()
 



