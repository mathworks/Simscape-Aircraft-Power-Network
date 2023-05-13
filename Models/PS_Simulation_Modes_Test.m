% Copyright 2013-2023 The MathWorks, Inc.

mdl = 'PS_Simulation_Modes';
open_system(mdl);
set_param([mdl '/powergui'], 'SimulationMode','Continuous');
sim(mdl);
VI_Data_CONT = VI_Data;

set_param([mdl '/powergui'], 'SimulationMode','Discrete');
set_param([mdl '/powergui'], 'SampleTime','1e-4');
sim(mdl);
VI_Data_DISC = VI_Data;

set_param([mdl '/powergui'], 'SimulationMode','Phasor');
set_param([mdl '/powergui'], 'Frequency','60');
sim(mdl);
VI_Data_PHAS = VI_Data;

figure(1)
set(gcf,'Position',[13    52   519   530]);
Lwidth = 2;
subplot(211)
plot(VI_Data_CONT.time,VI_Data_CONT.signals(1).values,'b','LineWidth',Lwidth);
hold on
stairs(VI_Data_DISC.time,VI_Data_DISC.signals(1).values,'r:','LineWidth',Lwidth);
plot(VI_Data_PHAS.time,VI_Data_PHAS.signals(1).values,'g','LineWidth',Lwidth);
hold off
title('Line Voltage','FontSize',14,'FontWeight','Bold');
legendstrings = {['Continuous'], ['Discrete'], ['Phasor']};
legend(legendstrings,'Location','Best','FontSize',12,'FontWeight','Bold');

subplot(212)
plot(VI_Data_CONT.time,VI_Data_CONT.signals(2).values,'b','LineWidth',Lwidth);
hold on
stairs(VI_Data_DISC.time,VI_Data_DISC.signals(2).values,'r:','LineWidth',Lwidth);
plot(VI_Data_PHAS.time,VI_Data_PHAS.signals(2).values,'g','LineWidth',Lwidth);
hold off
title('Load Current','FontSize',14,'FontWeight','Bold');

figure(2)
set(gcf,'Position',[550    52   464   530]);
semilogy(VI_Data_CONT.time(1:end-1),diff(VI_Data_CONT.time),'b-x','LineWidth',Lwidth);
hold on
semilogy(VI_Data_DISC.time(1:end-1),diff(VI_Data_DISC.time),'r-x','LineWidth',Lwidth);
semilogy(VI_Data_PHAS.time(1:end-1),diff(VI_Data_PHAS.time),'g-.x','LineWidth',Lwidth);
hold off
title('Simulation Step Size','FontSize',14,'FontWeight','Bold');
legendstrings = {...
    ['Continuous, ' num2str(length(VI_Data_CONT.time)) ' Steps'],...
    ['Discrete, ' num2str(length(VI_Data_DISC.time)) ' Steps'],...
    ['Phasor, ' num2str(length(VI_Data_PHAS.time)) ' Steps']};
legend(legendstrings,'Location','Best','FontSize',12,'FontWeight','Bold');


