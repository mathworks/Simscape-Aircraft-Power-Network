%% Aircraft Power Network Demo Script
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:10pt">
% <tr><b><u>Overview</u></b><br>
% <tr>1.  Power Network Model: <a href="matlab:open_system('Aircraft_Power_Network');open_system('Aircraft_Power_Network/Gen1 Data');">Open Model</a>, <a href="matlab:Test_APN_Model_SHORT;">Run Flight Cycles</a><br>
% <br>
% <tr><b><u>Initial Design</u></b><br>
% <tr>2.  <a href="matlab:open_system('Aircraft_Power_Network');">Link Specification and Design</a><br>
% <tr>3.  <a href="matlab:open_system('PS_Simulation_Modes');">Simulation Modes</a><br>
% <tr>4.  <a href="matlab:open_system('Aircraft_Power_Network');open_system([bdroot '/Initial']);open_system([bdroot '/Scopes/Apparent Power']);set_param([bdroot '/Generator'],'BlockChoice','Ideal');Flight_Cycle_Num = 1;">Refine Power Requirements</a><br>
% <br>
% <tr><b><u>Detailed Design</u></b><br>
% <tr>5.  <a href="matlab:open_system('Synch_Machine_Simple');">Synchronous Machine</a><br>
% <tr>6.  <a href="matlab:open_system('ACGen_Cycloconverter');">AC Generator with Cycloconverter</a><br>
% <tr>7.  <a href="matlab:open_system('ACGen_DCLink');">AC Generator with DC Link</a><br>
% <tr>8.  Harmonic Analysis: <a href="matlab:open_system('Aircraft_Power_Network');open_system([bdroot '/Detailed']);open_system([bdroot '/Scopes/Gen1_Vab']);set_param([bdroot '/Generator'],'BlockChoice','Integrated Drive');Flight_Cycle_Num = 5;set_param(bdroot,'StopTime','0.5');">Interactive</a>, <a href="matlab:edit THD_Calculate;">Show Script</a>, <a href="matlab:THD_Calculate;">Perform Analysis</a><br>
% <tr>9.  <a href="matlab:cd([APN_HomeDir '/Libraries/Battery']);open_system('lead_acid_battery_estim');">Estimate Battery Parameters</a><br>
% <br>
% <tr><b><u>Tuning Abstract Model</u></b><br>
% <tr>10.  Tune Abstract Model: <a href="matlab:cd(fileparts(which('Tune_Abstract_BDMotor')));open_system('Tune_Abstract_BDMotor');">Compare Results</a>, <a href="matlab:cd(fileparts(which('Tune_Abstract_BDMotor_SDO')));open_system('Tune_Abstract_BDMotor_SDO');">Tune Model</a><br>
% <tr>11.  <a href="matlab:cd(fileparts(which('APN_Model_PCT_Sim.m')));edit APN_Model_PCT_Sim">Distribute Simulations Using Parallel Computing</a><br>
% <br>
% <tr><b><u>Documenting Results</u></b><br>
% <tr>12.  Analyze and Document: <a href="matlab:open('APN_Model_Report_SHORT.html');">View Report</a>, <a href="matlab:cd(fileparts(which('APN_Model_Report_SHORT.rpt')));open('APN_Model_Report_SHORT.rpt');">Generate Report</a><br>
% </style>
% </style>
% </html>
% 
%
% Copyright 2013-2023 The MathWorks(TM), Inc.

