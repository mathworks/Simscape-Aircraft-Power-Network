% Copyright 2013-2022 The MathWorks, Inc.

mdl = 'sim_modes_data';
sim(mdl);
figure(1)
set(gcf,'Position',[624   594   496   299]);
clf
plot(SimModesData.time,SimModesData.signals.values(:,1),'b','LineWidth',3);
hold on
stairs(SimModesData.time,SimModesData.signals.values(:,2),'r','LineWidth',2);
plot(SimModesData.time,SimModesData.signals.values(:,3),'g','LineWidth',2);
hold off

set(gca,'YLim',[-2 2]);
set(gca,'XLim',[-1 11]);
