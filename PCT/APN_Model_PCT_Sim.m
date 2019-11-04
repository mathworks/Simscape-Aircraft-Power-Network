%% SETUP MODEL FOR RSIM
% Copyright 2013 The MathWorks(TM), Inc.

mdl = 'Aircraft_Power_Network';
open_system(mdl);
open_system([mdl '/Tuned']);
open_system([mdl '/No tictoc']);
set_param(mdl,'StopTime','600');
save_system(mdl);

%% BUILD TARGET
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl);

%% GENERATE PARAMETER SETS
Flight_Cycle_array = [1:1:length(FCFiles)]; 
SimSettings = Generate_Sim_Settings(Flight_Cycle_array,'Flight_Cycle_Num',rtp);

numSims = length(SimSettings);
out = cell(1, numSims);

%% START PARALLEL POOL
parpool(2);
Initialize_MLPool

%% SIMULATE
tic;
parfor i = 1:numSims
    out{i} = sim(mdl, SimSettings{i});
end
Total_Testing_Time = toc;
disp(['Total Testing Time = ' num2str(Total_Testing_Time)]);

%% PLOT RESULTS
figure(1)
clf
set(gcf,'Position',[11   356   545   293]);

for i=1:numSims
    data = out{i}.find('Gen1_DATA');
    plot(data.time(:,1),data.signals(3).values(:,1),'LineWidth',2)
    hold all
    legendstrings{i} = ['Cycle ' num2str(i)];
end
title('Generator Power','FontSize',16,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12,'FontWeight','Bold');
ylabel('Power (W)','FontSize',12,'FontWeight','Bold');
legend(legendstrings,'FontSize',10);
set(gca,'YLim',[0.4e4 1.6e4]);

%% CLOSE PARALLEL POOL
delete(gcp);
open_system([mdl '/tictoc']);
set_param(mdl,'StopTime','40');
save_system(mdl);

%% CLEANUP DIR
delete('*.mex*')
!rmdir slprj /S/Q