@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto c64069510ff0455da905d255b81eddf1 -m64 --debug typical --relax --mt 2 -L xbip_utils_v3_0_7 -L axi_utils_v2_0_3 -L xbip_pipe_v3_0_3 -L xbip_bram18k_v3_0_3 -L mult_gen_v12_0_12 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_3 -L xbip_dsp48_multadd_v3_0_3 -L dds_compiler_v6_0_13 -L xil_defaultlib -L blk_mem_gen_v8_3_5 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot sine_sim_behav xil_defaultlib.sine_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0