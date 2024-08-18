function Select_APN_Model_Config(mdl,variant)
% Copyright 2013-2024 The MathWorks, Inc.

if (strcmp(variant,'Initial') || strcmp(variant,'Tuned') )
    set_param([mdl '/TRU DC Loads'], 'ModelType','Phasor');
    set_param([mdl '/Pump (12kVA AC)'], 'ModelType','Phasor');
    set_param([mdl '/Actuator (2kW AC)'], 'ModelType','Phasor');
    set_param([mdl '/Lamp (1 kW AC)'], 'ModelType','Phasor');
    set_param([mdl '/AC Power Distr'], 'ModelType','Phasor');
    set_param([mdl '/Scopes/Power/Power Calc'], 'ModelType','Phasor');
    set_param([mdl '/powergui'], 'SimulationMode','Phasor');
    set_param(mdl,'SolverType','Variable-Step');
    set_param(mdl,'Solver','ode23t');

    set_param([mdl '/TRU DC Loads'], 'PQ_Model',variant);
    set_param([mdl '/Pump (12kVA AC)'], 'PQ_Model',variant);
    set_param([mdl '/Actuator (2kW AC)'], 'PQ_Model',variant);
    set_param([mdl '/Lamp (1 kW AC)'], 'PQ_Model',variant);

elseif (strcmp(variant,'Detailed'))
    set_param([mdl '/powergui'], 'SimulationMode','Discrete');
    set_param([mdl '/powergui'], 'SampleTime','Ts');
    set_param([mdl '/TRU DC Loads'], 'ModelType','Detailed');
    set_param([mdl '/Pump (12kVA AC)'], 'ModelType','Detailed');
    set_param([mdl '/Actuator (2kW AC)'], 'ModelType','Detailed');
    set_param([mdl '/Lamp (1 kW AC)'], 'ModelType','Detailed');
    set_param([mdl '/AC Power Distr'], 'ModelType','Detailed');
    set_param([mdl '/Scopes/Power/Power Calc'], 'ModelType','Detailed');
    set_param(mdl,'SolverType','Fixed-Step','Solver','ode3');
end