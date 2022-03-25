function [] = simulate(T)
    % Runs a simulation of the model and plots results.
    % Inputs
    % T: total time to simulate, in seconds
    
    rest_length_tibialis = tibialis_length(0);
    
    tibialis = HillTypeMuscle(2000, 0.6*rest_length_tibialis, 0.4*rest_length_tibialis);
    
    f = @(t, x) dynamics(x, tibialis);
    
    tspan = [0 T];
    initialCondition = [0, 0, 1];
    options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);
    [time, y] = ode45(f, tspan, initialCondition, options);
    
    theta = y(:,1);
    tibialis_norm_length_muscle = y(:,3);
    
    tibialis_moment_arm = 0.03;
    tibialis_moment = zeros(size(y,1),1);
    for i = 1:size(y,1)
        tibialis_moment(i) = tibialis_moment_arm * tibialis.get_force(tibialis_length(theta(i)), tibialis_norm_length_muscle(i));
    end
    
    figure()
    LineWidth = 1.5;
    subplot(2,1,1)
    plot(time, theta, 'LineWidth', LineWidth)
    ylabel('Body Angle (rad)')
    
    subplot(2,1,2)
    plot(time, tibialis_moment, 'g', 'LineWidth', LineWidth), hold on
    plot(time, gravity_moment(theta), 'k', 'LineWidth', LineWidth), hold off
    legend('Tibialis', 'Gravity', 'Location','northwest')
    xlabel('Time (s)')
    ylabel('Torques (Nm)')
    set(gca,'FontSize',12)
end