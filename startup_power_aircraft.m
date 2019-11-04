% Copyright 2013 The MathWorks, Inc.

% ADD PATHS
APN_HomeDir = pwd;
addpath(APN_HomeDir);
addpath([APN_HomeDir '/Images']);
addpath([APN_HomeDir '/Libraries']);
addpath([APN_HomeDir '/Libraries/Battery']);
addpath([APN_HomeDir '/PCT']);
addpath([APN_HomeDir '/Reports']);
addpath([APN_HomeDir '/Scripts_Data']);
%addpath([APN_HomeDir '/Scripts_Data/Vab_Data']);
addpath([APN_HomeDir '/Scripts_Data/FC_Data']);
%addpath([APN_HomeDir '/Simulation_Results']);
addpath([APN_HomeDir '/Supporting_Models']);
%addpath([APN_HomeDir '/Tune_Abstract_Model']);

% BUILD CUSTOM LIBRARIES
if(exist('Libraries/Battery')==7)
    cd('Libraries/Battery');
    if((exist('+LeadAcidBattery')==7) && ~exist('./LeadAcidBattery_lib'))
        ssc_build LeadAcidBattery
    end
    cd(APN_HomeDir)
end

% LOAD CUSTOM SIMULINK LIBRARIES
cd([APN_HomeDir '/Libraries']);
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

% OPEN MODEL
Aircraft_Power_Network

