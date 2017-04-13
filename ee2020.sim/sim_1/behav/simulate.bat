@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim sine_sim_behav -key {Behavioral:sim_1:Functional:sine_sim} -tclbatch sine_sim.tcl -view C:/Users/sidxb/FPGA/ee2020/tri_duty_sim_behav1.wcfg -view C:/Users/sidxb/FPGA/ee2020/square_sim_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
