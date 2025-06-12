% TOF =  total time of flight
% TMH = time to reach max height
% MH = max height
% D = displacement
% LV = landing velocity
% Vm = Velocity magnitude
% Vd = Velocity direction
% g = 9.81 m/s^2
function [TOF, TMH, MH, D, LV] = project(Vm, Vd)

% "Project", this function will take in a Velocity magnitude and direction
% and calculates the output parameters. 

% constants 
g = 9.81; 

% change the direction vector of Velocity to a unit vector
unit_V = unit_vector(Vd);

% Calculate the velocity vector
vector_V = Vm * unit_V;

% extract the X, Y, and Z velocites
Vx = vector_V(1,1); Vy = vector_V(1,2); Vz = vector_V(1,3);

% Calculate time to max height using Vy = (Vo)y + gt (Y-axis)
TMH = Vy/g;

% Calculate total time of flight
TOF = TMH * 2;

% Plot the Tragectory 
Tragectory(vector_V,TMH,TOF);

% Find the X and Z range (for displacement)
Range_X = Vx*TOF;
Range_Z = Vz*TOF;
D = [Range_X, Range_Z];

% Find the Max height
MH = Vy^2 / (2*g);



% Find the landing velocity
LVy = (2*g*MH)^(1/2);
LV = (Vz^2 + Vx^2 + LVy^2)^(1/2);


end

