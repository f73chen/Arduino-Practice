function [x_dot] = dynamics(x, soleus, tibialis)
    % Inputs
    % x: state vector (ankle angle, angular velocity, soleus normalized CE length, TA normalized CE length)
    % soleus: soleus muscle (HillTypeModel)
    % tibialis: tibialis anterior muscle (HillTypeModel)
    
    % Output
    % x_dot: derivative of state vector
    
    soleus_activation = 0.05;
    tibialis_activation = 0.4;
    ankle_inertia = 90;
    
    % WRITE CODE HERE TO IMPLEMENT THE MODEL
    soleus_force = soleus.get_force(soleus_length(x(1)), x(3)); 
    tibialis_force = tibialis.get_force(tibialis_length(x(1)), x(4)); 
      
    x_dot = zeros(4,1); 
    x_dot(1) = x(2); 
    x_dot(2) = (soleus_force*0.05 - tibialis_force*0.03 + gravity_moment(x(1))) / ankle_inertia; % 0.05 and 0.03 are moment arms 
      
    soleus_norm_tendon_length = soleus.norm_tendon_length(soleus_length(x(1)), x(3)); 
    x_dot(3) = get_velocity(soleus_activation, x(3), soleus_norm_tendon_length); 
      
    tibialis_norm_tendon_length = tibialis.norm_tendon_length(tibialis_length(x(1)), x(4)); 
    x_dot(4) = get_velocity(tibialis_activation, x(4), tibialis_norm_tendon_length);
end