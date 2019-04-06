// (C) 1992-2016 Intel Corporation.                            
// Intel, the Intel logo, Intel, MegaCore, NIOS II, Quartus and TalkBack words    
// and logos are trademarks of Intel Corporation or its subsidiaries in the U.S.  
// and/or other countries. Other marks and brands may be claimed as the property  
// of others. See Trademarks on intel.com for full list of Intel trademarks or    
// the Trademarks & Brands Names Database (if Intel) or See www.Intel.com/legal (if Altera) 
// Your use of Intel Corporation's design tools, logic functions and other        
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Intel MegaCore Function License Agreement, or other applicable      
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Intel and sold by    
// Intel or its authorized distributors.  Please refer to the applicable          
// agreement for further details.                                                 
    


/////////////////////////////////////////////////////////////////
// MODULE single_kernel_system
/////////////////////////////////////////////////////////////////
module single_kernel_system
(
   input logic clock,
   input logic clock2x,
   input logic resetn,
   // AVS avs_genetic_algorithm_cra
   input logic avs_genetic_algorithm_cra_enable,
   input logic avs_genetic_algorithm_cra_read,
   input logic avs_genetic_algorithm_cra_write,
   input logic [4:0] avs_genetic_algorithm_cra_address,
   input logic [63:0] avs_genetic_algorithm_cra_writedata,
   input logic [7:0] avs_genetic_algorithm_cra_byteenable,
   output logic [63:0] avs_genetic_algorithm_cra_readdata,
   output logic avs_genetic_algorithm_cra_readdatavalid,
   output logic kernel_irq,
   // AVM avm_memgmem0_port_0_0_rw
   output logic avm_memgmem0_port_0_0_rw_enable,
   output logic avm_memgmem0_port_0_0_rw_read,
   output logic avm_memgmem0_port_0_0_rw_write,
   output logic [4:0] avm_memgmem0_port_0_0_rw_burstcount,
   output logic [30:0] avm_memgmem0_port_0_0_rw_address,
   output logic [511:0] avm_memgmem0_port_0_0_rw_writedata,
   output logic [63:0] avm_memgmem0_port_0_0_rw_byteenable,
   input logic avm_memgmem0_port_0_0_rw_waitrequest,
   input logic [511:0] avm_memgmem0_port_0_0_rw_readdata,
   input logic avm_memgmem0_port_0_0_rw_readdatavalid,
   input logic avm_memgmem0_port_0_0_rw_writeack,
   // AVM avm_memgmem0_port_1_0_rw
   output logic avm_memgmem0_port_1_0_rw_enable,
   output logic avm_memgmem0_port_1_0_rw_read,
   output logic avm_memgmem0_port_1_0_rw_write,
   output logic [4:0] avm_memgmem0_port_1_0_rw_burstcount,
   output logic [30:0] avm_memgmem0_port_1_0_rw_address,
   output logic [511:0] avm_memgmem0_port_1_0_rw_writedata,
   output logic [63:0] avm_memgmem0_port_1_0_rw_byteenable,
   input logic avm_memgmem0_port_1_0_rw_waitrequest,
   input logic [511:0] avm_memgmem0_port_1_0_rw_readdata,
   input logic avm_memgmem0_port_1_0_rw_readdatavalid,
   input logic avm_memgmem0_port_1_0_rw_writeack
);
   logic genetic_algorithm_start;
   logic [0:0] genetic_algorithm_start_chain;
   logic [0:0] genetic_algorithm_start_kernel_copy;
   logic [0:0] genetic_algorithm_start_task_fd;
   logic [0:0] genetic_algorithm_start_finish_element;
   logic genetic_algorithm_finish;
   logic [0:0] genetic_algorithm_finish_kernel_copy;
   logic [0:0] genetic_algorithm_finish_chain;
   logic [31:0] genetic_algorithm_global_size [2:0];
   logic [31:0] genetic_algorithm_num_groups [2:0];
   logic [31:0] genetic_algorithm_local_size [2:0];
   logic [31:0] genetic_algorithm_global_offset [2:0];
   logic [31:0] genetic_algorithm_work_dim;
   logic [31:0] genetic_algorithm_wg_size;
   logic [0:0] genetic_algorithm_wg_disp_stall_in;
   logic [0:0] genetic_algorithm_wg_disp_valid_out;
   logic genetic_algorithm_wg_disp_start_out;
   logic [31:0] genetic_algorithm_wg_disp_group_id_out [2:0];
   logic [31:0] genetic_algorithm_wg_disp_global_id_base_out [2:0];
   logic genetic_algorithm_wg_disp_dispatched_all_groups;
   logic [31:0] genetic_algorithm_global_id [1][2:0];
   logic [31:0] genetic_algorithm_local_id [1][2:0];
   logic [31:0] genetic_algorithm_group_id [1][2:0];
   logic [0:0] genetic_algorithm_pending_write;
   logic [0:0] genetic_algorithm_lsu_active;
   logic [0:0] genetic_algorithm_valid_in;
   logic [0:0] genetic_algorithm_valid_out;
   logic [0:0] genetic_algorithm_stall_in;
   logic [0:0] genetic_algorithm_stall_out;
   logic genetic_algorithm_cra_pending_write;
   logic genetic_algorithm_cra_lsu_active;
   logic genetic_algorithm_cra_valid_in;
   logic [383:0] genetic_algorithm_kernel_arguments;
   logic kernel_irqs;
   logic avm_kernel_rd_enable [1];
   logic avm_kernel_rd_read [1];
   logic avm_kernel_rd_write [1];
   logic [4:0] avm_kernel_rd_burstcount [1];
   logic [31:0] avm_kernel_rd_address [1];
   logic [511:0] avm_kernel_rd_writedata [1];
   logic [63:0] avm_kernel_rd_byteenable [1];
   logic avm_kernel_rd_waitrequest [1];
   logic [511:0] avm_kernel_rd_readdata [1];
   logic avm_kernel_rd_readdatavalid [1];
   logic avm_kernel_rd_writeack [1];
   logic avm_kernel_wr_enable [2];
   logic avm_kernel_wr_read [2];
   logic avm_kernel_wr_write [2];
   logic [4:0] avm_kernel_wr_burstcount [2];
   logic [31:0] avm_kernel_wr_address [2];
   logic [511:0] avm_kernel_wr_writedata [2];
   logic [63:0] avm_kernel_wr_byteenable [2];
   logic avm_kernel_wr_waitrequest [2];
   logic [511:0] avm_kernel_wr_readdata [2];
   logic avm_kernel_wr_readdatavalid [2];
   logic avm_kernel_wr_writeack [2];
   logic ic_avm_enable [2];
   logic ic_avm_read [2];
   logic ic_avm_write [2];
   logic [4:0] ic_avm_burstcount [2];
   logic [30:0] ic_avm_address [2];
   logic [511:0] ic_avm_writedata [2];
   logic [63:0] ic_avm_byteenable [2];
   logic ic_avm_waitrequest [2];
   logic [511:0] ic_avm_readdata [2];
   logic ic_avm_readdatavalid [2];
   logic ic_avm_writeack [2];

   assign genetic_algorithm_start_chain[0] = genetic_algorithm_start;
   assign genetic_algorithm_finish_chain[0] = 1'b1;
   assign genetic_algorithm_cra_pending_write = |genetic_algorithm_pending_write;
   assign genetic_algorithm_cra_lsu_active = |genetic_algorithm_lsu_active;
   assign genetic_algorithm_cra_valid_in = |genetic_algorithm_valid_in;
   assign genetic_algorithm_stall_in = 0;
   // INST genetic_algorithm_workgroup_dispatcher of acl_work_group_dispatcher
   acl_work_group_dispatcher
   #(
      .WIDTH(32),
      .NUM_COPIES(1),
      .RUN_FOREVER(0)
   )
   genetic_algorithm_workgroup_dispatcher
   (
      .clock(clock),
      .resetn(resetn),
      .start(genetic_algorithm_start),
      .num_groups(genetic_algorithm_num_groups),
      .local_size(genetic_algorithm_local_size),
      .stall_in(genetic_algorithm_wg_disp_stall_in),
      .valid_out(genetic_algorithm_wg_disp_valid_out),
      .group_id_out(genetic_algorithm_wg_disp_group_id_out),
      .global_id_base_out(genetic_algorithm_wg_disp_global_id_base_out),
      .start_out(genetic_algorithm_wg_disp_start_out),
      .dispatched_all_groups(genetic_algorithm_wg_disp_dispatched_all_groups)
   );

   // INST genetic_algorithm_finish_detector of acl_kernel_finish_detector
   acl_kernel_finish_detector
   #(
      .NUM_COPIES(1),
      .WG_SIZE_W(32),
      .GLOBAL_ID_W(32),
      .TESSELLATION_SIZE(0)
   )
   genetic_algorithm_finish_detector
   (
      .clock(clock),
      .resetn(resetn),
      .start(genetic_algorithm_start),
      .wg_size(genetic_algorithm_wg_size),
      .wg_dispatch_valid_out(genetic_algorithm_wg_disp_valid_out),
      .wg_dispatch_stall_in(genetic_algorithm_wg_disp_stall_in),
      .dispatched_all_groups(genetic_algorithm_wg_disp_dispatched_all_groups),
      .kernel_copy_valid_out(genetic_algorithm_valid_out),
      .kernel_copy_stall_in(genetic_algorithm_stall_in),
      .pending_writes(genetic_algorithm_cra_pending_write),
      .finish(genetic_algorithm_finish)
   );

   // INST genetic_algorithm_cra_slave_inst of genetic_algorithm_function_cra_slave
   genetic_algorithm_function_cra_slave genetic_algorithm_cra_slave_inst
   (
      .clock(clock),
      .resetn(resetn),
      .start(genetic_algorithm_start),
      .finish(genetic_algorithm_finish),
      .global_offset_0(genetic_algorithm_global_offset[0]),
      .global_offset_1(genetic_algorithm_global_offset[1]),
      .global_offset_2(genetic_algorithm_global_offset[2]),
      .work_dim(genetic_algorithm_work_dim),
      .has_a_lsu_active(genetic_algorithm_cra_lsu_active),
      .has_a_write_pending(genetic_algorithm_cra_pending_write),
      .valid_in(genetic_algorithm_cra_valid_in),
      .global_size_0(genetic_algorithm_global_size[0]),
      .global_size_1(genetic_algorithm_global_size[1]),
      .global_size_2(genetic_algorithm_global_size[2]),
      .num_groups_0(genetic_algorithm_num_groups[0]),
      .num_groups_1(genetic_algorithm_num_groups[1]),
      .num_groups_2(genetic_algorithm_num_groups[2]),
      .local_size_0(genetic_algorithm_local_size[0]),
      .local_size_1(genetic_algorithm_local_size[1]),
      .local_size_2(genetic_algorithm_local_size[2]),
      .workgroup_size(genetic_algorithm_wg_size),
      .kernel_arguments(genetic_algorithm_kernel_arguments),
      .cra_irq(kernel_irqs),
      // AVS avs_cra
      .avs_cra_enable(avs_genetic_algorithm_cra_enable),
      .avs_cra_read(avs_genetic_algorithm_cra_read),
      .avs_cra_write(avs_genetic_algorithm_cra_write),
      .avs_cra_address(avs_genetic_algorithm_cra_address),
      .avs_cra_writedata(avs_genetic_algorithm_cra_writedata),
      .avs_cra_byteenable(avs_genetic_algorithm_cra_byteenable),
      .avs_cra_readdata(avs_genetic_algorithm_cra_readdata),
      .avs_cra_readdatavalid(avs_genetic_algorithm_cra_readdatavalid)
   );

   // INST genetic_algorithm_id_iter_inst_0 of acl_id_iterator
   acl_id_iterator
   #(
      .WIDTH(32),
      .LOCAL_WIDTH_X(1),
      .LOCAL_WIDTH_Y(1),
      .LOCAL_WIDTH_Z(1),
      .ENABLE_TESSELLATION(0)
   )
   genetic_algorithm_id_iter_inst_0
   (
      .clock(clock),
      .resetn(resetn),
      .start(genetic_algorithm_wg_disp_start_out),
      .valid_in(genetic_algorithm_wg_disp_valid_out[0]),
      .stall_out(genetic_algorithm_wg_disp_stall_in[0]),
      .stall_in(genetic_algorithm_stall_out[0]),
      .valid_out(genetic_algorithm_valid_in[0]),
      .group_id_in(genetic_algorithm_wg_disp_group_id_out),
      .global_id_base_in(genetic_algorithm_wg_disp_global_id_base_out),
      .local_size(genetic_algorithm_local_size),
      .global_size(genetic_algorithm_global_size),
      .local_id(genetic_algorithm_local_id[0]),
      .global_id(genetic_algorithm_global_id[0]),
      .group_id(genetic_algorithm_group_id[0])
   );

   // INST genetic_algorithm_inst_0 of genetic_algorithm_top_wrapper_0
   genetic_algorithm_top_wrapper_0 genetic_algorithm_inst_0
   (
      .start(genetic_algorithm_start_kernel_copy[0]),
      .kernel_arguments(genetic_algorithm_kernel_arguments),
      .work_dim(genetic_algorithm_work_dim),
      .global_offset(genetic_algorithm_global_offset),
      .kernel_valid_out(genetic_algorithm_valid_out[0]),
      .has_a_write_pending(genetic_algorithm_pending_write[0]),
      .has_a_lsu_active(genetic_algorithm_lsu_active[0]),
      .global_id(genetic_algorithm_global_id[0]),
      .local_id(genetic_algorithm_local_id[0]),
      .group_id(genetic_algorithm_group_id[0]),
      .global_size(genetic_algorithm_global_size),
      .local_size(genetic_algorithm_local_size),
      .num_groups(genetic_algorithm_num_groups),
      .workgroup_size(genetic_algorithm_wg_size),
      .kernel_stall_out(genetic_algorithm_stall_out[0]),
      .kernel_valid_in(genetic_algorithm_valid_in[0]),
      .clock(clock),
      .resetn(resetn),
      .clock2x(clock2x),
      // AVM avm_local_bb2_ld__inst0
      .avm_local_bb2_ld__inst0_enable(avm_kernel_rd_enable[0]),
      .avm_local_bb2_ld__inst0_read(avm_kernel_rd_read[0]),
      .avm_local_bb2_ld__inst0_write(avm_kernel_rd_write[0]),
      .avm_local_bb2_ld__inst0_burstcount(avm_kernel_rd_burstcount[0]),
      .avm_local_bb2_ld__inst0_address(avm_kernel_rd_address[0]),
      .avm_local_bb2_ld__inst0_writedata(avm_kernel_rd_writedata[0]),
      .avm_local_bb2_ld__inst0_byteenable(avm_kernel_rd_byteenable[0]),
      .avm_local_bb2_ld__inst0_waitrequest(avm_kernel_rd_waitrequest[0]),
      .avm_local_bb2_ld__inst0_readdata(avm_kernel_rd_readdata[0]),
      .avm_local_bb2_ld__inst0_readdatavalid(avm_kernel_rd_readdatavalid[0]),
      .avm_local_bb2_ld__inst0_writeack(avm_kernel_rd_writeack[0]),
      // AVM avm_local_bb4_st_c0_exe1171_inst0
      .avm_local_bb4_st_c0_exe1171_inst0_enable(avm_kernel_wr_enable[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_read(avm_kernel_wr_read[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_write(avm_kernel_wr_write[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_burstcount(avm_kernel_wr_burstcount[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_address(avm_kernel_wr_address[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_writedata(avm_kernel_wr_writedata[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_byteenable(avm_kernel_wr_byteenable[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_waitrequest(avm_kernel_wr_waitrequest[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_readdata(avm_kernel_wr_readdata[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_readdatavalid(avm_kernel_wr_readdatavalid[0]),
      .avm_local_bb4_st_c0_exe1171_inst0_writeack(avm_kernel_wr_writeack[0]),
      // AVM avm_local_bb6_st_c0_exe1182_inst0
      .avm_local_bb6_st_c0_exe1182_inst0_enable(avm_kernel_wr_enable[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_read(avm_kernel_wr_read[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_write(avm_kernel_wr_write[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_burstcount(avm_kernel_wr_burstcount[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_address(avm_kernel_wr_address[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_writedata(avm_kernel_wr_writedata[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_byteenable(avm_kernel_wr_byteenable[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_waitrequest(avm_kernel_wr_waitrequest[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_readdata(avm_kernel_wr_readdata[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_readdatavalid(avm_kernel_wr_readdatavalid[1]),
      .avm_local_bb6_st_c0_exe1182_inst0_writeack(avm_kernel_wr_writeack[1])
   );

   // INST genetic_algorithm_start_elem_inst_0 of acl_start_signal_chain_element
   acl_start_signal_chain_element genetic_algorithm_start_elem_inst_0
   (
      .clock(clock),
      .resetn(resetn),
      .start_in(genetic_algorithm_start_chain[0]),
      .start_kernel(genetic_algorithm_start_kernel_copy[0]),
      .start_finish_detector(genetic_algorithm_start_task_fd[0]),
      .start_finish_chain_element(genetic_algorithm_start_finish_element[0]),
      .start_chain()
   );

   assign kernel_irq = |kernel_irqs;
   // INST lsu_ic_top of lsu_ic_top
   lsu_ic_top
   #(
      .AWIDTH(32),
      .SHIFT(10),
      .MWIDTH_BYTES(64),
      .BURST_CNT_W(5),
      .NUM_RD_PORT(1),
      .NUM_WR_PORT(2),
      .NUM_DIMM(2),
      .ENABLE_DUAL_RING(0),
      .ENABLE_MULTIPLE_WR_RING(0),
      .ENABLE_LAST_WAIT(0),
      .ENABLE_REORDER(0),
      .NUM_REORDER(1)
   )
   lsu_ic_top
   (
      .clk(clock),
      .resetn(resetn),
      .i_rd_request(avm_kernel_rd_read),
      .i_rd_address(avm_kernel_rd_address),
      .i_rd_burstcount(avm_kernel_rd_burstcount),
      .i_wr_byteenable(avm_kernel_wr_byteenable),
      .i_wr_address(avm_kernel_wr_address),
      .i_wr_request(avm_kernel_wr_write),
      .i_wr_burstcount(avm_kernel_wr_burstcount),
      .i_wr_writedata(avm_kernel_wr_writedata),
      .i_avm_waitrequest(ic_avm_waitrequest),
      .i_avm_readdata(ic_avm_readdata),
      .i_avm_readdatavalid(ic_avm_readdatavalid),
      .o_avm_byteenable(ic_avm_byteenable),
      .o_avm_address(ic_avm_address),
      .o_avm_read(ic_avm_read),
      .o_avm_write(ic_avm_write),
      .o_avm_burstcount(ic_avm_burstcount),
      .o_wr_waitrequest(avm_kernel_wr_waitrequest),
      .o_avm_writedata(ic_avm_writedata),
      .o_avm_writeack(avm_kernel_wr_writeack),
      .o_rd_waitrequest(avm_kernel_rd_waitrequest),
      .o_avm_readdata(avm_kernel_rd_readdata),
      .o_avm_readdatavalid(avm_kernel_rd_readdatavalid)
   );

   assign avm_memgmem0_port_0_0_rw_read = ic_avm_read[0];
   assign avm_memgmem0_port_0_0_rw_write = ic_avm_write[0];
   assign avm_memgmem0_port_0_0_rw_burstcount = ic_avm_burstcount[0];
   assign avm_memgmem0_port_0_0_rw_address = ic_avm_address[0];
   assign avm_memgmem0_port_0_0_rw_writedata = ic_avm_writedata[0];
   assign avm_memgmem0_port_0_0_rw_byteenable = ic_avm_byteenable[0];
   assign ic_avm_waitrequest[0] = avm_memgmem0_port_0_0_rw_waitrequest;
   assign ic_avm_readdata[0] = avm_memgmem0_port_0_0_rw_readdata;
   assign ic_avm_readdatavalid[0] = avm_memgmem0_port_0_0_rw_readdatavalid;
   assign avm_memgmem0_port_1_0_rw_read = ic_avm_read[1];
   assign avm_memgmem0_port_1_0_rw_write = ic_avm_write[1];
   assign avm_memgmem0_port_1_0_rw_burstcount = ic_avm_burstcount[1];
   assign avm_memgmem0_port_1_0_rw_address = ic_avm_address[1];
   assign avm_memgmem0_port_1_0_rw_writedata = ic_avm_writedata[1];
   assign avm_memgmem0_port_1_0_rw_byteenable = ic_avm_byteenable[1];
   assign ic_avm_waitrequest[1] = avm_memgmem0_port_1_0_rw_waitrequest;
   assign ic_avm_readdata[1] = avm_memgmem0_port_1_0_rw_readdata;
   assign ic_avm_readdatavalid[1] = avm_memgmem0_port_1_0_rw_readdatavalid;
endmodule

/////////////////////////////////////////////////////////////////
// MODULE genetic_algorithm_top_wrapper_0
/////////////////////////////////////////////////////////////////
module genetic_algorithm_top_wrapper_0
(
   input logic start,
   input logic [383:0] kernel_arguments,
   input logic [31:0] work_dim,
   input logic [31:0] global_offset [2:0],
   output logic kernel_valid_out,
   output logic has_a_write_pending,
   output logic has_a_lsu_active,
   input logic [31:0] global_id [2:0],
   input logic [31:0] local_id [2:0],
   input logic [31:0] group_id [2:0],
   input logic [31:0] global_size [2:0],
   input logic [31:0] local_size [2:0],
   input logic [31:0] num_groups [2:0],
   input logic [31:0] workgroup_size,
   output logic kernel_stall_out,
   input logic kernel_valid_in,
   input logic clock,
   input logic resetn,
   input logic clock2x,
   // AVM avm_local_bb2_ld__inst0
   output logic avm_local_bb2_ld__inst0_enable,
   output logic avm_local_bb2_ld__inst0_read,
   output logic avm_local_bb2_ld__inst0_write,
   output logic [4:0] avm_local_bb2_ld__inst0_burstcount,
   output logic [31:0] avm_local_bb2_ld__inst0_address,
   output logic [511:0] avm_local_bb2_ld__inst0_writedata,
   output logic [63:0] avm_local_bb2_ld__inst0_byteenable,
   input logic avm_local_bb2_ld__inst0_waitrequest,
   input logic [511:0] avm_local_bb2_ld__inst0_readdata,
   input logic avm_local_bb2_ld__inst0_readdatavalid,
   input logic avm_local_bb2_ld__inst0_writeack,
   // AVM avm_local_bb4_st_c0_exe1171_inst0
   output logic avm_local_bb4_st_c0_exe1171_inst0_enable,
   output logic avm_local_bb4_st_c0_exe1171_inst0_read,
   output logic avm_local_bb4_st_c0_exe1171_inst0_write,
   output logic [4:0] avm_local_bb4_st_c0_exe1171_inst0_burstcount,
   output logic [31:0] avm_local_bb4_st_c0_exe1171_inst0_address,
   output logic [511:0] avm_local_bb4_st_c0_exe1171_inst0_writedata,
   output logic [63:0] avm_local_bb4_st_c0_exe1171_inst0_byteenable,
   input logic avm_local_bb4_st_c0_exe1171_inst0_waitrequest,
   input logic [511:0] avm_local_bb4_st_c0_exe1171_inst0_readdata,
   input logic avm_local_bb4_st_c0_exe1171_inst0_readdatavalid,
   input logic avm_local_bb4_st_c0_exe1171_inst0_writeack,
   // AVM avm_local_bb6_st_c0_exe1182_inst0
   output logic avm_local_bb6_st_c0_exe1182_inst0_enable,
   output logic avm_local_bb6_st_c0_exe1182_inst0_read,
   output logic avm_local_bb6_st_c0_exe1182_inst0_write,
   output logic [4:0] avm_local_bb6_st_c0_exe1182_inst0_burstcount,
   output logic [31:0] avm_local_bb6_st_c0_exe1182_inst0_address,
   output logic [511:0] avm_local_bb6_st_c0_exe1182_inst0_writedata,
   output logic [63:0] avm_local_bb6_st_c0_exe1182_inst0_byteenable,
   input logic avm_local_bb6_st_c0_exe1182_inst0_waitrequest,
   input logic [511:0] avm_local_bb6_st_c0_exe1182_inst0_readdata,
   input logic avm_local_bb6_st_c0_exe1182_inst0_readdatavalid,
   input logic avm_local_bb6_st_c0_exe1182_inst0_writeack
);
   genvar __i;
   genvar __j;
   genvar __k;
   logic lmem_invalid_single_bit;
   logic [1:0] lmem_invalid_aspaces;
   logic local_avm_aspace6_enable [1][2];
   logic local_avm_aspace6_read [1][2];
   logic local_avm_aspace6_write [1][2];
   logic local_avm_aspace6_burstcount [1][2];
   logic [31:0] local_avm_aspace6_address [1][2];
   logic [7:0] local_avm_aspace6_writedata [1][2];
   logic local_avm_aspace6_byteenable [1][2];
   logic local_avm_aspace6_waitrequest [1][2];
   logic [7:0] local_avm_aspace6_readdata [1][2];
   logic local_avm_aspace6_readdatavalid [1][2];
   logic local_avm_aspace6_writeack [1][2];
   logic local_avm_aspace7_enable [1][3];
   logic local_avm_aspace7_read [1][3];
   logic local_avm_aspace7_write [1][3];
   logic local_avm_aspace7_burstcount [1][3];
   logic [31:0] local_avm_aspace7_address [1][3];
   logic [7:0] local_avm_aspace7_writedata [1][3];
   logic local_avm_aspace7_byteenable [1][3];
   logic local_avm_aspace7_waitrequest [1][3];
   logic [7:0] local_avm_aspace7_readdata [1][3];
   logic local_avm_aspace7_readdatavalid [1][3];
   logic local_avm_aspace7_writeack [1][3];

   // INST kernel of genetic_algorithm_function_wrapper
   genetic_algorithm_function_wrapper kernel
   (
      .local_router_hang(lmem_invalid_single_bit),
      .start(start),
      .kernel_arguments(kernel_arguments),
      .work_dim(work_dim),
      .global_offset_0(global_offset[0]),
      .global_offset_1(global_offset[1]),
      .global_offset_2(global_offset[2]),
      .kernel_valid_out(kernel_valid_out),
      .has_a_write_pending(has_a_write_pending),
      .has_a_lsu_active(has_a_lsu_active),
      .global_id_0(global_id[0]),
      .global_id_1(global_id[1]),
      .global_id_2(global_id[2]),
      .local_id_0(local_id[0]),
      .local_id_1(local_id[1]),
      .local_id_2(local_id[2]),
      .group_id_0(group_id[0]),
      .group_id_1(group_id[1]),
      .group_id_2(group_id[2]),
      .global_size_0(global_size[0]),
      .global_size_1(global_size[1]),
      .global_size_2(global_size[2]),
      .local_size_0(local_size[0]),
      .local_size_1(local_size[1]),
      .local_size_2(local_size[2]),
      .num_groups_0(num_groups[0]),
      .num_groups_1(num_groups[1]),
      .num_groups_2(num_groups[2]),
      .workgroup_size(workgroup_size),
      .kernel_stall_out(kernel_stall_out),
      .kernel_valid_in(kernel_valid_in),
      .clock(clock),
      .resetn(resetn),
      .clock2x(clock2x),
      // AVM avm_local_bb2_ld__inst0
      .avm_local_bb2_ld__inst0_enable(avm_local_bb2_ld__inst0_enable),
      .avm_local_bb2_ld__inst0_read(avm_local_bb2_ld__inst0_read),
      .avm_local_bb2_ld__inst0_write(avm_local_bb2_ld__inst0_write),
      .avm_local_bb2_ld__inst0_burstcount(avm_local_bb2_ld__inst0_burstcount),
      .avm_local_bb2_ld__inst0_address(avm_local_bb2_ld__inst0_address),
      .avm_local_bb2_ld__inst0_writedata(avm_local_bb2_ld__inst0_writedata),
      .avm_local_bb2_ld__inst0_byteenable(avm_local_bb2_ld__inst0_byteenable),
      .avm_local_bb2_ld__inst0_waitrequest(avm_local_bb2_ld__inst0_waitrequest),
      .avm_local_bb2_ld__inst0_readdata(avm_local_bb2_ld__inst0_readdata),
      .avm_local_bb2_ld__inst0_readdatavalid(avm_local_bb2_ld__inst0_readdatavalid),
      .avm_local_bb2_ld__inst0_writeack(avm_local_bb2_ld__inst0_writeack),
      // AVM avm_local_bb4_st_c0_exe1171_inst0
      .avm_local_bb4_st_c0_exe1171_inst0_enable(avm_local_bb4_st_c0_exe1171_inst0_enable),
      .avm_local_bb4_st_c0_exe1171_inst0_read(avm_local_bb4_st_c0_exe1171_inst0_read),
      .avm_local_bb4_st_c0_exe1171_inst0_write(avm_local_bb4_st_c0_exe1171_inst0_write),
      .avm_local_bb4_st_c0_exe1171_inst0_burstcount(avm_local_bb4_st_c0_exe1171_inst0_burstcount),
      .avm_local_bb4_st_c0_exe1171_inst0_address(avm_local_bb4_st_c0_exe1171_inst0_address),
      .avm_local_bb4_st_c0_exe1171_inst0_writedata(avm_local_bb4_st_c0_exe1171_inst0_writedata),
      .avm_local_bb4_st_c0_exe1171_inst0_byteenable(avm_local_bb4_st_c0_exe1171_inst0_byteenable),
      .avm_local_bb4_st_c0_exe1171_inst0_waitrequest(avm_local_bb4_st_c0_exe1171_inst0_waitrequest),
      .avm_local_bb4_st_c0_exe1171_inst0_readdata(avm_local_bb4_st_c0_exe1171_inst0_readdata),
      .avm_local_bb4_st_c0_exe1171_inst0_readdatavalid(avm_local_bb4_st_c0_exe1171_inst0_readdatavalid),
      .avm_local_bb4_st_c0_exe1171_inst0_writeack(avm_local_bb4_st_c0_exe1171_inst0_writeack),
      // AVM avm_local_bb6_st_c0_exe1182_inst0
      .avm_local_bb6_st_c0_exe1182_inst0_enable(avm_local_bb6_st_c0_exe1182_inst0_enable),
      .avm_local_bb6_st_c0_exe1182_inst0_read(avm_local_bb6_st_c0_exe1182_inst0_read),
      .avm_local_bb6_st_c0_exe1182_inst0_write(avm_local_bb6_st_c0_exe1182_inst0_write),
      .avm_local_bb6_st_c0_exe1182_inst0_burstcount(avm_local_bb6_st_c0_exe1182_inst0_burstcount),
      .avm_local_bb6_st_c0_exe1182_inst0_address(avm_local_bb6_st_c0_exe1182_inst0_address),
      .avm_local_bb6_st_c0_exe1182_inst0_writedata(avm_local_bb6_st_c0_exe1182_inst0_writedata),
      .avm_local_bb6_st_c0_exe1182_inst0_byteenable(avm_local_bb6_st_c0_exe1182_inst0_byteenable),
      .avm_local_bb6_st_c0_exe1182_inst0_waitrequest(avm_local_bb6_st_c0_exe1182_inst0_waitrequest),
      .avm_local_bb6_st_c0_exe1182_inst0_readdata(avm_local_bb6_st_c0_exe1182_inst0_readdata),
      .avm_local_bb6_st_c0_exe1182_inst0_readdatavalid(avm_local_bb6_st_c0_exe1182_inst0_readdatavalid),
      .avm_local_bb6_st_c0_exe1182_inst0_writeack(avm_local_bb6_st_c0_exe1182_inst0_writeack),
      // AVM avm_local_bb2_st__inst0
      .avm_local_bb2_st__inst0_enable(local_avm_aspace6_enable[0][0]),
      .avm_local_bb2_st__inst0_read(local_avm_aspace6_read[0][0]),
      .avm_local_bb2_st__inst0_write(local_avm_aspace6_write[0][0]),
      .avm_local_bb2_st__inst0_burstcount(local_avm_aspace6_burstcount[0][0]),
      .avm_local_bb2_st__inst0_address(local_avm_aspace6_address[0][0]),
      .avm_local_bb2_st__inst0_writedata(local_avm_aspace6_writedata[0][0]),
      .avm_local_bb2_st__inst0_byteenable(local_avm_aspace6_byteenable[0][0]),
      .avm_local_bb2_st__inst0_waitrequest(local_avm_aspace6_waitrequest[0][0]),
      .avm_local_bb2_st__inst0_readdata(local_avm_aspace6_readdata[0][0]),
      .avm_local_bb2_st__inst0_readdatavalid(local_avm_aspace6_readdatavalid[0][0]),
      .avm_local_bb2_st__inst0_writeack(local_avm_aspace6_writeack[0][0]),
      // AVM avm_local_bb3_ld__inst0
      .avm_local_bb3_ld__inst0_enable(local_avm_aspace6_enable[0][1]),
      .avm_local_bb3_ld__inst0_read(local_avm_aspace6_read[0][1]),
      .avm_local_bb3_ld__inst0_write(local_avm_aspace6_write[0][1]),
      .avm_local_bb3_ld__inst0_burstcount(local_avm_aspace6_burstcount[0][1]),
      .avm_local_bb3_ld__inst0_address(local_avm_aspace6_address[0][1]),
      .avm_local_bb3_ld__inst0_writedata(local_avm_aspace6_writedata[0][1]),
      .avm_local_bb3_ld__inst0_byteenable(local_avm_aspace6_byteenable[0][1]),
      .avm_local_bb3_ld__inst0_waitrequest(local_avm_aspace6_waitrequest[0][1]),
      .avm_local_bb3_ld__inst0_readdata(local_avm_aspace6_readdata[0][1]),
      .avm_local_bb3_ld__inst0_readdatavalid(local_avm_aspace6_readdatavalid[0][1]),
      .avm_local_bb3_ld__inst0_writeack(local_avm_aspace6_writeack[0][1]),
      // AVM avm_local_bb3_st__inst0
      .avm_local_bb3_st__inst0_enable(local_avm_aspace7_enable[0][0]),
      .avm_local_bb3_st__inst0_read(local_avm_aspace7_read[0][0]),
      .avm_local_bb3_st__inst0_write(local_avm_aspace7_write[0][0]),
      .avm_local_bb3_st__inst0_burstcount(local_avm_aspace7_burstcount[0][0]),
      .avm_local_bb3_st__inst0_address(local_avm_aspace7_address[0][0]),
      .avm_local_bb3_st__inst0_writedata(local_avm_aspace7_writedata[0][0]),
      .avm_local_bb3_st__inst0_byteenable(local_avm_aspace7_byteenable[0][0]),
      .avm_local_bb3_st__inst0_waitrequest(local_avm_aspace7_waitrequest[0][0]),
      .avm_local_bb3_st__inst0_readdata(local_avm_aspace7_readdata[0][0]),
      .avm_local_bb3_st__inst0_readdatavalid(local_avm_aspace7_readdatavalid[0][0]),
      .avm_local_bb3_st__inst0_writeack(local_avm_aspace7_writeack[0][0]),
      // AVM avm_local_bb4_ld__inst0
      .avm_local_bb4_ld__inst0_enable(local_avm_aspace7_enable[0][1]),
      .avm_local_bb4_ld__inst0_read(local_avm_aspace7_read[0][1]),
      .avm_local_bb4_ld__inst0_write(local_avm_aspace7_write[0][1]),
      .avm_local_bb4_ld__inst0_burstcount(local_avm_aspace7_burstcount[0][1]),
      .avm_local_bb4_ld__inst0_address(local_avm_aspace7_address[0][1]),
      .avm_local_bb4_ld__inst0_writedata(local_avm_aspace7_writedata[0][1]),
      .avm_local_bb4_ld__inst0_byteenable(local_avm_aspace7_byteenable[0][1]),
      .avm_local_bb4_ld__inst0_waitrequest(local_avm_aspace7_waitrequest[0][1]),
      .avm_local_bb4_ld__inst0_readdata(local_avm_aspace7_readdata[0][1]),
      .avm_local_bb4_ld__inst0_readdatavalid(local_avm_aspace7_readdatavalid[0][1]),
      .avm_local_bb4_ld__inst0_writeack(local_avm_aspace7_writeack[0][1]),
      // AVM avm_local_bb6_ld__inst0
      .avm_local_bb6_ld__inst0_enable(local_avm_aspace7_enable[0][2]),
      .avm_local_bb6_ld__inst0_read(local_avm_aspace7_read[0][2]),
      .avm_local_bb6_ld__inst0_write(local_avm_aspace7_write[0][2]),
      .avm_local_bb6_ld__inst0_burstcount(local_avm_aspace7_burstcount[0][2]),
      .avm_local_bb6_ld__inst0_address(local_avm_aspace7_address[0][2]),
      .avm_local_bb6_ld__inst0_writedata(local_avm_aspace7_writedata[0][2]),
      .avm_local_bb6_ld__inst0_byteenable(local_avm_aspace7_byteenable[0][2]),
      .avm_local_bb6_ld__inst0_waitrequest(local_avm_aspace7_waitrequest[0][2]),
      .avm_local_bb6_ld__inst0_readdata(local_avm_aspace7_readdata[0][2]),
      .avm_local_bb6_ld__inst0_readdatavalid(local_avm_aspace7_readdatavalid[0][2]),
      .avm_local_bb6_ld__inst0_writeack(local_avm_aspace7_writeack[0][2])
   );

   assign lmem_invalid_single_bit = |lmem_invalid_aspaces;
   generate
   begin:local_mem_system_aspace6
      logic local_icm_arb_request [1][2];
      logic local_icm_arb_enable [1][2];
      logic local_icm_arb_read [1][2];
      logic local_icm_arb_write [1][2];
      logic local_icm_arb_burstcount [1][2];
      logic [6:0] local_icm_arb_address [1][2];
      logic [7:0] local_icm_arb_writedata [1][2];
      logic local_icm_arb_byteenable [1][2];
      logic local_icm_arb_stall [1][2];
      logic local_icm_wrp_ack [1][2];
      logic local_icm_rrp_datavalid [1][2];
      logic [7:0] local_icm_rrp_data [1][2];

      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:local_mem_group
         for( __j = 0; __j < 2; __j = __j + 1 )
         begin:master
            // INST avm_to_ic of acl_avm_to_ic
            acl_avm_to_ic
            #(
               .DATA_W(8),
               .WRITEDATA_W(8),
               .BURSTCOUNT_W(1),
               .ADDRESS_W(32),
               .BYTEENA_W(1)
            )
            avm_to_ic
            (
               // AVM avm
               .avm_enable(local_avm_aspace6_enable[__i][__j]),
               .avm_read(local_avm_aspace6_read[__i][__j]),
               .avm_write(local_avm_aspace6_write[__i][__j]),
               .avm_burstcount(local_avm_aspace6_burstcount[__i][__j]),
               .avm_address(local_avm_aspace6_address[__i][__j]),
               .avm_writedata(local_avm_aspace6_writedata[__i][__j]),
               .avm_byteenable(local_avm_aspace6_byteenable[__i][__j]),
               .avm_waitrequest(local_avm_aspace6_waitrequest[__i][__j]),
               .avm_readdata(local_avm_aspace6_readdata[__i][__j]),
               .avm_readdatavalid(local_avm_aspace6_readdatavalid[__i][__j]),
               .avm_writeack(local_avm_aspace6_writeack[__i][__j]),
               // ICM ic
               .ic_arb_request(local_icm_arb_request[__i][__j]),
               .ic_arb_enable(local_icm_arb_enable[__i][__j]),
               .ic_arb_read(local_icm_arb_read[__i][__j]),
               .ic_arb_write(local_icm_arb_write[__i][__j]),
               .ic_arb_burstcount(local_icm_arb_burstcount[__i][__j]),
               .ic_arb_address(local_icm_arb_address[__i][__j]),
               .ic_arb_writedata(local_icm_arb_writedata[__i][__j]),
               .ic_arb_byteenable(local_icm_arb_byteenable[__i][__j]),
               .ic_arb_stall(local_icm_arb_stall[__i][__j]),
               .ic_wrp_ack(local_icm_wrp_ack[__i][__j]),
               .ic_rrp_datavalid(local_icm_rrp_datavalid[__i][__j]),
               .ic_rrp_data(local_icm_rrp_data[__i][__j])
            );

         end

         for( __j = 0; __j < 1; __j = __j + 1 )
         begin:bank
            logic port_enable [1:2];
            logic port_read [1:2];
            logic port_write [1:2];
            logic [6:0] port_address [1:2];
            logic [7:0] port_writedata [1:2];
            logic port_byteenable [1:2];
            logic port_waitrequest [1:2];
            logic [7:0] port_readdata [1:2];
            logic port_readdatavalid [1:2];

            // INST mem0 of acl_mem1x
            acl_mem1x
            #(
               .INTENDED_DEVICE_FAMILY("Stratix V"),
               .DEPTH_WORDS(128),
               .WIDTH(8),
               .MEM_LATENCY(3),
               .ENABLED(0),
               .RDW_MODE("DONT_CARE"),
               .RAM_OPERATION_MODE("DUAL_PORT"),
               .PREFERRED_WIDTH(320),
               .RAM_BLOCK_TYPE("M20K")
            )
            mem0
            (
               .clk(clock),
               .resetn(resetn),
               // AVS avs_port1
               .avs_port1_enable(port_enable[1]),
               .avs_port1_read(port_read[1]),
               .avs_port1_write(port_write[1]),
               .avs_port1_address(port_address[1]),
               .avs_port1_writedata(port_writedata[1]),
               .avs_port1_byteenable(port_byteenable[1]),
               .avs_port1_waitrequest(port_waitrequest[1]),
               .avs_port1_readdata(port_readdata[1]),
               .avs_port1_readdatavalid(port_readdatavalid[1]),
               // AVS avs_port2
               .avs_port2_enable(port_enable[2]),
               .avs_port2_read(port_read[2]),
               .avs_port2_write(port_write[2]),
               .avs_port2_address(port_address[2]),
               .avs_port2_writedata(port_writedata[2]),
               .avs_port2_byteenable(port_byteenable[2]),
               .avs_port2_waitrequest(port_waitrequest[2]),
               .avs_port2_readdata(port_readdata[2]),
               .avs_port2_readdatavalid(port_readdatavalid[2])
            );

         end

         for( __j = 0; __j < 2; __j = __j + 1 )
         begin:router
            logic b_arb_request [1];
            logic b_arb_enable [1];
            logic b_arb_read [1];
            logic b_arb_write [1];
            logic b_arb_burstcount [1];
            logic [6:0] b_arb_address [1];
            logic [7:0] b_arb_writedata [1];
            logic b_arb_byteenable [1];
            logic b_arb_stall [1];
            logic b_wrp_ack [1];
            logic b_rrp_datavalid [1];
            logic [7:0] b_rrp_data [1];
            logic bank_select;

            // INST router of acl_ic_local_mem_router
            acl_ic_local_mem_router
            #(
               .DATA_W(8),
               .BURSTCOUNT_W(1),
               .ADDRESS_W(7),
               .BYTEENA_W(1),
               .NUM_BANKS(1)
            )
            router
            (
               .clock(clock),
               .resetn(resetn),
               .bank_select(bank_select),
               // ICM m
               .m_arb_request(local_icm_arb_request[__i][__j]),
               .m_arb_enable(local_icm_arb_enable[__i][__j]),
               .m_arb_read(local_icm_arb_read[__i][__j]),
               .m_arb_write(local_icm_arb_write[__i][__j]),
               .m_arb_burstcount(local_icm_arb_burstcount[__i][__j]),
               .m_arb_address(local_icm_arb_address[__i][__j]),
               .m_arb_writedata(local_icm_arb_writedata[__i][__j]),
               .m_arb_byteenable(local_icm_arb_byteenable[__i][__j]),
               .m_arb_stall(local_icm_arb_stall[__i][__j]),
               .m_wrp_ack(local_icm_wrp_ack[__i][__j]),
               .m_rrp_datavalid(local_icm_rrp_datavalid[__i][__j]),
               .m_rrp_data(local_icm_rrp_data[__i][__j]),
               // ICM b
               .b_arb_request(b_arb_request),
               .b_arb_enable(b_arb_enable),
               .b_arb_read(b_arb_read),
               .b_arb_write(b_arb_write),
               .b_arb_burstcount(b_arb_burstcount),
               .b_arb_address(b_arb_address),
               .b_arb_writedata(b_arb_writedata),
               .b_arb_byteenable(b_arb_byteenable),
               .b_arb_stall(b_arb_stall),
               .b_wrp_ack(b_wrp_ack),
               .b_rrp_datavalid(b_rrp_datavalid),
               .b_rrp_data(b_rrp_data)
            );

            assign bank_select = 1'b1;
         end

         for( __j = 0; __j < 1; __j = __j + 1 )
         begin:port1bank0
            logic icm_in_arb_request [1];
            logic icm_in_arb_enable [1];
            logic icm_in_arb_read [1];
            logic icm_in_arb_write [1];
            logic icm_in_arb_burstcount [1];
            logic [6:0] icm_in_arb_address [1];
            logic [7:0] icm_in_arb_writedata [1];
            logic icm_in_arb_byteenable [1];
            logic icm_in_arb_stall [1];
            logic icm_in_wrp_ack [1];
            logic icm_in_rrp_datavalid [1];
            logic [7:0] icm_in_rrp_data [1];
            logic icm_out_arb_request;
            logic icm_out_arb_enable;
            logic icm_out_arb_read;
            logic icm_out_arb_write;
            logic icm_out_arb_burstcount;
            logic [6:0] icm_out_arb_address;
            logic [7:0] icm_out_arb_writedata;
            logic icm_out_arb_byteenable;
            logic icm_out_arb_stall;
            logic icm_out_wrp_ack;
            logic icm_out_rrp_datavalid;
            logic [7:0] icm_out_rrp_data;

            assign icm_in_arb_request[0] = router[0].b_arb_request[0];
            assign icm_in_arb_enable[0] = router[0].b_arb_enable[0];
            assign icm_in_arb_read[0] = router[0].b_arb_read[0];
            assign icm_in_arb_write[0] = router[0].b_arb_write[0];
            assign icm_in_arb_burstcount[0] = router[0].b_arb_burstcount[0];
            assign icm_in_arb_address[0] = router[0].b_arb_address[0];
            assign icm_in_arb_writedata[0] = router[0].b_arb_writedata[0];
            assign icm_in_arb_byteenable[0] = router[0].b_arb_byteenable[0];
            assign router[0].b_arb_stall[0] = icm_in_arb_stall[0];
            assign router[0].b_wrp_ack[0] = icm_in_wrp_ack[0];
            assign router[0].b_rrp_datavalid[0] = icm_in_rrp_datavalid[0];
            assign router[0].b_rrp_data[0] = icm_in_rrp_data[0];
            // INST data_ic of single_kernel_system_interconnect_0
            single_kernel_system_interconnect_0 data_ic
            (
               .clock(clock),
               .resetn(resetn),
               // ICM m
               .m_arb_request(icm_in_arb_request),
               .m_arb_enable(icm_in_arb_enable),
               .m_arb_read(icm_in_arb_read),
               .m_arb_write(icm_in_arb_write),
               .m_arb_burstcount(icm_in_arb_burstcount),
               .m_arb_address(icm_in_arb_address),
               .m_arb_writedata(icm_in_arb_writedata),
               .m_arb_byteenable(icm_in_arb_byteenable),
               .m_arb_stall(icm_in_arb_stall),
               .m_wrp_ack(icm_in_wrp_ack),
               .m_rrp_datavalid(icm_in_rrp_datavalid),
               .m_rrp_data(icm_in_rrp_data),
               // ICM mout
               .mout_arb_request(icm_out_arb_request),
               .mout_arb_enable(icm_out_arb_enable),
               .mout_arb_read(icm_out_arb_read),
               .mout_arb_write(icm_out_arb_write),
               .mout_arb_burstcount(icm_out_arb_burstcount),
               .mout_arb_address(icm_out_arb_address),
               .mout_arb_writedata(icm_out_arb_writedata),
               .mout_arb_byteenable(icm_out_arb_byteenable),
               .mout_arb_id(),
               .mout_arb_stall(icm_out_arb_stall),
               .mout_wrp_ack(icm_out_wrp_ack),
               .mout_rrp_datavalid(icm_out_rrp_datavalid),
               .mout_rrp_data(icm_out_rrp_data)
            );

            assign bank[0].port_enable[1] = icm_out_arb_enable;
            assign bank[0].port_read[1] = icm_out_arb_read;
            assign bank[0].port_write[1] = icm_out_arb_write;
            assign bank[0].port_address[1] = icm_out_arb_address;
            assign bank[0].port_writedata[1] = icm_out_arb_writedata;
            assign bank[0].port_byteenable[1] = icm_out_arb_byteenable;
            assign icm_out_arb_stall = bank[0].port_waitrequest[1];
            assign icm_out_rrp_data = bank[0].port_readdata[1];
            assign icm_out_rrp_datavalid = bank[0].port_readdatavalid[1];
            assign icm_out_wrp_ack = 'b0;
         end

         for( __j = 0; __j < 1; __j = __j + 1 )
         begin:port2bank0
            logic icm_in_arb_request [1];
            logic icm_in_arb_enable [1];
            logic icm_in_arb_read [1];
            logic icm_in_arb_write [1];
            logic icm_in_arb_burstcount [1];
            logic [6:0] icm_in_arb_address [1];
            logic [7:0] icm_in_arb_writedata [1];
            logic icm_in_arb_byteenable [1];
            logic icm_in_arb_stall [1];
            logic icm_in_wrp_ack [1];
            logic icm_in_rrp_datavalid [1];
            logic [7:0] icm_in_rrp_data [1];
            logic icm_out_arb_request;
            logic icm_out_arb_enable;
            logic icm_out_arb_read;
            logic icm_out_arb_write;
            logic icm_out_arb_burstcount;
            logic [6:0] icm_out_arb_address;
            logic [7:0] icm_out_arb_writedata;
            logic icm_out_arb_byteenable;
            logic icm_out_arb_stall;
            logic icm_out_wrp_ack;
            logic icm_out_rrp_datavalid;
            logic [7:0] icm_out_rrp_data;

            assign icm_in_arb_request[0] = router[1].b_arb_request[0];
            assign icm_in_arb_enable[0] = router[1].b_arb_enable[0];
            assign icm_in_arb_read[0] = router[1].b_arb_read[0];
            assign icm_in_arb_write[0] = router[1].b_arb_write[0];
            assign icm_in_arb_burstcount[0] = router[1].b_arb_burstcount[0];
            assign icm_in_arb_address[0] = router[1].b_arb_address[0];
            assign icm_in_arb_writedata[0] = router[1].b_arb_writedata[0];
            assign icm_in_arb_byteenable[0] = router[1].b_arb_byteenable[0];
            assign router[1].b_arb_stall[0] = icm_in_arb_stall[0];
            assign router[1].b_wrp_ack[0] = icm_in_wrp_ack[0];
            assign router[1].b_rrp_datavalid[0] = icm_in_rrp_datavalid[0];
            assign router[1].b_rrp_data[0] = icm_in_rrp_data[0];
            // INST data_ic of single_kernel_system_interconnect_1
            single_kernel_system_interconnect_1 data_ic
            (
               .clock(clock),
               .resetn(resetn),
               // ICM m
               .m_arb_request(icm_in_arb_request),
               .m_arb_enable(icm_in_arb_enable),
               .m_arb_read(icm_in_arb_read),
               .m_arb_write(icm_in_arb_write),
               .m_arb_burstcount(icm_in_arb_burstcount),
               .m_arb_address(icm_in_arb_address),
               .m_arb_writedata(icm_in_arb_writedata),
               .m_arb_byteenable(icm_in_arb_byteenable),
               .m_arb_stall(icm_in_arb_stall),
               .m_wrp_ack(icm_in_wrp_ack),
               .m_rrp_datavalid(icm_in_rrp_datavalid),
               .m_rrp_data(icm_in_rrp_data),
               // ICM mout
               .mout_arb_request(icm_out_arb_request),
               .mout_arb_enable(icm_out_arb_enable),
               .mout_arb_read(icm_out_arb_read),
               .mout_arb_write(icm_out_arb_write),
               .mout_arb_burstcount(icm_out_arb_burstcount),
               .mout_arb_address(icm_out_arb_address),
               .mout_arb_writedata(icm_out_arb_writedata),
               .mout_arb_byteenable(icm_out_arb_byteenable),
               .mout_arb_id(),
               .mout_arb_stall(icm_out_arb_stall),
               .mout_wrp_ack(icm_out_wrp_ack),
               .mout_rrp_datavalid(icm_out_rrp_datavalid),
               .mout_rrp_data(icm_out_rrp_data)
            );

            assign bank[0].port_enable[2] = icm_out_arb_enable;
            assign bank[0].port_read[2] = icm_out_arb_read;
            assign bank[0].port_write[2] = icm_out_arb_write;
            assign bank[0].port_address[2] = icm_out_arb_address;
            assign bank[0].port_writedata[2] = icm_out_arb_writedata;
            assign bank[0].port_byteenable[2] = icm_out_arb_byteenable;
            assign icm_out_arb_stall = bank[0].port_waitrequest[2];
            assign icm_out_rrp_data = bank[0].port_readdata[2];
            assign icm_out_rrp_datavalid = bank[0].port_readdatavalid[2];
            assign icm_out_wrp_ack = 'b0;
         end

      end

   end
   endgenerate

   generate
   begin:local_mem_system_aspace7
      logic local_icm_arb_request [1][3];
      logic local_icm_arb_enable [1][3];
      logic local_icm_arb_read [1][3];
      logic local_icm_arb_write [1][3];
      logic local_icm_arb_burstcount [1][3];
      logic [6:0] local_icm_arb_address [1][3];
      logic [7:0] local_icm_arb_writedata [1][3];
      logic local_icm_arb_byteenable [1][3];
      logic local_icm_arb_stall [1][3];
      logic local_icm_wrp_ack [1][3];
      logic local_icm_rrp_datavalid [1][3];
      logic [7:0] local_icm_rrp_data [1][3];

      for( __j = 0; __j < 1; __j = __j + 1 )
      begin:local_mem_group
         for( __k = 0; __k < 3; __k = __k + 1 )
         begin:master
            // INST avm_to_ic of acl_avm_to_ic
            acl_avm_to_ic
            #(
               .DATA_W(8),
               .WRITEDATA_W(8),
               .BURSTCOUNT_W(1),
               .ADDRESS_W(32),
               .BYTEENA_W(1)
            )
            avm_to_ic
            (
               // AVM avm
               .avm_enable(local_avm_aspace7_enable[__j][__k]),
               .avm_read(local_avm_aspace7_read[__j][__k]),
               .avm_write(local_avm_aspace7_write[__j][__k]),
               .avm_burstcount(local_avm_aspace7_burstcount[__j][__k]),
               .avm_address(local_avm_aspace7_address[__j][__k]),
               .avm_writedata(local_avm_aspace7_writedata[__j][__k]),
               .avm_byteenable(local_avm_aspace7_byteenable[__j][__k]),
               .avm_waitrequest(local_avm_aspace7_waitrequest[__j][__k]),
               .avm_readdata(local_avm_aspace7_readdata[__j][__k]),
               .avm_readdatavalid(local_avm_aspace7_readdatavalid[__j][__k]),
               .avm_writeack(local_avm_aspace7_writeack[__j][__k]),
               // ICM ic
               .ic_arb_request(local_icm_arb_request[__j][__k]),
               .ic_arb_enable(local_icm_arb_enable[__j][__k]),
               .ic_arb_read(local_icm_arb_read[__j][__k]),
               .ic_arb_write(local_icm_arb_write[__j][__k]),
               .ic_arb_burstcount(local_icm_arb_burstcount[__j][__k]),
               .ic_arb_address(local_icm_arb_address[__j][__k]),
               .ic_arb_writedata(local_icm_arb_writedata[__j][__k]),
               .ic_arb_byteenable(local_icm_arb_byteenable[__j][__k]),
               .ic_arb_stall(local_icm_arb_stall[__j][__k]),
               .ic_wrp_ack(local_icm_wrp_ack[__j][__k]),
               .ic_rrp_datavalid(local_icm_rrp_datavalid[__j][__k]),
               .ic_rrp_data(local_icm_rrp_data[__j][__k])
            );

         end

         for( __k = 0; __k < 1; __k = __k + 1 )
         begin:bank
            logic port_enable [1:2];
            logic port_read [1:2];
            logic port_write [1:2];
            logic [6:0] port_address [1:2];
            logic [7:0] port_writedata [1:2];
            logic port_byteenable [1:2];
            logic port_waitrequest [1:2];
            logic [7:0] port_readdata [1:2];
            logic port_readdatavalid [1:2];

            // INST mem0 of acl_mem1x
            acl_mem1x
            #(
               .INTENDED_DEVICE_FAMILY("Stratix V"),
               .DEPTH_WORDS(128),
               .WIDTH(8),
               .MEM_LATENCY(3),
               .ENABLED(0),
               .RDW_MODE("DONT_CARE"),
               .RAM_OPERATION_MODE("BIDIR_DUAL_PORT"),
               .PREFERRED_WIDTH(160),
               .RAM_BLOCK_TYPE("M20K")
            )
            mem0
            (
               .clk(clock),
               .resetn(resetn),
               // AVS avs_port1
               .avs_port1_enable(port_enable[1]),
               .avs_port1_read(port_read[1]),
               .avs_port1_write(port_write[1]),
               .avs_port1_address(port_address[1]),
               .avs_port1_writedata(port_writedata[1]),
               .avs_port1_byteenable(port_byteenable[1]),
               .avs_port1_waitrequest(port_waitrequest[1]),
               .avs_port1_readdata(port_readdata[1]),
               .avs_port1_readdatavalid(port_readdatavalid[1]),
               // AVS avs_port2
               .avs_port2_enable(port_enable[2]),
               .avs_port2_read(port_read[2]),
               .avs_port2_write(port_write[2]),
               .avs_port2_address(port_address[2]),
               .avs_port2_writedata(port_writedata[2]),
               .avs_port2_byteenable(port_byteenable[2]),
               .avs_port2_waitrequest(port_waitrequest[2]),
               .avs_port2_readdata(port_readdata[2]),
               .avs_port2_readdatavalid(port_readdatavalid[2])
            );

         end

         for( __k = 0; __k < 3; __k = __k + 1 )
         begin:router
            logic b_arb_request [1];
            logic b_arb_enable [1];
            logic b_arb_read [1];
            logic b_arb_write [1];
            logic b_arb_burstcount [1];
            logic [6:0] b_arb_address [1];
            logic [7:0] b_arb_writedata [1];
            logic b_arb_byteenable [1];
            logic b_arb_stall [1];
            logic b_wrp_ack [1];
            logic b_rrp_datavalid [1];
            logic [7:0] b_rrp_data [1];
            logic bank_select;

            // INST router of acl_ic_local_mem_router
            acl_ic_local_mem_router
            #(
               .DATA_W(8),
               .BURSTCOUNT_W(1),
               .ADDRESS_W(7),
               .BYTEENA_W(1),
               .NUM_BANKS(1)
            )
            router
            (
               .clock(clock),
               .resetn(resetn),
               .bank_select(bank_select),
               // ICM m
               .m_arb_request(local_icm_arb_request[__j][__k]),
               .m_arb_enable(local_icm_arb_enable[__j][__k]),
               .m_arb_read(local_icm_arb_read[__j][__k]),
               .m_arb_write(local_icm_arb_write[__j][__k]),
               .m_arb_burstcount(local_icm_arb_burstcount[__j][__k]),
               .m_arb_address(local_icm_arb_address[__j][__k]),
               .m_arb_writedata(local_icm_arb_writedata[__j][__k]),
               .m_arb_byteenable(local_icm_arb_byteenable[__j][__k]),
               .m_arb_stall(local_icm_arb_stall[__j][__k]),
               .m_wrp_ack(local_icm_wrp_ack[__j][__k]),
               .m_rrp_datavalid(local_icm_rrp_datavalid[__j][__k]),
               .m_rrp_data(local_icm_rrp_data[__j][__k]),
               // ICM b
               .b_arb_request(b_arb_request),
               .b_arb_enable(b_arb_enable),
               .b_arb_read(b_arb_read),
               .b_arb_write(b_arb_write),
               .b_arb_burstcount(b_arb_burstcount),
               .b_arb_address(b_arb_address),
               .b_arb_writedata(b_arb_writedata),
               .b_arb_byteenable(b_arb_byteenable),
               .b_arb_stall(b_arb_stall),
               .b_wrp_ack(b_wrp_ack),
               .b_rrp_datavalid(b_rrp_datavalid),
               .b_rrp_data(b_rrp_data)
            );

            assign bank_select = 1'b1;
         end

         for( __k = 0; __k < 1; __k = __k + 1 )
         begin:port1bank0
            logic icm_in_arb_request [2];
            logic icm_in_arb_enable [2];
            logic icm_in_arb_read [2];
            logic icm_in_arb_write [2];
            logic icm_in_arb_burstcount [2];
            logic [6:0] icm_in_arb_address [2];
            logic [7:0] icm_in_arb_writedata [2];
            logic icm_in_arb_byteenable [2];
            logic icm_in_arb_stall [2];
            logic icm_in_wrp_ack [2];
            logic icm_in_rrp_datavalid [2];
            logic [7:0] icm_in_rrp_data [2];
            logic icm_out_arb_request;
            logic icm_out_arb_enable;
            logic icm_out_arb_read;
            logic icm_out_arb_write;
            logic icm_out_arb_burstcount;
            logic [6:0] icm_out_arb_address;
            logic [7:0] icm_out_arb_writedata;
            logic icm_out_arb_byteenable;
            logic icm_out_arb_stall;
            logic icm_out_wrp_ack;
            logic icm_out_rrp_datavalid;
            logic [7:0] icm_out_rrp_data;

            assign icm_in_arb_request[0] = router[0].b_arb_request[0];
            assign icm_in_arb_enable[0] = router[0].b_arb_enable[0];
            assign icm_in_arb_read[0] = router[0].b_arb_read[0];
            assign icm_in_arb_write[0] = router[0].b_arb_write[0];
            assign icm_in_arb_burstcount[0] = router[0].b_arb_burstcount[0];
            assign icm_in_arb_address[0] = router[0].b_arb_address[0];
            assign icm_in_arb_writedata[0] = router[0].b_arb_writedata[0];
            assign icm_in_arb_byteenable[0] = router[0].b_arb_byteenable[0];
            assign router[0].b_arb_stall[0] = icm_in_arb_stall[0];
            assign router[0].b_wrp_ack[0] = icm_in_wrp_ack[0];
            assign router[0].b_rrp_datavalid[0] = icm_in_rrp_datavalid[0];
            assign router[0].b_rrp_data[0] = icm_in_rrp_data[0];
            assign icm_in_arb_request[1] = router[2].b_arb_request[0];
            assign icm_in_arb_enable[1] = router[2].b_arb_enable[0];
            assign icm_in_arb_read[1] = router[2].b_arb_read[0];
            assign icm_in_arb_write[1] = router[2].b_arb_write[0];
            assign icm_in_arb_burstcount[1] = router[2].b_arb_burstcount[0];
            assign icm_in_arb_address[1] = router[2].b_arb_address[0];
            assign icm_in_arb_writedata[1] = router[2].b_arb_writedata[0];
            assign icm_in_arb_byteenable[1] = router[2].b_arb_byteenable[0];
            assign router[2].b_arb_stall[0] = icm_in_arb_stall[1];
            assign router[2].b_wrp_ack[0] = icm_in_wrp_ack[1];
            assign router[2].b_rrp_datavalid[0] = icm_in_rrp_datavalid[1];
            assign router[2].b_rrp_data[0] = icm_in_rrp_data[1];
            // INST data_ic of single_kernel_system_interconnect_2
            single_kernel_system_interconnect_2 data_ic
            (
               .clock(clock),
               .resetn(resetn),
               // ICM m
               .m_arb_request(icm_in_arb_request),
               .m_arb_enable(icm_in_arb_enable),
               .m_arb_read(icm_in_arb_read),
               .m_arb_write(icm_in_arb_write),
               .m_arb_burstcount(icm_in_arb_burstcount),
               .m_arb_address(icm_in_arb_address),
               .m_arb_writedata(icm_in_arb_writedata),
               .m_arb_byteenable(icm_in_arb_byteenable),
               .m_arb_stall(icm_in_arb_stall),
               .m_wrp_ack(icm_in_wrp_ack),
               .m_rrp_datavalid(icm_in_rrp_datavalid),
               .m_rrp_data(icm_in_rrp_data),
               // ICM mout
               .mout_arb_request(icm_out_arb_request),
               .mout_arb_enable(icm_out_arb_enable),
               .mout_arb_read(icm_out_arb_read),
               .mout_arb_write(icm_out_arb_write),
               .mout_arb_burstcount(icm_out_arb_burstcount),
               .mout_arb_address(icm_out_arb_address),
               .mout_arb_writedata(icm_out_arb_writedata),
               .mout_arb_byteenable(icm_out_arb_byteenable),
               .mout_arb_id(),
               .mout_arb_stall(icm_out_arb_stall),
               .mout_wrp_ack(icm_out_wrp_ack),
               .mout_rrp_datavalid(icm_out_rrp_datavalid),
               .mout_rrp_data(icm_out_rrp_data)
            );

            assign bank[0].port_enable[1] = icm_out_arb_enable;
            assign bank[0].port_read[1] = icm_out_arb_read;
            assign bank[0].port_write[1] = icm_out_arb_write;
            assign bank[0].port_address[1] = icm_out_arb_address;
            assign bank[0].port_writedata[1] = icm_out_arb_writedata;
            assign bank[0].port_byteenable[1] = icm_out_arb_byteenable;
            assign icm_out_arb_stall = bank[0].port_waitrequest[1];
            assign icm_out_rrp_data = bank[0].port_readdata[1];
            assign icm_out_rrp_datavalid = bank[0].port_readdatavalid[1];
            assign icm_out_wrp_ack = 'b0;
         end

         for( __k = 0; __k < 1; __k = __k + 1 )
         begin:port2bank0
            logic icm_in_arb_request [1];
            logic icm_in_arb_enable [1];
            logic icm_in_arb_read [1];
            logic icm_in_arb_write [1];
            logic icm_in_arb_burstcount [1];
            logic [6:0] icm_in_arb_address [1];
            logic [7:0] icm_in_arb_writedata [1];
            logic icm_in_arb_byteenable [1];
            logic icm_in_arb_stall [1];
            logic icm_in_wrp_ack [1];
            logic icm_in_rrp_datavalid [1];
            logic [7:0] icm_in_rrp_data [1];
            logic icm_out_arb_request;
            logic icm_out_arb_enable;
            logic icm_out_arb_read;
            logic icm_out_arb_write;
            logic icm_out_arb_burstcount;
            logic [6:0] icm_out_arb_address;
            logic [7:0] icm_out_arb_writedata;
            logic icm_out_arb_byteenable;
            logic icm_out_arb_stall;
            logic icm_out_wrp_ack;
            logic icm_out_rrp_datavalid;
            logic [7:0] icm_out_rrp_data;

            assign icm_in_arb_request[0] = router[1].b_arb_request[0];
            assign icm_in_arb_enable[0] = router[1].b_arb_enable[0];
            assign icm_in_arb_read[0] = router[1].b_arb_read[0];
            assign icm_in_arb_write[0] = router[1].b_arb_write[0];
            assign icm_in_arb_burstcount[0] = router[1].b_arb_burstcount[0];
            assign icm_in_arb_address[0] = router[1].b_arb_address[0];
            assign icm_in_arb_writedata[0] = router[1].b_arb_writedata[0];
            assign icm_in_arb_byteenable[0] = router[1].b_arb_byteenable[0];
            assign router[1].b_arb_stall[0] = icm_in_arb_stall[0];
            assign router[1].b_wrp_ack[0] = icm_in_wrp_ack[0];
            assign router[1].b_rrp_datavalid[0] = icm_in_rrp_datavalid[0];
            assign router[1].b_rrp_data[0] = icm_in_rrp_data[0];
            // INST data_ic of single_kernel_system_interconnect_1
            single_kernel_system_interconnect_1 data_ic
            (
               .clock(clock),
               .resetn(resetn),
               // ICM m
               .m_arb_request(icm_in_arb_request),
               .m_arb_enable(icm_in_arb_enable),
               .m_arb_read(icm_in_arb_read),
               .m_arb_write(icm_in_arb_write),
               .m_arb_burstcount(icm_in_arb_burstcount),
               .m_arb_address(icm_in_arb_address),
               .m_arb_writedata(icm_in_arb_writedata),
               .m_arb_byteenable(icm_in_arb_byteenable),
               .m_arb_stall(icm_in_arb_stall),
               .m_wrp_ack(icm_in_wrp_ack),
               .m_rrp_datavalid(icm_in_rrp_datavalid),
               .m_rrp_data(icm_in_rrp_data),
               // ICM mout
               .mout_arb_request(icm_out_arb_request),
               .mout_arb_enable(icm_out_arb_enable),
               .mout_arb_read(icm_out_arb_read),
               .mout_arb_write(icm_out_arb_write),
               .mout_arb_burstcount(icm_out_arb_burstcount),
               .mout_arb_address(icm_out_arb_address),
               .mout_arb_writedata(icm_out_arb_writedata),
               .mout_arb_byteenable(icm_out_arb_byteenable),
               .mout_arb_id(),
               .mout_arb_stall(icm_out_arb_stall),
               .mout_wrp_ack(icm_out_wrp_ack),
               .mout_rrp_datavalid(icm_out_rrp_datavalid),
               .mout_rrp_data(icm_out_rrp_data)
            );

            assign bank[0].port_enable[2] = icm_out_arb_enable;
            assign bank[0].port_read[2] = icm_out_arb_read;
            assign bank[0].port_write[2] = icm_out_arb_write;
            assign bank[0].port_address[2] = icm_out_arb_address;
            assign bank[0].port_writedata[2] = icm_out_arb_writedata;
            assign bank[0].port_byteenable[2] = icm_out_arb_byteenable;
            assign icm_out_arb_stall = bank[0].port_waitrequest[2];
            assign icm_out_rrp_data = bank[0].port_readdata[2];
            assign icm_out_rrp_datavalid = bank[0].port_readdatavalid[2];
            assign icm_out_wrp_ack = 'b0;
         end

      end

   end
   endgenerate

endmodule

/////////////////////////////////////////////////////////////////
// MODULE single_kernel_system_interconnect_0
/////////////////////////////////////////////////////////////////
module single_kernel_system_interconnect_0
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [1],
   input logic m_arb_enable [1],
   input logic m_arb_read [1],
   input logic m_arb_write [1],
   input logic m_arb_burstcount [1],
   input logic [6:0] m_arb_address [1],
   input logic [7:0] m_arb_writedata [1],
   input logic m_arb_byteenable [1],
   output logic m_arb_stall [1],
   output logic m_wrp_ack [1],
   output logic m_rrp_datavalid [1],
   output logic [7:0] m_rrp_data [1],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_enable,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic mout_arb_burstcount,
   output logic [6:0] mout_arb_address,
   output logic [7:0] mout_arb_writedata,
   output logic mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [7:0] mout_rrp_data
);
   genvar __i;
   generate
      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(8),
            .ID_W(1)
         ) rrp_intf();

         assign id = __i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1),
            .TOTAL_NUM_MASTERS(1),
            .ID(__i)
         )
         m_endp
         (
            .clock(clock),
            .resetn(resetn),
            .m_intf(m_intf),
            .arb_intf(arb_intf),
            .wrp_intf(wrp_intf),
            .rrp_intf(rrp_intf)
         );

         assign m_intf.arb.req.request = m_arb_request[__i];
         assign m_intf.arb.req.enable = m_arb_enable[__i];
         assign m_intf.arb.req.read = m_arb_read[__i];
         assign m_intf.arb.req.write = m_arb_write[__i];
         assign m_intf.arb.req.burstcount = m_arb_burstcount[__i];
         assign m_intf.arb.req.address = m_arb_address[__i];
         assign m_intf.arb.req.writedata = m_arb_writedata[__i];
         assign m_intf.arb.req.byteenable = m_arb_byteenable[__i];
         assign m_arb_stall[__i] = m_intf.arb.stall;
         assign m_wrp_ack[__i] = m_intf.wrp.ack;
         assign m_rrp_datavalid[__i] = m_intf.rrp.datavalid;
         assign m_rrp_data[__i] = m_intf.rrp.data;
         assign m_intf.arb.req.id = id;
      end

   endgenerate

   generate
   begin:s
      acl_arb_intf
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(8),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1),
         .NUM_MASTERS(1),
         .PIPELINE_RETURN_PATHS(0),
         .WRP_FIFO_DEPTH(0),
         .RRP_FIFO_DEPTH(0),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(3),
         .SEPARATE_READ_WRITE_STALLS(0)
      )
      s_endp
      (
         .clock(clock),
         .resetn(resetn),
         .m_intf(in_arb_intf),
         .s_intf(out_arb_intf),
         .s_readdatavalid(mout_rrp_datavalid),
         .s_readdata(mout_rrp_data),
         .s_writeack(mout_wrp_ack),
         .wrp_intf(wrp_intf),
         .rrp_intf(rrp_intf)
      );

   end
   endgenerate

   generate
   begin:wrp
      assign m[0].wrp_intf.ack = s.wrp_intf.ack;
      assign m[0].wrp_intf.id = s.wrp_intf.id;
   end
   endgenerate

   generate
   begin:rrp
   end
   endgenerate

   assign mout_arb_request = s.out_arb_intf.req.request;
   assign mout_arb_enable = s.out_arb_intf.req.enable;
   assign mout_arb_read = s.out_arb_intf.req.read;
   assign mout_arb_write = s.out_arb_intf.req.write;
   assign mout_arb_burstcount = s.out_arb_intf.req.burstcount;
   assign mout_arb_address = s.out_arb_intf.req.address;
   assign mout_arb_writedata = s.out_arb_intf.req.writedata;
   assign mout_arb_byteenable = s.out_arb_intf.req.byteenable;
   assign mout_arb_id = s.out_arb_intf.req.id;
   assign s.out_arb_intf.stall = mout_arb_stall;
   assign s.in_arb_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = s.in_arb_intf.stall;
endmodule

/////////////////////////////////////////////////////////////////
// MODULE single_kernel_system_interconnect_1
/////////////////////////////////////////////////////////////////
module single_kernel_system_interconnect_1
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [1],
   input logic m_arb_enable [1],
   input logic m_arb_read [1],
   input logic m_arb_write [1],
   input logic m_arb_burstcount [1],
   input logic [6:0] m_arb_address [1],
   input logic [7:0] m_arb_writedata [1],
   input logic m_arb_byteenable [1],
   output logic m_arb_stall [1],
   output logic m_wrp_ack [1],
   output logic m_rrp_datavalid [1],
   output logic [7:0] m_rrp_data [1],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_enable,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic mout_arb_burstcount,
   output logic [6:0] mout_arb_address,
   output logic [7:0] mout_arb_writedata,
   output logic mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [7:0] mout_rrp_data
);
   genvar __i;
   generate
      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(8),
            .ID_W(1)
         ) rrp_intf();

         assign id = __i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1),
            .TOTAL_NUM_MASTERS(1),
            .ID(__i)
         )
         m_endp
         (
            .clock(clock),
            .resetn(resetn),
            .m_intf(m_intf),
            .arb_intf(arb_intf),
            .wrp_intf(wrp_intf),
            .rrp_intf(rrp_intf)
         );

         assign m_intf.arb.req.request = m_arb_request[__i];
         assign m_intf.arb.req.enable = m_arb_enable[__i];
         assign m_intf.arb.req.read = m_arb_read[__i];
         assign m_intf.arb.req.write = m_arb_write[__i];
         assign m_intf.arb.req.burstcount = m_arb_burstcount[__i];
         assign m_intf.arb.req.address = m_arb_address[__i];
         assign m_intf.arb.req.writedata = m_arb_writedata[__i];
         assign m_intf.arb.req.byteenable = m_arb_byteenable[__i];
         assign m_arb_stall[__i] = m_intf.arb.stall;
         assign m_wrp_ack[__i] = m_intf.wrp.ack;
         assign m_rrp_datavalid[__i] = m_intf.rrp.datavalid;
         assign m_rrp_data[__i] = m_intf.rrp.data;
         assign m_intf.arb.req.id = id;
      end

   endgenerate

   generate
   begin:s
      acl_arb_intf
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(8),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1),
         .NUM_MASTERS(1),
         .PIPELINE_RETURN_PATHS(0),
         .WRP_FIFO_DEPTH(0),
         .RRP_FIFO_DEPTH(0),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(3),
         .SEPARATE_READ_WRITE_STALLS(0)
      )
      s_endp
      (
         .clock(clock),
         .resetn(resetn),
         .m_intf(in_arb_intf),
         .s_intf(out_arb_intf),
         .s_readdatavalid(mout_rrp_datavalid),
         .s_readdata(mout_rrp_data),
         .s_writeack(mout_wrp_ack),
         .wrp_intf(wrp_intf),
         .rrp_intf(rrp_intf)
      );

   end
   endgenerate

   generate
   begin:wrp
   end
   endgenerate

   generate
   begin:rrp
      assign m[0].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[0].rrp_intf.data = s.rrp_intf.data;
      assign m[0].rrp_intf.id = s.rrp_intf.id;
   end
   endgenerate

   assign mout_arb_request = s.out_arb_intf.req.request;
   assign mout_arb_enable = s.out_arb_intf.req.enable;
   assign mout_arb_read = s.out_arb_intf.req.read;
   assign mout_arb_write = s.out_arb_intf.req.write;
   assign mout_arb_burstcount = s.out_arb_intf.req.burstcount;
   assign mout_arb_address = s.out_arb_intf.req.address;
   assign mout_arb_writedata = s.out_arb_intf.req.writedata;
   assign mout_arb_byteenable = s.out_arb_intf.req.byteenable;
   assign mout_arb_id = s.out_arb_intf.req.id;
   assign s.out_arb_intf.stall = mout_arb_stall;
   assign s.in_arb_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = s.in_arb_intf.stall;
endmodule

/////////////////////////////////////////////////////////////////
// MODULE single_kernel_system_interconnect_2
/////////////////////////////////////////////////////////////////
module single_kernel_system_interconnect_2
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [2],
   input logic m_arb_enable [2],
   input logic m_arb_read [2],
   input logic m_arb_write [2],
   input logic m_arb_burstcount [2],
   input logic [6:0] m_arb_address [2],
   input logic [7:0] m_arb_writedata [2],
   input logic m_arb_byteenable [2],
   output logic m_arb_stall [2],
   output logic m_wrp_ack [2],
   output logic m_rrp_datavalid [2],
   output logic [7:0] m_rrp_data [2],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_enable,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic mout_arb_burstcount,
   output logic [6:0] mout_arb_address,
   output logic [7:0] mout_arb_writedata,
   output logic mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [7:0] mout_rrp_data
);
   genvar __i;
   generate
      for( __i = 0; __i < 2; __i = __i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(8),
            .ID_W(1)
         ) rrp_intf();

         assign id = __i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1),
            .TOTAL_NUM_MASTERS(2),
            .ID(__i)
         )
         m_endp
         (
            .clock(clock),
            .resetn(resetn),
            .m_intf(m_intf),
            .arb_intf(arb_intf),
            .wrp_intf(wrp_intf),
            .rrp_intf(rrp_intf)
         );

         assign m_intf.arb.req.request = m_arb_request[__i];
         assign m_intf.arb.req.enable = m_arb_enable[__i];
         assign m_intf.arb.req.read = m_arb_read[__i];
         assign m_intf.arb.req.write = m_arb_write[__i];
         assign m_intf.arb.req.burstcount = m_arb_burstcount[__i];
         assign m_intf.arb.req.address = m_arb_address[__i];
         assign m_intf.arb.req.writedata = m_arb_writedata[__i];
         assign m_intf.arb.req.byteenable = m_arb_byteenable[__i];
         assign m_arb_stall[__i] = m_intf.arb.stall;
         assign m_wrp_ack[__i] = m_intf.wrp.ack;
         assign m_rrp_datavalid[__i] = m_intf.rrp.datavalid;
         assign m_rrp_data[__i] = m_intf.rrp.data;
         assign m_intf.arb.req.id = id;
      end

   endgenerate

   generate
   begin:s
      acl_arb_intf
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(8),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(8),
         .BURSTCOUNT_W(1),
         .ADDRESS_W(7),
         .BYTEENA_W(1),
         .ID_W(1),
         .NUM_MASTERS(2),
         .PIPELINE_RETURN_PATHS(0),
         .WRP_FIFO_DEPTH(0),
         .RRP_FIFO_DEPTH(0),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(3),
         .SEPARATE_READ_WRITE_STALLS(0)
      )
      s_endp
      (
         .clock(clock),
         .resetn(resetn),
         .m_intf(in_arb_intf),
         .s_intf(out_arb_intf),
         .s_readdatavalid(mout_rrp_datavalid),
         .s_readdata(mout_rrp_data),
         .s_writeack(mout_wrp_ack),
         .wrp_intf(wrp_intf),
         .rrp_intf(rrp_intf)
      );

   end
   endgenerate

   generate
   begin:wrp
      assign m[0].wrp_intf.ack = s.wrp_intf.ack;
      assign m[0].wrp_intf.id = s.wrp_intf.id;
   end
   endgenerate

   generate
   begin:rrp
      assign m[1].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[1].rrp_intf.data = s.rrp_intf.data;
      assign m[1].rrp_intf.id = s.rrp_intf.id;
   end
   endgenerate

   generate
      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:a
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) m0_intf();
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) m1_intf();
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) mout_intf();

         // INST a of acl_arb2
         acl_arb2
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1),
            .PIPELINE("none"),
            .KEEP_LAST_GRANT(0),
            .NO_STALL_NETWORK(0)
         )
         a
         (
            .clock(clock),
            .resetn(resetn),
            .m0_intf(m0_intf),
            .m1_intf(m1_intf),
            .mout_intf(mout_intf)
         );

      end

   endgenerate

   generate
      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:dp
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) in_intf();
         acl_arb_intf
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         ) out_intf();

         // INST dp of acl_arb_pipeline_reg
         acl_arb_pipeline_reg
         #(
            .DATA_W(8),
            .BURSTCOUNT_W(1),
            .ADDRESS_W(7),
            .BYTEENA_W(1),
            .ID_W(1)
         )
         dp
         (
            .clock(clock),
            .resetn(resetn),
            .in_intf(in_intf),
            .out_intf(out_intf)
         );

      end

   endgenerate

   assign mout_arb_request = s.out_arb_intf.req.request;
   assign mout_arb_enable = s.out_arb_intf.req.enable;
   assign mout_arb_read = s.out_arb_intf.req.read;
   assign mout_arb_write = s.out_arb_intf.req.write;
   assign mout_arb_burstcount = s.out_arb_intf.req.burstcount;
   assign mout_arb_address = s.out_arb_intf.req.address;
   assign mout_arb_writedata = s.out_arb_intf.req.writedata;
   assign mout_arb_byteenable = s.out_arb_intf.req.byteenable;
   assign mout_arb_id = s.out_arb_intf.req.id;
   assign s.out_arb_intf.stall = mout_arb_stall;
   assign s.in_arb_intf.req = dp[0].out_intf.req;
   assign dp[0].out_intf.stall = s.in_arb_intf.stall;
   assign dp[0].in_intf.req = a[0].mout_intf.req;
   assign a[0].mout_intf.stall = dp[0].in_intf.stall;
   assign a[0].m0_intf.req = m[1].arb_intf.req;
   assign m[1].arb_intf.stall = a[0].m0_intf.stall;
   assign a[0].m1_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = a[0].m1_intf.stall;
endmodule

