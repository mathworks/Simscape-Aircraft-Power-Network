% Copyright 2013-2023 The MathWorks, Inc.

Ts=10e-6;
%load PQ_DATA4
load com_bus.mat
Flight_Cycle_Num = 1;
ssc_lead_acid_battery_ini

% LOAD FLIGHT CYCLE DATA
cd([APN_HomeDir filesep 'Scripts_Data' filesep 'FC_Data']);
x = dir('FC*.mat');
FCFiles = {x.name};
for i=1:length(FCFiles)
    load(char(FCFiles(i)));
end
FCSignalNames = {'DC_Lamp_B','DC_Heater_B','DC_Pump_B','TRU_B','AC_Pump_B','AC_Lamp_B','AC_BLDC_B','AC_BLDC_Spd'};
cd(APN_HomeDir)

% LOAD ACTIVE AND REACTIVE POWER
APN_Param.TRU.P = 2050; 
APN_Param.TRU.Q = -50;
APN_Param.Lamp.P = 1e3;
APN_Param.Lamp.Q = 15e-4;
APN_Param.Pump.P = 6820;
APN_Param.Pump.Q = -360;
APN_Param.Actuator.P = 600;
APN_Param.Actuator.Q = -50;

APN_Param.Actuator.Abstract.delay_periods = 5;
APN_Param.Actuator.Abstract.ramp_periods = 45;
APN_Param.Actuator.Abstract.step_down = 452.3;
APN_Param.Actuator.Abstract.slope = 2432.3;
APN_Param.Actuator.Abstract.q_scaling = 0.2713;

% CYCLOCONVERTER
DeadZone = 5;
block_angle = 90 - DeadZone;
%Ts  = 1e-4;
fref = 10;
Eref = 4.16e3 * sqrt(2);
Em  = 4.16e3 * sqrt(2) / sqrt(3);
fao = 0;
