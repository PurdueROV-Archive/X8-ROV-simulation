%This PID loop currently only looks at the X angle its PID loop

function [angle time] = PID(endAngle, startAngle)

	%margin of errer in angle that is acceptable
	angleError = 0.5;

	%time increment
	dt = 0.020

	%success counter counts many consecutive times the end angle has been reached
	successcounter = 0;

	%success num is the number of times the target is meet before end the pid
	successNum = 10;


	




	[endX, endY, endZ] = decompose_rotation(endAngle);
	[startX, startY, startZ] = decompose_rotation(startAngle);

	%create a variable that I can mess with
	curX = startX
	endX
	

	time = [0];
	angle = [curX];

	%P, I, and D values
	P = .0001;

	xError = 0;


	%loops until end angle is reached
	while successcounter < successNum

		%if the angle is within the margin of error
		if endX > curX - angleError && endX < curX + angleError;
			successcounter = successcounter + 1;
		end

		%Update the P, I, and D values

		%error between current and desired state

		xError = endX - curX

		curX = curX + xError * P;

		%update angle and time variable
		time = [time time(end) + dt]; 
		angle = [angle curX];

	end



end


function [x,y,z] = decompose_rotation(R)
		x = atan2(R(3,2), R(3,3));
	y = atan2(-R(3,1), sqrt(R(3,2)*R(3,2) + R(3,3)*R(3,3)));
	z = atan2(R(2,1), R(1,1));
end