% Execute HAPI make_waves command to load pre-cooked waveform
% 12:49:54 Fri 30 Jul 2021 - Scott Robson
function load_waves()
global UUTS
global pypath
global call_cmd_str

uut_string = UUTS{1};

command = sprintf("%s %s/user_apps/utils/make_waves.py load_raw load_uut %s continuous",...
    call_cmd_str,pypath,uut_string);
system(command);
