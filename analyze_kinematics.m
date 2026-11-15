%% KineticCoach - Automated MATLAB Biomechanical Analysis Pipeline
data = readtable('telemetry.csv');
t = data.Time_s;
theta = movmean(data.Angle_deg, 3);

omega = gradient(theta, t);
alpha = gradient(omega, t);
jerk  = gradient(alpha, t);

min_rom = round(min(theta), 1);
max_rom = round(max(theta), 1);
mean_vel = round(mean(abs(omega)), 1);
peak_vel = round(max(abs(omega)), 1);
rms_jerk = round(rms(jerk), 1);
smoothness = round(max(0, min(100, 100 - std(abs(omega))*0.35)), 1);

res = struct('min_rom', min_rom, 'max_rom', max_rom, 'mean_vel', mean_vel, ...
             'peak_vel', peak_vel, 'rms_jerk', rms_jerk, 'smoothness', smoothness, ...
             'engine_status', 'MATLAB Live Engine');
fid = fopen('matlab_results.json', 'w');
fprintf(fid, '%s', jsonencode(res));
fclose(fid);

fig = figure('Name', 'KineticCoach MATLAB Biomechanics', 'Color', [0.06 0.09 0.16], ...
             'Position', [100, 100, 1000, 580], 'Visible', 'off');

subplot(3,1,1);
plot(t, theta, 'Color', [0.22 0.74 0.97], 'LineWidth', 2.2); hold on;
yline(50, '--g', 'LineWidth', 1.4); yline(68, '--g', 'LineWidth', 1.4);
title('MATLAB Signal Processing: Smoothed Joint Flexion (\theta)', 'Color', 'w');
ylabel('Angle (deg)', 'Color', 'w'); set(gca, 'Color', [0.12 0.16 0.23], 'XColor', 'w', 'YColor', 'w'); grid on;

subplot(3,1,2);
plot(t, omega, 'Color', [0.98 0.57 0.24], 'LineWidth', 1.8);
title('MATLAB 1st Derivative: Angular Velocity (\omega = d\theta/dt)', 'Color', 'w');
ylabel('deg/s', 'Color', 'w'); set(gca, 'Color', [0.12 0.16 0.23], 'XColor', 'w', 'YColor', 'w'); grid on;

subplot(3,1,3);
plot(t, jerk, 'Color', [0.75 0.52 0.99], 'LineWidth', 1.5);
title('MATLAB 3rd Derivative: Kinematic Jerk (d^3\theta/dt^3 - Tremor & Smoothness)', 'Color', 'w');
xlabel('Time (s)', 'Color', 'w'); ylabel('deg/s^3', 'Color', 'w');
set(gca, 'Color', [0.12 0.16 0.23], 'XColor', 'w', 'YColor', 'w'); grid on;

exportgraphics(fig, 'matlab_biomechanics.png', 'Resolution', 150);
close(fig);
