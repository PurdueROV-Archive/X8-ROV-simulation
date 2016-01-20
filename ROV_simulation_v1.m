%Technical notes about the simulation
%
%I am concidering positive rotation to be CCW and negative roation CW.
%
%

   
motorOrienations = [[1, 1, 1]; [2, 2, 2]; [3, 3, 3]; [4, 4, 4]];
motorPositions = [[1, 1,0]; [-1, 1, 0]; [-1, -1. 0]; [1, -1, 0]];


mass = 6; %mass in Kg
moment = [1, 1, 1]; %moment about X, Y, and Z axismass
position = [0, 0, 0];
 
orientation = [0, 0, 0]; %starting orientation of ROV
dt = 20 / 1000; %time step in seconds
maxInput = 20000; %input that the thrusters take
maxThrust = 6; 
startingOmega = [0, 0, 0];

rovSimulation = ROV(position, mass, orientation, moment, dt, motorOrienations, motorPositions, maxInput, maxThrust, startingOmega);





Angle = []; %creates an empty array to start storing the angle values
Time = 0:rovSimulation.dt:20; %stores the time values for later

input = [20000, 0, 0, 10000];


for time = Time
    
    if(time == 10.0)
        input = -1 .* input;
    end
    
    [newOrientation newOmega] = updateRotation(rovSimulation, input);
    
    rovSimulation.omega = newOmega;
    rovSimulation.orientation = newOrientation;
    Angle = [Angle; newOrientation];  
     
end
    visualize(Angle, Time);

clear