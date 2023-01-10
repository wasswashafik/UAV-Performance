function removal = uavpowerrequired( T_Req )
% uavpowerrequired.m
%   First  edition : 11-Apr-2015 14:22:05
%   Lasted edition : 12-Apr-2015 00:57:51
%   Lasted modify : Chang, Wei-Chieh
%
% DESCRIPTION
%   This is the file calculating the power required.
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

% This is a statement to judge the number of input data. If there without
% any input augment, then the initial and final value of climb velocity will
% be defult. Else if there have one input data, then we just define the final
% value of climb velocity.
% if nargin == 0
%     Vinf_i = 5;
%     Vinf_f = 25;
% elseif nargin == 1
%     Vinf_f = 25
% end

% Declare range.
V_inf = linspace( 5, 25, 25 );

% Get the global parameters from parameters list.
global SizH LenH CouF CouH
global rho_inf h_inf g_inf T_inf
global W S_fw S_bw b_fw b_bw AR_fw AR_bw e_fw e_bw
global T_Req

% Declare the power required.
for i = 1: 1: SizH( 2 )
    P_req( i, : ) = T_Req( i, : ) .* V_inf;
end

% Plot the figure.
figure( CouF )
CouF = CouF + 1;
h = plot( V_inf, P_req( CouH, : ) );
set( h, 'linewidth', 1.9 );
grid on
title( 'Power Required' );
xlabel( 'Velocity (m/s)' );
ylabel( 'Power (W)');

% Just return.
removal = 0;


