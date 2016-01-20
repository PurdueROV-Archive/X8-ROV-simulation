function visualize(angle, time)
	
    

	hold on;

	figure(1)
    subplot(3, 1, 1)
    plot(time, angle(:, 1))
    
    ylabel('x angle')
    xlabel('time')
    
    
    hold on;
    
    subplot(3, 1, 2)
    plot(time, angle(:, 2))
       
    ylabel('y angle')
    xlabel('time')
    
    hold on;
    
    subplot(3, 1, 3)
    plot(time, angle(:, 3))
    
    ylabel('z angle')
    xlabel('time')

end



