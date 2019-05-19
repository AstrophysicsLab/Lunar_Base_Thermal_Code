function Kt = Regolith_Thermal_Conductivity(Temperature,Kc,Chi)
%Regolith_Thermal_Conductivity
%    Thermal Conductivity W m^-1 s^-1
Kt = Kc*(1+Chi*(Temperature./350).^2);
end

