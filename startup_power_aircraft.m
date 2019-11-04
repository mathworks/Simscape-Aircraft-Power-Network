% ADD PATHS
% Copyright 2013-2019 The MathWorks, Inc.

APN_HomeDir = pwd;
addpath(APN_HomeDir);
addpath([APN_HomeDir filesep 'Images']);
addpath([APN_HomeDir filesep 'Libraries']);
addpath([APN_HomeDir filesep 'Libraries' filesep 'Battery']);
addpath([APN_HomeDir filesep 'PCT']);
addpath([APN_HomeDir filesep 'Reports']);
addpath([APN_HomeDir filesep 'Scripts_Data']);
addpath([APN_HomeDir filesep 'Scripts_Data' filesep 'FC_Data']);
addpath([APN_HomeDir filesep 'Supporting_Models']);

% Folders for testing
optional_dirs = {...
    'Tune_Abstract_Model'...
    ['Scripts_Data' filesep 'Vab_Data']...
    'Simulation_Results'...
    };
for i=1:length(optional_dirs)
    opt_dir = [APN_HomeDir filesep optional_dirs{i}];
    if(exist(opt_dir,'dir'))
        addpath(opt_dir)
    end
end

% BUILD CUSTOM LIBRARIES
if(exist(['Libraries' filesep 'Battery'])==7)
    cd(['Libraries' filesep 'Battery']);
    if((exist('+LeadAcidBattery')==7) && ~exist('LeadAcidBattery_lib'))
        ssc_build LeadAcidBattery
    end
    cd(APN_HomeDir)
end

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

% OPEN MODEL
Aircraft_Power_Network

%  OPEN DEMO SCRIPT
open('APN_Demo_Script.html')

