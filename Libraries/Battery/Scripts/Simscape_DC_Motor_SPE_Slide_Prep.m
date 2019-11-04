% Copyright 2013-2016 The MathWorks, Inc.

colordef black;

time = Battery_DATA.time;
Voltage_Data = Battery_DATA.signals.values(:,1);
Meas_Data = Battery_DATA.signals.values(:,2);
%Voltage_Data = ASM.signals(1).values;
%Disp_Data = FEL_Actuator_DATA.signals(1).values(:,1);
%Current_Data = ASM.signals(2).values;
%Speed_Data = ASM.signals(3).values;

figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[765   405   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];
spd_h = plot(time,Voltage_Data,'y','LineWidth',3);
hold on
mea_h = plot(time,Meas_Data,'m--','LineWidth',3);

title_h = title('Voltage (V)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Voltage (V)');
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
set(title_h,'FontSize',14);


grid on
set(gca,'Box','on');
%legend('Rod','Piston','Location',[0.2128    0.4421    0.2691    0.1622]);
axis([time(1) time(end) 1.8 2.25]);
legend('Simulation Results','Measured Data','Location','Best');

