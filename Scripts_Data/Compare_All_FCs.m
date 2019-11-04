% Copyright 2013-2019 The MathWorks, Inc.

cd([APN_HomeDir '/Simulation_Results']);
mdl = 'Aircraft_Power_Network';
open_system(mdl)

for i = 1:length(FCFiles)
    Flight_Cycle_Num = i;
    if (Flight_Cycle_Num<=3)
        set_param(mdl,'StopTime','40');
    else
        set_param(mdl,'StopTime','5');
    end
    Compare_PhasorDetailed
    saveas(gcf,['./Compare_PhDet_FC_' num2str(i)],'fig');
    close(gcf);
end
