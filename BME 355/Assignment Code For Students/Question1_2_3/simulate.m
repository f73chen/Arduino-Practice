function simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol)
    % Input Parameters
    % T: simulation time (seconds)
    % f0M: maximum isometric force
    % resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
    % resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1
    
    %%% TASK 1
    % Define the Hill-type muscle
    hill_type = HillTypeMuscle(f0M, resting_length_muscle, resting_length_tendon);
    
    %%% TASK 2
    % Isometric contraction at resting lengths
    muscle_tendon_length = resting_length_muscle + resting_length_tendon;
    % Return velocity based on time and normalized muscle length
    function [sim_velocity] = simulation_velocity(time, normalized_muscle_length)
        if time < 0.5
            a = 0;
        else
            a = 1;
        end
        normalized_tendon_length = hill_type.norm_tendon_length(muscle_tendon_length, normalized_muscle_length);
        sim_velocity = get_velocity(a, normalized_muscle_length, normalized_tendon_length);
    end
    
    %%% TASK 3
    % the outputs of ode45 must be named "time" and "norm_lm"
    tspan = [0, T];
    initial_condition = 1;
    options = odeset('RelTol', RelTol);
    [time, norm_lm] = ode45(@simulation_velocity, tspan, initial_condition, options);
    
    %%% TASK 4
    % save the estimated forces in a vector called "forces"
    forces = hill_type.get_force(muscle_tendon_length, norm_lm);
    
    % Do not alter the rest (it should not be needed)
    norm_lm = norm_lm * resting_length_muscle;
    
    % Plot results
    figure()
    LineWidth = 1.5;
    FontSize = 12;
    
    subplot(2,1,1)
    plot(time, norm_lm, 'LineWidth', LineWidth)
    xlabel('Time (s)')
    ylabel('Normalized CE Length (m)')
    set(gca,'FontSize', FontSize)
    
    subplot(2,1,2)
    plot(time, forces, 'LineWidth', LineWidth)
    xlabel('Time (s)')
    ylabel('CE Tension (N)')
    set(gca,'FontSize', FontSize)
end