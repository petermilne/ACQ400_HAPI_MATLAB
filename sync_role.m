% Execute HAPI sync_role command to configure clocking on UUTS
% 15:51:11 Wed 28 Jul 2021 - Scott Robson
function sync_role(clk_rate)
global UUTS
global pypath
global call_cmd_str

uut_string = "";

for i=1:length(UUTS); uut_string = append(uut_string,UUTS{i}," ");end

command = sprintf("%s %s/user_apps/acq400/sync_role.py --toprole=master --fclk=%d %s",...
    call_cmd_str,pypath,clk_rate,uut_string);

system(command);