function removal = uavenvelope( V_stall, V_max )
% uavenvelope.m
%   First  edtion : 11-Apr-2015 15:29:09
%   Lasted edtion : 11-Apr-2015 15:29:09
%   Lasted modify : Chang, Wei-Chieh
%
% DESCRIPTION
%   This is a file to plot flight envelope.
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
global h_inf

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
plot( V_stall, h_inf );
hold on 
plot( V_max, h_inf );
grid on
xlabel( 'Velocity (m/s)' );
ylabel( 'Altitude (m)' );
axis( [ V_stall(1,1)-1 V_max(1,1)+1 0 5000 ] )