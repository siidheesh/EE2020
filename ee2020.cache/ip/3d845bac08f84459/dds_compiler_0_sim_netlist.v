// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Tue Mar 28 02:08:39 2017
// Host        : DESKTOP-B1QME94 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dds_compiler_0_sim_netlist.v
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_13,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    s_axis_phase_tvalid,
    s_axis_phase_tdata,
    m_axis_data_tvalid,
    m_axis_data_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_PHASE TVALID" *) input s_axis_phase_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_PHASE TDATA" *) input [23:0]s_axis_phase_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [15:0]m_axis_data_tdata;

  wire aclk;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [23:0]s_axis_phase_tdata;
  wire s_axis_phase_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [21:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [21:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [21:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "22" *) 
  (* C_AMPLITUDE = "1" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "1" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "5" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "10000" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "1" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "12" *) 
  (* C_PHASE_ANGLE_WIDTH = "10" *) 
  (* C_PHASE_INCREMENT = "3" *) 
  (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "24" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "1" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_13 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[21:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[21:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[21:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule

(* C_ACCUMULATOR_WIDTH = "22" *) (* C_AMPLITUDE = "1" *) (* C_CHANNELS = "1" *) 
(* C_CHAN_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ARESETN = "0" *) (* C_HAS_M_DATA = "1" *) (* C_HAS_M_PHASE = "0" *) 
(* C_HAS_PHASEGEN = "1" *) (* C_HAS_PHASE_OUT = "0" *) (* C_HAS_SINCOS = "1" *) 
(* C_HAS_S_CONFIG = "0" *) (* C_HAS_S_PHASE = "1" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "5" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "10000" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "16" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "1" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "0" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "12" *) 
(* C_PHASE_ANGLE_WIDTH = "10" *) (* C_PHASE_INCREMENT = "3" *) (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "24" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "1" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_13
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [23:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [0:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [15:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [0:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [21:0]debug_axi_pinc_in;
  output [21:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [21:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire event_s_phase_tlast_missing;
  wire [11:0]\^m_axis_data_tdata ;
  wire m_axis_data_tvalid;
  wire [23:0]s_axis_phase_tdata;
  wire s_axis_phase_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;
  wire NLW_i_synth_debug_core_nd_UNCONNECTED;
  wire NLW_i_synth_debug_phase_nd_UNCONNECTED;
  wire NLW_i_synth_event_phase_in_invalid_UNCONNECTED;
  wire NLW_i_synth_event_pinc_invalid_UNCONNECTED;
  wire NLW_i_synth_event_poff_invalid_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_m_axis_data_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_i_synth_s_axis_config_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_debug_axi_chan_in_UNCONNECTED;
  wire [21:0]NLW_i_synth_debug_axi_pinc_in_UNCONNECTED;
  wire [21:0]NLW_i_synth_debug_axi_poff_in_UNCONNECTED;
  wire [21:0]NLW_i_synth_debug_phase_UNCONNECTED;
  wire [14:11]NLW_i_synth_m_axis_data_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tuser_UNCONNECTED;

  assign debug_axi_chan_in[0] = \<const0> ;
  assign debug_axi_pinc_in[21] = \<const0> ;
  assign debug_axi_pinc_in[20] = \<const0> ;
  assign debug_axi_pinc_in[19] = \<const0> ;
  assign debug_axi_pinc_in[18] = \<const0> ;
  assign debug_axi_pinc_in[17] = \<const0> ;
  assign debug_axi_pinc_in[16] = \<const0> ;
  assign debug_axi_pinc_in[15] = \<const0> ;
  assign debug_axi_pinc_in[14] = \<const0> ;
  assign debug_axi_pinc_in[13] = \<const0> ;
  assign debug_axi_pinc_in[12] = \<const0> ;
  assign debug_axi_pinc_in[11] = \<const0> ;
  assign debug_axi_pinc_in[10] = \<const0> ;
  assign debug_axi_pinc_in[9] = \<const0> ;
  assign debug_axi_pinc_in[8] = \<const0> ;
  assign debug_axi_pinc_in[7] = \<const0> ;
  assign debug_axi_pinc_in[6] = \<const0> ;
  assign debug_axi_pinc_in[5] = \<const0> ;
  assign debug_axi_pinc_in[4] = \<const0> ;
  assign debug_axi_pinc_in[3] = \<const0> ;
  assign debug_axi_pinc_in[2] = \<const0> ;
  assign debug_axi_pinc_in[1] = \<const0> ;
  assign debug_axi_pinc_in[0] = \<const0> ;
  assign debug_axi_poff_in[21] = \<const0> ;
  assign debug_axi_poff_in[20] = \<const0> ;
  assign debug_axi_poff_in[19] = \<const0> ;
  assign debug_axi_poff_in[18] = \<const0> ;
  assign debug_axi_poff_in[17] = \<const0> ;
  assign debug_axi_poff_in[16] = \<const0> ;
  assign debug_axi_poff_in[15] = \<const0> ;
  assign debug_axi_poff_in[14] = \<const0> ;
  assign debug_axi_poff_in[13] = \<const0> ;
  assign debug_axi_poff_in[12] = \<const0> ;
  assign debug_axi_poff_in[11] = \<const0> ;
  assign debug_axi_poff_in[10] = \<const0> ;
  assign debug_axi_poff_in[9] = \<const0> ;
  assign debug_axi_poff_in[8] = \<const0> ;
  assign debug_axi_poff_in[7] = \<const0> ;
  assign debug_axi_poff_in[6] = \<const0> ;
  assign debug_axi_poff_in[5] = \<const0> ;
  assign debug_axi_poff_in[4] = \<const0> ;
  assign debug_axi_poff_in[3] = \<const0> ;
  assign debug_axi_poff_in[2] = \<const0> ;
  assign debug_axi_poff_in[1] = \<const0> ;
  assign debug_axi_poff_in[0] = \<const0> ;
  assign debug_axi_resync_in = \<const0> ;
  assign debug_core_nd = \<const0> ;
  assign debug_phase[21] = \<const0> ;
  assign debug_phase[20] = \<const0> ;
  assign debug_phase[19] = \<const0> ;
  assign debug_phase[18] = \<const0> ;
  assign debug_phase[17] = \<const0> ;
  assign debug_phase[16] = \<const0> ;
  assign debug_phase[15] = \<const0> ;
  assign debug_phase[14] = \<const0> ;
  assign debug_phase[13] = \<const0> ;
  assign debug_phase[12] = \<const0> ;
  assign debug_phase[11] = \<const0> ;
  assign debug_phase[10] = \<const0> ;
  assign debug_phase[9] = \<const0> ;
  assign debug_phase[8] = \<const0> ;
  assign debug_phase[7] = \<const0> ;
  assign debug_phase[6] = \<const0> ;
  assign debug_phase[5] = \<const0> ;
  assign debug_phase[4] = \<const0> ;
  assign debug_phase[3] = \<const0> ;
  assign debug_phase[2] = \<const0> ;
  assign debug_phase[1] = \<const0> ;
  assign debug_phase[0] = \<const0> ;
  assign debug_phase_nd = \<const0> ;
  assign event_phase_in_invalid = \<const0> ;
  assign event_pinc_invalid = \<const0> ;
  assign event_poff_invalid = \<const0> ;
  assign event_s_config_tlast_missing = \<const0> ;
  assign event_s_config_tlast_unexpected = \<const0> ;
  assign event_s_phase_chanid_incorrect = \<const0> ;
  assign event_s_phase_tlast_unexpected = \<const0> ;
  assign m_axis_data_tdata[15] = \^m_axis_data_tdata [11];
  assign m_axis_data_tdata[14] = \^m_axis_data_tdata [11];
  assign m_axis_data_tdata[13] = \^m_axis_data_tdata [11];
  assign m_axis_data_tdata[12] = \^m_axis_data_tdata [11];
  assign m_axis_data_tdata[11:0] = \^m_axis_data_tdata [11:0];
  assign m_axis_data_tlast = \<const0> ;
  assign m_axis_data_tuser[0] = \<const0> ;
  assign m_axis_phase_tdata[0] = \<const0> ;
  assign m_axis_phase_tlast = \<const0> ;
  assign m_axis_phase_tuser[0] = \<const0> ;
  assign m_axis_phase_tvalid = \<const0> ;
  assign s_axis_config_tready = \<const1> ;
  assign s_axis_phase_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* C_ACCUMULATOR_WIDTH = "22" *) 
  (* C_AMPLITUDE = "1" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "1" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "5" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "10000" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "1" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "12" *) 
  (* C_PHASE_ANGLE_WIDTH = "10" *) 
  (* C_PHASE_INCREMENT = "3" *) 
  (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "24" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "1" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_13_viv i_synth
       (.aclk(aclk),
        .aclken(1'b0),
        .aresetn(1'b0),
        .debug_axi_chan_in(NLW_i_synth_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_i_synth_debug_axi_pinc_in_UNCONNECTED[21:0]),
        .debug_axi_poff_in(NLW_i_synth_debug_axi_poff_in_UNCONNECTED[21:0]),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_i_synth_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_i_synth_debug_phase_UNCONNECTED[21:0]),
        .debug_phase_nd(NLW_i_synth_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_i_synth_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_i_synth_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_i_synth_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(event_s_phase_tlast_missing),
        .event_s_phase_tlast_unexpected(NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata({\^m_axis_data_tdata [11],NLW_i_synth_m_axis_data_tdata_UNCONNECTED[14:11],\^m_axis_data_tdata [10:0]}),
        .m_axis_data_tlast(NLW_i_synth_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_i_synth_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_i_synth_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_i_synth_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_i_synth_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_i_synth_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata({1'b0,1'b0,s_axis_phase_tdata[21:0]}),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_i_synth_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
UeUQOSqc517u4Gp21W1qcB44JkXjttQw3I9etxLnnrt3tkJ0d4uxhbBwSkc7IM9w0xxr7owGLR37
1Ii0/OYJsQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
kOXgzYTJC4GxJCP3UAJekjjYLOXKC9b70sFPvaIFCHz6zbI3mz+JUFPTpADGukAuJQCKiXWwYOBZ
MmBb8JugLkKE+O1iqIjgnplEt9Bnnc0cPnUeT9o1Q0bWLLOKk75pVanxsTWyvGhO5t3dBcHf76mm
DceLRrUeM7AAXcHNQP8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JeQtyj3Kal6oTj33H4A+stJ+V3DCiNJv8J7k4H0+dLfFYYJJ3jbUoUt90xE3PJrsmjZDUKwDIVOX
HWBDaCL3u44dq/L0M441Q3RfpW9QQqU0ai34/xEtkAvplg6Oe3ludzsYQZ7T2bjYDyh8NSDEu4PD
/ngBWkp/hfXUBkMQq3g=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D+mEShAo+idVddojD4Ocf30d3PeQsjyupmNQjqsNdbpJFSb9AWyTI4HLKIImT0S50Zgb6LGKxa9h
26g8vXL3CdbVdP5O8FpM1809Abu5sfhEOCwdvtKWRwLRZt1+A/6C8nMHuYTLwrt4lXg1bU5c54n9
i12z+RFxTTeQUgM++Sl/RYKl7QJ7e+6a2bvs7RCI+NDk3Qaeos9nT6roJnfx2wpYOF4jStxFa2up
F5q2mhYTDOmLHpkBQCKAWc41vFlv1ZeWkv5nIa97hTbbuUW8GmJEmxKYO5Ix08oKP4QxHuiNF++X
v0t8M5z/+3rsLJl0oKiKofyP/dx+okR3PXDIyw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tcnuNu53+hchNr+pZ1NtakfiTYoR6SYivYJdM66R8/4XDELZLm46FZjh8e2MDPfDIe0TPxgXssIK
JBpdVvHEF3sN4ne8BH5Hig1m+5eYblKUujpGtmIpXovQKiu33+xi9YvN+S91R0i8O+wIG5Y8ZtSd
416fkpAXIqKUgtlCKXBPfNKh6pXB2wSYbWz3TlPOiCZhgXOn24ftBdQmq794Zo6QdyiBWEIqcHvf
cGxpfdy9soUWUFDgRcMQziQpv5Bf40FoOoFPc0PTxzAfe1PMhPuWIOtJwU7v2ehiljl8zfvKr43F
vafnOBmYmG/WIJ2D8gT8zcjKCOuzkEZD4/6LHw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CtAJ5i2Ss06xmVLrV4Tdrt3cQho/pCz9fbTCKJxQdDrBclu8FdA7n6uV/sbGH0tMaSievrFx2Jcw
lrfRQgsQbFyxSpn5PUFRabLV3UXwVpPqRPFv60hHW8dL6EBKTJRiEKGMFV/9GNtBclnQParE68gy
UWIYfWYlfU8odNKh63v3UlbKBdSSTudb0Ul16UHMxR9rOEcIVol8aLIxFF0XFN3SbjvZQYMrSrda
mdPrPZ6RZeEOu+2fjH5DVxI6YAiec9k48XHplaRfVHc5p6pbC8oywpPPg+e3mzZanroV2DYjAywn
LeUIPZxac7VkB/2/ioqm/Wqs+AR5+6YLStbDqg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
UesFXZohTVGUOt640IPA/wGlkH2pYV4JgIM0k8MURGM3allB5cIps4mztSY68NNpKvzjXGoNjpkg
4Qy1cfvXlj0wjVEYfUIeIW8qwa15w8kIei9hYjOo2T2Bf8IZnCre1/FoZJnts+R13FnGOrtaoxdx
3eKudP4GNsK/PkNj4JTJ+OtbzB+z+xXE+QrN5U0TdhIp7Lg+RiCCnmXmagmAL8ovnPNDe42tKunl
/yV2B4HwIWHdBniU2FYO9YIm547aRzolF1/leEmn8YnbTSFH8XFbYrF8uz9vtujWK0GF4IZvEipO
ZTUE/NWH62uarqH/5YQtyJsiMBnYZLerVvKY3g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
m0s6uaZxWNhb2XNCuUdAMUvOnwiOWl8q4w6Zy59Ck8vdjDXIMnjcUpmJOU5PoX9dYZx45Ypu8K6M
9O+IsqHr8rGMqS0du/r9rG1vlVqcudWiK/f0ZBhzYCqhFAhO+L1mwPEUKq1TEKJ/wj7JEg8B976I
hjjIj4/V6psmXiSLQoJjst1apLkxcEtZPIPqngluGGtF55ttKzfLPFYZ4ZmC24Y4gOzQGc0IX2cN
qYJP365UaHBnItgXPuHofPX4YnuCInZXMB2vQYV0oOrwHysK9+E6CVehs7lZlQZGjwgD8a96qhJT
2I3a6V0W5i2SDOWM8oJ4rpbD4s84J4uEVkig3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 56768)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
