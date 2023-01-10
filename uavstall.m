function removal = uavstall
% UAVSTALL.M
%   First  edtion : 05-Apr-2015 22:55:27
%   Lasted edtion : 08-Apr-2015 21:47:54
%   Lasted modify : Chang, Wei-Chieh
%
% DESCRIPTION
%   This is a file to compute stall velocity for fixed-wing UAV.
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

% The main algorithm.
CL = 1.25;
V_stall= sqrt( 2 * W( 1, 1 ) ./  ( rho_inf .* ( S_fw + S_bw ) .* CL ) );

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
f = plot( V_stall, h_inf, '-o' );
set( f, 'linewidth', 1.7 );
xlabel( 'Velocity (m/s)' );
ylabel( 'Altitude (m)' );
legend( 'Stall Velocity' );
grid on

% Display some useful informations at command windows.
disp( [ 'The stall velocity at ' num2str( V_stall( CouH, 1 ) ) '(m/s) at ' ...
        num2str( h_inf( CouH, 1 ) ) ' (m) height ' ] )
    
% Just return 0    
removal = V_stall;
