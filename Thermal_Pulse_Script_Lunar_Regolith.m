% Thermal_Conductivity_Lunar_Regolith
% Script to send to Lunar Temperature Pulse Function for ploting
Rho_dense = 1900;% Kg/m^3
Rho_fluff = 1300; %Kg/m^3
Kc_fluff = 9.22E-4; % W m^-1 K^-1
Chi_fluff = 1.48; % Ratio of radiative to oild condiuctivity
Kc_Dense = 9.3E-3; % W m^-1 K
Chi_Dense = 0.073;
Temperature = linspace(0,450,1000);
Kt_fluff = Regolith_Thermal_Conductivity(Temperature,Kc_fluff, Chi_fluff);
Kt_Dense = Regolith_Thermal_Conductivity(Temperature,Kc_Dense, Chi_Dense);
Marov_Fluff = Marov_Fluff_Thermal_Conductivity(Temperature);
Cv_fluff = Regolith_Heat_Capcity(Kt_fluff,Rho_fluff);
Cv_Dense = Regolith_Heat_Capcity(Kt_Dense,Rho_dense);
Temperature = Lunar_Temperature_Pulse(Kc_fluff,Chi_fluff,Rho_fluff);
%Temperature = Lunar_Temperature_Pulse(Kc_Dense,Chi_Dense,Rho_dense);