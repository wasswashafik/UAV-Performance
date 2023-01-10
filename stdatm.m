function SATD = stdatm( HeightToSealevel )
% STDATM
%     stdatm( HeightToSealevel ). Just give the height that you want to
%     know in the row vector. this function will return the atmosphere datas
%     to you.

% AUTHOOR INFORMACTIONS
%     Date : 11-Feb-2015 16:20:42, "using datestr(now)"
%     Author : Wei-Chieh Chang
%     Degree : M. Eng. Dept. Of Aerospace Engineering Tamkang University
%     Version : 3
%     Copyright 2014 by Avionics And Flight Simulation Laboratory
%     Base on MATLAB R2014a for GNU/Linux

format long g 

% DECLARE SOME VARIABLES OF .
%     L : 
%     M : 
%     R :  
%     g0 : The  gravity constant at sealevel.
%     T0 : The temperature at sealevel in K.
%     P0 : The pressure at sealevel in Pa.
%     R_EAR : The radious for earth.  

g0 = 9.80665;
T0 = 288.15;
P0 = 101.325e3;
R_EAR = 6378;
L = 0.0065;
M = 0.0289644;
R =  8.31447;

% COMPUTE DATA OF STANDARD ATMOSPHERE
%     Culomn 1, Height
%     Culomn 2, Gravity
%     Culomn 3, Temputure
%     Culomn 4, GRML
%     Culomn 5, Pressure
%     Culomn 6, Density

SATD( :, 1 ) = HeightToSealevel;
SATD( :, 2 ) = g0 .* ( R_EAR ./ ( R_EAR + ( SATD( 1, 1 ) * 1e-3 ) ) ) .^2;
SATD( :, 3 ) = T0 - L .*  SATD( :, 1 );
SATD( :, 4 ) = ( SATD( :, 2 ) * M ) / ( R * L );
SATD( :, 5 ) = P0 .* ( 1 - ( L .* SATD( :, 1 ) ) ./ T0   ).^SATD( :, 4 );
SATD( :, 6 ) = ( SATD( :, 5 ) .* M ) ./ ( R .* SATD( :, 3 ) ) ;

