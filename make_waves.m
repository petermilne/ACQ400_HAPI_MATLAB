% Utility script to generate some basic waveforms and save to file
% 12:13:49 Fri 30 Jul 2021 - Scott Robson
function make_waves(fx, amp, amp_offset)

if nargin < 2
	fprintf("\nNot enough input arguments!\n\nExample run\n\nmake_waves(fx,amp,amp_offset)\n\nmake_waves(""sine"",0.1,0.1)\n")
	%disp "CH_DEBUG will allow user to plot individual channels to identify faulty channel\n"
	return;
elseif nargin < 3
	amp_offset = 0;
end;

for nchan = [16]
	filename = "DATA/myfile.raw"
	patt_len = 16384;
	ncycles = 2;
	t = 1:patt_len;
    
    volts_fs = 10;
    res = 16;
    amp = amp/volts_fs*2^(res-1)-1;
    ao = amp_offset/volts_fs*2^(res-1)-1;
	
	combo = [];
    clear waves
	waves = cell(1,nchan);
	for i=1:nchan
        switch fx
            case "sine_poff"
                waves{i} = amp*sin(2*pi*((1/(patt_len/ncycles))*t)-(((i-1)*2*pi/nchan)-pi/2)) + ao*i; % Sine poffset
            case "sine"
                waves{i} = amp*sin(2*pi*(1/(patt_len/ncycles))*t) + ao*i; % Sine
            case "tri"
                waves{i} = 2*amp/pi*asin( sin(2*pi*(1/(patt_len/ncycles))*t) ) + ao*i; % Triangle
            case "dc"
                waves{i} = amp*ones(1,patt_len) + ao*i; % DC
            case "ramp"
                y = linspace(-amp,amp,patt_len) + ao*i; % Ramp
                for j=1:ncycles
                    waves{i} = [waves{i},y(1:ncycles:end)];
                end
            otherwise
                waves{i} = amp*sin(2*pi*(1/(patt_len/ncycles))*t) + ao*i; % Sine
        end 
        
        combo = vertcat(combo, waves{i});
	end

	% Reshape into 1 long interleaved array
	combo2 = reshape(combo,1,nchan*length(waves{1}));
    
    % Check DIR exists
    if ~exist("DATA", 'dir')
       mkdir("DATA");
    end

	% Write to file
	fid = fopen(filename,'w');
	fwrite(fid,combo2,'int16');
	fclose(fid);
    
    assignin('base', 'waves', waves); % Save variable to Base Workspace
    assignin('base', 't', t); % Save variable to Base Workspace
    
    plot_waves

end