v = 1; 
R = 1;
T = 1/R; 
f = 0:0.001*R:2*R; 
f = f + 1e-10; 
f_zero = 1e-9;

% Unipolar NRZ
s_unipolar_nrz = (v^2 * T/4) * (sin(pi * f * T) ./ (pi * f * T)).^2;
s_unipolar_nrz(1) = s_unipolar_nrz(1) + (v^2 / 4) + f_zero;

figure;
stem(f_zero, s_unipolar_nrz(1), 'or', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(f, s_unipolar_nrz, '-r', 'LineWidth', 2);

% Manchester code
s_manchester = (v^2 * T) * ((sin(pi * f * T/2) ./ (pi * f * T/2)).^2) .* (sin(pi * f * T/2).^2);
plot(f, s_manchester, '--g', 'LineWidth', 2);

% Polar NRZ
s_polar_nrz = (v^2 * T) * (sin(pi * f * T) ./ (pi * f * T)).^2;
plot(f, s_polar_nrz, '--b', 'LineWidth', 2);

% Bipolar RZ
s_bipolar_rz = (v^2 * T/4) * ((sin(pi * f * T/2) ./ (pi * f * T/2)).^2) .* (sin(pi * f * T).^2);
plot(f, s_bipolar_rz, '--k', 'LineWidth', 2);

legend('Unipolar NRZ: impulse at f=0', 'Unipolar NRZ', 'Manchester code', 'Polar NRZ', 'Bipolar RZ / RZ-AMI');
xlabel('Normalized frequency');
ylabel('Power spectral density');
title('Power Spectral Density for Different Line Codes');
