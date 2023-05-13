% ADD PATHS
% Copyright 2013-2023 The MathWorks, Inc.

APN_HomeDir = pwd;


% BUILD CUSTOM LIBRARIES
cd(fileparts(which('Aircraft_Power_Network.slx')))
cd(['Libraries' filesep 'Battery']);
if(exist('+LeadAcidBattery','dir') && ~exist('LeadAcidBattery_lib','file'))
    ssc_build LeadAcidBattery
end
cd(fileparts(which('Aircraft_Power_Network.slx')))

% LOAD CUSTOM SIMULINK LIBRARIES
cd([APN_HomeDir filesep 'Libraries']);
liblist = dir('*_Lib.slx');
libnames = {liblist.name}';
for i=1:length(libnames)
    load_system(char(libnames(i)));
end
clear liblist libnames
cd(APN_HomeDir);

% SETUP REQUIREMENTS MANAGEMENT
if(exist('rmi')==2)
    rmi setup
end

% LOAD PARAMETERS
APN_Model_PARAM

open_start_content = 1;

% If running in a parallel pool
% do not open model or demo script
if(~isempty(ver('parallel')))
    if(~isempty(getCurrentTask()))
        open_start_content = 0;
    end
end

if(open_start_content)
    Aircraft_Power_Network
    open('APN_Demo_Script.html')
end
