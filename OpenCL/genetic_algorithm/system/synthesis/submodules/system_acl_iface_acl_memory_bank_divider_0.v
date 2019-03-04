// system_acl_iface_acl_memory_bank_divider_0.v

// This file was auto-generated from acl_memory_bank_divider_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module system_acl_iface_acl_memory_bank_divider_0 (
		input  wire         clk_clk,                  //                 clk.clk
		input  wire         reset_reset_n,            //               reset.reset_n
		input  wire         kernel_clk_clk,           //          kernel_clk.clk
		input  wire         kernel_reset_reset_n,     //        kernel_reset.reset_n
		output wire [31:0]  acl_bsp_snoop_data,       //       acl_bsp_snoop.data
		output wire         acl_bsp_snoop_valid,      //                    .valid
		input  wire         acl_bsp_snoop_ready,      //                    .ready
		input  wire         s_read,                   //                   s.read
		output wire [511:0] s_readdata,               //                    .readdata
		output wire         s_readdatavalid,          //                    .readdatavalid
		input  wire         s_write,                  //                    .write
		input  wire [511:0] s_writedata,              //                    .writedata
		input  wire [4:0]   s_burstcount,             //                    .burstcount
		input  wire         s_beginbursttransfer,     //                    .beginbursttransfer
		input  wire [63:0]  s_byteenable,             //                    .byteenable
		input  wire [25:0]  s_address,                //                    .address
		output wire         s_waitrequest,            //                    .waitrequest
		input  wire [1:0]   acl_bsp_memorg_host_mode, // acl_bsp_memorg_host.mode
		output wire [30:0]  bank1_address,            //               bank1.address
		output wire [511:0] bank1_writedata,          //                    .writedata
		output wire         bank1_read,               //                    .read
		output wire         bank1_write,              //                    .write
		output wire [4:0]   bank1_burstcount,         //                    .burstcount
		output wire [63:0]  bank1_byteenable,         //                    .byteenable
		input  wire         bank1_waitrequest,        //                    .waitrequest
		input  wire [511:0] bank1_readdata,           //                    .readdata
		input  wire         bank1_readdatavalid,      //                    .readdatavalid
		output wire [30:0]  bank2_address,            //               bank2.address
		output wire [511:0] bank2_writedata,          //                    .writedata
		output wire         bank2_read,               //                    .read
		output wire         bank2_write,              //                    .write
		output wire [4:0]   bank2_burstcount,         //                    .burstcount
		output wire [63:0]  bank2_byteenable,         //                    .byteenable
		input  wire         bank2_waitrequest,        //                    .waitrequest
		input  wire [511:0] bank2_readdata,           //                    .readdata
		input  wire         bank2_readdatavalid       //                    .readdatavalid
	);

	wire  [511:0] acl_snoop_adapter_0_m1_readdata;                           // mm_interconnect_0:acl_snoop_adapter_0_m1_readdata -> acl_snoop_adapter_0:export_readdata
	wire          acl_snoop_adapter_0_m1_waitrequest;                        // mm_interconnect_0:acl_snoop_adapter_0_m1_waitrequest -> acl_snoop_adapter_0:export_waitrequest
	wire   [31:0] acl_snoop_adapter_0_m1_address;                            // acl_snoop_adapter_0:export_address -> mm_interconnect_0:acl_snoop_adapter_0_m1_address
	wire          acl_snoop_adapter_0_m1_read;                               // acl_snoop_adapter_0:export_read -> mm_interconnect_0:acl_snoop_adapter_0_m1_read
	wire   [63:0] acl_snoop_adapter_0_m1_byteenable;                         // acl_snoop_adapter_0:export_byteenable -> mm_interconnect_0:acl_snoop_adapter_0_m1_byteenable
	wire          acl_snoop_adapter_0_m1_readdatavalid;                      // mm_interconnect_0:acl_snoop_adapter_0_m1_readdatavalid -> acl_snoop_adapter_0:export_readdatavalid
	wire          acl_snoop_adapter_0_m1_write;                              // acl_snoop_adapter_0:export_write -> mm_interconnect_0:acl_snoop_adapter_0_m1_write
	wire  [511:0] acl_snoop_adapter_0_m1_writedata;                          // acl_snoop_adapter_0:export_writedata -> mm_interconnect_0:acl_snoop_adapter_0_m1_writedata
	wire    [4:0] acl_snoop_adapter_0_m1_burstcount;                         // acl_snoop_adapter_0:export_burstcount -> mm_interconnect_0:acl_snoop_adapter_0_m1_burstcount
	wire  [511:0] mm_interconnect_0_pipe_stage_presplitter_s0_readdata;      // pipe_stage_presplitter:s0_readdata -> mm_interconnect_0:pipe_stage_presplitter_s0_readdata
	wire          mm_interconnect_0_pipe_stage_presplitter_s0_waitrequest;   // pipe_stage_presplitter:s0_waitrequest -> mm_interconnect_0:pipe_stage_presplitter_s0_waitrequest
	wire          mm_interconnect_0_pipe_stage_presplitter_s0_debugaccess;   // mm_interconnect_0:pipe_stage_presplitter_s0_debugaccess -> pipe_stage_presplitter:s0_debugaccess
	wire   [31:0] mm_interconnect_0_pipe_stage_presplitter_s0_address;       // mm_interconnect_0:pipe_stage_presplitter_s0_address -> pipe_stage_presplitter:s0_address
	wire          mm_interconnect_0_pipe_stage_presplitter_s0_read;          // mm_interconnect_0:pipe_stage_presplitter_s0_read -> pipe_stage_presplitter:s0_read
	wire   [63:0] mm_interconnect_0_pipe_stage_presplitter_s0_byteenable;    // mm_interconnect_0:pipe_stage_presplitter_s0_byteenable -> pipe_stage_presplitter:s0_byteenable
	wire          mm_interconnect_0_pipe_stage_presplitter_s0_readdatavalid; // pipe_stage_presplitter:s0_readdatavalid -> mm_interconnect_0:pipe_stage_presplitter_s0_readdatavalid
	wire          mm_interconnect_0_pipe_stage_presplitter_s0_write;         // mm_interconnect_0:pipe_stage_presplitter_s0_write -> pipe_stage_presplitter:s0_write
	wire  [511:0] mm_interconnect_0_pipe_stage_presplitter_s0_writedata;     // mm_interconnect_0:pipe_stage_presplitter_s0_writedata -> pipe_stage_presplitter:s0_writedata
	wire    [4:0] mm_interconnect_0_pipe_stage_presplitter_s0_burstcount;    // mm_interconnect_0:pipe_stage_presplitter_s0_burstcount -> pipe_stage_presplitter:s0_burstcount
	wire          pipe_stage_presplitter_m0_waitrequest;                     // mm_interconnect_1:pipe_stage_presplitter_m0_waitrequest -> pipe_stage_presplitter:m0_waitrequest
	wire  [511:0] pipe_stage_presplitter_m0_readdata;                        // mm_interconnect_1:pipe_stage_presplitter_m0_readdata -> pipe_stage_presplitter:m0_readdata
	wire          pipe_stage_presplitter_m0_debugaccess;                     // pipe_stage_presplitter:m0_debugaccess -> mm_interconnect_1:pipe_stage_presplitter_m0_debugaccess
	wire   [31:0] pipe_stage_presplitter_m0_address;                         // pipe_stage_presplitter:m0_address -> mm_interconnect_1:pipe_stage_presplitter_m0_address
	wire          pipe_stage_presplitter_m0_read;                            // pipe_stage_presplitter:m0_read -> mm_interconnect_1:pipe_stage_presplitter_m0_read
	wire   [63:0] pipe_stage_presplitter_m0_byteenable;                      // pipe_stage_presplitter:m0_byteenable -> mm_interconnect_1:pipe_stage_presplitter_m0_byteenable
	wire          pipe_stage_presplitter_m0_readdatavalid;                   // mm_interconnect_1:pipe_stage_presplitter_m0_readdatavalid -> pipe_stage_presplitter:m0_readdatavalid
	wire  [511:0] pipe_stage_presplitter_m0_writedata;                       // pipe_stage_presplitter:m0_writedata -> mm_interconnect_1:pipe_stage_presplitter_m0_writedata
	wire          pipe_stage_presplitter_m0_write;                           // pipe_stage_presplitter:m0_write -> mm_interconnect_1:pipe_stage_presplitter_m0_write
	wire    [4:0] pipe_stage_presplitter_m0_burstcount;                      // pipe_stage_presplitter:m0_burstcount -> mm_interconnect_1:pipe_stage_presplitter_m0_burstcount
	wire  [511:0] mm_interconnect_1_mem_splitter_0_s_readdata;               // mem_splitter_0:slave_readdata -> mm_interconnect_1:mem_splitter_0_s_readdata
	wire          mm_interconnect_1_mem_splitter_0_s_waitrequest;            // mem_splitter_0:slave_waitrequest -> mm_interconnect_1:mem_splitter_0_s_waitrequest
	wire   [25:0] mm_interconnect_1_mem_splitter_0_s_address;                // mm_interconnect_1:mem_splitter_0_s_address -> mem_splitter_0:slave_address
	wire          mm_interconnect_1_mem_splitter_0_s_read;                   // mm_interconnect_1:mem_splitter_0_s_read -> mem_splitter_0:slave_read
	wire   [63:0] mm_interconnect_1_mem_splitter_0_s_byteenable;             // mm_interconnect_1:mem_splitter_0_s_byteenable -> mem_splitter_0:slave_byteenable
	wire          mm_interconnect_1_mem_splitter_0_s_readdatavalid;          // mem_splitter_0:slave_readdatavalid -> mm_interconnect_1:mem_splitter_0_s_readdatavalid
	wire          mm_interconnect_1_mem_splitter_0_s_write;                  // mm_interconnect_1:mem_splitter_0_s_write -> mem_splitter_0:slave_write
	wire  [511:0] mm_interconnect_1_mem_splitter_0_s_writedata;              // mm_interconnect_1:mem_splitter_0_s_writedata -> mem_splitter_0:slave_writedata
	wire    [4:0] mm_interconnect_1_mem_splitter_0_s_burstcount;             // mm_interconnect_1:mem_splitter_0_s_burstcount -> mem_splitter_0:slave_burstcount
	wire          rst_controller_reset_out_reset;                            // rst_controller:reset_out -> acl_snoop_adapter_0:kernel_reset

	snoop_adapter #(
		.NUM_BYTES          (64),
		.BYTE_ADDRESS_WIDTH (32),
		.WORD_ADDRESS_WIDTH (26),
		.BURSTCOUNT_WIDTH   (5)
	) acl_snoop_adapter_0 (
		.clk                  (clk_clk),                              //          clk.clk
		.reset                (~reset_reset_n),                       //    clk_reset.reset
		.kernel_clk           (kernel_clk_clk),                       //   kernel_clk.clk
		.kernel_reset         (rst_controller_reset_out_reset),       // kernel_reset.reset
		.read                 (s_read),                               //           s1.read
		.readdata             (s_readdata),                           //             .readdata
		.readdatavalid        (s_readdatavalid),                      //             .readdatavalid
		.write                (s_write),                              //             .write
		.writedata            (s_writedata),                          //             .writedata
		.burstcount           (s_burstcount),                         //             .burstcount
		.burstbegin           (s_beginbursttransfer),                 //             .beginbursttransfer
		.byteenable           (s_byteenable),                         //             .byteenable
		.address              (s_address),                            //             .address
		.waitrequest          (s_waitrequest),                        //             .waitrequest
		.export_address       (acl_snoop_adapter_0_m1_address),       //           m1.address
		.export_read          (acl_snoop_adapter_0_m1_read),          //             .read
		.export_readdata      (acl_snoop_adapter_0_m1_readdata),      //             .readdata
		.export_readdatavalid (acl_snoop_adapter_0_m1_readdatavalid), //             .readdatavalid
		.export_write         (acl_snoop_adapter_0_m1_write),         //             .write
		.export_writedata     (acl_snoop_adapter_0_m1_writedata),     //             .writedata
		.export_burstcount    (acl_snoop_adapter_0_m1_burstcount),    //             .burstcount
		.export_byteenable    (acl_snoop_adapter_0_m1_byteenable),    //             .byteenable
		.export_waitrequest   (acl_snoop_adapter_0_m1_waitrequest),   //             .waitrequest
		.snoop_data           (acl_bsp_snoop_data),                   //        snoop.data
		.snoop_valid          (acl_bsp_snoop_valid),                  //             .valid
		.snoop_ready          (acl_bsp_snoop_ready)                   //             .ready
	);

	mem_splitter #(
		.NUM_BANKS         (2),
		.WIDTH_D           (512),
		.M_WIDTH_A         (31),
		.S_WIDTH_A         (26),
		.BURSTCOUNT_WIDTH  (5),
		.BYTEENABLE_WIDTH  (64),
		.MAX_PENDING_READS (64)
	) mem_splitter_0 (
		.mode                (acl_bsp_memorg_host_mode),                         //      mode.mode
		.clk                 (clk_clk),                                          //       clk.clk
		.resetn              (reset_reset_n),                                    // clk_reset.reset_n
		.slave_address       (mm_interconnect_1_mem_splitter_0_s_address),       //         s.address
		.slave_writedata     (mm_interconnect_1_mem_splitter_0_s_writedata),     //          .writedata
		.slave_read          (mm_interconnect_1_mem_splitter_0_s_read),          //          .read
		.slave_write         (mm_interconnect_1_mem_splitter_0_s_write),         //          .write
		.slave_burstcount    (mm_interconnect_1_mem_splitter_0_s_burstcount),    //          .burstcount
		.slave_byteenable    (mm_interconnect_1_mem_splitter_0_s_byteenable),    //          .byteenable
		.slave_waitrequest   (mm_interconnect_1_mem_splitter_0_s_waitrequest),   //          .waitrequest
		.slave_readdata      (mm_interconnect_1_mem_splitter_0_s_readdata),      //          .readdata
		.slave_readdatavalid (mm_interconnect_1_mem_splitter_0_s_readdatavalid), //          .readdatavalid
		.bank1_address       (bank1_address),                                    //     bank1.address
		.bank1_writedata     (bank1_writedata),                                  //          .writedata
		.bank1_read          (bank1_read),                                       //          .read
		.bank1_write         (bank1_write),                                      //          .write
		.bank1_burstcount    (bank1_burstcount),                                 //          .burstcount
		.bank1_byteenable    (bank1_byteenable),                                 //          .byteenable
		.bank1_waitrequest   (bank1_waitrequest),                                //          .waitrequest
		.bank1_readdata      (bank1_readdata),                                   //          .readdata
		.bank1_readdatavalid (bank1_readdatavalid),                              //          .readdatavalid
		.bank2_address       (bank2_address),                                    //     bank2.address
		.bank2_writedata     (bank2_writedata),                                  //          .writedata
		.bank2_read          (bank2_read),                                       //          .read
		.bank2_write         (bank2_write),                                      //          .write
		.bank2_burstcount    (bank2_burstcount),                                 //          .burstcount
		.bank2_byteenable    (bank2_byteenable),                                 //          .byteenable
		.bank2_waitrequest   (bank2_waitrequest),                                //          .waitrequest
		.bank2_readdata      (bank2_readdata),                                   //          .readdata
		.bank2_readdatavalid (bank2_readdatavalid)                               //          .readdatavalid
	);

	altera_avalon_mm_bridge #(
		.DATA_WIDTH        (512),
		.SYMBOL_WIDTH      (8),
		.HDL_ADDR_WIDTH    (32),
		.BURSTCOUNT_WIDTH  (5),
		.PIPELINE_COMMAND  (1),
		.PIPELINE_RESPONSE (1)
	) pipe_stage_presplitter (
		.clk              (clk_clk),                                                   //   clk.clk
		.reset            (~reset_reset_n),                                            // reset.reset
		.s0_waitrequest   (mm_interconnect_0_pipe_stage_presplitter_s0_waitrequest),   //    s0.waitrequest
		.s0_readdata      (mm_interconnect_0_pipe_stage_presplitter_s0_readdata),      //      .readdata
		.s0_readdatavalid (mm_interconnect_0_pipe_stage_presplitter_s0_readdatavalid), //      .readdatavalid
		.s0_burstcount    (mm_interconnect_0_pipe_stage_presplitter_s0_burstcount),    //      .burstcount
		.s0_writedata     (mm_interconnect_0_pipe_stage_presplitter_s0_writedata),     //      .writedata
		.s0_address       (mm_interconnect_0_pipe_stage_presplitter_s0_address),       //      .address
		.s0_write         (mm_interconnect_0_pipe_stage_presplitter_s0_write),         //      .write
		.s0_read          (mm_interconnect_0_pipe_stage_presplitter_s0_read),          //      .read
		.s0_byteenable    (mm_interconnect_0_pipe_stage_presplitter_s0_byteenable),    //      .byteenable
		.s0_debugaccess   (mm_interconnect_0_pipe_stage_presplitter_s0_debugaccess),   //      .debugaccess
		.m0_waitrequest   (pipe_stage_presplitter_m0_waitrequest),                     //    m0.waitrequest
		.m0_readdata      (pipe_stage_presplitter_m0_readdata),                        //      .readdata
		.m0_readdatavalid (pipe_stage_presplitter_m0_readdatavalid),                   //      .readdatavalid
		.m0_burstcount    (pipe_stage_presplitter_m0_burstcount),                      //      .burstcount
		.m0_writedata     (pipe_stage_presplitter_m0_writedata),                       //      .writedata
		.m0_address       (pipe_stage_presplitter_m0_address),                         //      .address
		.m0_write         (pipe_stage_presplitter_m0_write),                           //      .write
		.m0_read          (pipe_stage_presplitter_m0_read),                            //      .read
		.m0_byteenable    (pipe_stage_presplitter_m0_byteenable),                      //      .byteenable
		.m0_debugaccess   (pipe_stage_presplitter_m0_debugaccess),                     //      .debugaccess
		.s0_response      (),                                                          // (terminated)
		.m0_response      (2'b00)                                                      // (terminated)
	);

	system_acl_iface_acl_memory_bank_divider_0_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                                               (clk_clk),                                                   //                                             clk_clk.clk
		.acl_snoop_adapter_0_clk_reset_reset_bridge_in_reset_reset (~reset_reset_n),                                            // acl_snoop_adapter_0_clk_reset_reset_bridge_in_reset.reset
		.acl_snoop_adapter_0_m1_address                            (acl_snoop_adapter_0_m1_address),                            //                              acl_snoop_adapter_0_m1.address
		.acl_snoop_adapter_0_m1_waitrequest                        (acl_snoop_adapter_0_m1_waitrequest),                        //                                                    .waitrequest
		.acl_snoop_adapter_0_m1_burstcount                         (acl_snoop_adapter_0_m1_burstcount),                         //                                                    .burstcount
		.acl_snoop_adapter_0_m1_byteenable                         (acl_snoop_adapter_0_m1_byteenable),                         //                                                    .byteenable
		.acl_snoop_adapter_0_m1_read                               (acl_snoop_adapter_0_m1_read),                               //                                                    .read
		.acl_snoop_adapter_0_m1_readdata                           (acl_snoop_adapter_0_m1_readdata),                           //                                                    .readdata
		.acl_snoop_adapter_0_m1_readdatavalid                      (acl_snoop_adapter_0_m1_readdatavalid),                      //                                                    .readdatavalid
		.acl_snoop_adapter_0_m1_write                              (acl_snoop_adapter_0_m1_write),                              //                                                    .write
		.acl_snoop_adapter_0_m1_writedata                          (acl_snoop_adapter_0_m1_writedata),                          //                                                    .writedata
		.pipe_stage_presplitter_s0_address                         (mm_interconnect_0_pipe_stage_presplitter_s0_address),       //                           pipe_stage_presplitter_s0.address
		.pipe_stage_presplitter_s0_write                           (mm_interconnect_0_pipe_stage_presplitter_s0_write),         //                                                    .write
		.pipe_stage_presplitter_s0_read                            (mm_interconnect_0_pipe_stage_presplitter_s0_read),          //                                                    .read
		.pipe_stage_presplitter_s0_readdata                        (mm_interconnect_0_pipe_stage_presplitter_s0_readdata),      //                                                    .readdata
		.pipe_stage_presplitter_s0_writedata                       (mm_interconnect_0_pipe_stage_presplitter_s0_writedata),     //                                                    .writedata
		.pipe_stage_presplitter_s0_burstcount                      (mm_interconnect_0_pipe_stage_presplitter_s0_burstcount),    //                                                    .burstcount
		.pipe_stage_presplitter_s0_byteenable                      (mm_interconnect_0_pipe_stage_presplitter_s0_byteenable),    //                                                    .byteenable
		.pipe_stage_presplitter_s0_readdatavalid                   (mm_interconnect_0_pipe_stage_presplitter_s0_readdatavalid), //                                                    .readdatavalid
		.pipe_stage_presplitter_s0_waitrequest                     (mm_interconnect_0_pipe_stage_presplitter_s0_waitrequest),   //                                                    .waitrequest
		.pipe_stage_presplitter_s0_debugaccess                     (mm_interconnect_0_pipe_stage_presplitter_s0_debugaccess)    //                                                    .debugaccess
	);

	system_acl_iface_acl_memory_bank_divider_0_mm_interconnect_1 mm_interconnect_1 (
		.clk_clk_clk                                              (clk_clk),                                          //                                            clk_clk.clk
		.pipe_stage_presplitter_reset_reset_bridge_in_reset_reset (~reset_reset_n),                                   // pipe_stage_presplitter_reset_reset_bridge_in_reset.reset
		.pipe_stage_presplitter_m0_address                        (pipe_stage_presplitter_m0_address),                //                          pipe_stage_presplitter_m0.address
		.pipe_stage_presplitter_m0_waitrequest                    (pipe_stage_presplitter_m0_waitrequest),            //                                                   .waitrequest
		.pipe_stage_presplitter_m0_burstcount                     (pipe_stage_presplitter_m0_burstcount),             //                                                   .burstcount
		.pipe_stage_presplitter_m0_byteenable                     (pipe_stage_presplitter_m0_byteenable),             //                                                   .byteenable
		.pipe_stage_presplitter_m0_read                           (pipe_stage_presplitter_m0_read),                   //                                                   .read
		.pipe_stage_presplitter_m0_readdata                       (pipe_stage_presplitter_m0_readdata),               //                                                   .readdata
		.pipe_stage_presplitter_m0_readdatavalid                  (pipe_stage_presplitter_m0_readdatavalid),          //                                                   .readdatavalid
		.pipe_stage_presplitter_m0_write                          (pipe_stage_presplitter_m0_write),                  //                                                   .write
		.pipe_stage_presplitter_m0_writedata                      (pipe_stage_presplitter_m0_writedata),              //                                                   .writedata
		.pipe_stage_presplitter_m0_debugaccess                    (pipe_stage_presplitter_m0_debugaccess),            //                                                   .debugaccess
		.mem_splitter_0_s_address                                 (mm_interconnect_1_mem_splitter_0_s_address),       //                                   mem_splitter_0_s.address
		.mem_splitter_0_s_write                                   (mm_interconnect_1_mem_splitter_0_s_write),         //                                                   .write
		.mem_splitter_0_s_read                                    (mm_interconnect_1_mem_splitter_0_s_read),          //                                                   .read
		.mem_splitter_0_s_readdata                                (mm_interconnect_1_mem_splitter_0_s_readdata),      //                                                   .readdata
		.mem_splitter_0_s_writedata                               (mm_interconnect_1_mem_splitter_0_s_writedata),     //                                                   .writedata
		.mem_splitter_0_s_burstcount                              (mm_interconnect_1_mem_splitter_0_s_burstcount),    //                                                   .burstcount
		.mem_splitter_0_s_byteenable                              (mm_interconnect_1_mem_splitter_0_s_byteenable),    //                                                   .byteenable
		.mem_splitter_0_s_readdatavalid                           (mm_interconnect_1_mem_splitter_0_s_readdatavalid), //                                                   .readdatavalid
		.mem_splitter_0_s_waitrequest                             (mm_interconnect_1_mem_splitter_0_s_waitrequest)    //                                                   .waitrequest
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~kernel_reset_reset_n),          // reset_in0.reset
		.clk            (kernel_clk_clk),                 //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule