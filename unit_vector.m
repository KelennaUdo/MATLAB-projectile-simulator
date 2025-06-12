function [unit_vector] = unit_vector(vector)
% calculates the unit vector of Velocity
direction_magntude = 0;
for a = vector
direction_magntude = direction_magntude + a^2;
end
direction_magntude  = (direction_magntude)^(1/2);
unit_vector = vector/direction_magntude;
end
