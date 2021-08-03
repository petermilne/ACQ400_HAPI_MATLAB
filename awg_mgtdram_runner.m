% Execute HAPI make_waves command to run an awg_mgtdram shot(s)
% 17:04:20 Fri 30 Jul 2021 - Scott Robson
function awg_mgtdram_runner()
global UUTS
global pypath
global call_cmd_str

shots = 1;
mu = UUTS{1};

uut_string = "";
for i=2:length(UUTS); uut_string = append(uut_string,UUTS{i}," ");end

command = sprintf("%s %s/user_apps/special/awg_mgtdram_runner.py --shots=%d --save_egu=1 --awg_restart=1 --shot_seconds=1 --mu=%s %s",...
    call_cmd_str,pypath,shots,mu,uut_string);

system(command);
