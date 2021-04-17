% Copyright 2013-2021 The MathWorks, Inc.

mdl = 'Signal_Builder_To_Workspace';
open_system(mdl);

sigbpth = [mdl '/Flight Cycles'];
towspth = [mdl '/To Workspace'];

numcycles = size(signalbuilder(sigbpth),2);

for i = 1:numcycles
    %cyclename = ['Flight_Cycle_' num2str(i)];
    signalbuilder(sigbpth, 'activegroup', i);
    [ind, label]=signalbuilder(sigbpth,'activegroup');
    set_param(towspth,'VariableName',label);
    sim(bdroot);
    disp(['SAVING ' label '.mat']);
    save([label '.mat'],label);
    eval(['a' num2str(i) '.time = ' label '.time;']);
    eval(['a' num2str(i) '.signals.values = ' label '.signals.values;']);
end

% CREATE 50 SEC SETS
long_sets = ...
    [1 4 3 2 7 8 6 5 4 2;
     2 8 4 7 6 2 1 5 3 1;
     3 2 1 4 5 6 7 3 2 4;
     4 6 1 2 3 2 6 2 7 3;
     5 8 2 3 4 7 4 1 2 5;
     6 6 7 4 3 8 2 6 4 6;
     7 6 1 4 2 5 7 4 3 8;
     8 4 5 2 1 4 5 3 6 3];

 % CREATE 600 sec)
long_sets = repmat(long_sets,1,12);

 
for i = 1:size(long_sets,1)
    disp('i LOOP');
    fcname=who(['FC0' num2str(i) '*']);
    for j=1:size(long_sets,2)
        %disp('j LOOP');
        if (j==1)
            b.time=eval(['a' num2str(long_sets(i,j)) '.time']);
            b.signals.values=eval(['a' num2str(long_sets(i,j)) '.signals.values']);
        else
        %    disp(['[b.time;(a' num2str(j) '.time(2:end))+b.time(end)]']);
            b.time=eval(['[b.time;(a' num2str(long_sets(i,j)) '.time(2:end))+b.time(end)]']);
        %    disp(['[b.signals.values; a' num2str(j) '.signals.values(2:end,:)]']);
            b.signals.values=eval(['[b.signals.values; a' num2str(long_sets(i,j)) '.signals.values(2:end,:)]']);
        end
    end
    disp([char(fcname) ' = b;']);
    eval([char(fcname) ' = b;']);
    disp(['SAVING ' char(fcname) '.mat']);
    save([char(fcname) '.mat'],char(fcname));
    clear b;
end
            