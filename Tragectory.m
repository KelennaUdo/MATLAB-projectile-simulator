% TOF =  total time of flight
% TMH = time to reach max height
% MH = max height
% D = displacement
% LV = landing velocity
% Vm = Velocity magnitude
% Vd = Velocity direction
% TBMH = time_before_max_height
% TAMH = time_after_max_height

function[] = Tragectory(vector_V, TMH, TOF)
% Tragectory will plot the tragectory of the projectile

%time plot
time = 0:0.0001:TOF;

% extract the X, Y, and Z velocites
Vx = vector_V(1,1); Vy = vector_V(1,2); Vz = vector_V(1,3);

% X and Z displacement plot
X = Vx*time;
Z = Vz*time;

%time plot for the Y axis
TBMH = 0:0.0001:TMH;
TAMH = TMH:0.0001:TOF;

% Y displacement plot for before, and after max height
Y_before = Vy.*(TBMH) - 0.5*(9.81)*(TBMH).^2;
Y_after =  Vy.*(TAMH) - 0.5*(9.81)*(TAMH).^2;
Y = cat(2,Y_before, Y_after);

% Error correction
if length(Y)>length(X)
    Y(end) = [];
end

% Trragectory Table
Table = table( X,Z,Y);

%Plot
plot3(Table,'X','Z','Y');

end