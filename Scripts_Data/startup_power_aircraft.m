% ADD PATHS
% Copyright 2013-2019 The MathWorks, Inc.

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

% OPEN MODEL
Aircraft_Power_Network

%  OPEN DEMO SCRIPT
open('APN_Demo_Script.html')

