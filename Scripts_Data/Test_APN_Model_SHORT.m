% Copyright 2013-2023 The MathWorks, Inc.

mdl = 'Aircraft_Power_Network';
open_system(mdl);
open_system([mdl '/Tuned']);
open_system([mdl '/Gen1 Data']);

for Flight_Cycle_Num = 1:3
    Plot_FC;
    sim(mdl);
end

open('APN_Model_Report_SHORT.html');

%{
ModelVariants = {'System Level' 'Mean Value' 'Detailed'};
BattVariants = {'Predefined' 'Generic'};
VehVariants = {'Simple' 'Full'};
SimDuration = [max(UrbanCycle1.time) max(UrbanCycle2.time) max(UrbanCycle3.time)];
%}
