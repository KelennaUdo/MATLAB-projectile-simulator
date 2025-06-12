fprintf('=================================================================================\nWelcome to our programming project!\nThe purpose of this program is to map out the tragectory of a projectile, given various input data.\n');
while true
enter = input('=================================================================================\nIf you would like to continue, press any number Or enter 0 to exit\n=================================================================================\n');
if enter~=0 

prompt = ('Would you like to map the tragectory of the projectile using speed or range?\nTo use speed, enter 1\nTo use range, enter 2\nenter 0 to exit\n');
choice = input(prompt); 

switch choice
    case 1
    fprintf('To plot the tragectory using speed, you have to enter the magnitude and x-y-z directon of the stating velocity\n');
    Vm = input('\nEnter the madnitude of the starting Velocity in meters/second\n');
    Vd = input('\nEnter the Direction of the starting Velocity in the [x,y,z] coordinates e.g., [1,2,1]\n');
    [TOF, TMH, MH, D, LV] = project(Vm,Vd);

    fprintf('Time of flight: %f seconds\n', TOF);
    fprintf('Maximum Height: %f meters\n', MH);
    fprintf('Time to Reach Max Height: %f seconds\n', TMH);
    fprintf('Displacement in the [x,z] direction: %s\n', mat2str(D));
    fprintf('Landing Velocity: %s \n', mat2str(LV));

    case 2
    fprintf('To plot the tragectory using displacement, you have to enter the magnitude and x-z direction of displacement,\nand angle of projection to the horizontal\n');
    D = input('Enter the magnitude of displacement in meters\n');
    Ddir = input('Enter the direction of displacement in the x-z plane,\nin the format [x,z] e.g., [2,3]\n');
    theta = input('Enter the angle of projection to the horizontal\n');
    [TOF, TMH, MH, D, LV, Vd, Vm] = range_to_project(D, Ddir, theta);
    
    fprintf('Time of flight: %f seconds\n', TOF);
    fprintf('Maximum Height: %f meters\n', MH);
    fprintf('Time to Reach Max Height: %f seconds\n', TMH);
    fprintf('Landing Velocity: %f \n', LV);
    fprintf('Displacement in the [x,z] direction: %s meters\n', mat2str(D));
    fprintf('Velocity Magnitude: %f meter per seconds\n', Vm);
    fprintf('Velocity Direction: %s \n', mat2str(Vd));
    
    case 0 
    fprintf('See ya later\n');
    break;
end

else
fprintf('See ya later\n'); 
break;
end
end 