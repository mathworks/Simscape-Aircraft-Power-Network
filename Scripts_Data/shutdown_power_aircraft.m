% Shutdown script for Aircraft Power Network
% Copyright 2013-2019 The MathWorks, Inc.

% ssc_clean custom libraries
cd(fileparts(which('Aircraft_Power_Network.slx')))
cd(['Libraries' filesep 'Battery']);
if(exist('+LeadAcidBattery','dir') && exist('LeadAcidBattery_lib','file'))
    ssc_clean LeadAcidBattery
end
cd(fileparts(which('Aircraft_Power_Network.slx')))

