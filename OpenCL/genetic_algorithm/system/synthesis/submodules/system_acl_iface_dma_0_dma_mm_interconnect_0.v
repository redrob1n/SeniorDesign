// system_acl_iface_dma_0_dma_mm_interconnect_0.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module system_acl_iface_dma_0_dma_mm_interconnect_0 (
		input  wire         dma_clk_clk_clk,                                          //                                        dma_clk_clk.clk
		input  wire         dma_write_master_Clock_reset_reset_bridge_in_reset_reset, // dma_write_master_Clock_reset_reset_bridge_in_reset.reset
		input  wire [33:0]  dma_write_master_Data_Write_Master_address,               //                 dma_write_master_Data_Write_Master.address
		output wire         dma_write_master_Data_Write_Master_waitrequest,           //                                                   .waitrequest
		input  wire [4:0]   dma_write_master_Data_Write_Master_burstcount,            //                                                   .burstcount
		input  wire [63:0]  dma_write_master_Data_Write_Master_byteenable,            //                                                   .byteenable
		input  wire         dma_write_master_Data_Write_Master_write,                 //                                                   .write
		input  wire [511:0] dma_write_master_Data_Write_Master_writedata,             //                                                   .writedata
		output wire [33:0]  pipe_stage_dma_write_s0_address,                          //                            pipe_stage_dma_write_s0.address
		output wire         pipe_stage_dma_write_s0_write,                            //                                                   .write
		output wire         pipe_stage_dma_write_s0_read,                             //                                                   .read
		input  wire [511:0] pipe_stage_dma_write_s0_readdata,                         //                                                   .readdata
		output wire [511:0] pipe_stage_dma_write_s0_writedata,                        //                                                   .writedata
		output wire [4:0]   pipe_stage_dma_write_s0_burstcount,                       //                                                   .burstcount
		output wire [63:0]  pipe_stage_dma_write_s0_byteenable,                       //                                                   .byteenable
		input  wire         pipe_stage_dma_write_s0_readdatavalid,                    //                                                   .readdatavalid
		input  wire         pipe_stage_dma_write_s0_waitrequest,                      //                                                   .waitrequest
		output wire         pipe_stage_dma_write_s0_debugaccess                       //                                                   .debugaccess
	);

	wire          dma_write_master_data_write_master_translator_avalon_universal_master_0_waitrequest;   // pipe_stage_dma_write_s0_translator:uav_waitrequest -> dma_write_master_Data_Write_Master_translator:uav_waitrequest
	wire  [511:0] dma_write_master_data_write_master_translator_avalon_universal_master_0_readdata;      // pipe_stage_dma_write_s0_translator:uav_readdata -> dma_write_master_Data_Write_Master_translator:uav_readdata
	wire          dma_write_master_data_write_master_translator_avalon_universal_master_0_debugaccess;   // dma_write_master_Data_Write_Master_translator:uav_debugaccess -> pipe_stage_dma_write_s0_translator:uav_debugaccess
	wire   [33:0] dma_write_master_data_write_master_translator_avalon_universal_master_0_address;       // dma_write_master_Data_Write_Master_translator:uav_address -> pipe_stage_dma_write_s0_translator:uav_address
	wire          dma_write_master_data_write_master_translator_avalon_universal_master_0_read;          // dma_write_master_Data_Write_Master_translator:uav_read -> pipe_stage_dma_write_s0_translator:uav_read
	wire   [63:0] dma_write_master_data_write_master_translator_avalon_universal_master_0_byteenable;    // dma_write_master_Data_Write_Master_translator:uav_byteenable -> pipe_stage_dma_write_s0_translator:uav_byteenable
	wire          dma_write_master_data_write_master_translator_avalon_universal_master_0_readdatavalid; // pipe_stage_dma_write_s0_translator:uav_readdatavalid -> dma_write_master_Data_Write_Master_translator:uav_readdatavalid
	wire          dma_write_master_data_write_master_translator_avalon_universal_master_0_lock;          // dma_write_master_Data_Write_Master_translator:uav_lock -> pipe_stage_dma_write_s0_translator:uav_lock
	wire          dma_write_master_data_write_master_translator_avalon_universal_master_0_write;         // dma_write_master_Data_Write_Master_translator:uav_write -> pipe_stage_dma_write_s0_translator:uav_write
	wire  [511:0] dma_write_master_data_write_master_translator_avalon_universal_master_0_writedata;     // dma_write_master_Data_Write_Master_translator:uav_writedata -> pipe_stage_dma_write_s0_translator:uav_writedata
	wire   [10:0] dma_write_master_data_write_master_translator_avalon_universal_master_0_burstcount;    // dma_write_master_Data_Write_Master_translator:uav_burstcount -> pipe_stage_dma_write_s0_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (34),
		.AV_DATA_W                   (512),
		.AV_BURSTCOUNT_W             (5),
		.AV_BYTEENABLE_W             (64),
		.UAV_ADDRESS_W               (34),
		.UAV_BURSTCOUNT_W            (11),
		.USE_READ                    (0),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (1),
		.USE_READDATAVALID           (0),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (64),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (1),
		.UAV_CONSTANT_BURST_BEHAVIOR (1),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) dma_write_master_data_write_master_translator (
		.clk                    (dma_clk_clk_clk),                                                                       //                       clk.clk
		.reset                  (dma_write_master_Clock_reset_reset_bridge_in_reset_reset),                              //                     reset.reset
		.uav_address            (dma_write_master_data_write_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (dma_write_master_data_write_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (dma_write_master_data_write_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (dma_write_master_data_write_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (dma_write_master_data_write_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (dma_write_master_data_write_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (dma_write_master_data_write_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (dma_write_master_data_write_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (dma_write_master_data_write_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (dma_write_master_data_write_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (dma_write_master_data_write_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (dma_write_master_Data_Write_Master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (dma_write_master_Data_Write_Master_waitrequest),                                        //                          .waitrequest
		.av_burstcount          (dma_write_master_Data_Write_Master_burstcount),                                         //                          .burstcount
		.av_byteenable          (dma_write_master_Data_Write_Master_byteenable),                                         //                          .byteenable
		.av_write               (dma_write_master_Data_Write_Master_write),                                              //                          .write
		.av_writedata           (dma_write_master_Data_Write_Master_writedata),                                          //                          .writedata
		.av_beginbursttransfer  (1'b0),                                                                                  //               (terminated)
		.av_begintransfer       (1'b0),                                                                                  //               (terminated)
		.av_chipselect          (1'b0),                                                                                  //               (terminated)
		.av_read                (1'b0),                                                                                  //               (terminated)
		.av_readdata            (),                                                                                      //               (terminated)
		.av_readdatavalid       (),                                                                                      //               (terminated)
		.av_lock                (1'b0),                                                                                  //               (terminated)
		.av_debugaccess         (1'b0),                                                                                  //               (terminated)
		.uav_clken              (),                                                                                      //               (terminated)
		.av_clken               (1'b1),                                                                                  //               (terminated)
		.uav_response           (2'b00),                                                                                 //               (terminated)
		.av_response            (),                                                                                      //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                                  //               (terminated)
		.av_writeresponsevalid  ()                                                                                       //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (34),
		.AV_DATA_W                      (512),
		.UAV_DATA_W                     (512),
		.AV_BURSTCOUNT_W                (5),
		.AV_BYTEENABLE_W                (64),
		.UAV_BYTEENABLE_W               (64),
		.UAV_ADDRESS_W                  (34),
		.UAV_BURSTCOUNT_W               (11),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (1),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (64),
		.AV_ADDRESS_SYMBOLS             (1),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) pipe_stage_dma_write_s0_translator (
		.clk                    (dma_clk_clk_clk),                                                                       //                      clk.clk
		.reset                  (dma_write_master_Clock_reset_reset_bridge_in_reset_reset),                              //                    reset.reset
		.uav_address            (dma_write_master_data_write_master_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (dma_write_master_data_write_master_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (dma_write_master_data_write_master_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (dma_write_master_data_write_master_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (dma_write_master_data_write_master_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (dma_write_master_data_write_master_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (dma_write_master_data_write_master_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (dma_write_master_data_write_master_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (dma_write_master_data_write_master_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (dma_write_master_data_write_master_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (dma_write_master_data_write_master_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (pipe_stage_dma_write_s0_address),                                                       //      avalon_anti_slave_0.address
		.av_write               (pipe_stage_dma_write_s0_write),                                                         //                         .write
		.av_read                (pipe_stage_dma_write_s0_read),                                                          //                         .read
		.av_readdata            (pipe_stage_dma_write_s0_readdata),                                                      //                         .readdata
		.av_writedata           (pipe_stage_dma_write_s0_writedata),                                                     //                         .writedata
		.av_burstcount          (pipe_stage_dma_write_s0_burstcount),                                                    //                         .burstcount
		.av_byteenable          (pipe_stage_dma_write_s0_byteenable),                                                    //                         .byteenable
		.av_readdatavalid       (pipe_stage_dma_write_s0_readdatavalid),                                                 //                         .readdatavalid
		.av_waitrequest         (pipe_stage_dma_write_s0_waitrequest),                                                   //                         .waitrequest
		.av_debugaccess         (pipe_stage_dma_write_s0_debugaccess),                                                   //                         .debugaccess
		.av_begintransfer       (),                                                                                      //              (terminated)
		.av_beginbursttransfer  (),                                                                                      //              (terminated)
		.av_writebyteenable     (),                                                                                      //              (terminated)
		.av_lock                (),                                                                                      //              (terminated)
		.av_chipselect          (),                                                                                      //              (terminated)
		.av_clken               (),                                                                                      //              (terminated)
		.uav_clken              (1'b0),                                                                                  //              (terminated)
		.av_outputenable        (),                                                                                      //              (terminated)
		.uav_response           (),                                                                                      //              (terminated)
		.av_response            (2'b00),                                                                                 //              (terminated)
		.uav_writeresponsevalid (),                                                                                      //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                                   //              (terminated)
	);

endmodule
