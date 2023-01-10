function [ LD1 ] = uavloverd
% UAVLOVERD
%   First  edition : 09-Apr-2015 00:49:08
%   Lasted edition : 12-Apr-2015 00:57:51
%   Lasted modify : Chang, Wei-Chieh
%
% DESCRIPTION
%   This is the file calculating lift over drag for fixed-wing aircraft.
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

% Get the global parameters from parameters list.
global SizH LenH CouF CouH
global rho_inf h_inf g_inf T_inf
global W S_fw S_bw b_fw b_bw AR_fw AR_bw e_fw e_bw
global CD_0

% Parameter.
K = 1 / ( pi * e_fw * AR_fw );
V_inf = linspace( 5, 25, 25 );
Q_inf = 0.5 * rho_inf * V_inf.^2;
CL = W( 1, 1 ) ./ ( Q_inf .* ( S_fw + S_bw ) );
CD = CD_0 + K .* CL.^2;

% Main algorithm.
LD1 = CL ./ CD;
LD2 = CL.^(0.5) ./ CD;
LD3 = CL.^(1.5) ./ CD;

% Seek the maximun value.
[ AmpLD1 LocLD1 ] = max( LD1( CouH, : ) );
[ AmpLD2 LocLD2 ] = max( LD2( CouH, : ) );
[ AmpLD3 LocLD3 ] = max( LD3( CouH, : ) );

% Seek the velocity while  maximun value occure.
VLD1 = V_inf( 1, LocLD1( CouH, : ) );
VLD2 = V_inf( 1, LocLD2( CouH, : ) );
VLD3 = V_inf( 1, LocLD3( CouH, : ) );

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
h = plot( V_inf, LD1( CouH, : ),...
    V_inf, LD2( CouH, : ),...
    V_inf, LD3( CouH, : ) );
set( h, 'linewidth', 1.7 );
title( ' Lift over Drag ' );
xlabel( 'Velocity (m/s)' );
ylabel( 'L/D' );
legend( 'C_{L} / C_{D}',...
        'C_{L}^{1/2} / C_{D}',...
        'C_{L}^{3/2} / C_{D}' );
grid on

% Display some useful informations at command windows.
disp( [ 'The maximum L/D is ' num2str( AmpLD1 ) ' while ' ...
        num2str( VLD1 ) '(m/s) at ' ...
        num2str( h_inf( CouH, 1 ) ) '(m) height ' ] )