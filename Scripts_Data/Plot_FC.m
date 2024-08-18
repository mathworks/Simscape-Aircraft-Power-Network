% Copyright 2013-2024 The MathWorks, Inc.

FCData = eval(char(who(['FC0' num2str(Flight_Cycle_Num) '*'])));


numsigs = length(FCSignalNames);
colorlist = {'y','m','r','g','b','c','k','m'};
maxlist = [1 1 1 1 1 1 1 500];

if ~exist('h1_APN', 'var') || ...
        ~isgraphics(h1_APN, 'figure')
    h1_APN = figure('Name', 'Aircraft_Power_Network');
end
figure(h1_APN)
clf(h1_APN)


set(gcf,'Position',[47    54   473   556]);   

for i = 1:numsigs
    subplot(numsigs,1,i)
    stairs(FCData.time,FCData.signals.values(:,i),char(colorlist(i)),'LineWidth',2);
    set(gca,'Ylim',[-1.05 1.05]*maxlist(i));
    set(gca,'Xlim',[0 40]);
%    set(gca,'Xlim',[0 5]);
    legend(strrep(char(FCSignalNames(i)),'_','\_'));
end

subplot(numsigs,1,1)
title(['Flight Cycle ' num2str(Flight_Cycle_Num)],'FontSize',14,'FontWeight','Bold');
