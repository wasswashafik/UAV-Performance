function [ V_max ta ]=  uavthrustaviliable( T_Req )
% uavthrustaviliable.m
%   First  edtion : 08-Apr-2015 20:38:27
%   Lasted edtion : 08-Apr-2015 21:47:54
%   Lasted modify : Huang,Kuan-Lin
%
% DESCRIPTION
%   This is a file to compute max thrust available for fixed-wing UAV.
%
% COPPYRIGHT
%   Copy right 2015 UAV Laboratory, Dept. of Aerospace Engineering, Tamkang
%   University.
%
% AUTHOORS INFORMACTION
%   Chang, Wei-Chieh
%    addischang1991@gmail.com
%   Huang,Kuan-Lin
%     breakfastho@yahoo.com.tw
%   Liu, Yu-Lin
%     lightning.539418@gmail.com


% Get the global parameters from parameters list.
global SizH LenH CouF CouH
global rho_inf h_inf g_inf T_inf
global W S_fw S_bw b_fw b_bw AR_fw AR_bw e_fw e_bw
global P eta_p
global T_Req

% Declare the range of velocity.
V_inf = linspace( 5, 25, 25 );


% Compute the actual power aviliable at different height. Notice that, the
% engine without supercharge will discrease the efficicency with the height
% changed. If you want know more details, please check aircraft performance
% page 228, eq.5.48
P_A =  eta_p * P .* rho_inf ./ rho_inf( 1, 1 );


% The main loop to compute the thrust avaliable at different height. Thrust
% aviliable will decreased as the velocity increased.
for i = 1: SizH(1,2)
    T_A( i, : ) = P_A( i, : ) ./ V_inf ;
    [ a(i) b(i) ] = min( abs( T_A( i, : ) - T_Req( i, : ) ) );
    V_max( i ) = V_inf( 1, b( i ) );
end
 

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
plot( V_inf, T_Req(CouH, : ), V_inf, T_A(CouH, : ),'--m' );
grid on
legend('T_{Req}','T_{A}')
xlabel('Velocity (m/s)')
ylabel('Thrust (N)')


% % Plot the figure.
% figure( CouF )
% CouF = CouF + 1;
% plot(V_inf, T_A)



% Dispplay something useful.
disp( [ ' Max thrust is ' num2str( a( 1, CouH ) ) '(N) while '...
          num2str( V_inf( 1, b ) ) '(m/s). ' ])

      ta = T_A;

% Just return
