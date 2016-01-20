classdef motor
    %This class contains all of the variables and methods needed to model
    %a brushless DC motor used on the ROV. Parameters can be changed to
    %meet your motors and motor configuration.
    
    %   Detailed explanation goes here
    
    properties
       tau
       orientationAngle     
       position     %position relative to the center of the ROV
       maxThrust 
       maxInput
       dt
       
       
    end
    
    methods
        function obj = motor(timeInterval, orientation, newPosition, newMaxThrust, newMaxInput)
            obj.dt = timeInterval;
            obj.orientationAngle = orientation;
            obj.maxThrust = newMaxThrust;
            obj.maxInput = newMaxInput;
            obj.position = newPosition;
        end
        
        function torque = getForce(obj, RovOrientation, inputForce)
            
            
            torque = obj.position .* inputForce;
        end
        
        
    end
    
end


