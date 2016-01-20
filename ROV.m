classdef ROV
    %ROV Summary of this class goes here
    
    
    
    %   function ROV(obj, newPosition, newMass, newOrientation, newMoment, timeInterval)
    
    properties
        motors
        mass
        moment
        orientation
        omega
        position
        dt
        maxInput
        maxThrust
        inputScale
        numMotors
        
    end
    
    methods
        
        function obj = ROV(newPosition, newMass, newOrientation, newMoment, timeInterval, motorOrientation, motorPosition, newMaxInput, newMaxThrust, newOmega)
           obj.orientation = newOrientation;
           obj.mass = newMass;
           obj.moment = newMoment;
           obj.position = newPosition;
           obj.dt = timeInterval;
           obj.motors = [];
           obj.maxInput = newMaxInput;
           obj.maxThrust = newMaxThrust;
           obj.inputScale = newMaxThrust / newMaxInput;
           obj.omega = newOmega;
           
          [obj.numMotors, temp] =  size(motorPosition);
           
           for i = 1:obj.numMotors
               
                y = motor(obj.dt, motorOrientation(i, :), motorPosition(i, :), obj.maxInput, obj.maxThrust);
                
                obj.motors = [obj.motors, y];
            end
           
        end
        
        function [newOrientation newOmega] = updateRotation(obj, input)
            
            %restricts the maximum input the motors can receive
            %if(input(1) > obj.maxInput)
            %    input(1) = obj.maxInput;
            %end   
            %if(input(2) > obj.maxInput)
            %    input(2) = obj.maxInput;
            %end   
            %if(input(3) > obj.maxInput)
            %    input(3) = obj.maxInput;
            %end
            torque = [0, 0, 0];
            
            
            %loops through each of the motors and calculate the torque from
            %each motor
            for i = 1:obj.numMotors
                torque = torque + getForce(obj.motors(i), obj.orientation, input(i) * obj.inputScale);
            end        
              
            
            %calculate angualr acceleration based on the angular torque and
            %moment of inertia
            alpha = torque ./ obj.moment;
            
            %calculate the new omega
            %calculate the average omega between the previous and new omega
            newOmega = obj.omega + alpha .* obj.dt;
            
            avgOmega = (obj.omega + newOmega) ./ 2;
            
            %update obj.orientation based average omegao
            newOrientation = obj.orientation + avgOmega .* obj.dt;
              
        end
       
        
        
    end
    
end

