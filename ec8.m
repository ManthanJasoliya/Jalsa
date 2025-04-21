% Define constants (to be extracted from Example Problem 7-5)
Vs = 400; % Supply voltage (example value)
omega_s = 2 * pi * 50; % Synchronous speed (example value)
R_th = 0.5; % Thevenin resistance (example value)
X_th = 1.0; % Thevenin reactance (example value)
X_R = 1.0; % Rotor reactance (example value)
R_R_base = 0.6; % Base rotor resistance (example value)

% Define slip range
s = 0:0.01:1;

% Case (a): Chosen value of R_R
T_a = (3 / omega_s) * (Vs^2 * (R_R_base ./ s) ./ ((R_th + R_R_base ./ s).^2 + (X_th + X_R).^2));

% Case (b): Half of R_R
T_b = (3 / omega_s) * (Vs^2 * ((R_R_base/2) ./ s) ./ ((R_th + (R_R_base/2) ./ s).^2 + (X_th + X_R).^2));

% Case (c): Double of R_R
T_c = (3 / omega_s) * (Vs^2 * ((2*R_R_base) ./ s) ./ ((R_th + (2*R_R_base) ./ s).^2 + (X_th + X_R).^2));

% Plotting
speed = (1 - s) * omega_s / (2 * pi); % Convert slip to speed (RPM)
plot(speed, T_a, 'b', 'DisplayName', 'R_R = Base');
hold on;
plot(speed, T_b, 'r', 'DisplayName', 'R_R = Base/2');
plot(speed, T_c, 'g', 'DisplayName', 'R_R = 2*Base');
xlabel('Speed (RPM)');
ylabel('Torque (N-m)');
title('Torque-Speed Characteristics of Induction Motor');
legend('show');
grid on;
hold off;