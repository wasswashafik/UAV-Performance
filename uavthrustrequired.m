function removal = uavthrustrequired
% uavthrustrequired.m
%   First  edition : 07-Apr-2015 10:37:56
%   Lasted edition : 08-Apr-2015 21:47:54
%   Lasted modify : Chang, Wei-Chieh 
%
% DESCRIPTION
%   This is the file calculating the thrust required.
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


% Declare range. 
V_inf = linspace( 5, 25, 25 );
Q_inf = 0.5 .* rho_inf * V_inf.^2; 
K = 1 / ( pi * e_fw * AR_fw );

% Declare the change of lift and drag coefficient while in level flight.
% The paremeters will changed as the velocicy changes. The final state will
% make the lift coefficient small and drag coefficient approach zero lift
% drag coefficient.
CL = W( 1, 1 ) ./ ( Q_inf .* ( S_fw + S_bw ) );
CD = CD_0 + K * CL.^2;


% Main algorithm.
D_0 = Q_inf .* ( S_fw + S_bw ) .* CD_0;
D_L = Q_inf .* ( S_fw + S_bw ) .* K .* CL.^2;
D = D_0 + D_L;


% Seek the minimum drag. 
[ a b ] = min( D( CouH, : ) );


% Plot the figure.
figure( CouF )
CouF = CouF + 1;
h = plot( V_inf, D_0( CouH, : ), '--m', ...
          V_inf, D_L( CouH, : ), '--r', ... 
          V_inf, D( CouH, : )  );
set( h, 'linewidth', 1.9 );
grid on
legend('D_{0}','D_{i}','D')
xlabel('Velocity (m/s)')
ylabel('Drag (N)')


% Dispplay something useful.
disp( [ ' Minimum darg is ' num2str( a ) '(N) at ' num2str( V_inf( 1, b ) ) '(m/s). ' ]  )

global T_Req
T_Req = D;


removal = D;




