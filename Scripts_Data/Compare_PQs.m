% Copyright 2013-2018 The MathWorks, Inc.

cd([APN_HomeDir '/Simulation_Results']);
mdl = 'Aircraft_Power_Network';
open_system(mdl);
open_system([mdl '/Detailed']);

% LOG DATA FROM PQ SCOPES
syspath = 'Aircraft_Power_Network/Scopes/PowerMeas/';
scplist = {'PQ TRU','PQ Induction Motor','PQ Lamp','PQ BDMotor'};

for i = 1:length(scplist);
    blkpath = [syspath char(scplist(i))];
    set_param(blkpath,'SaveToWorkspace','on');
    set_param(blkpath,'Decimation','1');
end
    

for i = 6:6%1:length(FCFiles)
    Flight_Cycle_Num = i;
    sim(mdl)
    save(['PQ_DATA_FC' num2str(i)],'PQ_*');
end

pqlist = who('PQ*');
for i = 1:length(pqlist)
    figure(i)
    eval(['pqdata = ' char(pqlist(i)) ';']);
    dataname = strrep(char(pqlist(i)),'_','\_');
    subplot(211)
    plot(pqdata.time,pqdata.signals(1).values(:,2),'r:');
    hold on;
    plot(pqdata.time,pqdata.signals(1).values(:,3),'b');
    hold off
    title(['Active Power (P), ' dataname]);
    legend({'Detailed','Abstract'});
    subplot(212)
    plot(pqdata.time,pqdata.signals(2).values(:,2),'r:');
    hold on;
    plot(pqdata.time,pqdata.signals(2).values(:,3),'b');
    hold off
    title(['Reactive Power (Q), ' dataname]);
    legend({'Detailed','Abstract'}); 
end


for i = 1:length(scplist);
    blkpath = [syspath char(scplist(i))];
    set_param(blkpath,'SaveToWorkspace','off');
    set_param(blkpath,'Decimation','100');
end
