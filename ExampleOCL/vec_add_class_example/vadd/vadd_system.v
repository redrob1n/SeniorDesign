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
// MODULE vadd_system
/////////////////////////////////////////////////////////////////
module vadd_system
(
   input logic clock,
   input logic clock2x,
   input logic resetn,
   // AVS avs_vadd_cra
   input logic avs_vadd_cra_enable,
   input logic avs_vadd_cra_read,
   input logic avs_vadd_cra_write,
   input logic [3:0] avs_vadd_cra_address,
   input logic [63:0] avs_vadd_cra_writedata,
   input logic [7:0] avs_vadd_cra_byteenable,
   output logic [63:0] avs_vadd_cra_readdata,
   output logic avs_vadd_cra_readdatavalid,
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
   genvar __i;
   logic vadd_start;
   logic [0:0] vadd_start_chain;
   logic [0:0] vadd_start_kernel_copy;
   logic [0:0] vadd_start_task_fd;
   logic [0:0] vadd_start_finish_element;
   logic vadd_finish;
   logic [0:0] vadd_finish_kernel_copy;
   logic [0:0] vadd_finish_chain;
   logic [31:0] vadd_global_size [2:0];
   logic [31:0] vadd_num_groups [2:0];
   logic [31:0] vadd_local_size [2:0];
   logic [31:0] vadd_global_offset [2:0];
   logic [31:0] vadd_work_dim;
   logic [31:0] vadd_wg_size;
   logic [0:0] vadd_wg_disp_stall_in;
   logic [0:0] vadd_wg_disp_valid_out;
   logic vadd_wg_disp_start_out;
   logic [31:0] vadd_wg_disp_group_id_out [2:0];
   logic [31:0] vadd_wg_disp_global_id_base_out [2:0];
   logic vadd_wg_disp_dispatched_all_groups;
   logic [31:0] vadd_global_id [1][2:0];
   logic [31:0] vadd_local_id [1][2:0];
   logic [31:0] vadd_group_id [1][2:0];
   logic [0:0] vadd_pending_write;
   logic [0:0] vadd_lsu_active;
   logic [0:0] vadd_valid_in;
   logic [0:0] vadd_valid_out;
   logic [0:0] vadd_stall_in;
   logic [0:0] vadd_stall_out;
   logic vadd_cra_pending_write;
   logic vadd_cra_lsu_active;
   logic vadd_cra_valid_in;
   logic [223:0] vadd_kernel_arguments;
   logic kernel_irqs;
   logic gmem0_global_avm_enable [3];
   logic gmem0_global_avm_read [3];
   logic gmem0_global_avm_write [3];
   logic [4:0] gmem0_global_avm_burstcount [3];
   logic [31:0] gmem0_global_avm_address [3];
   logic [511:0] gmem0_global_avm_writedata [3];
   logic [63:0] gmem0_global_avm_byteenable [3];
   logic gmem0_global_avm_waitrequest [3];
   logic [511:0] gmem0_global_avm_readdata [3];
   logic gmem0_global_avm_readdatavalid [3];
   logic gmem0_global_avm_writeack [3];

   assign vadd_start_chain[0] = vadd_start;
   assign vadd_finish_chain[0] = 1'b1;
   assign vadd_cra_pending_write = |vadd_pending_write;
   assign vadd_cra_lsu_active = |vadd_lsu_active;
   assign vadd_cra_valid_in = |vadd_valid_in;
   assign vadd_stall_in = 0;
   // INST vadd_workgroup_dispatcher of acl_work_group_dispatcher
   acl_work_group_dispatcher
   #(
      .WIDTH(32),
      .NUM_COPIES(1),
      .RUN_FOREVER(0)
   )
   vadd_workgroup_dispatcher
   (
      .clock(clock),
      .resetn(resetn),
      .start(vadd_start),
      .num_groups(vadd_num_groups),
      .local_size(vadd_local_size),
      .stall_in(vadd_wg_disp_stall_in),
      .valid_out(vadd_wg_disp_valid_out),
      .group_id_out(vadd_wg_disp_group_id_out),
      .global_id_base_out(vadd_wg_disp_global_id_base_out),
      .start_out(vadd_wg_disp_start_out),
      .dispatched_all_groups(vadd_wg_disp_dispatched_all_groups)
   );

   // INST vadd_finish_detector of acl_kernel_finish_detector
   acl_kernel_finish_detector
   #(
      .NUM_COPIES(1),
      .WG_SIZE_W(32),
      .GLOBAL_ID_W(32),
      .TESSELLATION_SIZE(0)
   )
   vadd_finish_detector
   (
      .clock(clock),
      .resetn(resetn),
      .start(vadd_start),
      .wg_size(vadd_wg_size),
      .wg_dispatch_valid_out(vadd_wg_disp_valid_out),
      .wg_dispatch_stall_in(vadd_wg_disp_stall_in),
      .dispatched_all_groups(vadd_wg_disp_dispatched_all_groups),
      .kernel_copy_valid_out(vadd_valid_out),
      .kernel_copy_stall_in(vadd_stall_in),
      .pending_writes(vadd_cra_pending_write),
      .finish(vadd_finish)
   );

   // INST vadd_cra_slave_inst of vadd_function_cra_slave
   vadd_function_cra_slave vadd_cra_slave_inst
   (
      .clock(clock),
      .resetn(resetn),
      .start(vadd_start),
      .finish(vadd_finish),
      .global_offset_0(vadd_global_offset[0]),
      .global_offset_1(vadd_global_offset[1]),
      .global_offset_2(vadd_global_offset[2]),
      .work_dim(vadd_work_dim),
      .has_a_lsu_active(vadd_cra_lsu_active),
      .has_a_write_pending(vadd_cra_pending_write),
      .valid_in(vadd_cra_valid_in),
      .global_size_0(vadd_global_size[0]),
      .global_size_1(vadd_global_size[1]),
      .global_size_2(vadd_global_size[2]),
      .num_groups_0(vadd_num_groups[0]),
      .num_groups_1(vadd_num_groups[1]),
      .num_groups_2(vadd_num_groups[2]),
      .local_size_0(vadd_local_size[0]),
      .local_size_1(vadd_local_size[1]),
      .local_size_2(vadd_local_size[2]),
      .workgroup_size(vadd_wg_size),
      .kernel_arguments(vadd_kernel_arguments),
      .cra_irq(kernel_irqs),
      // AVS avs_cra
      .avs_cra_enable(avs_vadd_cra_enable),
      .avs_cra_read(avs_vadd_cra_read),
      .avs_cra_write(avs_vadd_cra_write),
      .avs_cra_address(avs_vadd_cra_address),
      .avs_cra_writedata(avs_vadd_cra_writedata),
      .avs_cra_byteenable(avs_vadd_cra_byteenable),
      .avs_cra_readdata(avs_vadd_cra_readdata),
      .avs_cra_readdatavalid(avs_vadd_cra_readdatavalid)
   );

   // INST vadd_id_iter_inst_0 of acl_id_iterator
   acl_id_iterator
   #(
      .WIDTH(32),
      .LOCAL_WIDTH_X(32),
      .LOCAL_WIDTH_Y(32),
      .LOCAL_WIDTH_Z(32),
      .ENABLE_TESSELLATION(0)
   )
   vadd_id_iter_inst_0
   (
      .clock(clock),
      .resetn(resetn),
      .start(vadd_wg_disp_start_out),
      .valid_in(vadd_wg_disp_valid_out[0]),
      .stall_out(vadd_wg_disp_stall_in[0]),
      .stall_in(vadd_stall_out[0]),
      .valid_out(vadd_valid_in[0]),
      .group_id_in(vadd_wg_disp_group_id_out),
      .global_id_base_in(vadd_wg_disp_global_id_base_out),
      .local_size(vadd_local_size),
      .global_size(vadd_global_size),
      .local_id(vadd_local_id[0]),
      .global_id(vadd_global_id[0]),
      .group_id(vadd_group_id[0])
   );

   // INST vadd_inst_0 of vadd_top_wrapper_0
   vadd_top_wrapper_0 vadd_inst_0
   (
      .start(vadd_start_kernel_copy[0]),
      .kernel_arguments(vadd_kernel_arguments),
      .work_dim(vadd_work_dim),
      .global_offset(vadd_global_offset),
      .kernel_valid_out(vadd_valid_out[0]),
      .has_a_write_pending(vadd_pending_write[0]),
      .has_a_lsu_active(vadd_lsu_active[0]),
      .global_id(vadd_global_id[0]),
      .local_id(vadd_local_id[0]),
      .group_id(vadd_group_id[0]),
      .global_size(vadd_global_size),
      .local_size(vadd_local_size),
      .num_groups(vadd_num_groups),
      .workgroup_size(vadd_wg_size),
      .kernel_stall_out(vadd_stall_out[0]),
      .kernel_valid_in(vadd_valid_in[0]),
      .clock(clock),
      .resetn(resetn),
      .clock2x(clock2x),
      // AVM avm_local_bb0_ld_memcoalesce_a_load_0_inst0
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_enable(gmem0_global_avm_enable[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_read(gmem0_global_avm_read[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_write(gmem0_global_avm_write[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_burstcount(gmem0_global_avm_burstcount[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_address(gmem0_global_avm_address[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writedata(gmem0_global_avm_writedata[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_byteenable(gmem0_global_avm_byteenable[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_waitrequest(gmem0_global_avm_waitrequest[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdata(gmem0_global_avm_readdata[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdatavalid(gmem0_global_avm_readdatavalid[0]),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writeack(gmem0_global_avm_writeack[0]),
      // AVM avm_local_bb0_ld_memcoalesce_b_load_0_inst0
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_enable(gmem0_global_avm_enable[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_read(gmem0_global_avm_read[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_write(gmem0_global_avm_write[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_burstcount(gmem0_global_avm_burstcount[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_address(gmem0_global_avm_address[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writedata(gmem0_global_avm_writedata[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_byteenable(gmem0_global_avm_byteenable[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_waitrequest(gmem0_global_avm_waitrequest[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdata(gmem0_global_avm_readdata[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdatavalid(gmem0_global_avm_readdatavalid[1]),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writeack(gmem0_global_avm_writeack[1]),
      // AVM avm_local_bb0_st_c0_exe1_inst0
      .avm_local_bb0_st_c0_exe1_inst0_enable(gmem0_global_avm_enable[2]),
      .avm_local_bb0_st_c0_exe1_inst0_read(gmem0_global_avm_read[2]),
      .avm_local_bb0_st_c0_exe1_inst0_write(gmem0_global_avm_write[2]),
      .avm_local_bb0_st_c0_exe1_inst0_burstcount(gmem0_global_avm_burstcount[2]),
      .avm_local_bb0_st_c0_exe1_inst0_address(gmem0_global_avm_address[2]),
      .avm_local_bb0_st_c0_exe1_inst0_writedata(gmem0_global_avm_writedata[2]),
      .avm_local_bb0_st_c0_exe1_inst0_byteenable(gmem0_global_avm_byteenable[2]),
      .avm_local_bb0_st_c0_exe1_inst0_waitrequest(gmem0_global_avm_waitrequest[2]),
      .avm_local_bb0_st_c0_exe1_inst0_readdata(gmem0_global_avm_readdata[2]),
      .avm_local_bb0_st_c0_exe1_inst0_readdatavalid(gmem0_global_avm_readdatavalid[2]),
      .avm_local_bb0_st_c0_exe1_inst0_writeack(gmem0_global_avm_writeack[2])
   );

   // INST vadd_start_elem_inst_0 of acl_start_signal_chain_element
   acl_start_signal_chain_element vadd_start_elem_inst_0
   (
      .clock(clock),
      .resetn(resetn),
      .start_in(vadd_start_chain[0]),
      .start_kernel(vadd_start_kernel_copy[0]),
      .start_finish_detector(vadd_start_task_fd[0]),
      .start_finish_chain_element(vadd_start_finish_element[0]),
      .start_chain()
   );

   assign kernel_irq = |kernel_irqs;
   generate
   begin:gmem0_
      logic gmem0_icm_in_arb_request [3];
      logic gmem0_icm_in_arb_enable [3];
      logic gmem0_icm_in_arb_read [3];
      logic gmem0_icm_in_arb_write [3];
      logic [4:0] gmem0_icm_in_arb_burstcount [3];
      logic [25:0] gmem0_icm_in_arb_address [3];
      logic [511:0] gmem0_icm_in_arb_writedata [3];
      logic [63:0] gmem0_icm_in_arb_byteenable [3];
      logic gmem0_icm_in_arb_stall [3];
      logic gmem0_icm_in_wrp_ack [3];
      logic gmem0_icm_in_rrp_datavalid [3];
      logic [511:0] gmem0_icm_in_rrp_data [3];
      logic gmem0_icm_preroute_arb_request [3];
      logic gmem0_icm_preroute_arb_enable [3];
      logic gmem0_icm_preroute_arb_read [3];
      logic gmem0_icm_preroute_arb_write [3];
      logic [4:0] gmem0_icm_preroute_arb_burstcount [3];
      logic [25:0] gmem0_icm_preroute_arb_address [3];
      logic [511:0] gmem0_icm_preroute_arb_writedata [3];
      logic [63:0] gmem0_icm_preroute_arb_byteenable [3];
      logic gmem0_icm_preroute_arb_stall [3];
      logic gmem0_icm_preroute_wrp_ack [3];
      logic gmem0_icm_preroute_rrp_datavalid [3];
      logic [511:0] gmem0_icm_preroute_rrp_data [3];
      logic icm_groupgmem0_router_0_arb_request [1];
      logic icm_groupgmem0_router_0_arb_enable [1];
      logic icm_groupgmem0_router_0_arb_read [1];
      logic icm_groupgmem0_router_0_arb_write [1];
      logic [4:0] icm_groupgmem0_router_0_arb_burstcount [1];
      logic [25:0] icm_groupgmem0_router_0_arb_address [1];
      logic [511:0] icm_groupgmem0_router_0_arb_writedata [1];
      logic [63:0] icm_groupgmem0_router_0_arb_byteenable [1];
      logic icm_groupgmem0_router_0_arb_stall [1];
      logic icm_groupgmem0_router_0_wrp_ack [1];
      logic icm_groupgmem0_router_0_rrp_datavalid [1];
      logic [511:0] icm_groupgmem0_router_0_rrp_data [1];
      logic icm_groupgmem0_router_1_arb_request [1];
      logic icm_groupgmem0_router_1_arb_enable [1];
      logic icm_groupgmem0_router_1_arb_read [1];
      logic icm_groupgmem0_router_1_arb_write [1];
      logic [4:0] icm_groupgmem0_router_1_arb_burstcount [1];
      logic [25:0] icm_groupgmem0_router_1_arb_address [1];
      logic [511:0] icm_groupgmem0_router_1_arb_writedata [1];
      logic [63:0] icm_groupgmem0_router_1_arb_byteenable [1];
      logic icm_groupgmem0_router_1_arb_stall [1];
      logic icm_groupgmem0_router_1_wrp_ack [1];
      logic icm_groupgmem0_router_1_rrp_datavalid [1];
      logic [511:0] icm_groupgmem0_router_1_rrp_data [1];
      logic icm_groupgmem0_router_2_arb_request [1];
      logic icm_groupgmem0_router_2_arb_enable [1];
      logic icm_groupgmem0_router_2_arb_read [1];
      logic icm_groupgmem0_router_2_arb_write [1];
      logic [4:0] icm_groupgmem0_router_2_arb_burstcount [1];
      logic [25:0] icm_groupgmem0_router_2_arb_address [1];
      logic [511:0] icm_groupgmem0_router_2_arb_writedata [1];
      logic [63:0] icm_groupgmem0_router_2_arb_byteenable [1];
      logic icm_groupgmem0_router_2_arb_stall [1];
      logic icm_groupgmem0_router_2_wrp_ack [1];
      logic icm_groupgmem0_router_2_rrp_datavalid [1];
      logic [511:0] icm_groupgmem0_router_2_rrp_data [1];
      logic icm_out_0_rw_arb_request [2];
      logic icm_out_0_rw_arb_enable [2];
      logic icm_out_0_rw_arb_read [2];
      logic icm_out_0_rw_arb_write [2];
      logic [4:0] icm_out_0_rw_arb_burstcount [2];
      logic [24:0] icm_out_0_rw_arb_address [2];
      logic [511:0] icm_out_0_rw_arb_writedata [2];
      logic [63:0] icm_out_0_rw_arb_byteenable [2];
      logic [1:0] icm_out_0_rw_arb_id [2];
      logic icm_out_0_rw_arb_stall [2];
      logic icm_out_0_rw_wrp_ack [2];
      logic icm_out_0_rw_rrp_datavalid [2];
      logic [511:0] icm_out_0_rw_rrp_data [2];
      logic icm_routedgmem0_port_0_0_rw_arb_request [3];
      logic icm_routedgmem0_port_0_0_rw_arb_enable [3];
      logic icm_routedgmem0_port_0_0_rw_arb_read [3];
      logic icm_routedgmem0_port_0_0_rw_arb_write [3];
      logic [4:0] icm_routedgmem0_port_0_0_rw_arb_burstcount [3];
      logic [24:0] icm_routedgmem0_port_0_0_rw_arb_address [3];
      logic [511:0] icm_routedgmem0_port_0_0_rw_arb_writedata [3];
      logic [63:0] icm_routedgmem0_port_0_0_rw_arb_byteenable [3];
      logic icm_routedgmem0_port_0_0_rw_arb_stall [3];
      logic icm_routedgmem0_port_0_0_rw_wrp_ack [3];
      logic icm_routedgmem0_port_0_0_rw_rrp_datavalid [3];
      logic [511:0] icm_routedgmem0_port_0_0_rw_rrp_data [3];
      logic icm_routedgmem0_port_1_0_rw_arb_request [3];
      logic icm_routedgmem0_port_1_0_rw_arb_enable [3];
      logic icm_routedgmem0_port_1_0_rw_arb_read [3];
      logic icm_routedgmem0_port_1_0_rw_arb_write [3];
      logic [4:0] icm_routedgmem0_port_1_0_rw_arb_burstcount [3];
      logic [24:0] icm_routedgmem0_port_1_0_rw_arb_address [3];
      logic [511:0] icm_routedgmem0_port_1_0_rw_arb_writedata [3];
      logic [63:0] icm_routedgmem0_port_1_0_rw_arb_byteenable [3];
      logic icm_routedgmem0_port_1_0_rw_arb_stall [3];
      logic icm_routedgmem0_port_1_0_rw_wrp_ack [3];
      logic icm_routedgmem0_port_1_0_rw_rrp_datavalid [3];
      logic [511:0] icm_routedgmem0_port_1_0_rw_rrp_data [3];

      for( __i = 0; __i < 3; __i = __i + 1 )
      begin:t
         // INST gmem0_avm_to_ic of acl_avm_to_ic
         acl_avm_to_ic
         #(
            .DATA_W(512),
            .WRITEDATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(32),
            .BYTEENA_W(64)
         )
         gmem0_avm_to_ic
         (
            // AVM avm
            .avm_enable(gmem0_global_avm_enable[__i]),
            .avm_read(gmem0_global_avm_read[__i]),
            .avm_write(gmem0_global_avm_write[__i]),
            .avm_burstcount(gmem0_global_avm_burstcount[__i]),
            .avm_address(gmem0_global_avm_address[__i]),
            .avm_writedata(gmem0_global_avm_writedata[__i]),
            .avm_byteenable(gmem0_global_avm_byteenable[__i]),
            .avm_waitrequest(gmem0_global_avm_waitrequest[__i]),
            .avm_readdata(gmem0_global_avm_readdata[__i]),
            .avm_readdatavalid(gmem0_global_avm_readdatavalid[__i]),
            .avm_writeack(gmem0_global_avm_writeack[__i]),
            // ICM ic
            .ic_arb_request(gmem0_icm_in_arb_request[__i]),
            .ic_arb_enable(gmem0_icm_in_arb_enable[__i]),
            .ic_arb_read(gmem0_icm_in_arb_read[__i]),
            .ic_arb_write(gmem0_icm_in_arb_write[__i]),
            .ic_arb_burstcount(gmem0_icm_in_arb_burstcount[__i]),
            .ic_arb_address(gmem0_icm_in_arb_address[__i]),
            .ic_arb_writedata(gmem0_icm_in_arb_writedata[__i]),
            .ic_arb_byteenable(gmem0_icm_in_arb_byteenable[__i]),
            .ic_arb_stall(gmem0_icm_in_arb_stall[__i]),
            .ic_wrp_ack(gmem0_icm_in_wrp_ack[__i]),
            .ic_rrp_datavalid(gmem0_icm_in_rrp_datavalid[__i]),
            .ic_rrp_data(gmem0_icm_in_rrp_data[__i])
         );

      end

      assign icm_groupgmem0_router_0_arb_request[0] = gmem0_icm_in_arb_request[2];
      assign icm_groupgmem0_router_0_arb_enable[0] = gmem0_icm_in_arb_enable[2];
      assign icm_groupgmem0_router_0_arb_read[0] = gmem0_icm_in_arb_read[2];
      assign icm_groupgmem0_router_0_arb_write[0] = gmem0_icm_in_arb_write[2];
      assign icm_groupgmem0_router_0_arb_burstcount[0] = gmem0_icm_in_arb_burstcount[2];
      assign icm_groupgmem0_router_0_arb_address[0] = gmem0_icm_in_arb_address[2];
      assign icm_groupgmem0_router_0_arb_writedata[0] = gmem0_icm_in_arb_writedata[2];
      assign icm_groupgmem0_router_0_arb_byteenable[0] = gmem0_icm_in_arb_byteenable[2];
      assign gmem0_icm_in_arb_stall[2] = icm_groupgmem0_router_0_arb_stall[0];
      assign gmem0_icm_in_wrp_ack[2] = icm_groupgmem0_router_0_wrp_ack[0];
      assign gmem0_icm_in_rrp_datavalid[2] = icm_groupgmem0_router_0_rrp_datavalid[0];
      assign gmem0_icm_in_rrp_data[2] = icm_groupgmem0_router_0_rrp_data[0];
      // INST global_ic_preroutegmem0_router_0 of vadd_system_interconnect_0
      vadd_system_interconnect_0 global_ic_preroutegmem0_router_0
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_groupgmem0_router_0_arb_request),
         .m_arb_enable(icm_groupgmem0_router_0_arb_enable),
         .m_arb_read(icm_groupgmem0_router_0_arb_read),
         .m_arb_write(icm_groupgmem0_router_0_arb_write),
         .m_arb_burstcount(icm_groupgmem0_router_0_arb_burstcount),
         .m_arb_address(icm_groupgmem0_router_0_arb_address),
         .m_arb_writedata(icm_groupgmem0_router_0_arb_writedata),
         .m_arb_byteenable(icm_groupgmem0_router_0_arb_byteenable),
         .m_arb_stall(icm_groupgmem0_router_0_arb_stall),
         .m_wrp_ack(icm_groupgmem0_router_0_wrp_ack),
         .m_rrp_datavalid(icm_groupgmem0_router_0_rrp_datavalid),
         .m_rrp_data(icm_groupgmem0_router_0_rrp_data),
         // ICM mout
         .mout_arb_request(gmem0_icm_preroute_arb_request[0]),
         .mout_arb_enable(gmem0_icm_preroute_arb_enable[0]),
         .mout_arb_read(gmem0_icm_preroute_arb_read[0]),
         .mout_arb_write(gmem0_icm_preroute_arb_write[0]),
         .mout_arb_burstcount(gmem0_icm_preroute_arb_burstcount[0]),
         .mout_arb_address(gmem0_icm_preroute_arb_address[0]),
         .mout_arb_writedata(gmem0_icm_preroute_arb_writedata[0]),
         .mout_arb_byteenable(gmem0_icm_preroute_arb_byteenable[0]),
         .mout_arb_id(),
         .mout_arb_stall(gmem0_icm_preroute_arb_stall[0]),
         .mout_wrp_ack(gmem0_icm_preroute_wrp_ack[0]),
         .mout_rrp_datavalid(gmem0_icm_preroute_rrp_datavalid[0]),
         .mout_rrp_data(gmem0_icm_preroute_rrp_data[0])
      );

      assign icm_groupgmem0_router_1_arb_request[0] = gmem0_icm_in_arb_request[1];
      assign icm_groupgmem0_router_1_arb_enable[0] = gmem0_icm_in_arb_enable[1];
      assign icm_groupgmem0_router_1_arb_read[0] = gmem0_icm_in_arb_read[1];
      assign icm_groupgmem0_router_1_arb_write[0] = gmem0_icm_in_arb_write[1];
      assign icm_groupgmem0_router_1_arb_burstcount[0] = gmem0_icm_in_arb_burstcount[1];
      assign icm_groupgmem0_router_1_arb_address[0] = gmem0_icm_in_arb_address[1];
      assign icm_groupgmem0_router_1_arb_writedata[0] = gmem0_icm_in_arb_writedata[1];
      assign icm_groupgmem0_router_1_arb_byteenable[0] = gmem0_icm_in_arb_byteenable[1];
      assign gmem0_icm_in_arb_stall[1] = icm_groupgmem0_router_1_arb_stall[0];
      assign gmem0_icm_in_wrp_ack[1] = icm_groupgmem0_router_1_wrp_ack[0];
      assign gmem0_icm_in_rrp_datavalid[1] = icm_groupgmem0_router_1_rrp_datavalid[0];
      assign gmem0_icm_in_rrp_data[1] = icm_groupgmem0_router_1_rrp_data[0];
      // INST global_ic_preroutegmem0_router_1 of vadd_system_interconnect_1
      vadd_system_interconnect_1 global_ic_preroutegmem0_router_1
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_groupgmem0_router_1_arb_request),
         .m_arb_enable(icm_groupgmem0_router_1_arb_enable),
         .m_arb_read(icm_groupgmem0_router_1_arb_read),
         .m_arb_write(icm_groupgmem0_router_1_arb_write),
         .m_arb_burstcount(icm_groupgmem0_router_1_arb_burstcount),
         .m_arb_address(icm_groupgmem0_router_1_arb_address),
         .m_arb_writedata(icm_groupgmem0_router_1_arb_writedata),
         .m_arb_byteenable(icm_groupgmem0_router_1_arb_byteenable),
         .m_arb_stall(icm_groupgmem0_router_1_arb_stall),
         .m_wrp_ack(icm_groupgmem0_router_1_wrp_ack),
         .m_rrp_datavalid(icm_groupgmem0_router_1_rrp_datavalid),
         .m_rrp_data(icm_groupgmem0_router_1_rrp_data),
         // ICM mout
         .mout_arb_request(gmem0_icm_preroute_arb_request[1]),
         .mout_arb_enable(gmem0_icm_preroute_arb_enable[1]),
         .mout_arb_read(gmem0_icm_preroute_arb_read[1]),
         .mout_arb_write(gmem0_icm_preroute_arb_write[1]),
         .mout_arb_burstcount(gmem0_icm_preroute_arb_burstcount[1]),
         .mout_arb_address(gmem0_icm_preroute_arb_address[1]),
         .mout_arb_writedata(gmem0_icm_preroute_arb_writedata[1]),
         .mout_arb_byteenable(gmem0_icm_preroute_arb_byteenable[1]),
         .mout_arb_id(),
         .mout_arb_stall(gmem0_icm_preroute_arb_stall[1]),
         .mout_wrp_ack(gmem0_icm_preroute_wrp_ack[1]),
         .mout_rrp_datavalid(gmem0_icm_preroute_rrp_datavalid[1]),
         .mout_rrp_data(gmem0_icm_preroute_rrp_data[1])
      );

      assign icm_groupgmem0_router_2_arb_request[0] = gmem0_icm_in_arb_request[0];
      assign icm_groupgmem0_router_2_arb_enable[0] = gmem0_icm_in_arb_enable[0];
      assign icm_groupgmem0_router_2_arb_read[0] = gmem0_icm_in_arb_read[0];
      assign icm_groupgmem0_router_2_arb_write[0] = gmem0_icm_in_arb_write[0];
      assign icm_groupgmem0_router_2_arb_burstcount[0] = gmem0_icm_in_arb_burstcount[0];
      assign icm_groupgmem0_router_2_arb_address[0] = gmem0_icm_in_arb_address[0];
      assign icm_groupgmem0_router_2_arb_writedata[0] = gmem0_icm_in_arb_writedata[0];
      assign icm_groupgmem0_router_2_arb_byteenable[0] = gmem0_icm_in_arb_byteenable[0];
      assign gmem0_icm_in_arb_stall[0] = icm_groupgmem0_router_2_arb_stall[0];
      assign gmem0_icm_in_wrp_ack[0] = icm_groupgmem0_router_2_wrp_ack[0];
      assign gmem0_icm_in_rrp_datavalid[0] = icm_groupgmem0_router_2_rrp_datavalid[0];
      assign gmem0_icm_in_rrp_data[0] = icm_groupgmem0_router_2_rrp_data[0];
      // INST global_ic_preroutegmem0_router_2 of vadd_system_interconnect_1
      vadd_system_interconnect_1 global_ic_preroutegmem0_router_2
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_groupgmem0_router_2_arb_request),
         .m_arb_enable(icm_groupgmem0_router_2_arb_enable),
         .m_arb_read(icm_groupgmem0_router_2_arb_read),
         .m_arb_write(icm_groupgmem0_router_2_arb_write),
         .m_arb_burstcount(icm_groupgmem0_router_2_arb_burstcount),
         .m_arb_address(icm_groupgmem0_router_2_arb_address),
         .m_arb_writedata(icm_groupgmem0_router_2_arb_writedata),
         .m_arb_byteenable(icm_groupgmem0_router_2_arb_byteenable),
         .m_arb_stall(icm_groupgmem0_router_2_arb_stall),
         .m_wrp_ack(icm_groupgmem0_router_2_wrp_ack),
         .m_rrp_datavalid(icm_groupgmem0_router_2_rrp_datavalid),
         .m_rrp_data(icm_groupgmem0_router_2_rrp_data),
         // ICM mout
         .mout_arb_request(gmem0_icm_preroute_arb_request[2]),
         .mout_arb_enable(gmem0_icm_preroute_arb_enable[2]),
         .mout_arb_read(gmem0_icm_preroute_arb_read[2]),
         .mout_arb_write(gmem0_icm_preroute_arb_write[2]),
         .mout_arb_burstcount(gmem0_icm_preroute_arb_burstcount[2]),
         .mout_arb_address(gmem0_icm_preroute_arb_address[2]),
         .mout_arb_writedata(gmem0_icm_preroute_arb_writedata[2]),
         .mout_arb_byteenable(gmem0_icm_preroute_arb_byteenable[2]),
         .mout_arb_id(),
         .mout_arb_stall(gmem0_icm_preroute_arb_stall[2]),
         .mout_wrp_ack(gmem0_icm_preroute_wrp_ack[2]),
         .mout_rrp_datavalid(gmem0_icm_preroute_rrp_datavalid[2]),
         .mout_rrp_data(gmem0_icm_preroute_rrp_data[2])
      );

      for( __i = 0; __i < 3; __i = __i + 1 )
      begin:router
         logic b_arb_request [2];
         logic b_arb_enable [2];
         logic b_arb_read [2];
         logic b_arb_write [2];
         logic [4:0] b_arb_burstcount [2];
         logic [24:0] b_arb_address [2];
         logic [511:0] b_arb_writedata [2];
         logic [63:0] b_arb_byteenable [2];
         logic b_arb_stall [2];
         logic b_wrp_ack [2];
         logic b_rrp_datavalid [2];
         logic [511:0] b_rrp_data [2];
         logic [1:0] bank_select;

         // INST router of acl_ic_mem_router
         acl_ic_mem_router
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(26),
            .BYTEENA_W(64),
            .NUM_BANKS(2)
         )
         router
         (
            .clock(clock),
            .resetn(resetn),
            .bank_select(bank_select),
            // ICM m
            .m_arb_request(gmem0_icm_preroute_arb_request[__i]),
            .m_arb_enable(gmem0_icm_preroute_arb_enable[__i]),
            .m_arb_read(gmem0_icm_preroute_arb_read[__i]),
            .m_arb_write(gmem0_icm_preroute_arb_write[__i]),
            .m_arb_burstcount(gmem0_icm_preroute_arb_burstcount[__i]),
            .m_arb_address(gmem0_icm_preroute_arb_address[__i]),
            .m_arb_writedata(gmem0_icm_preroute_arb_writedata[__i]),
            .m_arb_byteenable(gmem0_icm_preroute_arb_byteenable[__i]),
            .m_arb_stall(gmem0_icm_preroute_arb_stall[__i]),
            .m_wrp_ack(gmem0_icm_preroute_wrp_ack[__i]),
            .m_rrp_datavalid(gmem0_icm_preroute_rrp_datavalid[__i]),
            .m_rrp_data(gmem0_icm_preroute_rrp_data[__i]),
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

         assign bank_select[0] = (gmem0_icm_preroute_arb_address[__i][25] == 1'b0);
         assign bank_select[1] = (gmem0_icm_preroute_arb_address[__i][25] == 1'b1);
      end

      // INST global_icgmem0_port_0_0_rw of vadd_system_interconnect_2
      vadd_system_interconnect_2 global_icgmem0_port_0_0_rw
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_routedgmem0_port_0_0_rw_arb_request),
         .m_arb_enable(icm_routedgmem0_port_0_0_rw_arb_enable),
         .m_arb_read(icm_routedgmem0_port_0_0_rw_arb_read),
         .m_arb_write(icm_routedgmem0_port_0_0_rw_arb_write),
         .m_arb_burstcount(icm_routedgmem0_port_0_0_rw_arb_burstcount),
         .m_arb_address(icm_routedgmem0_port_0_0_rw_arb_address),
         .m_arb_writedata(icm_routedgmem0_port_0_0_rw_arb_writedata),
         .m_arb_byteenable(icm_routedgmem0_port_0_0_rw_arb_byteenable),
         .m_arb_stall(icm_routedgmem0_port_0_0_rw_arb_stall),
         .m_wrp_ack(icm_routedgmem0_port_0_0_rw_wrp_ack),
         .m_rrp_datavalid(icm_routedgmem0_port_0_0_rw_rrp_datavalid),
         .m_rrp_data(icm_routedgmem0_port_0_0_rw_rrp_data),
         // ICM mout
         .mout_arb_request(icm_out_0_rw_arb_request[0]),
         .mout_arb_enable(icm_out_0_rw_arb_enable[0]),
         .mout_arb_read(icm_out_0_rw_arb_read[0]),
         .mout_arb_write(icm_out_0_rw_arb_write[0]),
         .mout_arb_burstcount(icm_out_0_rw_arb_burstcount[0]),
         .mout_arb_address(icm_out_0_rw_arb_address[0]),
         .mout_arb_writedata(icm_out_0_rw_arb_writedata[0]),
         .mout_arb_byteenable(icm_out_0_rw_arb_byteenable[0]),
         .mout_arb_id(icm_out_0_rw_arb_id[0]),
         .mout_arb_stall(icm_out_0_rw_arb_stall[0]),
         .mout_wrp_ack(icm_out_0_rw_wrp_ack[0]),
         .mout_rrp_datavalid(icm_out_0_rw_rrp_datavalid[0]),
         .mout_rrp_data(icm_out_0_rw_rrp_data[0])
      );

      for( __i = 0; __i < 3; __i = __i + 1 )
      begin:mgmem0_port_0_0_rw
         assign icm_routedgmem0_port_0_0_rw_arb_request[__i] = router[__i].b_arb_request[0];
         assign icm_routedgmem0_port_0_0_rw_arb_enable[__i] = router[__i].b_arb_enable[0];
         assign icm_routedgmem0_port_0_0_rw_arb_read[__i] = router[__i].b_arb_read[0];
         assign icm_routedgmem0_port_0_0_rw_arb_write[__i] = router[__i].b_arb_write[0];
         assign icm_routedgmem0_port_0_0_rw_arb_burstcount[__i] = router[__i].b_arb_burstcount[0];
         assign icm_routedgmem0_port_0_0_rw_arb_address[__i] = router[__i].b_arb_address[0];
         assign icm_routedgmem0_port_0_0_rw_arb_writedata[__i] = router[__i].b_arb_writedata[0];
         assign icm_routedgmem0_port_0_0_rw_arb_byteenable[__i] = router[__i].b_arb_byteenable[0];
         assign router[__i].b_arb_stall[0] = icm_routedgmem0_port_0_0_rw_arb_stall[__i];
         assign router[__i].b_wrp_ack[0] = icm_routedgmem0_port_0_0_rw_wrp_ack[__i];
         assign router[__i].b_rrp_datavalid[0] = icm_routedgmem0_port_0_0_rw_rrp_datavalid[__i];
         assign router[__i].b_rrp_data[0] = icm_routedgmem0_port_0_0_rw_rrp_data[__i];
      end

      // INST global_out_ic_to_avmgmem0_port_0_0_rw of acl_ic_to_avm
      acl_ic_to_avm
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(31),
         .BYTEENA_W(64),
         .LATENCY(0),
         .ID_W(2)
      )
      global_out_ic_to_avmgmem0_port_0_0_rw
      (
         // ICM ic
         .ic_arb_request(icm_out_0_rw_arb_request[0]),
         .ic_arb_enable(icm_out_0_rw_arb_enable[0]),
         .ic_arb_read(icm_out_0_rw_arb_read[0]),
         .ic_arb_write(icm_out_0_rw_arb_write[0]),
         .ic_arb_burstcount(icm_out_0_rw_arb_burstcount[0]),
         .ic_arb_address(icm_out_0_rw_arb_address[0]),
         .ic_arb_writedata(icm_out_0_rw_arb_writedata[0]),
         .ic_arb_byteenable(icm_out_0_rw_arb_byteenable[0]),
         .ic_arb_id(icm_out_0_rw_arb_id[0]),
         .ic_arb_stall(icm_out_0_rw_arb_stall[0]),
         .ic_wrp_ack(icm_out_0_rw_wrp_ack[0]),
         .ic_rrp_datavalid(icm_out_0_rw_rrp_datavalid[0]),
         .ic_rrp_data(icm_out_0_rw_rrp_data[0]),
         // AVM avm
         .avm_enable(avm_memgmem0_port_0_0_rw_enable),
         .avm_read(avm_memgmem0_port_0_0_rw_read),
         .avm_write(avm_memgmem0_port_0_0_rw_write),
         .avm_burstcount(avm_memgmem0_port_0_0_rw_burstcount),
         .avm_address(avm_memgmem0_port_0_0_rw_address),
         .avm_writedata(avm_memgmem0_port_0_0_rw_writedata),
         .avm_byteenable(avm_memgmem0_port_0_0_rw_byteenable),
         .avm_waitrequest(avm_memgmem0_port_0_0_rw_waitrequest),
         .avm_readdata(avm_memgmem0_port_0_0_rw_readdata),
         .avm_readdatavalid(avm_memgmem0_port_0_0_rw_readdatavalid),
         .avm_writeack(avm_memgmem0_port_0_0_rw_writeack),
         .clock(),
         .resetn()
      );

      // INST global_icgmem0_port_1_0_rw of vadd_system_interconnect_2
      vadd_system_interconnect_2 global_icgmem0_port_1_0_rw
      (
         .clock(clock),
         .resetn(resetn),
         // ICM m
         .m_arb_request(icm_routedgmem0_port_1_0_rw_arb_request),
         .m_arb_enable(icm_routedgmem0_port_1_0_rw_arb_enable),
         .m_arb_read(icm_routedgmem0_port_1_0_rw_arb_read),
         .m_arb_write(icm_routedgmem0_port_1_0_rw_arb_write),
         .m_arb_burstcount(icm_routedgmem0_port_1_0_rw_arb_burstcount),
         .m_arb_address(icm_routedgmem0_port_1_0_rw_arb_address),
         .m_arb_writedata(icm_routedgmem0_port_1_0_rw_arb_writedata),
         .m_arb_byteenable(icm_routedgmem0_port_1_0_rw_arb_byteenable),
         .m_arb_stall(icm_routedgmem0_port_1_0_rw_arb_stall),
         .m_wrp_ack(icm_routedgmem0_port_1_0_rw_wrp_ack),
         .m_rrp_datavalid(icm_routedgmem0_port_1_0_rw_rrp_datavalid),
         .m_rrp_data(icm_routedgmem0_port_1_0_rw_rrp_data),
         // ICM mout
         .mout_arb_request(icm_out_0_rw_arb_request[1]),
         .mout_arb_enable(icm_out_0_rw_arb_enable[1]),
         .mout_arb_read(icm_out_0_rw_arb_read[1]),
         .mout_arb_write(icm_out_0_rw_arb_write[1]),
         .mout_arb_burstcount(icm_out_0_rw_arb_burstcount[1]),
         .mout_arb_address(icm_out_0_rw_arb_address[1]),
         .mout_arb_writedata(icm_out_0_rw_arb_writedata[1]),
         .mout_arb_byteenable(icm_out_0_rw_arb_byteenable[1]),
         .mout_arb_id(icm_out_0_rw_arb_id[1]),
         .mout_arb_stall(icm_out_0_rw_arb_stall[1]),
         .mout_wrp_ack(icm_out_0_rw_wrp_ack[1]),
         .mout_rrp_datavalid(icm_out_0_rw_rrp_datavalid[1]),
         .mout_rrp_data(icm_out_0_rw_rrp_data[1])
      );

      for( __i = 0; __i < 3; __i = __i + 1 )
      begin:mgmem0_port_1_0_rw
         assign icm_routedgmem0_port_1_0_rw_arb_request[__i] = router[__i].b_arb_request[1];
         assign icm_routedgmem0_port_1_0_rw_arb_enable[__i] = router[__i].b_arb_enable[1];
         assign icm_routedgmem0_port_1_0_rw_arb_read[__i] = router[__i].b_arb_read[1];
         assign icm_routedgmem0_port_1_0_rw_arb_write[__i] = router[__i].b_arb_write[1];
         assign icm_routedgmem0_port_1_0_rw_arb_burstcount[__i] = router[__i].b_arb_burstcount[1];
         assign icm_routedgmem0_port_1_0_rw_arb_address[__i] = router[__i].b_arb_address[1];
         assign icm_routedgmem0_port_1_0_rw_arb_writedata[__i] = router[__i].b_arb_writedata[1];
         assign icm_routedgmem0_port_1_0_rw_arb_byteenable[__i] = router[__i].b_arb_byteenable[1];
         assign router[__i].b_arb_stall[1] = icm_routedgmem0_port_1_0_rw_arb_stall[__i];
         assign router[__i].b_wrp_ack[1] = icm_routedgmem0_port_1_0_rw_wrp_ack[__i];
         assign router[__i].b_rrp_datavalid[1] = icm_routedgmem0_port_1_0_rw_rrp_datavalid[__i];
         assign router[__i].b_rrp_data[1] = icm_routedgmem0_port_1_0_rw_rrp_data[__i];
      end

      // INST global_out_ic_to_avmgmem0_port_1_0_rw of acl_ic_to_avm
      acl_ic_to_avm
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(31),
         .BYTEENA_W(64),
         .LATENCY(0),
         .ID_W(2)
      )
      global_out_ic_to_avmgmem0_port_1_0_rw
      (
         // ICM ic
         .ic_arb_request(icm_out_0_rw_arb_request[1]),
         .ic_arb_enable(icm_out_0_rw_arb_enable[1]),
         .ic_arb_read(icm_out_0_rw_arb_read[1]),
         .ic_arb_write(icm_out_0_rw_arb_write[1]),
         .ic_arb_burstcount(icm_out_0_rw_arb_burstcount[1]),
         .ic_arb_address(icm_out_0_rw_arb_address[1]),
         .ic_arb_writedata(icm_out_0_rw_arb_writedata[1]),
         .ic_arb_byteenable(icm_out_0_rw_arb_byteenable[1]),
         .ic_arb_id(icm_out_0_rw_arb_id[1]),
         .ic_arb_stall(icm_out_0_rw_arb_stall[1]),
         .ic_wrp_ack(icm_out_0_rw_wrp_ack[1]),
         .ic_rrp_datavalid(icm_out_0_rw_rrp_datavalid[1]),
         .ic_rrp_data(icm_out_0_rw_rrp_data[1]),
         // AVM avm
         .avm_enable(avm_memgmem0_port_1_0_rw_enable),
         .avm_read(avm_memgmem0_port_1_0_rw_read),
         .avm_write(avm_memgmem0_port_1_0_rw_write),
         .avm_burstcount(avm_memgmem0_port_1_0_rw_burstcount),
         .avm_address(avm_memgmem0_port_1_0_rw_address),
         .avm_writedata(avm_memgmem0_port_1_0_rw_writedata),
         .avm_byteenable(avm_memgmem0_port_1_0_rw_byteenable),
         .avm_waitrequest(avm_memgmem0_port_1_0_rw_waitrequest),
         .avm_readdata(avm_memgmem0_port_1_0_rw_readdata),
         .avm_readdatavalid(avm_memgmem0_port_1_0_rw_readdatavalid),
         .avm_writeack(avm_memgmem0_port_1_0_rw_writeack),
         .clock(),
         .resetn()
      );

   end
   endgenerate

endmodule

/////////////////////////////////////////////////////////////////
// MODULE vadd_top_wrapper_0
/////////////////////////////////////////////////////////////////
module vadd_top_wrapper_0
(
   input logic start,
   input logic [223:0] kernel_arguments,
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
   // AVM avm_local_bb0_ld_memcoalesce_a_load_0_inst0
   output logic avm_local_bb0_ld_memcoalesce_a_load_0_inst0_enable,
   output logic avm_local_bb0_ld_memcoalesce_a_load_0_inst0_read,
   output logic avm_local_bb0_ld_memcoalesce_a_load_0_inst0_write,
   output logic [4:0] avm_local_bb0_ld_memcoalesce_a_load_0_inst0_burstcount,
   output logic [31:0] avm_local_bb0_ld_memcoalesce_a_load_0_inst0_address,
   output logic [511:0] avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writedata,
   output logic [63:0] avm_local_bb0_ld_memcoalesce_a_load_0_inst0_byteenable,
   input logic avm_local_bb0_ld_memcoalesce_a_load_0_inst0_waitrequest,
   input logic [511:0] avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdata,
   input logic avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdatavalid,
   input logic avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writeack,
   // AVM avm_local_bb0_ld_memcoalesce_b_load_0_inst0
   output logic avm_local_bb0_ld_memcoalesce_b_load_0_inst0_enable,
   output logic avm_local_bb0_ld_memcoalesce_b_load_0_inst0_read,
   output logic avm_local_bb0_ld_memcoalesce_b_load_0_inst0_write,
   output logic [4:0] avm_local_bb0_ld_memcoalesce_b_load_0_inst0_burstcount,
   output logic [31:0] avm_local_bb0_ld_memcoalesce_b_load_0_inst0_address,
   output logic [511:0] avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writedata,
   output logic [63:0] avm_local_bb0_ld_memcoalesce_b_load_0_inst0_byteenable,
   input logic avm_local_bb0_ld_memcoalesce_b_load_0_inst0_waitrequest,
   input logic [511:0] avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdata,
   input logic avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdatavalid,
   input logic avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writeack,
   // AVM avm_local_bb0_st_c0_exe1_inst0
   output logic avm_local_bb0_st_c0_exe1_inst0_enable,
   output logic avm_local_bb0_st_c0_exe1_inst0_read,
   output logic avm_local_bb0_st_c0_exe1_inst0_write,
   output logic [4:0] avm_local_bb0_st_c0_exe1_inst0_burstcount,
   output logic [31:0] avm_local_bb0_st_c0_exe1_inst0_address,
   output logic [511:0] avm_local_bb0_st_c0_exe1_inst0_writedata,
   output logic [63:0] avm_local_bb0_st_c0_exe1_inst0_byteenable,
   input logic avm_local_bb0_st_c0_exe1_inst0_waitrequest,
   input logic [511:0] avm_local_bb0_st_c0_exe1_inst0_readdata,
   input logic avm_local_bb0_st_c0_exe1_inst0_readdatavalid,
   input logic avm_local_bb0_st_c0_exe1_inst0_writeack
);
   logic lmem_invalid_single_bit;

   // INST kernel of vadd_function_wrapper
   vadd_function_wrapper kernel
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
      // AVM avm_local_bb0_ld_memcoalesce_a_load_0_inst0
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_enable(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_enable),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_read(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_read),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_write(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_write),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_burstcount(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_burstcount),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_address(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_address),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writedata(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writedata),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_byteenable(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_byteenable),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_waitrequest(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_waitrequest),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdata(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdata),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdatavalid(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdatavalid),
      .avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writeack(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writeack),
      // AVM avm_local_bb0_ld_memcoalesce_b_load_0_inst0
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_enable(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_enable),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_read(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_read),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_write(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_write),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_burstcount(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_burstcount),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_address(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_address),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writedata(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writedata),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_byteenable(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_byteenable),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_waitrequest(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_waitrequest),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdata(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdata),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdatavalid(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdatavalid),
      .avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writeack(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writeack),
      // AVM avm_local_bb0_st_c0_exe1_inst0
      .avm_local_bb0_st_c0_exe1_inst0_enable(avm_local_bb0_st_c0_exe1_inst0_enable),
      .avm_local_bb0_st_c0_exe1_inst0_read(avm_local_bb0_st_c0_exe1_inst0_read),
      .avm_local_bb0_st_c0_exe1_inst0_write(avm_local_bb0_st_c0_exe1_inst0_write),
      .avm_local_bb0_st_c0_exe1_inst0_burstcount(avm_local_bb0_st_c0_exe1_inst0_burstcount),
      .avm_local_bb0_st_c0_exe1_inst0_address(avm_local_bb0_st_c0_exe1_inst0_address),
      .avm_local_bb0_st_c0_exe1_inst0_writedata(avm_local_bb0_st_c0_exe1_inst0_writedata),
      .avm_local_bb0_st_c0_exe1_inst0_byteenable(avm_local_bb0_st_c0_exe1_inst0_byteenable),
      .avm_local_bb0_st_c0_exe1_inst0_waitrequest(avm_local_bb0_st_c0_exe1_inst0_waitrequest),
      .avm_local_bb0_st_c0_exe1_inst0_readdata(avm_local_bb0_st_c0_exe1_inst0_readdata),
      .avm_local_bb0_st_c0_exe1_inst0_readdatavalid(avm_local_bb0_st_c0_exe1_inst0_readdatavalid),
      .avm_local_bb0_st_c0_exe1_inst0_writeack(avm_local_bb0_st_c0_exe1_inst0_writeack)
   );

   assign lmem_invalid_single_bit = 'b0;
endmodule

/////////////////////////////////////////////////////////////////
// MODULE vadd_system_interconnect_0
/////////////////////////////////////////////////////////////////
module vadd_system_interconnect_0
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [1],
   input logic m_arb_enable [1],
   input logic m_arb_read [1],
   input logic m_arb_write [1],
   input logic [4:0] m_arb_burstcount [1],
   input logic [25:0] m_arb_address [1],
   input logic [511:0] m_arb_writedata [1],
   input logic [63:0] m_arb_byteenable [1],
   output logic m_arb_stall [1],
   output logic m_wrp_ack [1],
   output logic m_rrp_datavalid [1],
   output logic [511:0] m_rrp_data [1],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_enable,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic [4:0] mout_arb_burstcount,
   output logic [25:0] mout_arb_address,
   output logic [511:0] mout_arb_writedata,
   output logic [63:0] mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [511:0] mout_rrp_data
);
   genvar __i;
   generate
      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(26),
            .BYTEENA_W(64),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(26),
            .BYTEENA_W(64),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(512),
            .ID_W(1)
         ) rrp_intf();

         assign id = __i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(26),
            .BYTEENA_W(64),
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
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(26),
         .BYTEENA_W(64),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(26),
         .BYTEENA_W(64),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(512),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(26),
         .BYTEENA_W(64),
         .ID_W(1),
         .NUM_MASTERS(1),
         .PIPELINE_RETURN_PATHS(1),
         .WRP_FIFO_DEPTH(64),
         .RRP_FIFO_DEPTH(64),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(0),
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
// MODULE vadd_system_interconnect_1
/////////////////////////////////////////////////////////////////
module vadd_system_interconnect_1
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [1],
   input logic m_arb_enable [1],
   input logic m_arb_read [1],
   input logic m_arb_write [1],
   input logic [4:0] m_arb_burstcount [1],
   input logic [25:0] m_arb_address [1],
   input logic [511:0] m_arb_writedata [1],
   input logic [63:0] m_arb_byteenable [1],
   output logic m_arb_stall [1],
   output logic m_wrp_ack [1],
   output logic m_rrp_datavalid [1],
   output logic [511:0] m_rrp_data [1],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_enable,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic [4:0] mout_arb_burstcount,
   output logic [25:0] mout_arb_address,
   output logic [511:0] mout_arb_writedata,
   output logic [63:0] mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [511:0] mout_rrp_data
);
   genvar __i;
   generate
      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(26),
            .BYTEENA_W(64),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(26),
            .BYTEENA_W(64),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(512),
            .ID_W(1)
         ) rrp_intf();

         assign id = __i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(26),
            .BYTEENA_W(64),
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
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(26),
         .BYTEENA_W(64),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(26),
         .BYTEENA_W(64),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(512),
         .ID_W(1)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(26),
         .BYTEENA_W(64),
         .ID_W(1),
         .NUM_MASTERS(1),
         .PIPELINE_RETURN_PATHS(1),
         .WRP_FIFO_DEPTH(64),
         .RRP_FIFO_DEPTH(64),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(0),
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
// MODULE vadd_system_interconnect_2
/////////////////////////////////////////////////////////////////
module vadd_system_interconnect_2
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [3],
   input logic m_arb_enable [3],
   input logic m_arb_read [3],
   input logic m_arb_write [3],
   input logic [4:0] m_arb_burstcount [3],
   input logic [24:0] m_arb_address [3],
   input logic [511:0] m_arb_writedata [3],
   input logic [63:0] m_arb_byteenable [3],
   output logic m_arb_stall [3],
   output logic m_wrp_ack [3],
   output logic m_rrp_datavalid [3],
   output logic [511:0] m_rrp_data [3],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_enable,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic [4:0] mout_arb_burstcount,
   output logic [24:0] mout_arb_address,
   output logic [511:0] mout_arb_writedata,
   output logic [63:0] mout_arb_byteenable,
   output logic [1:0] mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [511:0] mout_rrp_data
);
   genvar __i;
   generate
      for( __i = 0; __i < 3; __i = __i + 1 )
      begin:m
         logic [1:0] id;
         acl_ic_master_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(2)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(512),
            .ID_W(2)
         ) rrp_intf();

         assign id = __i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2),
            .TOTAL_NUM_MASTERS(3),
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
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(64),
         .ID_W(2)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(64),
         .ID_W(2)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(2)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(512),
         .ID_W(2)
      ) rrp_intf();

      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(512),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(64),
         .ID_W(2),
         .NUM_MASTERS(3),
         .PIPELINE_RETURN_PATHS(1),
         .WRP_FIFO_DEPTH(0),
         .RRP_FIFO_DEPTH(64),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(0),
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
      assign m[1].wrp_intf.ack = s.wrp_intf.ack;
      assign m[1].wrp_intf.id = s.wrp_intf.id;
      assign m[2].wrp_intf.ack = s.wrp_intf.ack;
      assign m[2].wrp_intf.id = s.wrp_intf.id;
   end
   endgenerate

   generate
   begin:rrp
      assign m[0].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[0].rrp_intf.data = s.rrp_intf.data;
      assign m[0].rrp_intf.id = s.rrp_intf.id;
      assign m[1].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[1].rrp_intf.data = s.rrp_intf.data;
      assign m[1].rrp_intf.id = s.rrp_intf.id;
      assign m[2].rrp_intf.datavalid = s.rrp_intf.datavalid;
      assign m[2].rrp_intf.data = s.rrp_intf.data;
      assign m[2].rrp_intf.id = s.rrp_intf.id;
   end
   endgenerate

   generate
      for( __i = 0; __i < 2; __i = __i + 1 )
      begin:a
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) m0_intf();
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) m1_intf();
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) mout_intf();

         // INST a of acl_arb2
         acl_arb2
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2),
            .PIPELINE("none"),
            .KEEP_LAST_GRANT(1),
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
      for( __i = 0; __i < 5; __i = __i + 1 )
      begin:dp
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) in_intf();
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) out_intf();

         // INST dp of acl_arb_pipeline_reg
         acl_arb_pipeline_reg
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
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

   generate
      for( __i = 0; __i < 1; __i = __i + 1 )
      begin:sp
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) in_intf();
         acl_arb_intf
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         ) out_intf();

         // INST sp of acl_arb_staging_reg
         acl_arb_staging_reg
         #(
            .DATA_W(512),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(64),
            .ID_W(2)
         )
         sp
         (
            .clock(clock),
            .resetn(resetn),
            .in_intf(in_intf),
            .out_intf(out_intf)
         );

      end

   endgenerate

   assign mout_arb_request = dp[0].out_intf.req.request;
   assign mout_arb_enable = dp[0].out_intf.req.enable;
   assign mout_arb_read = dp[0].out_intf.req.read;
   assign mout_arb_write = dp[0].out_intf.req.write;
   assign mout_arb_burstcount = dp[0].out_intf.req.burstcount;
   assign mout_arb_address = dp[0].out_intf.req.address;
   assign mout_arb_writedata = dp[0].out_intf.req.writedata;
   assign mout_arb_byteenable = dp[0].out_intf.req.byteenable;
   assign mout_arb_id = dp[0].out_intf.req.id;
   assign dp[0].out_intf.stall = mout_arb_stall;
   assign dp[0].in_intf.req = sp[0].out_intf.req;
   assign sp[0].out_intf.stall = dp[0].in_intf.stall;
   assign sp[0].in_intf.req = s.out_arb_intf.req;
   assign s.out_arb_intf.stall = sp[0].in_intf.stall;
   assign s.in_arb_intf.req = dp[1].out_intf.req;
   assign dp[1].out_intf.stall = s.in_arb_intf.stall;
   assign dp[1].in_intf.req = a[1].mout_intf.req;
   assign a[1].mout_intf.stall = dp[1].in_intf.stall;
   assign a[1].m0_intf.req = a[0].mout_intf.req;
   assign a[0].mout_intf.stall = a[1].m0_intf.stall;
   assign a[1].m1_intf.req = dp[2].out_intf.req;
   assign dp[2].out_intf.stall = a[1].m1_intf.stall;
   assign a[0].m0_intf.req = dp[3].out_intf.req;
   assign dp[3].out_intf.stall = a[0].m0_intf.stall;
   assign a[0].m1_intf.req = dp[4].out_intf.req;
   assign dp[4].out_intf.stall = a[0].m1_intf.stall;
   assign dp[2].in_intf.req = m[2].arb_intf.req;
   assign m[2].arb_intf.stall = dp[2].in_intf.stall;
   assign dp[3].in_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = dp[3].in_intf.stall;
   assign dp[4].in_intf.req = m[1].arb_intf.req;
   assign m[1].arb_intf.stall = dp[4].in_intf.stall;
endmodule

