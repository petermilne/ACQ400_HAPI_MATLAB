% Execute HAPI acq400_hello_world command to check working environment
% 16:24:53 Wed 28 Jul 2021 - Scott Robson
function acq400_hello_world()
global UUTS
global pypath
global call_cmd_str

uut_string = "";

for i=1:length(UUTS); uut_string = append(uut_string,UUTS{i}," ");end


command = sprintf("%s %s/user_apps/acq400/acq400_hello_world.py %s",...
    call_cmd_str,pypath,uut_string);

system(command);