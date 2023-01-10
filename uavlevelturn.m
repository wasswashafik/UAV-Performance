function removal =  uavlevelturn( LiftDrag, Thrust )
% uavthrustaviliable.m
%   First  edtion : 12-Apr-2015 15:31:29
%   Lasted edtion : 12-Apr-2015 15:31:29
%   Lasted modify : Chang, Wei-Chieh
%
% DESCRIPTION
%   This is a file to compute level turn for fixed-wing UAV.
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
global CD_0 CL_max


% Declare range.
V_inf = linspace( 5, 25, 25 );
Q_inf = 0.5 .* rho_inf * V_inf.^2;

% Compute the load factor for different height, radious and banking angle
% for the fixed-wing aircraft.
TW = Thrust ./ W;
for i = 1: 1: SizH( 2 )
    N( i, : ) = LiftDrag( i, : ) .* TW( i, : );
    R( i, : ) = V_inf.^2 ./ ( g_inf( 1, 1 ) .* sqrt(  N( i, : ).^2 - 1 ) );
    Phi( i, : ) = acos( 1 ./  N( i, : ) );
end

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
plot( V_inf, Phi( CouH, : ) )
grid on
title('The bank angle of level turn');
xlabel('Velocity (m/s)')
ylabel('Phi (rad)')

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
plot( V_inf, N( CouH, : ) )
grid on
title('The load factor of level turn');
xlabel('Velocity (m/s)')
ylabel('Load factor')

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
plot( V_inf, R( CouH, : ) )
grid on
title('The radious of level turn');
xlabel('Velocity (m/s)')
ylabel('Radious (m)')


% 
% % Plot the figure.
% figure( CouF )
% CouF = CouF + 1;
% plot( V_inf, R( CouH, : ) )