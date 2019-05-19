function Kt = Marov_Fluff_Thermal_Conductivity(Temperature)
%Marov_Fluff_Thermal_Conductivity 
%    Thermal Conductivity W m^-1 s^-1
Kt = 1.2E-3+Temperature.^3 * 0.5E-10;
end

