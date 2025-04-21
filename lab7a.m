% Initialize current amplitudes (21 values in the range 0-60 A)
i_a = (0:20) * 3;

% Initialize phase voltage arrays for different power factors
v_phase_02 = zeros(1, 21);
v_phase_04 = zeros(1, 21);
v_phase_06 = zeros(1, 21);
v_phase_08 = zeros(1, 21);

% Given parameters
e_a = 277.0; % Excitation voltage
x_s = 1.0;   % Synchronous reactance

% Power factors and corresponding angles
pf_values = [0.2, 0.4, 0.6, 0.8];
theta_values = acos(pf_values); % Convert power factors to angles in radians

% Calculate v_phase for each power factor
for ii = 1:21
    % 0.2 PF
    v_phase_02(ii) = sqrt(e_a^2 - (x_s * i_a(ii) * cos(theta_values(1)))^2) ...
                     - (x_s * i_a(ii) * sin(theta_values(1)));
    
    % 0.4 PF
    v_phase_04(ii) = sqrt(e_a^2 - (x_s * i_a(ii) * cos(theta_values(2)))^2) ...
                     - (x_s * i_a(ii) * sin(theta_values(2)));

    % 0.6 PF
    v_phase_06(ii) = sqrt(e_a^2 - (x_s * i_a(ii) * cos(theta_values(3)))^2) ...
                     - (x_s * i_a(ii) * sin(theta_values(3)));

    % 0.8 PF
    v_phase_08(ii) = sqrt(e_a^2 - (x_s * i_a(ii) * cos(theta_values(4)))^2) ...
                     - (x_s * i_a(ii) * sin(theta_values(4)));
end

% Calculate terminal voltage from phase voltage
v_t_02 = v_phase_02 .* sqrt(3);
v_t_04 = v_phase_04 .* sqrt(3);
v_t_06 = v_phase_06 .* sqrt(3);
v_t_08 = v_phase_08 .* sqrt(3);

% Plot the terminal characteristics for different power factors
figure;
hold on;
plot(i_a, v_t_02, 'r', 'LineWidth', 2, 'DisplayName', '0.2 PF Lagging');
plot(i_a, v_t_04, 'b', 'LineWidth', 2, 'DisplayName', '0.4 PF Lagging');
plot(i_a, v_t_06, 'g', 'LineWidth', 2, 'DisplayName', '0.6 PF Lagging');
plot(i_a, v_t_08, 'k', 'LineWidth', 2, 'DisplayName', '0.8 PF Lagging');

% Graph Labels
xlabel('Line Current (A)', 'FontWeight', 'Bold');
ylabel('Terminal Voltage (V)', 'FontWeight', 'Bold');
title('Terminal Characteristics for Various Power Factors', 'FontWeight', 'Bold');
legend('show'); % Show legend
grid on;
axis([0 60 350 550]); % Adjusted axis for clarity
hold off;