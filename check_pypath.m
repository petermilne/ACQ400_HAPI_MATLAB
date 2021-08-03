global pypath
[status,pypath] = system("echo %PYTHONPATH%");
pypath = pypath(1:end-1); % Pop carriage return off the end
pypath = strrep(pypath,"\","/"); % Let's work with forward slashes!
disp(pypath)

if not(contains(pypath,"acq400_hapi"))
    fprintf("\n WARNING! Have you set your PYTHONPATH enviroment variable in Windows?!?\n")
    fprintf("\n See acq400_hapi/SETPYTHONPATH.BAT\n\n")
end

use_conda = 1;
global call_cmd_str
if use_conda == 1
    call_cmd_str = "enable_conda_env.bat & python";
else
    call_cmd_str = "python3";
end