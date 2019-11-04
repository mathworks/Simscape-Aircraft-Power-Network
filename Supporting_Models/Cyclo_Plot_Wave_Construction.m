% Copyright 2013 The MathWorks, Inc.

figure(1)
if exist('va_construct','var')                                           
    h1=plot(va_construct.time,va_construct.signals.values(:,4));           
    set(h1,'Linewidth',4,'Color','m')                                  
    hold on
    h2=plot(va_construct.time,va_construct.signals.values(:,1:3),'LineWidth',2);           
    h3=plot(va_construct.time,-va_construct.signals.values(:,1:3),':');
    hold off
    axis([0.105 0.111 -200 200])                                             ;
    xlabel('Time (S)'),ylabel('Voltage');
    legend({'Va out','Va','Vb','Vc','-Va','-Vb','-Vc'},'Location','Best');
    title('Constructing Va Out','FontSize',14,'FontWeight','Bold');
end                        