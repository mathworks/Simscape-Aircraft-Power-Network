%% Use Parallel Computing and Fast Restart to sweep parameter value
% Copyright 2013-2023 The MathWorks(TM), Inc.

% Move to folder where script is saved
cd(fileparts(which(mfilename)));

% Open model and save under another name for test
orig_mdl = 'Aircraft_Power_Network';
open_system(orig_mdl);
mdl = [orig_mdl '_pct_temp'];
save_system(orig_mdl,mdl);

%% Configure model for tests
open_system([mdl '/Tuned']);
open_system([mdl '/No tictoc']);
set_param(mdl,'StopTime','600');
save_system(mdl);

%% Generate parameter sets
Flight_Cycle_array = [1:1:length(FCFiles)]; 

for i=1:length(Flight_Cycle_array)
    simInput(i) = Simulink.SimulationInput(mdl);
    simInput(i) = simInput(i).setVariable('Flight_Cycle_Num',Flight_Cycle_array(i));
end

%% Run one simulation to see time used
timerVal = tic;
sim(mdl)
Elapsed_Sim_Time_single = toc(timerVal);
disp(['Elapsed Simulation Time Single Run: ' num2str(Elapsed_Sim_Time_single)]);

%% Run parameter sweep in parallel
timerVal = tic;
simOut = parsim(simInput,'ShowSimulationManager','on',...
    'ShowProgress','on','UseFastRestart','on',...
    'TransferBaseWorkspaceVariables','on');
Elapsed_Time_Time_parallel  = toc(timerVal);

%% Calculate elapsed time less setup of parallel
Elapsed_Time_Sweep = ...
    (datenum(simOut(end).SimulationMetadata.TimingInfo.WallClockTimestampStop) - ...
    datenum(simOut(1).SimulationMetadata.TimingInfo.WallClockTimestampStart)) * 86400;
disp(['Elapsed Sweep Time Total:       ' sprintf('%5.2f',Elapsed_Time_Sweep)]);
disp(['Elapsed Sweep Time/(Num Tests): ' sprintf('%5.2f',Elapsed_Time_Sweep/length(simOut))]);

%% Plot results
plot_sim_res(simOut,'Parallel Test',Elapsed_Time_Time_parallel)

%% Close parallel pool
delete(gcp);

%% Cleanup directory
bdclose(mdl);
delete([mdl '.slx']);

%%  Plot function
function plot_sim_res(simOut,annotation_str,elapsed_time)

fig_handle_name =   'h4_aircraft_power_network_pct';

handle_var = evalin('base',['who(''' fig_handle_name ''')']);
if(isempty(handle_var))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
elseif ~isgraphics(evalin('base',handle_var{:}))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
end
figure(evalin('base',fig_handle_name))
clf(evalin('base',fig_handle_name))

%set(gcf,'Position',[11   356   545   293]);

for i=1:length(simOut)
    data = simOut(i).find('Gen1_DATA');
    plot(data.time(:,1),data.signals(3).values(:,1),'LineWidth',1)
    hold all
    legendstrings{i} = ['Cycle ' num2str(i)];
end
title('Generator Power','FontSize',16,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12,'FontWeight','Bold');
ylabel('Power (W)','FontSize',12,'FontWeight','Bold');
legend(legendstrings,'FontSize',10);
set(gca,'YLim',[0.4e4 1.6e4]);

text(0.1,0.15,sprintf('%s\n%s',annotation_str,['Elapsed Time: ' num2str(elapsed_time)]),'Color',[1 1 1]*0.6,'Units','Normalized');
end

