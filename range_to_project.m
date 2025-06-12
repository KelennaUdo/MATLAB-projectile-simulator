% TOF =  total time of flight
% TMH = time to reach max height
% MH = max height
% D = displacement
% LV = landing velocity
% Vm = Velocity magnitude
% Vd = Velocity direction
% g = 9.81 m/s^2
% D = Displacement
% Ddir = Displacement Direction
% Vm = Velocity magnitude
% Vd = Velocity direction

function [TOF, TMH, MH, D, LV, Vd, Vm] = range_to_project(D, Ddir, theta)
% This function allows the user to input a range and it will calculate the 
% launch velocity needed. 
g = 9.81;
% It assumes the object is projected at a 45 degree angle to the X - Z
% plane if theta is not given
if ~exist("theta","var")
    theta = 45;
end

% convert theta to radians
 theta = (2*pi*theta)/360;

%Change Displacement direction to a unit vector
unit_D = unit_vector(Ddir);


adjacent = (Ddir(1,1)^2 + Ddir(1,2)^2)^(1/2);
% Find the unit vector of launch velocity and assign it to Velocity
% direction
unit_V = unit_vector([Ddir(1,1), tan(theta)*adjacent, Ddir(1,2)]);
Vd = unit_V;

%Extract the components of velocity
unit_Vx = unit_V(1,1); unit_Vy = unit_V(1,2); unit_Vz = unit_V(1,3);

%Extract the X component of displacement
vector_D = D*unit_D;
Dx = vector_D(1,1); 
Dz = vector_D(1,2);
%Calculate the Magnitude of velocity
if unit_Vz == 0
Vm = ((g*Dx)/(2*unit_Vx*unit_Vy))^(1/2);
else
Vm = ((g*Dz)/(2*unit_Vz*unit_Vy))^(1/2);
end

%Call the Project function
[TOF, TMH, MH, D, LV] = project(Vm, Vd);
end