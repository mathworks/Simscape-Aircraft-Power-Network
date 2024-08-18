% Copyright 2013-2024 The MathWorks, Inc.

open_system([mdl '/Initial']);
sim(mdl)
Gen1_DATA_PHASORi = Gen1_DATA;

open_system([mdl '/Tuned']);
sim(mdl)
Gen1_DATA_PHASORt = Gen1_DATA;

open_system([mdl '/Detailed']);
sim(mdl)
Gen1_DATA_DISCRETE = Gen1_DATA;

figure(1)
plot(Gen1_DATA_DISCRETE.time,Gen1_DATA_DISCRETE.signals(3).values,'r:');
hold on
plot(Gen1_DATA_PHASORt.time,Gen1_DATA_PHASORt.signals(3).values,'b','LineWidth',2);
plot(Gen1_DATA_PHASORi.time,Gen1_DATA_PHASORi.signals(3).values,'g:','LineWidth',2);
set(gca,'YLim',[0 1.6e4]);
hold off;
title(['Generator Power, Flight Cycle ' num2str(Flight_Cycle_Num)],'FontSize',14,'FontWeight','Bold');
legend({'Detailed','Tuned','Initial'},'Location','Best','FontSize',12,'FontWeight','Bold');


%{
figure(2)
plot(Gen1_DATA_DISCRETE.time,Gen1_DATA_DISCRETE.signals(2).values+0.45,'r:');
hold on
plot(Gen1_DATA_PHASOR.time,Gen1_DATA_PHASOR.signals(2).values);
set(gca,'YLim',[201.5 203]);
hold off;
%}
