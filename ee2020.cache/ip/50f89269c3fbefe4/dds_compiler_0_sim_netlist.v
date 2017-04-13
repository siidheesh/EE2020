// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Tue Mar 28 02:26:33 2017
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
  (* C_LATENCY = "7" *) 
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
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "12" *) 
  (* C_PHASE_ANGLE_WIDTH = "12" *) 
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
  (* C_USE_DSP48 = "0" *) 
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
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "7" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "10000" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "16" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "0" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "12" *) 
(* C_PHASE_ANGLE_WIDTH = "12" *) (* C_PHASE_INCREMENT = "3" *) (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "24" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
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
  (* C_LATENCY = "7" *) 
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
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "12" *) 
  (* C_PHASE_ANGLE_WIDTH = "12" *) 
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
  (* C_USE_DSP48 = "0" *) 
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
V9s2xQ72hMsQwNlHNrV0yoigV/kuZq9TWwcDDul2MbZHvXt1crjRvpKZo13aKugdB+7iFDdruyuT
QVc2zpIkGpIkOqOS2jpONQ10JZuvFiwpnwccx7CwE3kK0qH2Y7k/Ud49MD/Uf3oouA41d2CKuQ5D
+OWqnm6tFtwyFT/gOBiBrYnlv+3iA9NPIH98W2ueQJR75tpLm7qYCopa/WNNZXVwKGZv0AJ4KofZ
cskmXVibOaB4OgIf66+c0l5BgqXY8dRPQy2PvUquS8yqPFkb0LpC8mRV4nwoz4TNJcnJ+/VTkmLW
wqNYnRf6wZyw/PJuu/fmNYY8DbNj/Y3oymDGQg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
ry90svkNr/JYbvd/80V2yEkyRl3WtPqNFBcWR+JVlFB+E3lvnDMNnnKeCKDY3C31isquaWCFOT2i
BrYHY+1/6mnznGwY+r/6dHE7+YbeaofJc5W35IsUizOyPW60OpgdUe0TFLmMwX3FMypcxUZjdtGh
yUIeno2iZp6JZSlGxWN9KG55dk3UxK75SXXO+JXI94G+y913k7+SSmsVfs5+YMlvw8d4/1oB30gP
FABoHtnof/RI0vZJxnUi4VIQcvRwt77nwT5FQu5xLVqYmrCTL4krsQPgmP7Fa+xWiBTK79I3vvvj
5e+RN5G6wrG1qg6PhZSal8P+71jQyOIrjS0c3g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 83296)
`pragma protect data_block
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
+Fi6QAaGjKxAgbBawnrhkUs4TA==
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
