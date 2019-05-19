function Cv = Regolith_Heat_Capcity(Kt,Rho)
%Regolith_Heat_Capcity 
Bulk_Thermal_Inertia = 0.019; % m^2 s^1/2 K/J
Cv = 1./(Kt.*Rho*Bulk_Thermal_Inertia^2);
end

