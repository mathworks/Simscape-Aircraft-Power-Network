function Select_APN_Model_Config(mdl,variant)
% Copyright 2013-2017 The MathWorks, Inc.

if (strcmp(variant,'Initial') || strcmp(variant,'Tuned') )
    set_param([mdl '/TRU DC Loads'], 'BlockChoice','Phasor');
    set_param([mdl '/Pump (12kVA AC)'], 'BlockChoice','Phasor');
    set_param([mdl '/Actuator (2kW AC)'], 'BlockChoice','Phasor');
    set_param([mdl '/Lamp (1 kW AC)'], 'BlockChoice','Phasor');
    set_param([mdl '/AC Power Distr'], 'BlockChoice','Phasor');
    set_param([mdl '/Scopes/Power/Power Calc'], 'BlockChoice','Phasor');
    set_param([mdl '/powergui'], 'SimulationMode','Phasor');
    set_param(mdl,'SolverType','Variable-Step');
    set_param(mdl,'Solver','ode23t');

    set_param([mdl '/TRU DC Loads/Phasor/Calc PQ'], 'BlockChoice',variant);
    set_param([mdl '/Pump (12kVA AC)/Phasor/Calc PQ'], 'BlockChoice',variant);
    set_param([mdl '/Actuator (2kW AC)/Phasor/Calc PQ'], 'BlockChoice',variant);
    set_param([mdl '/Lamp (1 kW AC)/Phasor/Calc PQ'], 'BlockChoice',variant);

elseif (strcmp(variant,'Detailed'))
    set_param([mdl '/powergui'], 'SimulationMode','Discrete');
    set_param([mdl '/powergui'], 'SampleTime','Ts');
    set_param([mdl '/TRU DC Loads'], 'BlockChoice','Detailed');
    set_param([mdl '/Pump (12kVA AC)'], 'BlockChoice','Detailed');
    set_param([mdl '/Actuator (2kW AC)'], 'BlockChoice','Detailed');
    set_param([mdl '/Lamp (1 kW AC)'], 'BlockChoice','Detailed');
    set_param([mdl '/AC Power Distr'], 'BlockChoice','Detailed');
    set_param([mdl '/Scopes/Power/Power Calc'], 'BlockChoice','Detailed');
    set_param(mdl,'SolverType','Fixed-Step','Solver','ode3');
end