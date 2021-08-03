% Function to demux ACQ400 data
% 11:57:16 Mon 02 Aug 2021 - Scott Robson
function demux_data(filename, word_length, num_ch, nsamp, offset)

	if nargin < 4
		fprintf("\nNot enough input arguments!\n\nExample run\ndemux_data(filename, word_length, num_ch, nsamp, offset)\n")
		fprintf("\ndemux_data('acq2106_054/0001.dat',16,128,100000)\n")
		return;
	elseif nargin < 5
		offset = 0;
	end

	%% Pull in shot data
	myfile=fopen(filename, "r" );
	if word_length == 32
		shot_data=fread( myfile, Inf,"int32" );
	else
		shot_data=fread( myfile, Inf,"int16" );
	end
	fclose( myfile );

	if length(shot_data) == 0
		fprintf("\n\nWARNING - NO DATA CAPTURED!!!\n\n")
    end
    
    out_filename = split(filename,"/");
    
	% Demux data
	for channel=1:num_ch
		ch_data{channel} = shot_data(channel:num_ch:end);
        filename = sprintf("%s/CH%02i",out_filename{1},channel+offset);
		fid = fopen(filename,"w");
		if word_length == 32
			fwrite(fid,ch_data{channel}(1:nsamp),"int32");
		else
			fwrite(fid,ch_data{channel}(1:nsamp),"int16");
		end
		fclose(fid);
	end

	assignin('base', 'CHx', ch_data); % Save variable to Base Workspace
end