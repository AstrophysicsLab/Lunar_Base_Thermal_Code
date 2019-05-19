function Temperature = Lunar_Temperature_Pulse(Kc,Chi, Rho)
High =212;                  % High Temperature
Low = 50;                  % Low Temperature
Theta_amp = (High-Low)/2;   % Positive Amplitude of Temperature change
Theta_avg = Low+ Theta_amp; % Average temperature
Fourdayssec = 60*60*24*4;
T = Fourdayssec;
omega = (4*pi)/T;
dt = Fourdayssec/100000;
t = 0:dt:Fourdayssec;  
Surface_temp = Theta_avg+Theta_amp*cos(omega.*t ); % Surface 
z = 0:.1:2;                 % Plane layers
Temperature = zeros(length(z), length(t)); % Memory allocation
       % Loop over layers of dirt
       Dt = 8.7E-7;
       delta = sqrt((2*Dt)/omega);    
   for idx = 1:length(z)    % loop over time (1 year)
       for jdx =1 :length(t)  
           Temperature(idx,jdx) = Theta_avg+ Theta_amp* exp(-z(idx)/delta)*cos(omega*t(jdx) -z(idx)/delta );
           Kt = Regolith_Thermal_Conductivity(Temperature(idx,jdx),Kc,Chi) ;          
           Cv = Regolith_Heat_Capcity(Kt,Rho);
           Dt = Kt/Cv;% Skin depth 
           delta = sqrt((2*Dt)/omega);
       end                      
   end


plot(t,Surface_temp,'-.black');
hold on;              
plot(t, Temperature(2,:), '-.r', 'LineWidth', 1.5);
plot(t, Temperature(4,:), '-.m', 'LineWidth', 1.5);
plot(t, Temperature(6,:), '-.c', 'LineWidth', 1.5);
 plot(t, Temperature(11,:), '-.b', 'LineWidth', 1);
title('Regolith')
legend('Surface', '0.2 meters','0.3 meters','0.5 meters', '1 meters');
xlabel('Time', 'FontSize' , 14);
ylabel('Temperature (K)', 'FontSize' , 14);
xlim([0  t(end)]);
end