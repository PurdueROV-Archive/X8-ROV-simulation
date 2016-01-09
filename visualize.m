function visualize(angle, time, setpoint)
	
	hold all;

	h = figure(1);

	line([0, max(time)], [setpoint,setpoint], 'LineWidth', 2, 'Color', 'b')
	  
	plot(time, angle, '-r', 'LineWidth',2);




	set(h, 'Position', [0 0 700 700])

	grid on

	xlabel('time (s)');
	ylabel('angle');
	set(gca,'YTick',[-45:5:45])

	set(gca,'XTick',[0:0.2:max(time)])

	

end



