% Simply plots number of channels for quick data validation.
% Scott Robson - 11:25:04 Tue 20 Jan 2015
function simple_plot(location,ch_mask,word_length,volts,xmin,xmax)

	if nargin < 3
		fprintf( "\nNot enough input arguments.\n location, ch_mask, word_length, volts, xmin, xmax\n")
        fprintf("\nExample run\n\nsimple_plot(""acq2106_054"", 1:32, 16, 10)\n\ndemux_data(""acq2106_054"", 1:32, 16, 10, 1000, 2000)\n")
		return;
	elseif nargin < 4
		volts = 0;
		xmin = 0;xmax = 0;
	elseif nargin < 5
        xmin = 0;xmax = 0;
	elseif nargin == 5
		xmin = 0;xmax = 0;
	end


	for channel=ch_mask
		filename = sprintf("./%s/CH%02i",location,channel);
		myfile=fopen(filename, "r" );
		if word_length == 16
			ch_data{channel}=fread( myfile, Inf,"int16" );
		else
			ch_data{channel}=fread( myfile, Inf,"int32" );
		end
		fclose( myfile );
    end

    % Codes to volts if specified
	if (volts ~= 0)
		vsf = 2*volts/(2^word_length);
		for i = ch_mask;
			ch_data{i} = ch_data{i}.*vsf;
		end
	end

	c_darkblue = [1 17 181] ./ 255;
	c_red = [236 21 29] ./ 255;
	c_green = [33 179 33] ./ 255;
	c_black = [18 4 19] ./ 255;
	c_purple = [124 53 187] ./ 255;
	c_yellow = [255 200 0] ./ 255;
	c_pink = [237 23 192] ./ 255;
	c_peach = [251 111 66] ./ 255;
	col_arr = {c_darkblue, c_red, c_green, c_black, c_purple, c_yellow, c_pink, c_peach};

	col_ind = 1;
	clf
	hold on;
	for i = ch_mask
		%plot(ch_data{i},"color",col_arr{col_ind},'o');
		plot(ch_data{i},"color",col_arr{col_ind});
		col_ind = col_ind + 1;
		if col_ind == 9
			col_ind = 1;
		end
	end
	hold off

	set(gcf, "papersize",[8.3,11.7]);
	set(gcf(),"paperposition",[0,0,8.3,11.7]); % Bottom,Left,Top,Right
	set(gcf(),"paperorientation","landscape");
	grid("on");
	if xmin ~= 0 && xmax ~= 0
		set(gca, 'XLim', [xmin,xmax]); % Set x-axis limits
	end
	xlabel_string = sprintf('Samples\n%s',datetime('now'));
	xlabel (xlabel_string, 'FontName','LiberationMono-Regular.ttf','FontSize',10);
	if (volts ~= 0)
		ylabel ('Volts', 'FontName','LiberationMono-Regular.ttf','FontSize',10);
	else
		ylabel ('Codes', 'FontName','LiberationMono-Regular.ttf','FontSize',10);
	end

end