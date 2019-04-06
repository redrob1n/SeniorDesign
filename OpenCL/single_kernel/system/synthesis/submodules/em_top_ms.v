// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`timescale 1ps/1ps


module em_top_ms #(
  parameter EMPC_EFFICIENCY = "ON",
  parameter EMPC_ENABLE_PROTOCOL_CHECK = "ON",
  parameter EMPC_AV_BURSTCOUNT_WIDTH = 3,
  parameter EMPC_AV_DATA_WIDTH = 64,
  parameter EMPC_AV_POW2_DATA_WIDTH = 64,
  parameter EMPC_AVM_ADDRESS_WIDTH = 10,
  parameter EMPC_AVS_ADDRESS_WIDTH = 10,
  parameter EMPC_AV_BE_WIDTH = 8,
  parameter EMPC_AV_POW2_BE_WIDTH = 8,
  parameter EMPC_COUNT_WIDTH = 32,
  parameter EMPC_CSR_ADDR_WIDTH = 12,
  parameter EMPC_CSR_DATA_WIDTH = 32,
  parameter EMPC_VERSION = 16'd100,
  parameter EMPC_LEGACY_VERSION = 1
)(

  input  wire          ctl_reset_n,
  input  wire          avm_clk,
  output wire          ctl_reset_n_out,
  output wire          avm_clk_out,

  input  wire          ctl_reset_n_sec,
  input  wire          avm_clk_sec,
  output wire          ctl_reset_n_out_sec,
  output wire          avm_clk_out_sec,

  input  wire          local_cal_success_in,
  input  wire          local_cal_fail_in,
  output wire          local_cal_success,
  output wire          local_cal_fail,

  input  wire       [EMPC_CSR_ADDR_WIDTH-1:0]  csr_addr_0,
  input  wire   [(EMPC_CSR_DATA_WIDTH/8)-1:0]  csr_be_0,
  input  wire                                  csr_write_req_0,
  input  wire                                  csr_read_req_0,
  input  wire       [EMPC_CSR_DATA_WIDTH-1:0]  csr_wdata_0,
  output wire       [EMPC_CSR_DATA_WIDTH-1:0]  csr_rdata_0,
  output wire                                  csr_rdata_valid_0,
  output wire                                  csr_waitrequest_0,

  input  wire    [EMPC_AVM_ADDRESS_WIDTH-1:0]  avm_address_0,
  input  wire          [EMPC_AV_POW2_BE_WIDTH-1:0]  avm_be_0,
  input  wire  [EMPC_AV_BURSTCOUNT_WIDTH-1:0]  avm_burstcount_0,
  input  wire                                  avm_beginbursttransfer_0,
  output wire                                  avm_waitrequest_0,
  input  wire                                  avm_write_0,
  input  wire                                  avm_read_0,
  output wire                                  avm_readvalid_0,
  input  wire        [EMPC_AV_POW2_DATA_WIDTH-1:0]  avm_wdata_0,
  output wire        [EMPC_AV_POW2_DATA_WIDTH-1:0]  avm_rdata_0,

  output wire    [EMPC_AVS_ADDRESS_WIDTH-1:0]  avs_address_0,
  output wire          [EMPC_AV_BE_WIDTH-1:0]  avs_be_0,
  output wire  [EMPC_AV_BURSTCOUNT_WIDTH-1:0]  avs_burstcount_0,

  output wire                                  avs_beginbursttransfer_0,
  input  wire                                  avs_waitrequest_0,
  output wire                                  avs_write_0,
  output wire                                  avs_read_0,
  input  wire                                  avs_readvalid_0,
  output wire        [EMPC_AV_DATA_WIDTH-1:0]  avs_wdata_0,
  input  wire        [EMPC_AV_DATA_WIDTH-1:0]  avs_rdata_0,

  input  wire       [EMPC_CSR_ADDR_WIDTH-1:0]  csr_addr_1,
  input  wire   [(EMPC_CSR_DATA_WIDTH/8)-1:0]  csr_be_1,
  input  wire                                  csr_write_req_1,
  input  wire                                  csr_read_req_1,
  input  wire       [EMPC_CSR_DATA_WIDTH-1:0]  csr_wdata_1,
  output wire       [EMPC_CSR_DATA_WIDTH-1:0]  csr_rdata_1,
  output wire                                  csr_rdata_valid_1,
  output wire                                  csr_waitrequest_1,

  input  wire    [EMPC_AVM_ADDRESS_WIDTH-1:0]  avm_address_1,
  input  wire          [EMPC_AV_POW2_BE_WIDTH-1:0]  avm_be_1,
  input  wire  [EMPC_AV_BURSTCOUNT_WIDTH-1:0]  avm_burstcount_1,
  input  wire                                  avm_beginbursttransfer_1,
  output wire                                  avm_waitrequest_1,
  input  wire                                  avm_write_1,
  input  wire                                  avm_read_1,
  output wire                                  avm_readvalid_1,
  input  wire        [EMPC_AV_POW2_DATA_WIDTH-1:0]  avm_wdata_1,
  output wire        [EMPC_AV_POW2_DATA_WIDTH-1:0]  avm_rdata_1,

  output wire    [EMPC_AVS_ADDRESS_WIDTH-1:0]  avs_address_1,
  output wire          [EMPC_AV_BE_WIDTH-1:0]  avs_be_1,
  output wire  [EMPC_AV_BURSTCOUNT_WIDTH-1:0]  avs_burstcount_1,

  output wire                                  avs_beginbursttransfer_1,
  input  wire                                  avs_waitrequest_1,
  output wire                                  avs_write_1,
  output wire                                  avs_read_1,
  input  wire                                  avs_readvalid_1,
  output wire        [EMPC_AV_DATA_WIDTH-1:0]  avs_wdata_1,
  input  wire        [EMPC_AV_DATA_WIDTH-1:0]  avs_rdata_1
);

assign local_cal_success = local_cal_success_in;
assign local_cal_fail = local_cal_fail_in;
assign ctl_reset_n_out = ctl_reset_n;
assign avm_clk_out = avm_clk;
assign ctl_reset_n_out_sec = ctl_reset_n_sec;
assign avm_clk_out_sec = avm_clk_sec;

em_single_top # (
  .EMPC_EFFICIENCY            (EMPC_EFFICIENCY),
  .EMPC_ENABLE_PROTOCOL_CHECK (EMPC_ENABLE_PROTOCOL_CHECK),
  .EMPC_AV_BURSTCOUNT_WIDTH   (EMPC_AV_BURSTCOUNT_WIDTH),
  .EMPC_AV_DATA_WIDTH         (EMPC_AV_DATA_WIDTH),
  .EMPC_AV_POW2_DATA_WIDTH    (EMPC_AV_POW2_DATA_WIDTH),
  .EMPC_AVM_ADDRESS_WIDTH     (EMPC_AVM_ADDRESS_WIDTH ),
  .EMPC_AVS_ADDRESS_WIDTH     (EMPC_AVS_ADDRESS_WIDTH ),
  .EMPC_AV_BE_WIDTH           (EMPC_AV_BE_WIDTH ),
  .EMPC_AV_POW2_BE_WIDTH      (EMPC_AV_POW2_BE_WIDTH),
  .EMPC_COUNT_WIDTH           (EMPC_COUNT_WIDTH ),
  .EMPC_CSR_ADDR_WIDTH        (EMPC_CSR_ADDR_WIDTH),
  .EMPC_CSR_DATA_WIDTH        (EMPC_CSR_DATA_WIDTH ),
  .EMPC_VERSION               (EMPC_VERSION ),
  .EMPC_LEGACY_VERSION        (EMPC_LEGACY_VERSION)
  ) e0 (
    .ctl_reset_n                 (ctl_reset_n & (local_cal_success | local_cal_fail)),
    .avm_clk                     (avm_clk),

    .csr_addr                    (csr_addr_0),
    .csr_be                      (csr_be_0),
    .csr_write_req               (csr_write_req_0),
    .csr_read_req                (csr_read_req_0),
    .csr_wdata                   (csr_wdata_0),
    .csr_rdata                   (csr_rdata_0),
    .csr_rdata_valid             (csr_rdata_valid_0),
    .csr_waitrequest             (csr_waitrequest_0),

    .avm_address                 (avm_address_0),
    .avm_be                      (avm_be_0),
    .avm_burstcount              (avm_burstcount_0),
    .avm_beginbursttransfer      (avm_beginbursttransfer_0),
    .avm_waitrequest             (avm_waitrequest_0),
    .avm_write                   (avm_write_0),
    .avm_read                    (avm_read_0),
    .avm_readvalid               (avm_readvalid_0),
    .avm_wdata                   (avm_wdata_0),
    .avm_rdata                   (avm_rdata_0),

    .avs_address                 (avs_address_0),
    .avs_be                      (avs_be_0),
    .avs_burstcount              (avs_burstcount_0),
    .avs_beginbursttransfer      (avs_beginbursttransfer_0),
    .avs_waitrequest             (avs_waitrequest_0),
    .avs_write                   (avs_write_0),
    .avs_read                    (avs_read_0),
    .avs_readvalid               (avs_readvalid_0),
    .avs_wdata                   (avs_wdata_0),
    .avs_rdata                   (avs_rdata_0)
 );

 em_single_top # (
  .EMPC_EFFICIENCY            (EMPC_EFFICIENCY),
  .EMPC_ENABLE_PROTOCOL_CHECK (EMPC_ENABLE_PROTOCOL_CHECK),
  .EMPC_AV_BURSTCOUNT_WIDTH   (EMPC_AV_BURSTCOUNT_WIDTH),
  .EMPC_AV_DATA_WIDTH         (EMPC_AV_DATA_WIDTH),
  .EMPC_AV_POW2_DATA_WIDTH    (EMPC_AV_POW2_DATA_WIDTH),
  .EMPC_AVM_ADDRESS_WIDTH     (EMPC_AVM_ADDRESS_WIDTH ),
  .EMPC_AVS_ADDRESS_WIDTH     (EMPC_AVS_ADDRESS_WIDTH ),
  .EMPC_AV_BE_WIDTH           (EMPC_AV_BE_WIDTH ),
  .EMPC_AV_POW2_BE_WIDTH      (EMPC_AV_POW2_BE_WIDTH),
  .EMPC_COUNT_WIDTH           (EMPC_COUNT_WIDTH ),
  .EMPC_CSR_ADDR_WIDTH        (EMPC_CSR_ADDR_WIDTH),
  .EMPC_CSR_DATA_WIDTH        (EMPC_CSR_DATA_WIDTH ),
  .EMPC_VERSION               (EMPC_VERSION ),
  .EMPC_LEGACY_VERSION        (EMPC_LEGACY_VERSION)
  ) e1 (
    .ctl_reset_n                 ((EMPC_LEGACY_VERSION ? ctl_reset_n : ctl_reset_n_sec) & (local_cal_success | local_cal_fail)),
    .avm_clk                     (EMPC_LEGACY_VERSION ? avm_clk : avm_clk_sec),

    .csr_addr                    (csr_addr_1),
    .csr_be                      (csr_be_1),
    .csr_write_req               (csr_write_req_1),
    .csr_read_req                (csr_read_req_1),
    .csr_wdata                   (csr_wdata_1),
    .csr_rdata                   (csr_rdata_1),
    .csr_rdata_valid             (csr_rdata_valid_1),
    .csr_waitrequest             (csr_waitrequest_1),

    .avm_address                 (avm_address_1),
    .avm_be                      (avm_be_1),
    .avm_burstcount              (avm_burstcount_1),
    .avm_beginbursttransfer      (avm_beginbursttransfer_1),
    .avm_waitrequest             (avm_waitrequest_1),
    .avm_write                   (avm_write_1),
    .avm_read                    (avm_read_1),
    .avm_readvalid               (avm_readvalid_1),
    .avm_wdata                   (avm_wdata_1),
    .avm_rdata                   (avm_rdata_1),

    .avs_address                 (avs_address_1),
    .avs_be                      (avs_be_1),
    .avs_burstcount              (avs_burstcount_1),
    .avs_beginbursttransfer      (avs_beginbursttransfer_1),
    .avs_waitrequest             (avs_waitrequest_1),
    .avs_write                   (avs_write_1),
    .avs_read                    (avs_read_1),
    .avs_readvalid               (avs_readvalid_1),
    .avs_wdata                   (avs_wdata_1),
    .avs_rdata                   (avs_rdata_1)
 );

endmodule

