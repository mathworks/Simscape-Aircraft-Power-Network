% Shutdown script for Aircraft Power Network
% Copyright 2013-2021 The MathWorks, Inc.

% ssc_clean custom libraries
cd(fileparts(which('Aircraft_Power_Network.slx')))
cd(['Libraries' filesep 'Battery']);
if(exist('+LeadAcidBattery','dir') && exist('LeadAcidBattery_lib','file'))
    ssc_clean LeadAcidBattery
end
cd(fileparts(which('Aircraft_Power_Network.slx')))

% If parameter sweep plot still open, close it
try close(h4_aircraft_power_network_pct),end
clear h4_aircraft_power_network_pct
