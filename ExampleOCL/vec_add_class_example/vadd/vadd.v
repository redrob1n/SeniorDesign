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
    

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vadd_basic_block_0
	(
		input 		clock,
		input 		resetn,
		input [31:0] 		input_N,
		input [63:0] 		input_a,
		input [63:0] 		input_b,
		input [63:0] 		input_result,
		input 		valid_in,
		output 		stall_out,
		input [31:0] 		input_global_id_0,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		input 		start,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_enable,
		input [511:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_waitrequest,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_address,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_read,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_write,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_writeack,
		output [511:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_writedata,
		output [63:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_burstcount,
		output 		local_bb0_ld_memcoalesce_b_load_0_active,
		input 		clock2x,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_enable,
		input [511:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_waitrequest,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_address,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_read,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_write,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_writeack,
		output [511:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_writedata,
		output [63:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_burstcount,
		output 		local_bb0_ld_memcoalesce_a_load_0_active,
		output 		avm_local_bb0_st_c0_exe1_enable,
		input [511:0] 		avm_local_bb0_st_c0_exe1_readdata,
		input 		avm_local_bb0_st_c0_exe1_readdatavalid,
		input 		avm_local_bb0_st_c0_exe1_waitrequest,
		output [31:0] 		avm_local_bb0_st_c0_exe1_address,
		output 		avm_local_bb0_st_c0_exe1_read,
		output 		avm_local_bb0_st_c0_exe1_write,
		input 		avm_local_bb0_st_c0_exe1_writeack,
		output [511:0] 		avm_local_bb0_st_c0_exe1_writedata,
		output [63:0] 		avm_local_bb0_st_c0_exe1_byteenable,
		output [4:0] 		avm_local_bb0_st_c0_exe1_burstcount,
		output 		local_bb0_st_c0_exe1_active
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((&valid_in) & ~((|stall_out)));
assign _exit = ((&valid_out) & ~((|stall_in)));
assign _num_live = (_num_entry_NO_SHIFT_REG - _num_exit_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		_num_entry_NO_SHIFT_REG <= 32'h0;
		_num_exit_NO_SHIFT_REG <= 32'h0;
	end
	else
	begin
		if (_entry)
		begin
			_num_entry_NO_SHIFT_REG <= (_num_entry_NO_SHIFT_REG + 2'h1);
		end
		if (_exit)
		begin
			_num_exit_NO_SHIFT_REG <= (_num_exit_NO_SHIFT_REG + 2'h1);
		end
	end
end



// This section defines the behaviour of the MERGE node
wire merge_node_stall_in;
 reg merge_node_valid_out_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_staging_reg_NO_SHIFT_REG;
 reg [31:0] input_global_id_0_staging_reg_NO_SHIFT_REG;
 reg [31:0] local_lvm_input_global_id_0_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = (|(merge_node_stall_in & merge_node_valid_out_NO_SHIFT_REG));
assign stall_out = merge_node_valid_in_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_staging_reg_NO_SHIFT_REG | valid_in))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_global_id_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				input_global_id_0_staging_reg_NO_SHIFT_REG <= input_global_id_0;
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
	end
end

always @(posedge clock)
begin
	if (~(merge_stalled_by_successors))
	begin
		case (merge_block_selector_NO_SHIFT_REG)
			1'b0:
			begin
				if (merge_node_valid_in_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0;
				end
			end

			default:
			begin
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		merge_node_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in))
			begin
				merge_node_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		invariant_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		invariant_valid_NO_SHIFT_REG <= (~(start) & (invariant_valid_NO_SHIFT_REG | is_merge_data_to_local_regs_valid_NO_SHIFT_REG));
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_var__stall_local;
wire [31:0] local_bb0_var_;

assign local_bb0_var_ = (local_lvm_input_global_id_0_NO_SHIFT_REG << 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u0_stall_local;
wire [31:0] local_bb0_var__u0;

assign local_bb0_var__u0 = ((local_bb0_var_ & 32'hFFFFFFFC) | 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u1_stall_local;
wire [31:0] local_bb0_var__u1;

assign local_bb0_var__u1 = ((local_bb0_var_ & 32'hFFFFFFFC) | 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u2_stall_local;
wire [31:0] local_bb0_var__u2;

assign local_bb0_var__u2 = ((local_bb0_var_ & 32'hFFFFFFFC) | 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_idxprom_stall_local;
wire [63:0] local_bb0_idxprom;
wire [31:0] local_bb0_idxprom$ps;

assign local_bb0_idxprom$ps = (local_bb0_var_ & 32'hFFFFFFFC);
assign local_bb0_idxprom[32] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[33] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[34] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[35] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[36] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[37] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[38] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[39] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[40] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[41] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[42] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[43] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[44] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[45] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[46] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[47] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[48] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[49] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[50] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[51] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[52] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[53] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[54] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[55] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[56] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[57] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[58] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[59] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[60] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[61] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[62] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[63] = local_bb0_idxprom$ps[31];
assign local_bb0_idxprom[31:0] = local_bb0_idxprom$ps;

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_xor_stall_local;
wire local_bb0_cmp_xor;

assign local_bb0_cmp_xor = ($signed((local_bb0_var_ & 32'hFFFFFFFC)) >= $signed(input_N));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_xor_vectorizex4_1_stall_local;
wire local_bb0_cmp_xor_vectorizex4_1;

assign local_bb0_cmp_xor_vectorizex4_1 = ($signed(((local_bb0_var__u0 & 32'hFFFFFFFD) | 32'h1)) >= $signed(input_N));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_xor_vectorizex4_2_stall_local;
wire local_bb0_cmp_xor_vectorizex4_2;

assign local_bb0_cmp_xor_vectorizex4_2 = ($signed(((local_bb0_var__u1 & 32'hFFFFFFFE) | 32'h2)) >= $signed(input_N));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_xor_vectorizex4_3_stall_local;
wire local_bb0_cmp_xor_vectorizex4_3;

assign local_bb0_cmp_xor_vectorizex4_3 = ($signed((local_bb0_var__u2 | 32'h3)) >= $signed(input_N));

// This section implements an unregistered operation.
// 
wire local_bb0_arrayidx_stall_local;
wire [63:0] local_bb0_arrayidx;

assign local_bb0_arrayidx = ((input_a & 64'hFFFFFFFFFFFFFC00) + ((local_bb0_idxprom & 64'hFFFFFFFFFFFFFFFC) << 6'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_arrayidx3_stall_local;
wire [63:0] local_bb0_arrayidx3;

assign local_bb0_arrayidx3 = ((input_b & 64'hFFFFFFFFFFFFFC00) + ((local_bb0_idxprom & 64'hFFFFFFFFFFFFFFFC) << 6'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_xor_valid_out;
wire local_bb0_cmp_xor_stall_in;
wire local_bb0_cmp_xor_vectorizex4_1_valid_out;
wire local_bb0_cmp_xor_vectorizex4_1_stall_in;
wire local_bb0_cmp_xor_vectorizex4_2_valid_out;
wire local_bb0_cmp_xor_vectorizex4_2_stall_in;
wire local_bb0_cmp_xor_vectorizex4_3_valid_out;
wire local_bb0_cmp_xor_vectorizex4_3_stall_in;
wire local_bb0_arrayidx_valid_out;
wire local_bb0_arrayidx_stall_in;
wire local_bb0_arrayidx3_valid_out;
wire local_bb0_arrayidx3_stall_in;
wire local_bb0_arrayidx5_valid_out;
wire local_bb0_arrayidx5_stall_in;
wire local_bb0_arrayidx5_inputs_ready;
wire local_bb0_arrayidx5_stall_local;
wire [63:0] local_bb0_arrayidx5;
 reg local_bb0_cmp_xor_consumed_0_NO_SHIFT_REG;
 reg local_bb0_cmp_xor_vectorizex4_1_consumed_0_NO_SHIFT_REG;
 reg local_bb0_cmp_xor_vectorizex4_2_consumed_0_NO_SHIFT_REG;
 reg local_bb0_cmp_xor_vectorizex4_3_consumed_0_NO_SHIFT_REG;
 reg local_bb0_arrayidx_consumed_0_NO_SHIFT_REG;
 reg local_bb0_arrayidx3_consumed_0_NO_SHIFT_REG;
 reg local_bb0_arrayidx5_consumed_0_NO_SHIFT_REG;

assign local_bb0_arrayidx5_inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign local_bb0_arrayidx5 = ((input_result & 64'hFFFFFFFFFFFFFC00) + ((local_bb0_idxprom & 64'hFFFFFFFFFFFFFFFC) << 6'h2));
assign local_bb0_arrayidx5_stall_local = ((local_bb0_cmp_xor_stall_in & ~(local_bb0_cmp_xor_consumed_0_NO_SHIFT_REG)) | (local_bb0_cmp_xor_vectorizex4_1_stall_in & ~(local_bb0_cmp_xor_vectorizex4_1_consumed_0_NO_SHIFT_REG)) | (local_bb0_cmp_xor_vectorizex4_2_stall_in & ~(local_bb0_cmp_xor_vectorizex4_2_consumed_0_NO_SHIFT_REG)) | (local_bb0_cmp_xor_vectorizex4_3_stall_in & ~(local_bb0_cmp_xor_vectorizex4_3_consumed_0_NO_SHIFT_REG)) | (local_bb0_arrayidx_stall_in & ~(local_bb0_arrayidx_consumed_0_NO_SHIFT_REG)) | (local_bb0_arrayidx3_stall_in & ~(local_bb0_arrayidx3_consumed_0_NO_SHIFT_REG)) | (local_bb0_arrayidx5_stall_in & ~(local_bb0_arrayidx5_consumed_0_NO_SHIFT_REG)));
assign local_bb0_cmp_xor_valid_out = (local_bb0_arrayidx5_inputs_ready & ~(local_bb0_cmp_xor_consumed_0_NO_SHIFT_REG));
assign local_bb0_cmp_xor_vectorizex4_1_valid_out = (local_bb0_arrayidx5_inputs_ready & ~(local_bb0_cmp_xor_vectorizex4_1_consumed_0_NO_SHIFT_REG));
assign local_bb0_cmp_xor_vectorizex4_2_valid_out = (local_bb0_arrayidx5_inputs_ready & ~(local_bb0_cmp_xor_vectorizex4_2_consumed_0_NO_SHIFT_REG));
assign local_bb0_cmp_xor_vectorizex4_3_valid_out = (local_bb0_arrayidx5_inputs_ready & ~(local_bb0_cmp_xor_vectorizex4_3_consumed_0_NO_SHIFT_REG));
assign local_bb0_arrayidx_valid_out = (local_bb0_arrayidx5_inputs_ready & ~(local_bb0_arrayidx_consumed_0_NO_SHIFT_REG));
assign local_bb0_arrayidx3_valid_out = (local_bb0_arrayidx5_inputs_ready & ~(local_bb0_arrayidx3_consumed_0_NO_SHIFT_REG));
assign local_bb0_arrayidx5_valid_out = (local_bb0_arrayidx5_inputs_ready & ~(local_bb0_arrayidx5_consumed_0_NO_SHIFT_REG));
assign merge_node_stall_in = (|local_bb0_arrayidx5_stall_local);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp_xor_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_cmp_xor_vectorizex4_1_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_cmp_xor_vectorizex4_2_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_cmp_xor_vectorizex4_3_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_arrayidx_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_arrayidx3_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_arrayidx5_consumed_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		local_bb0_cmp_xor_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx5_inputs_ready & (local_bb0_cmp_xor_consumed_0_NO_SHIFT_REG | ~(local_bb0_cmp_xor_stall_in)) & local_bb0_arrayidx5_stall_local);
		local_bb0_cmp_xor_vectorizex4_1_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx5_inputs_ready & (local_bb0_cmp_xor_vectorizex4_1_consumed_0_NO_SHIFT_REG | ~(local_bb0_cmp_xor_vectorizex4_1_stall_in)) & local_bb0_arrayidx5_stall_local);
		local_bb0_cmp_xor_vectorizex4_2_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx5_inputs_ready & (local_bb0_cmp_xor_vectorizex4_2_consumed_0_NO_SHIFT_REG | ~(local_bb0_cmp_xor_vectorizex4_2_stall_in)) & local_bb0_arrayidx5_stall_local);
		local_bb0_cmp_xor_vectorizex4_3_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx5_inputs_ready & (local_bb0_cmp_xor_vectorizex4_3_consumed_0_NO_SHIFT_REG | ~(local_bb0_cmp_xor_vectorizex4_3_stall_in)) & local_bb0_arrayidx5_stall_local);
		local_bb0_arrayidx_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx5_inputs_ready & (local_bb0_arrayidx_consumed_0_NO_SHIFT_REG | ~(local_bb0_arrayidx_stall_in)) & local_bb0_arrayidx5_stall_local);
		local_bb0_arrayidx3_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx5_inputs_ready & (local_bb0_arrayidx3_consumed_0_NO_SHIFT_REG | ~(local_bb0_arrayidx3_stall_in)) & local_bb0_arrayidx5_stall_local);
		local_bb0_arrayidx5_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx5_inputs_ready & (local_bb0_arrayidx5_consumed_0_NO_SHIFT_REG | ~(local_bb0_arrayidx5_stall_in)) & local_bb0_arrayidx5_stall_local);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb0_cmp_xor_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_0_stall_out_reg_2_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_0_consumed_0_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb0_cmp_xor_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb0_cmp_xor_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb0_cmp_xor_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb0_cmp_xor_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb0_cmp_xor_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb0_cmp_xor),
	.data_out(rnode_1to2_bb0_cmp_xor_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb0_cmp_xor_0_reg_2_fifo.DEPTH = 2;
defparam rnode_1to2_bb0_cmp_xor_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb0_cmp_xor_0_reg_2_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to2_bb0_cmp_xor_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb0_cmp_xor_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb0_cmp_xor_valid_out;
assign local_bb0_cmp_xor_stall_in = rnode_1to2_bb0_cmp_xor_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_0_stall_in_0_reg_2_NO_SHIFT_REG = ((rnode_1to2_bb0_cmp_xor_0_stall_in_0_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_0_consumed_0_NO_SHIFT_REG)) | (rnode_1to2_bb0_cmp_xor_0_stall_in_1_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_0_consumed_1_NO_SHIFT_REG)));
assign rnode_1to2_bb0_cmp_xor_0_valid_out_0_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_0_consumed_0_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_0_valid_out_1_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_0_consumed_1_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_0_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_1_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_0_reg_2_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_1to2_bb0_cmp_xor_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_1to2_bb0_cmp_xor_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_1to2_bb0_cmp_xor_0_consumed_0_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_0_consumed_0_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_0_stall_in_0_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_0_stall_in_0_reg_2_NO_SHIFT_REG);
		rnode_1to2_bb0_cmp_xor_0_consumed_1_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_0_consumed_1_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_0_stall_in_1_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_0_stall_in_0_reg_2_NO_SHIFT_REG);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_out_reg_2_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_0_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb0_cmp_xor_vectorizex4_1),
	.data_out(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_fifo.DEPTH = 2;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb0_cmp_xor_vectorizex4_1_valid_out;
assign local_bb0_cmp_xor_vectorizex4_1_stall_in = rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_reg_2_NO_SHIFT_REG = ((rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_0_NO_SHIFT_REG)) | (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_1_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_1_NO_SHIFT_REG)));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_0_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_1_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_1_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_1_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_reg_2_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_0_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_0_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_reg_2_NO_SHIFT_REG);
		rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_1_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_consumed_1_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_1_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_reg_2_NO_SHIFT_REG);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_out_reg_2_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_0_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb0_cmp_xor_vectorizex4_2),
	.data_out(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_fifo.DEPTH = 2;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb0_cmp_xor_vectorizex4_2_valid_out;
assign local_bb0_cmp_xor_vectorizex4_2_stall_in = rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_reg_2_NO_SHIFT_REG = ((rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_0_NO_SHIFT_REG)) | (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_1_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_1_NO_SHIFT_REG)));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_0_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_1_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_1_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_1_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_reg_2_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_0_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_0_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_reg_2_NO_SHIFT_REG);
		rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_1_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_consumed_1_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_1_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_reg_2_NO_SHIFT_REG);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_1_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_out_reg_2_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_0_NO_SHIFT_REG;
 reg rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb0_cmp_xor_vectorizex4_3),
	.data_out(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_fifo.DEPTH = 2;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb0_cmp_xor_vectorizex4_3_valid_out;
assign local_bb0_cmp_xor_vectorizex4_3_stall_in = rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_reg_2_NO_SHIFT_REG = ((rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_0_NO_SHIFT_REG)) | (rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_1_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_1_NO_SHIFT_REG)));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_0_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_1_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_1_NO_SHIFT_REG));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_1_NO_SHIFT_REG = rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_reg_2_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_0_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_0_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_reg_2_NO_SHIFT_REG);
		rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_1_NO_SHIFT_REG <= (rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_consumed_1_NO_SHIFT_REG | ~(rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_1_NO_SHIFT_REG)) & rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_reg_2_NO_SHIFT_REG);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb0_arrayidx_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb0_arrayidx_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb0_arrayidx_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb0_arrayidx_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb0_arrayidx_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb0_arrayidx_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb0_arrayidx_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb0_arrayidx_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in((local_bb0_arrayidx & 64'hFFFFFFFFFFFFFFF0)),
	.data_out(rnode_1to2_bb0_arrayidx_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb0_arrayidx_0_reg_2_fifo.DEPTH = 2;
defparam rnode_1to2_bb0_arrayidx_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb0_arrayidx_0_reg_2_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to2_bb0_arrayidx_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb0_arrayidx_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb0_arrayidx_valid_out;
assign local_bb0_arrayidx_stall_in = rnode_1to2_bb0_arrayidx_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_arrayidx_0_NO_SHIFT_REG = rnode_1to2_bb0_arrayidx_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_arrayidx_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb0_arrayidx_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb0_arrayidx_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb0_arrayidx_0_valid_out_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb0_arrayidx3_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx3_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb0_arrayidx3_0_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx3_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb0_arrayidx3_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx3_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx3_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb0_arrayidx3_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb0_arrayidx3_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb0_arrayidx3_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb0_arrayidx3_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb0_arrayidx3_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb0_arrayidx3_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in((local_bb0_arrayidx3 & 64'hFFFFFFFFFFFFFFF0)),
	.data_out(rnode_1to2_bb0_arrayidx3_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb0_arrayidx3_0_reg_2_fifo.DEPTH = 2;
defparam rnode_1to2_bb0_arrayidx3_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb0_arrayidx3_0_reg_2_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to2_bb0_arrayidx3_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb0_arrayidx3_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb0_arrayidx3_valid_out;
assign local_bb0_arrayidx3_stall_in = rnode_1to2_bb0_arrayidx3_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_arrayidx3_0_NO_SHIFT_REG = rnode_1to2_bb0_arrayidx3_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb0_arrayidx3_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb0_arrayidx3_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb0_arrayidx3_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb0_arrayidx3_0_valid_out_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 174
//  * capacity = 174
 logic rnode_1to175_bb0_arrayidx5_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to175_bb0_arrayidx5_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_1to175_bb0_arrayidx5_0_NO_SHIFT_REG;
 logic rnode_1to175_bb0_arrayidx5_0_reg_175_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to175_bb0_arrayidx5_0_reg_175_NO_SHIFT_REG;
 logic rnode_1to175_bb0_arrayidx5_0_valid_out_reg_175_NO_SHIFT_REG;
 logic rnode_1to175_bb0_arrayidx5_0_stall_in_reg_175_NO_SHIFT_REG;
 logic rnode_1to175_bb0_arrayidx5_0_stall_out_reg_175_NO_SHIFT_REG;

acl_data_fifo rnode_1to175_bb0_arrayidx5_0_reg_175_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to175_bb0_arrayidx5_0_reg_175_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to175_bb0_arrayidx5_0_stall_in_reg_175_NO_SHIFT_REG),
	.valid_out(rnode_1to175_bb0_arrayidx5_0_valid_out_reg_175_NO_SHIFT_REG),
	.stall_out(rnode_1to175_bb0_arrayidx5_0_stall_out_reg_175_NO_SHIFT_REG),
	.data_in((local_bb0_arrayidx5 & 64'hFFFFFFFFFFFFFFF0)),
	.data_out(rnode_1to175_bb0_arrayidx5_0_reg_175_NO_SHIFT_REG)
);

defparam rnode_1to175_bb0_arrayidx5_0_reg_175_fifo.DEPTH = 175;
defparam rnode_1to175_bb0_arrayidx5_0_reg_175_fifo.DATA_WIDTH = 64;
defparam rnode_1to175_bb0_arrayidx5_0_reg_175_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to175_bb0_arrayidx5_0_reg_175_fifo.IMPL = "ram";

assign rnode_1to175_bb0_arrayidx5_0_reg_175_inputs_ready_NO_SHIFT_REG = local_bb0_arrayidx5_valid_out;
assign local_bb0_arrayidx5_stall_in = rnode_1to175_bb0_arrayidx5_0_stall_out_reg_175_NO_SHIFT_REG;
assign rnode_1to175_bb0_arrayidx5_0_NO_SHIFT_REG = rnode_1to175_bb0_arrayidx5_0_reg_175_NO_SHIFT_REG;
assign rnode_1to175_bb0_arrayidx5_0_stall_in_reg_175_NO_SHIFT_REG = rnode_1to175_bb0_arrayidx5_0_stall_in_NO_SHIFT_REG;
assign rnode_1to175_bb0_arrayidx5_0_valid_out_NO_SHIFT_REG = rnode_1to175_bb0_arrayidx5_0_valid_out_reg_175_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_0_stall_local;
wire local_bb0_reduction_0;

assign local_bb0_reduction_0 = (rnode_1to2_bb0_cmp_xor_0_NO_SHIFT_REG & rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb0_not_cmp_xor_vectorizex4_1_valid_out;
wire local_bb0_not_cmp_xor_vectorizex4_1_stall_in;
wire local_bb0_not_cmp_xor_vectorizex4_1_inputs_ready;
wire local_bb0_not_cmp_xor_vectorizex4_1_stall_local;
wire local_bb0_not_cmp_xor_vectorizex4_1;

assign local_bb0_not_cmp_xor_vectorizex4_1_inputs_ready = rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_1_NO_SHIFT_REG;
assign local_bb0_not_cmp_xor_vectorizex4_1 = (rnode_1to2_bb0_cmp_xor_vectorizex4_1_1_NO_SHIFT_REG ^ 1'b1);
assign local_bb0_not_cmp_xor_vectorizex4_1_valid_out = local_bb0_not_cmp_xor_vectorizex4_1_inputs_ready;
assign local_bb0_not_cmp_xor_vectorizex4_1_stall_local = local_bb0_not_cmp_xor_vectorizex4_1_stall_in;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_1_NO_SHIFT_REG = (|local_bb0_not_cmp_xor_vectorizex4_1_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_1_stall_local;
wire local_bb0_reduction_1;

assign local_bb0_reduction_1 = (rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_NO_SHIFT_REG & rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb0_not_cmp_xor_vectorizex4_3_valid_out;
wire local_bb0_not_cmp_xor_vectorizex4_3_stall_in;
wire local_bb0_not_cmp_xor_vectorizex4_3_inputs_ready;
wire local_bb0_not_cmp_xor_vectorizex4_3_stall_local;
wire local_bb0_not_cmp_xor_vectorizex4_3;

assign local_bb0_not_cmp_xor_vectorizex4_3_inputs_ready = rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_1_NO_SHIFT_REG;
assign local_bb0_not_cmp_xor_vectorizex4_3 = (rnode_1to2_bb0_cmp_xor_vectorizex4_3_1_NO_SHIFT_REG ^ 1'b1);
assign local_bb0_not_cmp_xor_vectorizex4_3_valid_out = local_bb0_not_cmp_xor_vectorizex4_3_inputs_ready;
assign local_bb0_not_cmp_xor_vectorizex4_3_stall_local = local_bb0_not_cmp_xor_vectorizex4_3_stall_in;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_1_NO_SHIFT_REG = (|local_bb0_not_cmp_xor_vectorizex4_3_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_a_bitcast_0_valid_out;
wire local_bb0_memcoalesce_a_bitcast_0_stall_in;
wire local_bb0_memcoalesce_a_bitcast_0_inputs_ready;
wire local_bb0_memcoalesce_a_bitcast_0_stall_local;
wire [63:0] local_bb0_memcoalesce_a_bitcast_0;

assign local_bb0_memcoalesce_a_bitcast_0_inputs_ready = rnode_1to2_bb0_arrayidx_0_valid_out_NO_SHIFT_REG;
assign local_bb0_memcoalesce_a_bitcast_0 = (rnode_1to2_bb0_arrayidx_0_NO_SHIFT_REG & 64'hFFFFFFFFFFFFFFF0);
assign local_bb0_memcoalesce_a_bitcast_0_valid_out = local_bb0_memcoalesce_a_bitcast_0_inputs_ready;
assign local_bb0_memcoalesce_a_bitcast_0_stall_local = local_bb0_memcoalesce_a_bitcast_0_stall_in;
assign rnode_1to2_bb0_arrayidx_0_stall_in_NO_SHIFT_REG = (|local_bb0_memcoalesce_a_bitcast_0_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_b_bitcast_0_valid_out;
wire local_bb0_memcoalesce_b_bitcast_0_stall_in;
wire local_bb0_memcoalesce_b_bitcast_0_inputs_ready;
wire local_bb0_memcoalesce_b_bitcast_0_stall_local;
wire [63:0] local_bb0_memcoalesce_b_bitcast_0;

assign local_bb0_memcoalesce_b_bitcast_0_inputs_ready = rnode_1to2_bb0_arrayidx3_0_valid_out_NO_SHIFT_REG;
assign local_bb0_memcoalesce_b_bitcast_0 = (rnode_1to2_bb0_arrayidx3_0_NO_SHIFT_REG & 64'hFFFFFFFFFFFFFFF0);
assign local_bb0_memcoalesce_b_bitcast_0_valid_out = local_bb0_memcoalesce_b_bitcast_0_inputs_ready;
assign local_bb0_memcoalesce_b_bitcast_0_stall_local = local_bb0_memcoalesce_b_bitcast_0_stall_in;
assign rnode_1to2_bb0_arrayidx3_0_stall_in_NO_SHIFT_REG = (|local_bb0_memcoalesce_b_bitcast_0_stall_local);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_175to176_bb0_arrayidx5_0_valid_out_NO_SHIFT_REG;
 logic rnode_175to176_bb0_arrayidx5_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_175to176_bb0_arrayidx5_0_NO_SHIFT_REG;
 logic rnode_175to176_bb0_arrayidx5_0_reg_176_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_175to176_bb0_arrayidx5_0_reg_176_NO_SHIFT_REG;
 logic rnode_175to176_bb0_arrayidx5_0_valid_out_reg_176_NO_SHIFT_REG;
 logic rnode_175to176_bb0_arrayidx5_0_stall_in_reg_176_NO_SHIFT_REG;
 logic rnode_175to176_bb0_arrayidx5_0_stall_out_reg_176_NO_SHIFT_REG;

acl_data_fifo rnode_175to176_bb0_arrayidx5_0_reg_176_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_175to176_bb0_arrayidx5_0_reg_176_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_175to176_bb0_arrayidx5_0_stall_in_reg_176_NO_SHIFT_REG),
	.valid_out(rnode_175to176_bb0_arrayidx5_0_valid_out_reg_176_NO_SHIFT_REG),
	.stall_out(rnode_175to176_bb0_arrayidx5_0_stall_out_reg_176_NO_SHIFT_REG),
	.data_in((rnode_1to175_bb0_arrayidx5_0_NO_SHIFT_REG & 64'hFFFFFFFFFFFFFFF0)),
	.data_out(rnode_175to176_bb0_arrayidx5_0_reg_176_NO_SHIFT_REG)
);

defparam rnode_175to176_bb0_arrayidx5_0_reg_176_fifo.DEPTH = 2;
defparam rnode_175to176_bb0_arrayidx5_0_reg_176_fifo.DATA_WIDTH = 64;
defparam rnode_175to176_bb0_arrayidx5_0_reg_176_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_175to176_bb0_arrayidx5_0_reg_176_fifo.IMPL = "ll_reg";

assign rnode_175to176_bb0_arrayidx5_0_reg_176_inputs_ready_NO_SHIFT_REG = rnode_1to175_bb0_arrayidx5_0_valid_out_NO_SHIFT_REG;
assign rnode_1to175_bb0_arrayidx5_0_stall_in_NO_SHIFT_REG = rnode_175to176_bb0_arrayidx5_0_stall_out_reg_176_NO_SHIFT_REG;
assign rnode_175to176_bb0_arrayidx5_0_NO_SHIFT_REG = rnode_175to176_bb0_arrayidx5_0_reg_176_NO_SHIFT_REG;
assign rnode_175to176_bb0_arrayidx5_0_stall_in_reg_176_NO_SHIFT_REG = rnode_175to176_bb0_arrayidx5_0_stall_in_NO_SHIFT_REG;
assign rnode_175to176_bb0_arrayidx5_0_valid_out_NO_SHIFT_REG = rnode_175to176_bb0_arrayidx5_0_valid_out_reg_176_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_2_valid_out;
wire local_bb0_reduction_2_stall_in;
wire local_bb0_reduction_2_inputs_ready;
wire local_bb0_reduction_2_stall_local;
wire local_bb0_reduction_2;
wire [3:0] rci_rcnode_2to175_rc1_bb0_cmp_xor_0_reg_2;

assign local_bb0_reduction_2_inputs_ready = (rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_valid_out_0_NO_SHIFT_REG & rnode_1to2_bb0_cmp_xor_0_valid_out_0_NO_SHIFT_REG & rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_valid_out_0_NO_SHIFT_REG & rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_0_NO_SHIFT_REG);
assign local_bb0_reduction_2 = (local_bb0_reduction_0 & local_bb0_reduction_1);
assign local_bb0_reduction_2_valid_out = local_bb0_reduction_2_inputs_ready;
assign local_bb0_reduction_2_stall_local = local_bb0_reduction_2_stall_in;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_1_0_stall_in_0_NO_SHIFT_REG = (local_bb0_reduction_2_stall_local | ~(local_bb0_reduction_2_inputs_ready));
assign rnode_1to2_bb0_cmp_xor_0_stall_in_0_NO_SHIFT_REG = (local_bb0_reduction_2_stall_local | ~(local_bb0_reduction_2_inputs_ready));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_3_0_stall_in_0_NO_SHIFT_REG = (local_bb0_reduction_2_stall_local | ~(local_bb0_reduction_2_inputs_ready));
assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_0_NO_SHIFT_REG = (local_bb0_reduction_2_stall_local | ~(local_bb0_reduction_2_inputs_ready));
assign rci_rcnode_2to175_rc1_bb0_cmp_xor_0_reg_2[0] = rnode_1to2_bb0_cmp_xor_1_NO_SHIFT_REG;
assign rci_rcnode_2to175_rc1_bb0_cmp_xor_0_reg_2[1] = local_bb0_not_cmp_xor_vectorizex4_1;
assign rci_rcnode_2to175_rc1_bb0_cmp_xor_0_reg_2[2] = rnode_1to2_bb0_cmp_xor_vectorizex4_2_1_NO_SHIFT_REG;
assign rci_rcnode_2to175_rc1_bb0_cmp_xor_0_reg_2[3] = local_bb0_not_cmp_xor_vectorizex4_3;

// Register node:
//  * latency = 173
//  * capacity = 173
 logic rcnode_2to175_rc1_bb0_cmp_xor_0_valid_out_NO_SHIFT_REG;
 logic rcnode_2to175_rc1_bb0_cmp_xor_0_stall_in_NO_SHIFT_REG;
 logic [3:0] rcnode_2to175_rc1_bb0_cmp_xor_0_NO_SHIFT_REG;
 logic rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_inputs_ready_NO_SHIFT_REG;
 logic [3:0] rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_NO_SHIFT_REG;
 logic rcnode_2to175_rc1_bb0_cmp_xor_0_valid_out_reg_175_NO_SHIFT_REG;
 logic rcnode_2to175_rc1_bb0_cmp_xor_0_stall_in_reg_175_NO_SHIFT_REG;
 logic rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_IP_NO_SHIFT_REG;
 logic rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_NO_SHIFT_REG;

acl_data_fifo rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_inputs_ready_NO_SHIFT_REG),
	.stall_in(rcnode_2to175_rc1_bb0_cmp_xor_0_stall_in_reg_175_NO_SHIFT_REG),
	.valid_out(rcnode_2to175_rc1_bb0_cmp_xor_0_valid_out_reg_175_NO_SHIFT_REG),
	.stall_out(rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_IP_NO_SHIFT_REG),
	.data_in(rci_rcnode_2to175_rc1_bb0_cmp_xor_0_reg_2),
	.data_out(rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_NO_SHIFT_REG)
);

defparam rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_fifo.DEPTH = 174;
defparam rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_fifo.DATA_WIDTH = 4;
defparam rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_fifo.ALLOW_FULL_WRITE = 0;
defparam rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_fifo.IMPL = "ram";

assign rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_inputs_ready_NO_SHIFT_REG = (rnode_1to2_bb0_cmp_xor_0_valid_out_1_NO_SHIFT_REG & local_bb0_not_cmp_xor_vectorizex4_1_valid_out & rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_valid_out_1_NO_SHIFT_REG & local_bb0_not_cmp_xor_vectorizex4_3_valid_out);
assign rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_NO_SHIFT_REG = (~(rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_inputs_ready_NO_SHIFT_REG) | rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_IP_NO_SHIFT_REG);
assign rnode_1to2_bb0_cmp_xor_0_stall_in_1_NO_SHIFT_REG = rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_NO_SHIFT_REG;
assign local_bb0_not_cmp_xor_vectorizex4_1_stall_in = rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_NO_SHIFT_REG;
assign rnode_1to2_bb0_cmp_xor_vectorizex4_2_0_stall_in_1_NO_SHIFT_REG = rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_NO_SHIFT_REG;
assign local_bb0_not_cmp_xor_vectorizex4_3_stall_in = rcnode_2to175_rc1_bb0_cmp_xor_0_stall_out_0_reg_175_NO_SHIFT_REG;
assign rcnode_2to175_rc1_bb0_cmp_xor_0_NO_SHIFT_REG = rcnode_2to175_rc1_bb0_cmp_xor_0_reg_175_NO_SHIFT_REG;
assign rcnode_2to175_rc1_bb0_cmp_xor_0_stall_in_reg_175_NO_SHIFT_REG = rcnode_2to175_rc1_bb0_cmp_xor_0_stall_in_NO_SHIFT_REG;
assign rcnode_2to175_rc1_bb0_cmp_xor_0_valid_out_NO_SHIFT_REG = rcnode_2to175_rc1_bb0_cmp_xor_0_valid_out_reg_175_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_result_bitcast_0_valid_out;
wire local_bb0_memcoalesce_result_bitcast_0_stall_in;
wire local_bb0_memcoalesce_result_bitcast_0_inputs_ready;
wire local_bb0_memcoalesce_result_bitcast_0_stall_local;
wire [63:0] local_bb0_memcoalesce_result_bitcast_0;

assign local_bb0_memcoalesce_result_bitcast_0_inputs_ready = rnode_175to176_bb0_arrayidx5_0_valid_out_NO_SHIFT_REG;
assign local_bb0_memcoalesce_result_bitcast_0 = (rnode_175to176_bb0_arrayidx5_0_NO_SHIFT_REG & 64'hFFFFFFFFFFFFFFF0);
assign local_bb0_memcoalesce_result_bitcast_0_valid_out = local_bb0_memcoalesce_result_bitcast_0_inputs_ready;
assign local_bb0_memcoalesce_result_bitcast_0_stall_local = local_bb0_memcoalesce_result_bitcast_0_stall_in;
assign rnode_175to176_bb0_arrayidx5_0_stall_in_NO_SHIFT_REG = (|local_bb0_memcoalesce_result_bitcast_0_stall_local);

// This section implements a staging register.
// 
wire rstag_2to2_bb0_reduction_2_valid_out_0;
wire rstag_2to2_bb0_reduction_2_stall_in_0;
wire rstag_2to2_bb0_reduction_2_valid_out_1;
wire rstag_2to2_bb0_reduction_2_stall_in_1;
wire rstag_2to2_bb0_reduction_2_valid_out_2;
wire rstag_2to2_bb0_reduction_2_stall_in_2;
wire rstag_2to2_bb0_reduction_2_inputs_ready;
wire rstag_2to2_bb0_reduction_2_stall_local;
 reg rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG;
wire rstag_2to2_bb0_reduction_2_combined_valid;
 reg rstag_2to2_bb0_reduction_2_staging_reg_NO_SHIFT_REG;
wire rstag_2to2_bb0_reduction_2;
 reg rstag_2to2_bb0_reduction_2_consumed_0_NO_SHIFT_REG;
 reg rstag_2to2_bb0_reduction_2_consumed_1_NO_SHIFT_REG;
 reg rstag_2to2_bb0_reduction_2_consumed_2_NO_SHIFT_REG;
wire [3:0] rci_rcnode_175to176_rc0_bb0_cmp_xor_0_reg_175;

assign rstag_2to2_bb0_reduction_2_inputs_ready = local_bb0_reduction_2_valid_out;
assign rstag_2to2_bb0_reduction_2 = (rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG ? rstag_2to2_bb0_reduction_2_staging_reg_NO_SHIFT_REG : local_bb0_reduction_2);
assign rstag_2to2_bb0_reduction_2_combined_valid = (rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG | rstag_2to2_bb0_reduction_2_inputs_ready);
assign rstag_2to2_bb0_reduction_2_stall_local = ((rstag_2to2_bb0_reduction_2_stall_in_0 & ~(rstag_2to2_bb0_reduction_2_consumed_0_NO_SHIFT_REG)) | (rstag_2to2_bb0_reduction_2_stall_in_1 & ~(rstag_2to2_bb0_reduction_2_consumed_1_NO_SHIFT_REG)) | (rstag_2to2_bb0_reduction_2_stall_in_2 & ~(rstag_2to2_bb0_reduction_2_consumed_2_NO_SHIFT_REG)));
assign rstag_2to2_bb0_reduction_2_valid_out_0 = (rstag_2to2_bb0_reduction_2_combined_valid & ~(rstag_2to2_bb0_reduction_2_consumed_0_NO_SHIFT_REG));
assign rstag_2to2_bb0_reduction_2_valid_out_1 = (rstag_2to2_bb0_reduction_2_combined_valid & ~(rstag_2to2_bb0_reduction_2_consumed_1_NO_SHIFT_REG));
assign rstag_2to2_bb0_reduction_2_valid_out_2 = (rstag_2to2_bb0_reduction_2_combined_valid & ~(rstag_2to2_bb0_reduction_2_consumed_2_NO_SHIFT_REG));
assign local_bb0_reduction_2_stall_in = (|rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG);
assign rci_rcnode_175to176_rc0_bb0_cmp_xor_0_reg_175[0] = rcnode_2to175_rc1_bb0_cmp_xor_0_NO_SHIFT_REG[0];
assign rci_rcnode_175to176_rc0_bb0_cmp_xor_0_reg_175[1] = rcnode_2to175_rc1_bb0_cmp_xor_0_NO_SHIFT_REG[1];
assign rci_rcnode_175to176_rc0_bb0_cmp_xor_0_reg_175[2] = rcnode_2to175_rc1_bb0_cmp_xor_0_NO_SHIFT_REG[2];
assign rci_rcnode_175to176_rc0_bb0_cmp_xor_0_reg_175[3] = rcnode_2to175_rc1_bb0_cmp_xor_0_NO_SHIFT_REG[3];

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb0_reduction_2_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_2to2_bb0_reduction_2_stall_local)
		begin
			if (~(rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG))
			begin
				rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG <= rstag_2to2_bb0_reduction_2_inputs_ready;
			end
		end
		else
		begin
			rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_2to2_bb0_reduction_2_staging_valid_NO_SHIFT_REG))
		begin
			rstag_2to2_bb0_reduction_2_staging_reg_NO_SHIFT_REG <= local_bb0_reduction_2;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb0_reduction_2_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb0_reduction_2_consumed_1_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb0_reduction_2_consumed_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rstag_2to2_bb0_reduction_2_consumed_0_NO_SHIFT_REG <= (rstag_2to2_bb0_reduction_2_combined_valid & (rstag_2to2_bb0_reduction_2_consumed_0_NO_SHIFT_REG | ~(rstag_2to2_bb0_reduction_2_stall_in_0)) & rstag_2to2_bb0_reduction_2_stall_local);
		rstag_2to2_bb0_reduction_2_consumed_1_NO_SHIFT_REG <= (rstag_2to2_bb0_reduction_2_combined_valid & (rstag_2to2_bb0_reduction_2_consumed_1_NO_SHIFT_REG | ~(rstag_2to2_bb0_reduction_2_stall_in_1)) & rstag_2to2_bb0_reduction_2_stall_local);
		rstag_2to2_bb0_reduction_2_consumed_2_NO_SHIFT_REG <= (rstag_2to2_bb0_reduction_2_combined_valid & (rstag_2to2_bb0_reduction_2_consumed_2_NO_SHIFT_REG | ~(rstag_2to2_bb0_reduction_2_stall_in_2)) & rstag_2to2_bb0_reduction_2_stall_local);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_0_NO_SHIFT_REG;
 logic [3:0] rcnode_175to176_rc0_bb0_cmp_xor_0_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_1_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_1_NO_SHIFT_REG;
 logic [3:0] rcnode_175to176_rc0_bb0_cmp_xor_1_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_2_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_2_NO_SHIFT_REG;
 logic [3:0] rcnode_175to176_rc0_bb0_cmp_xor_2_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_3_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_3_NO_SHIFT_REG;
 logic [3:0] rcnode_175to176_rc0_bb0_cmp_xor_3_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_inputs_ready_NO_SHIFT_REG;
 logic [3:0] rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_reg_176_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_0_reg_176_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_stall_out_reg_176_IP_NO_SHIFT_REG;
 logic rcnode_175to176_rc0_bb0_cmp_xor_0_stall_out_reg_176_NO_SHIFT_REG;

acl_data_fifo rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_inputs_ready_NO_SHIFT_REG),
	.stall_in(rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_0_reg_176_NO_SHIFT_REG),
	.valid_out(rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_reg_176_NO_SHIFT_REG),
	.stall_out(rcnode_175to176_rc0_bb0_cmp_xor_0_stall_out_reg_176_IP_NO_SHIFT_REG),
	.data_in(rci_rcnode_175to176_rc0_bb0_cmp_xor_0_reg_175),
	.data_out(rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_NO_SHIFT_REG)
);

defparam rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_fifo.DEPTH = 2;
defparam rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_fifo.DATA_WIDTH = 4;
defparam rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_fifo.ALLOW_FULL_WRITE = 0;
defparam rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_fifo.IMPL = "ll_reg";

assign rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_inputs_ready_NO_SHIFT_REG = rcnode_2to175_rc1_bb0_cmp_xor_0_valid_out_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_0_stall_out_reg_176_NO_SHIFT_REG = (~(rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_inputs_ready_NO_SHIFT_REG) | rcnode_175to176_rc0_bb0_cmp_xor_0_stall_out_reg_176_IP_NO_SHIFT_REG);
assign rcnode_2to175_rc1_bb0_cmp_xor_0_stall_in_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_stall_out_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_0_reg_176_NO_SHIFT_REG = (rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_0_NO_SHIFT_REG | rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_1_NO_SHIFT_REG | rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_2_NO_SHIFT_REG | rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_3_NO_SHIFT_REG);
assign rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_1_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_2_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_3_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_0_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_1_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_2_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_NO_SHIFT_REG;
assign rcnode_175to176_rc0_bb0_cmp_xor_3_NO_SHIFT_REG = rcnode_175to176_rc0_bb0_cmp_xor_0_reg_176_NO_SHIFT_REG;

// Register node:
//  * latency = 173
//  * capacity = 173
 logic rnode_2to175_bb0_reduction_2_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to175_bb0_reduction_2_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to175_bb0_reduction_2_0_NO_SHIFT_REG;
 logic rnode_2to175_bb0_reduction_2_0_reg_175_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to175_bb0_reduction_2_0_reg_175_NO_SHIFT_REG;
 logic rnode_2to175_bb0_reduction_2_0_valid_out_reg_175_NO_SHIFT_REG;
 logic rnode_2to175_bb0_reduction_2_0_stall_in_reg_175_NO_SHIFT_REG;
 logic rnode_2to175_bb0_reduction_2_0_stall_out_reg_175_NO_SHIFT_REG;

acl_data_fifo rnode_2to175_bb0_reduction_2_0_reg_175_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to175_bb0_reduction_2_0_reg_175_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to175_bb0_reduction_2_0_stall_in_reg_175_NO_SHIFT_REG),
	.valid_out(rnode_2to175_bb0_reduction_2_0_valid_out_reg_175_NO_SHIFT_REG),
	.stall_out(rnode_2to175_bb0_reduction_2_0_stall_out_reg_175_NO_SHIFT_REG),
	.data_in(rstag_2to2_bb0_reduction_2),
	.data_out(rnode_2to175_bb0_reduction_2_0_reg_175_NO_SHIFT_REG)
);

defparam rnode_2to175_bb0_reduction_2_0_reg_175_fifo.DEPTH = 174;
defparam rnode_2to175_bb0_reduction_2_0_reg_175_fifo.DATA_WIDTH = 1;
defparam rnode_2to175_bb0_reduction_2_0_reg_175_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_2to175_bb0_reduction_2_0_reg_175_fifo.IMPL = "ram";

assign rnode_2to175_bb0_reduction_2_0_reg_175_inputs_ready_NO_SHIFT_REG = rstag_2to2_bb0_reduction_2_valid_out_0;
assign rstag_2to2_bb0_reduction_2_stall_in_0 = rnode_2to175_bb0_reduction_2_0_stall_out_reg_175_NO_SHIFT_REG;
assign rnode_2to175_bb0_reduction_2_0_NO_SHIFT_REG = rnode_2to175_bb0_reduction_2_0_reg_175_NO_SHIFT_REG;
assign rnode_2to175_bb0_reduction_2_0_stall_in_reg_175_NO_SHIFT_REG = rnode_2to175_bb0_reduction_2_0_stall_in_NO_SHIFT_REG;
assign rnode_2to175_bb0_reduction_2_0_valid_out_NO_SHIFT_REG = rnode_2to175_bb0_reduction_2_0_valid_out_reg_175_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire local_bb0_ld_memcoalesce_b_load_0_inputs_ready;
 reg local_bb0_ld_memcoalesce_b_load_0_valid_out_NO_SHIFT_REG;
wire local_bb0_ld_memcoalesce_b_load_0_stall_in;
wire local_bb0_ld_memcoalesce_b_load_0_output_regs_ready;
wire local_bb0_ld_memcoalesce_b_load_0_fu_stall_out;
wire local_bb0_ld_memcoalesce_b_load_0_fu_valid_out;
wire [127:0] local_bb0_ld_memcoalesce_b_load_0_lsu_dataout;
 reg [127:0] local_bb0_ld_memcoalesce_b_load_0_NO_SHIFT_REG;
wire local_bb0_ld_memcoalesce_b_load_0_causedstall;

lsu_top lsu_local_bb0_ld_memcoalesce_b_load_0 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb0_ld_memcoalesce_b_load_0_fu_stall_out),
	.i_valid(local_bb0_ld_memcoalesce_b_load_0_inputs_ready),
	.i_address((local_bb0_memcoalesce_b_bitcast_0 & 64'hFFFFFFFFFFFFFFF0)),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(rstag_2to2_bb0_reduction_2),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb0_ld_memcoalesce_b_load_0_output_regs_ready)),
	.o_valid(local_bb0_ld_memcoalesce_b_load_0_fu_valid_out),
	.o_readdata(local_bb0_ld_memcoalesce_b_load_0_lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_ld_memcoalesce_b_load_0_active),
	.avm_address(avm_local_bb0_ld_memcoalesce_b_load_0_address),
	.avm_read(avm_local_bb0_ld_memcoalesce_b_load_0_read),
	.avm_enable(avm_local_bb0_ld_memcoalesce_b_load_0_enable),
	.avm_readdata(avm_local_bb0_ld_memcoalesce_b_load_0_readdata),
	.avm_write(avm_local_bb0_ld_memcoalesce_b_load_0_write),
	.avm_writeack(avm_local_bb0_ld_memcoalesce_b_load_0_writeack),
	.avm_burstcount(avm_local_bb0_ld_memcoalesce_b_load_0_burstcount),
	.avm_writedata(avm_local_bb0_ld_memcoalesce_b_load_0_writedata),
	.avm_byteenable(avm_local_bb0_ld_memcoalesce_b_load_0_byteenable),
	.avm_waitrequest(avm_local_bb0_ld_memcoalesce_b_load_0_waitrequest),
	.avm_readdatavalid(avm_local_bb0_ld_memcoalesce_b_load_0_readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb0_ld_memcoalesce_b_load_0.AWIDTH = 32;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.WIDTH_BYTES = 16;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.MWIDTH_BYTES = 64;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.WRITEDATAWIDTH_BYTES = 64;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.ALIGNMENT_BYTES = 16;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.READ = 1;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.ATOMIC = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.WIDTH = 128;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.MWIDTH = 512;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.KERNEL_SIDE_MEM_LATENCY = 160;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.MEMORY_SIDE_MEM_LATENCY = 99;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.NUMBER_BANKS = 1;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.USEINPUTFIFO = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.USECACHING = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.ADDRSPACE = 1;
defparam lsu_local_bb0_ld_memcoalesce_b_load_0.STYLE = "BURST-COALESCED";

assign local_bb0_ld_memcoalesce_b_load_0_inputs_ready = (local_bb0_memcoalesce_b_bitcast_0_valid_out & rstag_2to2_bb0_reduction_2_valid_out_1);
assign local_bb0_ld_memcoalesce_b_load_0_output_regs_ready = (&(~(local_bb0_ld_memcoalesce_b_load_0_valid_out_NO_SHIFT_REG) | ~(local_bb0_ld_memcoalesce_b_load_0_stall_in)));
assign local_bb0_memcoalesce_b_bitcast_0_stall_in = (local_bb0_ld_memcoalesce_b_load_0_fu_stall_out | ~(local_bb0_ld_memcoalesce_b_load_0_inputs_ready));
assign rstag_2to2_bb0_reduction_2_stall_in_1 = (local_bb0_ld_memcoalesce_b_load_0_fu_stall_out | ~(local_bb0_ld_memcoalesce_b_load_0_inputs_ready));
assign local_bb0_ld_memcoalesce_b_load_0_causedstall = (local_bb0_ld_memcoalesce_b_load_0_inputs_ready && (local_bb0_ld_memcoalesce_b_load_0_fu_stall_out && !(~(local_bb0_ld_memcoalesce_b_load_0_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld_memcoalesce_b_load_0_NO_SHIFT_REG <= 'x;
		local_bb0_ld_memcoalesce_b_load_0_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_ld_memcoalesce_b_load_0_output_regs_ready)
		begin
			local_bb0_ld_memcoalesce_b_load_0_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_b_load_0_lsu_dataout;
			local_bb0_ld_memcoalesce_b_load_0_valid_out_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_b_load_0_fu_valid_out;
		end
		else
		begin
			if (~(local_bb0_ld_memcoalesce_b_load_0_stall_in))
			begin
				local_bb0_ld_memcoalesce_b_load_0_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_ld_memcoalesce_a_load_0_inputs_ready;
 reg local_bb0_ld_memcoalesce_a_load_0_valid_out_NO_SHIFT_REG;
wire local_bb0_ld_memcoalesce_a_load_0_stall_in;
wire local_bb0_ld_memcoalesce_a_load_0_output_regs_ready;
wire local_bb0_ld_memcoalesce_a_load_0_fu_stall_out;
wire local_bb0_ld_memcoalesce_a_load_0_fu_valid_out;
wire [127:0] local_bb0_ld_memcoalesce_a_load_0_lsu_dataout;
 reg [127:0] local_bb0_ld_memcoalesce_a_load_0_NO_SHIFT_REG;
wire local_bb0_ld_memcoalesce_a_load_0_causedstall;

lsu_top lsu_local_bb0_ld_memcoalesce_a_load_0 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb0_ld_memcoalesce_a_load_0_fu_stall_out),
	.i_valid(local_bb0_ld_memcoalesce_a_load_0_inputs_ready),
	.i_address((local_bb0_memcoalesce_a_bitcast_0 & 64'hFFFFFFFFFFFFFFF0)),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(rstag_2to2_bb0_reduction_2),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb0_ld_memcoalesce_a_load_0_output_regs_ready)),
	.o_valid(local_bb0_ld_memcoalesce_a_load_0_fu_valid_out),
	.o_readdata(local_bb0_ld_memcoalesce_a_load_0_lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_ld_memcoalesce_a_load_0_active),
	.avm_address(avm_local_bb0_ld_memcoalesce_a_load_0_address),
	.avm_read(avm_local_bb0_ld_memcoalesce_a_load_0_read),
	.avm_enable(avm_local_bb0_ld_memcoalesce_a_load_0_enable),
	.avm_readdata(avm_local_bb0_ld_memcoalesce_a_load_0_readdata),
	.avm_write(avm_local_bb0_ld_memcoalesce_a_load_0_write),
	.avm_writeack(avm_local_bb0_ld_memcoalesce_a_load_0_writeack),
	.avm_burstcount(avm_local_bb0_ld_memcoalesce_a_load_0_burstcount),
	.avm_writedata(avm_local_bb0_ld_memcoalesce_a_load_0_writedata),
	.avm_byteenable(avm_local_bb0_ld_memcoalesce_a_load_0_byteenable),
	.avm_waitrequest(avm_local_bb0_ld_memcoalesce_a_load_0_waitrequest),
	.avm_readdatavalid(avm_local_bb0_ld_memcoalesce_a_load_0_readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb0_ld_memcoalesce_a_load_0.AWIDTH = 32;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.WIDTH_BYTES = 16;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.MWIDTH_BYTES = 64;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.WRITEDATAWIDTH_BYTES = 64;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.ALIGNMENT_BYTES = 16;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.READ = 1;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.ATOMIC = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.WIDTH = 128;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.MWIDTH = 512;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.KERNEL_SIDE_MEM_LATENCY = 160;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.MEMORY_SIDE_MEM_LATENCY = 99;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.NUMBER_BANKS = 1;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.USEINPUTFIFO = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.USECACHING = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.ADDRSPACE = 1;
defparam lsu_local_bb0_ld_memcoalesce_a_load_0.STYLE = "BURST-COALESCED";

assign local_bb0_ld_memcoalesce_a_load_0_inputs_ready = (local_bb0_memcoalesce_a_bitcast_0_valid_out & rstag_2to2_bb0_reduction_2_valid_out_2);
assign local_bb0_ld_memcoalesce_a_load_0_output_regs_ready = (&(~(local_bb0_ld_memcoalesce_a_load_0_valid_out_NO_SHIFT_REG) | ~(local_bb0_ld_memcoalesce_a_load_0_stall_in)));
assign local_bb0_memcoalesce_a_bitcast_0_stall_in = (local_bb0_ld_memcoalesce_a_load_0_fu_stall_out | ~(local_bb0_ld_memcoalesce_a_load_0_inputs_ready));
assign rstag_2to2_bb0_reduction_2_stall_in_2 = (local_bb0_ld_memcoalesce_a_load_0_fu_stall_out | ~(local_bb0_ld_memcoalesce_a_load_0_inputs_ready));
assign local_bb0_ld_memcoalesce_a_load_0_causedstall = (local_bb0_ld_memcoalesce_a_load_0_inputs_ready && (local_bb0_ld_memcoalesce_a_load_0_fu_stall_out && !(~(local_bb0_ld_memcoalesce_a_load_0_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld_memcoalesce_a_load_0_NO_SHIFT_REG <= 'x;
		local_bb0_ld_memcoalesce_a_load_0_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_ld_memcoalesce_a_load_0_output_regs_ready)
		begin
			local_bb0_ld_memcoalesce_a_load_0_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_a_load_0_lsu_dataout;
			local_bb0_ld_memcoalesce_a_load_0_valid_out_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_a_load_0_fu_valid_out;
		end
		else
		begin
			if (~(local_bb0_ld_memcoalesce_a_load_0_stall_in))
			begin
				local_bb0_ld_memcoalesce_a_load_0_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_not_cmp_xor_stall_local;
wire local_bb0_not_cmp_xor;

assign local_bb0_not_cmp_xor = (rcnode_175to176_rc0_bb0_cmp_xor_0_NO_SHIFT_REG[0] ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb0_not_cmp_xor_vectorizex4_2_stall_local;
wire local_bb0_not_cmp_xor_vectorizex4_2;

assign local_bb0_not_cmp_xor_vectorizex4_2 = (rcnode_175to176_rc0_bb0_cmp_xor_0_NO_SHIFT_REG[2] ^ 1'b1);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_175to176_bb0_reduction_2_0_valid_out_NO_SHIFT_REG;
 logic rnode_175to176_bb0_reduction_2_0_stall_in_NO_SHIFT_REG;
 logic rnode_175to176_bb0_reduction_2_0_NO_SHIFT_REG;
 logic rnode_175to176_bb0_reduction_2_0_reg_176_inputs_ready_NO_SHIFT_REG;
 logic rnode_175to176_bb0_reduction_2_0_reg_176_NO_SHIFT_REG;
 logic rnode_175to176_bb0_reduction_2_0_valid_out_reg_176_NO_SHIFT_REG;
 logic rnode_175to176_bb0_reduction_2_0_stall_in_reg_176_NO_SHIFT_REG;
 logic rnode_175to176_bb0_reduction_2_0_stall_out_reg_176_NO_SHIFT_REG;

acl_data_fifo rnode_175to176_bb0_reduction_2_0_reg_176_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_175to176_bb0_reduction_2_0_reg_176_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_175to176_bb0_reduction_2_0_stall_in_reg_176_NO_SHIFT_REG),
	.valid_out(rnode_175to176_bb0_reduction_2_0_valid_out_reg_176_NO_SHIFT_REG),
	.stall_out(rnode_175to176_bb0_reduction_2_0_stall_out_reg_176_NO_SHIFT_REG),
	.data_in(rnode_2to175_bb0_reduction_2_0_NO_SHIFT_REG),
	.data_out(rnode_175to176_bb0_reduction_2_0_reg_176_NO_SHIFT_REG)
);

defparam rnode_175to176_bb0_reduction_2_0_reg_176_fifo.DEPTH = 2;
defparam rnode_175to176_bb0_reduction_2_0_reg_176_fifo.DATA_WIDTH = 1;
defparam rnode_175to176_bb0_reduction_2_0_reg_176_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_175to176_bb0_reduction_2_0_reg_176_fifo.IMPL = "ll_reg";

assign rnode_175to176_bb0_reduction_2_0_reg_176_inputs_ready_NO_SHIFT_REG = rnode_2to175_bb0_reduction_2_0_valid_out_NO_SHIFT_REG;
assign rnode_2to175_bb0_reduction_2_0_stall_in_NO_SHIFT_REG = rnode_175to176_bb0_reduction_2_0_stall_out_reg_176_NO_SHIFT_REG;
assign rnode_175to176_bb0_reduction_2_0_NO_SHIFT_REG = rnode_175to176_bb0_reduction_2_0_reg_176_NO_SHIFT_REG;
assign rnode_175to176_bb0_reduction_2_0_stall_in_reg_176_NO_SHIFT_REG = rnode_175to176_bb0_reduction_2_0_stall_in_NO_SHIFT_REG;
assign rnode_175to176_bb0_reduction_2_0_valid_out_NO_SHIFT_REG = rnode_175to176_bb0_reduction_2_0_valid_out_reg_176_NO_SHIFT_REG;

// This section implements a staging register.
// 
wire rstag_162to162_bb0_ld_memcoalesce_b_load_0_valid_out;
wire rstag_162to162_bb0_ld_memcoalesce_b_load_0_stall_in;
wire rstag_162to162_bb0_ld_memcoalesce_b_load_0_inputs_ready;
wire rstag_162to162_bb0_ld_memcoalesce_b_load_0_stall_local;
 reg rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG;
wire rstag_162to162_bb0_ld_memcoalesce_b_load_0_combined_valid;
 reg [127:0] rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_reg_NO_SHIFT_REG;
wire [127:0] rstag_162to162_bb0_ld_memcoalesce_b_load_0;

assign rstag_162to162_bb0_ld_memcoalesce_b_load_0_inputs_ready = local_bb0_ld_memcoalesce_b_load_0_valid_out_NO_SHIFT_REG;
assign rstag_162to162_bb0_ld_memcoalesce_b_load_0 = (rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG ? rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_reg_NO_SHIFT_REG : local_bb0_ld_memcoalesce_b_load_0_NO_SHIFT_REG);
assign rstag_162to162_bb0_ld_memcoalesce_b_load_0_combined_valid = (rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG | rstag_162to162_bb0_ld_memcoalesce_b_load_0_inputs_ready);
assign rstag_162to162_bb0_ld_memcoalesce_b_load_0_valid_out = rstag_162to162_bb0_ld_memcoalesce_b_load_0_combined_valid;
assign rstag_162to162_bb0_ld_memcoalesce_b_load_0_stall_local = rstag_162to162_bb0_ld_memcoalesce_b_load_0_stall_in;
assign local_bb0_ld_memcoalesce_b_load_0_stall_in = (|rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_162to162_bb0_ld_memcoalesce_b_load_0_stall_local)
		begin
			if (~(rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG))
			begin
				rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG <= rstag_162to162_bb0_ld_memcoalesce_b_load_0_inputs_ready;
			end
		end
		else
		begin
			rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_valid_NO_SHIFT_REG))
		begin
			rstag_162to162_bb0_ld_memcoalesce_b_load_0_staging_reg_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_b_load_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a staging register.
// 
wire rstag_162to162_bb0_ld_memcoalesce_a_load_0_valid_out;
wire rstag_162to162_bb0_ld_memcoalesce_a_load_0_stall_in;
wire rstag_162to162_bb0_ld_memcoalesce_a_load_0_inputs_ready;
wire rstag_162to162_bb0_ld_memcoalesce_a_load_0_stall_local;
 reg rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG;
wire rstag_162to162_bb0_ld_memcoalesce_a_load_0_combined_valid;
 reg [127:0] rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_reg_NO_SHIFT_REG;
wire [127:0] rstag_162to162_bb0_ld_memcoalesce_a_load_0;

assign rstag_162to162_bb0_ld_memcoalesce_a_load_0_inputs_ready = local_bb0_ld_memcoalesce_a_load_0_valid_out_NO_SHIFT_REG;
assign rstag_162to162_bb0_ld_memcoalesce_a_load_0 = (rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG ? rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_reg_NO_SHIFT_REG : local_bb0_ld_memcoalesce_a_load_0_NO_SHIFT_REG);
assign rstag_162to162_bb0_ld_memcoalesce_a_load_0_combined_valid = (rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG | rstag_162to162_bb0_ld_memcoalesce_a_load_0_inputs_ready);
assign rstag_162to162_bb0_ld_memcoalesce_a_load_0_valid_out = rstag_162to162_bb0_ld_memcoalesce_a_load_0_combined_valid;
assign rstag_162to162_bb0_ld_memcoalesce_a_load_0_stall_local = rstag_162to162_bb0_ld_memcoalesce_a_load_0_stall_in;
assign local_bb0_ld_memcoalesce_a_load_0_stall_in = (|rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_162to162_bb0_ld_memcoalesce_a_load_0_stall_local)
		begin
			if (~(rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG))
			begin
				rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG <= rstag_162to162_bb0_ld_memcoalesce_a_load_0_inputs_ready;
			end
		end
		else
		begin
			rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_valid_NO_SHIFT_REG))
		begin
			rstag_162to162_bb0_ld_memcoalesce_a_load_0_staging_reg_NO_SHIFT_REG <= local_bb0_ld_memcoalesce_a_load_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_reduction_8_vec_0_stall_local;
wire [3:0] local_bb0_reduction_8_vec_0;

assign local_bb0_reduction_8_vec_0[0] = local_bb0_not_cmp_xor;
assign local_bb0_reduction_8_vec_0[1] = 1'bx;
assign local_bb0_reduction_8_vec_0[2] = 1'bx;
assign local_bb0_reduction_8_vec_0[3] = 1'bx;

// This section implements an unregistered operation.
// 
wire local_bb0_c0_eni1_stall_local;
wire [263:0] local_bb0_c0_eni1;

assign local_bb0_c0_eni1[7:0] = 8'bx;
assign local_bb0_c0_eni1[135:8] = rstag_162to162_bb0_ld_memcoalesce_a_load_0;
assign local_bb0_c0_eni1[263:136] = 128'bx;

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_8_vec_1_stall_local;
wire [3:0] local_bb0_reduction_8_vec_1;

assign local_bb0_reduction_8_vec_1[0] = local_bb0_reduction_8_vec_0[0];
assign local_bb0_reduction_8_vec_1[1] = rcnode_175to176_rc0_bb0_cmp_xor_0_NO_SHIFT_REG[1];
assign local_bb0_reduction_8_vec_1[2] = local_bb0_reduction_8_vec_0[2];
assign local_bb0_reduction_8_vec_1[3] = local_bb0_reduction_8_vec_0[3];

// This section implements an unregistered operation.
// 
wire local_bb0_c0_eni2_valid_out;
wire local_bb0_c0_eni2_stall_in;
wire local_bb0_c0_eni2_inputs_ready;
wire local_bb0_c0_eni2_stall_local;
wire [263:0] local_bb0_c0_eni2;

assign local_bb0_c0_eni2_inputs_ready = (rstag_162to162_bb0_ld_memcoalesce_a_load_0_valid_out & rstag_162to162_bb0_ld_memcoalesce_b_load_0_valid_out);
assign local_bb0_c0_eni2[135:0] = local_bb0_c0_eni1[135:0];
assign local_bb0_c0_eni2[263:136] = rstag_162to162_bb0_ld_memcoalesce_b_load_0;
assign local_bb0_c0_eni2_valid_out = local_bb0_c0_eni2_inputs_ready;
assign local_bb0_c0_eni2_stall_local = local_bb0_c0_eni2_stall_in;
assign rstag_162to162_bb0_ld_memcoalesce_a_load_0_stall_in = (local_bb0_c0_eni2_stall_local | ~(local_bb0_c0_eni2_inputs_ready));
assign rstag_162to162_bb0_ld_memcoalesce_b_load_0_stall_in = (local_bb0_c0_eni2_stall_local | ~(local_bb0_c0_eni2_inputs_ready));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_8_vec_2_stall_local;
wire [3:0] local_bb0_reduction_8_vec_2;

assign local_bb0_reduction_8_vec_2[0] = local_bb0_reduction_8_vec_1[0];
assign local_bb0_reduction_8_vec_2[1] = local_bb0_reduction_8_vec_1[1];
assign local_bb0_reduction_8_vec_2[2] = local_bb0_not_cmp_xor_vectorizex4_2;
assign local_bb0_reduction_8_vec_2[3] = local_bb0_reduction_8_vec_1[3];

// This section implements a registered operation.
// 
wire local_bb0_c0_enter_c0_eni2_inputs_ready;
 reg local_bb0_c0_enter_c0_eni2_valid_out_0_NO_SHIFT_REG;
wire local_bb0_c0_enter_c0_eni2_stall_in_0;
 reg local_bb0_c0_enter_c0_eni2_valid_out_1_NO_SHIFT_REG;
wire local_bb0_c0_enter_c0_eni2_stall_in_1;
 reg local_bb0_c0_enter_c0_eni2_valid_out_2_NO_SHIFT_REG;
wire local_bb0_c0_enter_c0_eni2_stall_in_2;
wire local_bb0_c0_enter_c0_eni2_output_regs_ready;
 reg [263:0] local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG;
wire local_bb0_c0_enter_c0_eni2_input_accepted;
 reg local_bb0_c0_enter_c0_eni2_valid_bit_NO_SHIFT_REG;
wire local_bb0_c0_exit_c0_exi1_entry_stall;
wire local_bb0_c0_exit_c0_exi1_output_regs_ready;
wire local_bb0_c0_exit_c0_exi1_valid_in;
wire local_bb0_c0_exit_c0_exi1_phases;
wire local_bb0_c0_enter_c0_eni2_inc_pipelined_thread;
wire local_bb0_c0_enter_c0_eni2_dec_pipelined_thread;
wire local_bb0_c0_enter_c0_eni2_causedstall;

assign local_bb0_c0_enter_c0_eni2_inputs_ready = local_bb0_c0_eni2_valid_out;
assign local_bb0_c0_enter_c0_eni2_output_regs_ready = 1'b1;
assign local_bb0_c0_enter_c0_eni2_input_accepted = (local_bb0_c0_enter_c0_eni2_inputs_ready && !(local_bb0_c0_exit_c0_exi1_entry_stall));
assign local_bb0_c0_enter_c0_eni2_inc_pipelined_thread = 1'b1;
assign local_bb0_c0_enter_c0_eni2_dec_pipelined_thread = ~(1'b0);
assign local_bb0_c0_eni2_stall_in = ((~(local_bb0_c0_enter_c0_eni2_inputs_ready) | local_bb0_c0_exit_c0_exi1_entry_stall) | ~(1'b1));
assign local_bb0_c0_enter_c0_eni2_causedstall = (1'b1 && ((~(local_bb0_c0_enter_c0_eni2_inputs_ready) | local_bb0_c0_exit_c0_exi1_entry_stall) && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_c0_enter_c0_eni2_valid_bit_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		local_bb0_c0_enter_c0_eni2_valid_bit_NO_SHIFT_REG <= local_bb0_c0_enter_c0_eni2_input_accepted;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG <= 'x;
		local_bb0_c0_enter_c0_eni2_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_c0_enter_c0_eni2_valid_out_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_c0_enter_c0_eni2_output_regs_ready)
		begin
			local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG <= local_bb0_c0_eni2;
			local_bb0_c0_enter_c0_eni2_valid_out_0_NO_SHIFT_REG <= 1'b1;
			local_bb0_c0_enter_c0_eni2_valid_out_2_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb0_c0_enter_c0_eni2_stall_in_0))
			begin
				local_bb0_c0_enter_c0_eni2_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb0_c0_enter_c0_eni2_stall_in_2))
			begin
				local_bb0_c0_enter_c0_eni2_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	local_bb0_c0_enter_c0_eni2_valid_out_1_NO_SHIFT_REG = local_bb0_c0_enter_c0_eni2_valid_out_0_NO_SHIFT_REG;
end


// This section implements an unregistered operation.
// 
wire local_bb0_reduction_8_vec_3_stall_local;
wire [3:0] local_bb0_reduction_8_vec_3;

assign local_bb0_reduction_8_vec_3[0] = local_bb0_reduction_8_vec_2[0];
assign local_bb0_reduction_8_vec_3[1] = local_bb0_reduction_8_vec_2[1];
assign local_bb0_reduction_8_vec_3[2] = local_bb0_reduction_8_vec_2[2];
assign local_bb0_reduction_8_vec_3[3] = rcnode_175to176_rc0_bb0_cmp_xor_0_NO_SHIFT_REG[3];

// This section implements an unregistered operation.
// 
wire local_bb0_c0_ene1_stall_local;
wire [127:0] local_bb0_c0_ene1;

assign local_bb0_c0_ene1[31:0] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[39:8];
assign local_bb0_c0_ene1[63:32] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[71:40];
assign local_bb0_c0_ene1[95:64] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[103:72];
assign local_bb0_c0_ene1[127:96] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[135:104];

// This section implements an unregistered operation.
// 
wire local_bb0_c0_ene2_stall_local;
wire [127:0] local_bb0_c0_ene2;

assign local_bb0_c0_ene2[31:0] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[167:136];
assign local_bb0_c0_ene2[63:32] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[199:168];
assign local_bb0_c0_ene2[95:64] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[231:200];
assign local_bb0_c0_ene2[127:96] = local_bb0_c0_enter_c0_eni2_NO_SHIFT_REG[263:232];

// This section implements an unregistered operation.
// 
wire SFC_1_VALID_163_163_0_valid_out;
wire SFC_1_VALID_163_163_0_stall_in;
wire SFC_1_VALID_163_163_0_inputs_ready;
wire SFC_1_VALID_163_163_0_stall_local;
wire SFC_1_VALID_163_163_0;

assign SFC_1_VALID_163_163_0_inputs_ready = local_bb0_c0_enter_c0_eni2_valid_out_2_NO_SHIFT_REG;
assign SFC_1_VALID_163_163_0 = local_bb0_c0_enter_c0_eni2_valid_bit_NO_SHIFT_REG;
assign SFC_1_VALID_163_163_0_valid_out = 1'b1;
assign local_bb0_c0_enter_c0_eni2_stall_in_2 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_8_shuffle_stall_local;
wire [15:0] local_bb0_reduction_8_shuffle;

assign local_bb0_reduction_8_shuffle[0] = local_bb0_reduction_8_vec_3[0];
assign local_bb0_reduction_8_shuffle[1] = local_bb0_reduction_8_vec_3[0];
assign local_bb0_reduction_8_shuffle[2] = local_bb0_reduction_8_vec_3[0];
assign local_bb0_reduction_8_shuffle[3] = local_bb0_reduction_8_vec_3[0];
assign local_bb0_reduction_8_shuffle[4] = local_bb0_reduction_8_vec_3[1];
assign local_bb0_reduction_8_shuffle[5] = local_bb0_reduction_8_vec_3[1];
assign local_bb0_reduction_8_shuffle[6] = local_bb0_reduction_8_vec_3[1];
assign local_bb0_reduction_8_shuffle[7] = local_bb0_reduction_8_vec_3[1];
assign local_bb0_reduction_8_shuffle[8] = local_bb0_reduction_8_vec_3[2];
assign local_bb0_reduction_8_shuffle[9] = local_bb0_reduction_8_vec_3[2];
assign local_bb0_reduction_8_shuffle[10] = local_bb0_reduction_8_vec_3[2];
assign local_bb0_reduction_8_shuffle[11] = local_bb0_reduction_8_vec_3[2];
assign local_bb0_reduction_8_shuffle[12] = local_bb0_reduction_8_vec_3[3];
assign local_bb0_reduction_8_shuffle[13] = local_bb0_reduction_8_vec_3[3];
assign local_bb0_reduction_8_shuffle[14] = local_bb0_reduction_8_vec_3[3];
assign local_bb0_reduction_8_shuffle[15] = local_bb0_reduction_8_vec_3[3];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_a_extrValue_1_stall_local;
wire [31:0] local_bb0_memcoalesce_a_extrValue_1;

assign local_bb0_memcoalesce_a_extrValue_1[31:0] = local_bb0_c0_ene1[63:32];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_a_extrValue_2_stall_local;
wire [31:0] local_bb0_memcoalesce_a_extrValue_2;

assign local_bb0_memcoalesce_a_extrValue_2[31:0] = local_bb0_c0_ene1[95:64];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_a_extrValue_3_stall_local;
wire [31:0] local_bb0_memcoalesce_a_extrValue_3;

assign local_bb0_memcoalesce_a_extrValue_3[31:0] = local_bb0_c0_ene1[127:96];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_a_extrValue_0_stall_local;
wire [31:0] local_bb0_memcoalesce_a_extrValue_0;

assign local_bb0_memcoalesce_a_extrValue_0[31:0] = local_bb0_c0_ene1[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_b_extrValue_1_stall_local;
wire [31:0] local_bb0_memcoalesce_b_extrValue_1;

assign local_bb0_memcoalesce_b_extrValue_1[31:0] = local_bb0_c0_ene2[63:32];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_b_extrValue_2_stall_local;
wire [31:0] local_bb0_memcoalesce_b_extrValue_2;

assign local_bb0_memcoalesce_b_extrValue_2[31:0] = local_bb0_c0_ene2[95:64];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_b_extrValue_3_stall_local;
wire [31:0] local_bb0_memcoalesce_b_extrValue_3;

assign local_bb0_memcoalesce_b_extrValue_3[31:0] = local_bb0_c0_ene2[127:96];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_b_extrValue_0_stall_local;
wire [31:0] local_bb0_memcoalesce_b_extrValue_0;

assign local_bb0_memcoalesce_b_extrValue_0[31:0] = local_bb0_c0_ene2[31:0];

// This section implements a registered operation.
// 
wire SFC_1_VALID_163_164_0_inputs_ready;
 reg SFC_1_VALID_163_164_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_163_164_0_stall_in;
wire SFC_1_VALID_163_164_0_output_regs_ready;
 reg SFC_1_VALID_163_164_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_163_164_0_causedstall;

assign SFC_1_VALID_163_164_0_inputs_ready = 1'b1;
assign SFC_1_VALID_163_164_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_163_163_0_stall_in = 1'b0;
assign SFC_1_VALID_163_164_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_163_164_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_163_164_0_output_regs_ready)
		begin
			SFC_1_VALID_163_164_0_NO_SHIFT_REG <= SFC_1_VALID_163_163_0;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_reduction_8_compressed_valid_out;
wire local_bb0_reduction_8_compressed_stall_in;
wire local_bb0_reduction_8_compressed_inputs_ready;
wire local_bb0_reduction_8_compressed_stall_local;
wire [15:0] local_bb0_reduction_8_compressed;

assign local_bb0_reduction_8_compressed_inputs_ready = (rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_0_NO_SHIFT_REG & rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_1_NO_SHIFT_REG & rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_2_NO_SHIFT_REG & rcnode_175to176_rc0_bb0_cmp_xor_0_valid_out_3_NO_SHIFT_REG);
assign local_bb0_reduction_8_compressed = local_bb0_reduction_8_shuffle;
assign local_bb0_reduction_8_compressed_valid_out = local_bb0_reduction_8_compressed_inputs_ready;
assign local_bb0_reduction_8_compressed_stall_local = local_bb0_reduction_8_compressed_stall_in;
assign rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_0_NO_SHIFT_REG = (local_bb0_reduction_8_compressed_stall_local | ~(local_bb0_reduction_8_compressed_inputs_ready));
assign rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_1_NO_SHIFT_REG = (local_bb0_reduction_8_compressed_stall_local | ~(local_bb0_reduction_8_compressed_inputs_ready));
assign rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_2_NO_SHIFT_REG = (local_bb0_reduction_8_compressed_stall_local | ~(local_bb0_reduction_8_compressed_inputs_ready));
assign rcnode_175to176_rc0_bb0_cmp_xor_0_stall_in_3_NO_SHIFT_REG = (local_bb0_reduction_8_compressed_stall_local | ~(local_bb0_reduction_8_compressed_inputs_ready));

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i_stall_local;
wire [31:0] local_bb0_astype_i;

assign local_bb0_astype_i = local_bb0_memcoalesce_a_extrValue_1;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i767_stall_local;
wire [31:0] local_bb0_astype_i767;

assign local_bb0_astype_i767 = local_bb0_memcoalesce_a_extrValue_2;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i411_stall_local;
wire [31:0] local_bb0_astype_i411;

assign local_bb0_astype_i411 = local_bb0_memcoalesce_a_extrValue_3;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i55_stall_local;
wire [31:0] local_bb0_astype_i55;

assign local_bb0_astype_i55 = local_bb0_memcoalesce_a_extrValue_0;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i1102_stall_local;
wire [31:0] local_bb0_astype_i1102;

assign local_bb0_astype_i1102 = local_bb0_memcoalesce_b_extrValue_1;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i746_stall_local;
wire [31:0] local_bb0_astype_i746;

assign local_bb0_astype_i746 = local_bb0_memcoalesce_b_extrValue_2;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i390_stall_local;
wire [31:0] local_bb0_astype_i390;

assign local_bb0_astype_i390 = local_bb0_memcoalesce_b_extrValue_3;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i34_stall_local;
wire [31:0] local_bb0_astype_i34;

assign local_bb0_astype_i34 = local_bb0_memcoalesce_b_extrValue_0;

// This section implements a registered operation.
// 
wire SFC_1_VALID_164_165_0_inputs_ready;
 reg SFC_1_VALID_164_165_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_164_165_0_stall_in;
wire SFC_1_VALID_164_165_0_output_regs_ready;
 reg SFC_1_VALID_164_165_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_164_165_0_causedstall;

assign SFC_1_VALID_164_165_0_inputs_ready = 1'b1;
assign SFC_1_VALID_164_165_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_163_164_0_stall_in = 1'b0;
assign SFC_1_VALID_164_165_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_164_165_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_164_165_0_output_regs_ready)
		begin
			SFC_1_VALID_164_165_0_NO_SHIFT_REG <= SFC_1_VALID_163_164_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_conv_i_stall_local;
wire [63:0] local_bb0_conv_i;

assign local_bb0_conv_i[63:32] = 32'h0;
assign local_bb0_conv_i[31:0] = local_bb0_astype_i;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i_stall_local;
wire [31:0] local_bb0_and2_i;

assign local_bb0_and2_i = (local_bb0_astype_i & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i_stall_local;
wire [31:0] local_bb0_and4_i;

assign local_bb0_and4_i = (local_bb0_astype_i >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i768_stall_local;
wire [63:0] local_bb0_conv_i768;

assign local_bb0_conv_i768[63:32] = 32'h0;
assign local_bb0_conv_i768[31:0] = local_bb0_astype_i767;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i769_stall_local;
wire [31:0] local_bb0_and2_i769;

assign local_bb0_and2_i769 = (local_bb0_astype_i767 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i771_stall_local;
wire [31:0] local_bb0_and4_i771;

assign local_bb0_and4_i771 = (local_bb0_astype_i767 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i412_stall_local;
wire [63:0] local_bb0_conv_i412;

assign local_bb0_conv_i412[63:32] = 32'h0;
assign local_bb0_conv_i412[31:0] = local_bb0_astype_i411;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i413_stall_local;
wire [31:0] local_bb0_and2_i413;

assign local_bb0_and2_i413 = (local_bb0_astype_i411 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i415_stall_local;
wire [31:0] local_bb0_and4_i415;

assign local_bb0_and4_i415 = (local_bb0_astype_i411 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i56_stall_local;
wire [63:0] local_bb0_conv_i56;

assign local_bb0_conv_i56[63:32] = 32'h0;
assign local_bb0_conv_i56[31:0] = local_bb0_astype_i55;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i57_stall_local;
wire [31:0] local_bb0_and2_i57;

assign local_bb0_and2_i57 = (local_bb0_astype_i55 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i59_stall_local;
wire [31:0] local_bb0_and4_i59;

assign local_bb0_and4_i59 = (local_bb0_astype_i55 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i1103_stall_local;
wire [63:0] local_bb0_conv_i1103;

assign local_bb0_conv_i1103[63:32] = 32'h0;
assign local_bb0_conv_i1103[31:0] = local_bb0_astype_i1102;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i1104_stall_local;
wire [31:0] local_bb0_and2_i1104;

assign local_bb0_and2_i1104 = (local_bb0_astype_i1102 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i1106_stall_local;
wire [31:0] local_bb0_and4_i1106;

assign local_bb0_and4_i1106 = (local_bb0_astype_i1102 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i747_stall_local;
wire [63:0] local_bb0_conv_i747;

assign local_bb0_conv_i747[63:32] = 32'h0;
assign local_bb0_conv_i747[31:0] = local_bb0_astype_i746;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i748_stall_local;
wire [31:0] local_bb0_and2_i748;

assign local_bb0_and2_i748 = (local_bb0_astype_i746 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i750_stall_local;
wire [31:0] local_bb0_and4_i750;

assign local_bb0_and4_i750 = (local_bb0_astype_i746 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i391_stall_local;
wire [63:0] local_bb0_conv_i391;

assign local_bb0_conv_i391[63:32] = 32'h0;
assign local_bb0_conv_i391[31:0] = local_bb0_astype_i390;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i392_stall_local;
wire [31:0] local_bb0_and2_i392;

assign local_bb0_and2_i392 = (local_bb0_astype_i390 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i394_stall_local;
wire [31:0] local_bb0_and4_i394;

assign local_bb0_and4_i394 = (local_bb0_astype_i390 >> 32'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i35_stall_local;
wire [63:0] local_bb0_conv_i35;

assign local_bb0_conv_i35[63:32] = 32'h0;
assign local_bb0_conv_i35[31:0] = local_bb0_astype_i34;

// This section implements an unregistered operation.
// 
wire local_bb0_and2_i36_stall_local;
wire [31:0] local_bb0_and2_i36;

assign local_bb0_and2_i36 = (local_bb0_astype_i34 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i38_stall_local;
wire [31:0] local_bb0_and4_i38;

assign local_bb0_and4_i38 = (local_bb0_astype_i34 >> 32'h17);

// This section implements a registered operation.
// 
wire SFC_1_VALID_165_166_0_inputs_ready;
 reg SFC_1_VALID_165_166_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_165_166_0_stall_in;
wire SFC_1_VALID_165_166_0_output_regs_ready;
 reg SFC_1_VALID_165_166_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_165_166_0_causedstall;

assign SFC_1_VALID_165_166_0_inputs_ready = 1'b1;
assign SFC_1_VALID_165_166_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_164_165_0_stall_in = 1'b0;
assign SFC_1_VALID_165_166_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_165_166_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_165_166_0_output_regs_ready)
		begin
			SFC_1_VALID_165_166_0_NO_SHIFT_REG <= SFC_1_VALID_164_165_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_var__u3_stall_local;
wire [63:0] local_bb0_var__u3;

assign local_bb0_var__u3 = ((local_bb0_conv_i & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i_stall_local;
wire [63:0] local_bb0_conv3_i;

assign local_bb0_conv3_i[63:32] = 32'h0;
assign local_bb0_conv3_i[31:0] = (local_bb0_and2_i & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i_stall_local;
wire [31:0] local_bb0_shr5_i;

assign local_bb0_shr5_i = ((local_bb0_and4_i & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i_stall_local;
wire [63:0] local_bb0_conv6_i;

assign local_bb0_conv6_i[63:32] = 32'h0;
assign local_bb0_conv6_i[31:0] = (local_bb0_and4_i & 32'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv13_i958_stall_local;
wire [31:0] local_bb0_conv13_i958;

assign local_bb0_conv13_i958 = ((local_bb0_and4_i & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u4_stall_local;
wire [63:0] local_bb0_var__u4;

assign local_bb0_var__u4 = ((local_bb0_conv_i768 & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i770_stall_local;
wire [63:0] local_bb0_conv3_i770;

assign local_bb0_conv3_i770[63:32] = 32'h0;
assign local_bb0_conv3_i770[31:0] = (local_bb0_and2_i769 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i772_stall_local;
wire [31:0] local_bb0_shr5_i772;

assign local_bb0_shr5_i772 = ((local_bb0_and4_i771 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u5_stall_local;
wire [63:0] local_bb0_var__u5;

assign local_bb0_var__u5 = ((local_bb0_conv_i412 & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i414_stall_local;
wire [63:0] local_bb0_conv3_i414;

assign local_bb0_conv3_i414[63:32] = 32'h0;
assign local_bb0_conv3_i414[31:0] = (local_bb0_and2_i413 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i416_stall_local;
wire [31:0] local_bb0_shr5_i416;

assign local_bb0_shr5_i416 = ((local_bb0_and4_i415 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u6_stall_local;
wire [63:0] local_bb0_var__u6;

assign local_bb0_var__u6 = ((local_bb0_conv_i56 & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i58_stall_local;
wire [63:0] local_bb0_conv3_i58;

assign local_bb0_conv3_i58[63:32] = 32'h0;
assign local_bb0_conv3_i58[31:0] = (local_bb0_and2_i57 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i60_stall_local;
wire [31:0] local_bb0_shr5_i60;

assign local_bb0_shr5_i60 = ((local_bb0_and4_i59 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u7_stall_local;
wire [63:0] local_bb0_var__u7;

assign local_bb0_var__u7 = ((local_bb0_conv_i1103 & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i1105_stall_local;
wire [63:0] local_bb0_conv3_i1105;

assign local_bb0_conv3_i1105[63:32] = 32'h0;
assign local_bb0_conv3_i1105[31:0] = (local_bb0_and2_i1104 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i1107_stall_local;
wire [31:0] local_bb0_shr5_i1107;

assign local_bb0_shr5_i1107 = ((local_bb0_and4_i1106 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i1108_stall_local;
wire [63:0] local_bb0_conv6_i1108;

assign local_bb0_conv6_i1108[63:32] = 32'h0;
assign local_bb0_conv6_i1108[31:0] = (local_bb0_and4_i1106 & 32'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u8_stall_local;
wire [63:0] local_bb0_var__u8;

assign local_bb0_var__u8 = ((local_bb0_conv_i747 & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i749_stall_local;
wire [63:0] local_bb0_conv3_i749;

assign local_bb0_conv3_i749[63:32] = 32'h0;
assign local_bb0_conv3_i749[31:0] = (local_bb0_and2_i748 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i751_stall_local;
wire [31:0] local_bb0_shr5_i751;

assign local_bb0_shr5_i751 = ((local_bb0_and4_i750 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i752_stall_local;
wire [63:0] local_bb0_conv6_i752;

assign local_bb0_conv6_i752[63:32] = 32'h0;
assign local_bb0_conv6_i752[31:0] = (local_bb0_and4_i750 & 32'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u9_stall_local;
wire [63:0] local_bb0_var__u9;

assign local_bb0_var__u9 = ((local_bb0_conv_i391 & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i393_stall_local;
wire [63:0] local_bb0_conv3_i393;

assign local_bb0_conv3_i393[63:32] = 32'h0;
assign local_bb0_conv3_i393[31:0] = (local_bb0_and2_i392 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i395_stall_local;
wire [31:0] local_bb0_shr5_i395;

assign local_bb0_shr5_i395 = ((local_bb0_and4_i394 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i396_stall_local;
wire [63:0] local_bb0_conv6_i396;

assign local_bb0_conv6_i396[63:32] = 32'h0;
assign local_bb0_conv6_i396[31:0] = (local_bb0_and4_i394 & 32'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u10_stall_local;
wire [63:0] local_bb0_var__u10;

assign local_bb0_var__u10 = ((local_bb0_conv_i35 & 64'hFFFFFFFF) >> 64'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_i37_stall_local;
wire [63:0] local_bb0_conv3_i37;

assign local_bb0_conv3_i37[63:32] = 32'h0;
assign local_bb0_conv3_i37[31:0] = (local_bb0_and2_i36 & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shr5_i39_stall_local;
wire [31:0] local_bb0_shr5_i39;

assign local_bb0_shr5_i39 = ((local_bb0_and4_i38 & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i40_stall_local;
wire [63:0] local_bb0_conv6_i40;

assign local_bb0_conv6_i40[63:32] = 32'h0;
assign local_bb0_conv6_i40[31:0] = (local_bb0_and4_i38 & 32'h1FF);

// This section implements a registered operation.
// 
wire SFC_1_VALID_166_167_0_inputs_ready;
 reg SFC_1_VALID_166_167_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_166_167_0_stall_in;
wire SFC_1_VALID_166_167_0_output_regs_ready;
 reg SFC_1_VALID_166_167_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_166_167_0_causedstall;

assign SFC_1_VALID_166_167_0_inputs_ready = 1'b1;
assign SFC_1_VALID_166_167_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_165_166_0_stall_in = 1'b0;
assign SFC_1_VALID_166_167_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_166_167_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_166_167_0_output_regs_ready)
		begin
			SFC_1_VALID_166_167_0_NO_SHIFT_REG <= SFC_1_VALID_165_166_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_or11_i_stall_local;
wire [63:0] local_bb0_or11_i;

assign local_bb0_or11_i = ((local_bb0_conv3_i & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i_stall_local;
wire local_bb0_cmp8_i;

assign local_bb0_cmp8_i = ((local_bb0_shr5_i & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i_stall_local;
wire [63:0] local_bb0_shl21_i;

assign local_bb0_shl21_i = ((local_bb0_conv6_i & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_or11_i778_stall_local;
wire [63:0] local_bb0_or11_i778;

assign local_bb0_or11_i778 = ((local_bb0_conv3_i770 & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i779_stall_local;
wire local_bb0_cmp8_i779;

assign local_bb0_cmp8_i779 = ((local_bb0_shr5_i772 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or11_i422_stall_local;
wire [63:0] local_bb0_or11_i422;

assign local_bb0_or11_i422 = ((local_bb0_conv3_i414 & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i423_stall_local;
wire local_bb0_cmp8_i423;

assign local_bb0_cmp8_i423 = ((local_bb0_shr5_i416 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or11_i66_stall_local;
wire [63:0] local_bb0_or11_i66;

assign local_bb0_or11_i66 = ((local_bb0_conv3_i58 & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i67_stall_local;
wire local_bb0_cmp8_i67;

assign local_bb0_cmp8_i67 = ((local_bb0_shr5_i60 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or11_i1113_stall_local;
wire [63:0] local_bb0_or11_i1113;

assign local_bb0_or11_i1113 = ((local_bb0_conv3_i1105 & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i1114_stall_local;
wire local_bb0_cmp8_i1114;

assign local_bb0_cmp8_i1114 = ((local_bb0_shr5_i1107 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i962_stall_local;
wire [31:0] local_bb0_sub_i962;

assign local_bb0_sub_i962 = ((local_bb0_conv13_i958 & 32'hFF) - (local_bb0_shr5_i1107 & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i1120_stall_local;
wire [63:0] local_bb0_shl21_i1120;

assign local_bb0_shl21_i1120 = ((local_bb0_conv6_i1108 & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_or11_i757_stall_local;
wire [63:0] local_bb0_or11_i757;

assign local_bb0_or11_i757 = ((local_bb0_conv3_i749 & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i758_stall_local;
wire local_bb0_cmp8_i758;

assign local_bb0_cmp8_i758 = ((local_bb0_shr5_i751 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or11_i401_stall_local;
wire [63:0] local_bb0_or11_i401;

assign local_bb0_or11_i401 = ((local_bb0_conv3_i393 & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i402_stall_local;
wire local_bb0_cmp8_i402;

assign local_bb0_cmp8_i402 = ((local_bb0_shr5_i395 & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or11_i45_stall_local;
wire [63:0] local_bb0_or11_i45;

assign local_bb0_or11_i45 = ((local_bb0_conv3_i37 & 64'h7FFFFF) | 64'h800000);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp8_i46_stall_local;
wire local_bb0_cmp8_i46;

assign local_bb0_cmp8_i46 = ((local_bb0_shr5_i39 & 32'hFF) == 32'h0);

// This section implements a registered operation.
// 
wire SFC_1_VALID_167_168_0_inputs_ready;
 reg SFC_1_VALID_167_168_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_167_168_0_stall_in;
wire SFC_1_VALID_167_168_0_output_regs_ready;
 reg SFC_1_VALID_167_168_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_167_168_0_causedstall;

assign SFC_1_VALID_167_168_0_inputs_ready = 1'b1;
assign SFC_1_VALID_167_168_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_166_167_0_stall_in = 1'b0;
assign SFC_1_VALID_167_168_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_167_168_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_167_168_0_output_regs_ready)
		begin
			SFC_1_VALID_167_168_0_NO_SHIFT_REG <= SFC_1_VALID_166_167_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i_stall_local;
wire [63:0] local_bb0_conv3_or11_i;

assign local_bb0_conv3_or11_i = (local_bb0_cmp8_i ? (local_bb0_conv3_i & 64'h7FFFFF) : ((local_bb0_or11_i & 64'hFFFFFF) | 64'h800000));

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i780_stall_local;
wire [63:0] local_bb0_conv3_or11_i780;

assign local_bb0_conv3_or11_i780 = (local_bb0_cmp8_i779 ? (local_bb0_conv3_i770 & 64'h7FFFFF) : ((local_bb0_or11_i778 & 64'hFFFFFF) | 64'h800000));

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i424_stall_local;
wire [63:0] local_bb0_conv3_or11_i424;

assign local_bb0_conv3_or11_i424 = (local_bb0_cmp8_i423 ? (local_bb0_conv3_i414 & 64'h7FFFFF) : ((local_bb0_or11_i422 & 64'hFFFFFF) | 64'h800000));

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i68_stall_local;
wire [63:0] local_bb0_conv3_or11_i68;

assign local_bb0_conv3_or11_i68 = (local_bb0_cmp8_i67 ? (local_bb0_conv3_i58 & 64'h7FFFFF) : ((local_bb0_or11_i66 & 64'hFFFFFF) | 64'h800000));

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i1115_stall_local;
wire [63:0] local_bb0_conv3_or11_i1115;

assign local_bb0_conv3_or11_i1115 = (local_bb0_cmp8_i1114 ? (local_bb0_conv3_i1105 & 64'h7FFFFF) : ((local_bb0_or11_i1113 & 64'hFFFFFF) | 64'h800000));

// This section implements an unregistered operation.
// 
wire local_bb0_and18_i963_stall_local;
wire [31:0] local_bb0_and18_i963;

assign local_bb0_and18_i963 = (local_bb0_sub_i962 & 32'h200);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i759_stall_local;
wire [63:0] local_bb0_conv3_or11_i759;

assign local_bb0_conv3_or11_i759 = (local_bb0_cmp8_i758 ? (local_bb0_conv3_i749 & 64'h7FFFFF) : ((local_bb0_or11_i757 & 64'hFFFFFF) | 64'h800000));

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i403_stall_local;
wire [63:0] local_bb0_conv3_or11_i403;

assign local_bb0_conv3_or11_i403 = (local_bb0_cmp8_i402 ? (local_bb0_conv3_i393 & 64'h7FFFFF) : ((local_bb0_or11_i401 & 64'hFFFFFF) | 64'h800000));

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_i47_stall_local;
wire [63:0] local_bb0_conv3_or11_i47;

assign local_bb0_conv3_or11_i47 = (local_bb0_cmp8_i46 ? (local_bb0_conv3_i37 & 64'h7FFFFF) : ((local_bb0_or11_i45 & 64'hFFFFFF) | 64'h800000));

// This section implements a registered operation.
// 
wire SFC_1_VALID_168_169_0_inputs_ready;
 reg SFC_1_VALID_168_169_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_168_169_0_stall_in;
wire SFC_1_VALID_168_169_0_output_regs_ready;
 reg SFC_1_VALID_168_169_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_168_169_0_causedstall;

assign SFC_1_VALID_168_169_0_inputs_ready = 1'b1;
assign SFC_1_VALID_168_169_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_167_168_0_stall_in = 1'b0;
assign SFC_1_VALID_168_169_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_168_169_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_168_169_0_output_regs_ready)
		begin
			SFC_1_VALID_168_169_0_NO_SHIFT_REG <= SFC_1_VALID_167_168_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i;

assign local_bb0_conv3_or11_op_i = ((local_bb0_conv3_or11_i & 64'hFFFFFF) << 64'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i782_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i782;

assign local_bb0_conv3_or11_op_i782 = ((local_bb0_conv3_or11_i780 & 64'hFFFFFF) << 64'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i426_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i426;

assign local_bb0_conv3_or11_op_i426 = ((local_bb0_conv3_or11_i424 & 64'hFFFFFF) << 64'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i70_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i70;

assign local_bb0_conv3_or11_op_i70 = ((local_bb0_conv3_or11_i68 & 64'hFFFFFF) << 64'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i1117_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i1117;

assign local_bb0_conv3_or11_op_i1117 = ((local_bb0_conv3_or11_i1115 & 64'hFFFFFF) << 64'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool19_i964_stall_local;
wire local_bb0_tobool19_i964;

assign local_bb0_tobool19_i964 = ((local_bb0_and18_i963 & 32'h200) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and18_lobit_i974_stall_local;
wire [31:0] local_bb0_and18_lobit_i974;

assign local_bb0_and18_lobit_i974 = ((local_bb0_and18_i963 & 32'h200) >> 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i761_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i761;

assign local_bb0_conv3_or11_op_i761 = ((local_bb0_conv3_or11_i759 & 64'hFFFFFF) << 64'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i405_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i405;

assign local_bb0_conv3_or11_op_i405 = ((local_bb0_conv3_or11_i403 & 64'hFFFFFF) << 64'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_conv3_or11_op_i49_stall_local;
wire [63:0] local_bb0_conv3_or11_op_i49;

assign local_bb0_conv3_or11_op_i49 = ((local_bb0_conv3_or11_i47 & 64'hFFFFFF) << 64'h3);

// This section implements a registered operation.
// 
wire SFC_1_VALID_169_170_0_inputs_ready;
 reg SFC_1_VALID_169_170_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_169_170_0_stall_in;
wire SFC_1_VALID_169_170_0_output_regs_ready;
 reg SFC_1_VALID_169_170_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_169_170_0_causedstall;

assign SFC_1_VALID_169_170_0_inputs_ready = 1'b1;
assign SFC_1_VALID_169_170_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_168_169_0_stall_in = 1'b0;
assign SFC_1_VALID_169_170_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_169_170_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_169_170_0_output_regs_ready)
		begin
			SFC_1_VALID_169_170_0_NO_SHIFT_REG <= SFC_1_VALID_168_169_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_shl_i_stall_local;
wire [63:0] local_bb0_shl_i;

assign local_bb0_shl_i = (local_bb0_cmp8_i ? 64'h0 : (local_bb0_conv3_or11_op_i & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i783_stall_local;
wire [63:0] local_bb0_shl_i783;

assign local_bb0_shl_i783 = (local_bb0_cmp8_i779 ? 64'h0 : (local_bb0_conv3_or11_op_i782 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i427_stall_local;
wire [63:0] local_bb0_shl_i427;

assign local_bb0_shl_i427 = (local_bb0_cmp8_i423 ? 64'h0 : (local_bb0_conv3_or11_op_i426 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i71_stall_local;
wire [63:0] local_bb0_shl_i71;

assign local_bb0_shl_i71 = (local_bb0_cmp8_i67 ? 64'h0 : (local_bb0_conv3_or11_op_i70 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i1118_stall_local;
wire [63:0] local_bb0_shl_i1118;

assign local_bb0_shl_i1118 = (local_bb0_cmp8_i1114 ? 64'h0 : (local_bb0_conv3_or11_op_i1117 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i1026_stall_local;
wire [31:0] local_bb0_cond135_i1026;

assign local_bb0_cond135_i1026 = (local_bb0_tobool19_i964 ? 32'hFFFF : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i762_stall_local;
wire [63:0] local_bb0_shl_i762;

assign local_bb0_shl_i762 = (local_bb0_cmp8_i758 ? 64'h0 : (local_bb0_conv3_or11_op_i761 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i406_stall_local;
wire [63:0] local_bb0_shl_i406;

assign local_bb0_shl_i406 = (local_bb0_cmp8_i402 ? 64'h0 : (local_bb0_conv3_or11_op_i405 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i50_stall_local;
wire [63:0] local_bb0_shl_i50;

assign local_bb0_shl_i50 = (local_bb0_cmp8_i46 ? 64'h0 : (local_bb0_conv3_or11_op_i49 & 64'h7FFFFF8));

// This section implements a registered operation.
// 
wire SFC_1_VALID_170_171_0_inputs_ready;
 reg SFC_1_VALID_170_171_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_170_171_0_stall_in;
wire SFC_1_VALID_170_171_0_output_regs_ready;
 reg SFC_1_VALID_170_171_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_170_171_0_causedstall;

assign SFC_1_VALID_170_171_0_inputs_ready = 1'b1;
assign SFC_1_VALID_170_171_0_output_regs_ready = 1'b1;
assign SFC_1_VALID_169_170_0_stall_in = 1'b0;
assign SFC_1_VALID_170_171_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_170_171_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_170_171_0_output_regs_ready)
		begin
			SFC_1_VALID_170_171_0_NO_SHIFT_REG <= SFC_1_VALID_169_170_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_or23_i_stall_local;
wire [63:0] local_bb0_or23_i;

assign local_bb0_or23_i = ((local_bb0_shl21_i & 64'hFF8000000) | (local_bb0_shl_i & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_or23_i1122_stall_local;
wire [63:0] local_bb0_or23_i1122;

assign local_bb0_or23_i1122 = ((local_bb0_shl21_i1120 & 64'hFF8000000) | (local_bb0_shl_i1118 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_y_tr_i954_stall_local;
wire [31:0] local_bb0_y_tr_i954;
wire [63:0] local_bb0_y_tr_i954$ps;

assign local_bb0_y_tr_i954$ps = (local_bb0_shl_i1118 & 64'h7FFFFF8);
assign local_bb0_y_tr_i954 = local_bb0_y_tr_i954$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_xor186_i1035_stall_local;
wire [31:0] local_bb0_xor186_i1035;

assign local_bb0_xor186_i1035 = ((local_bb0_cond135_i1026 & 32'hFFFF) ^ local_bb0_sub_i962);

// This section implements an unregistered operation.
// 
wire local_bb0_and525051_i1027_stall_local;
wire [63:0] local_bb0_and525051_i1027;

assign local_bb0_and525051_i1027 = ((local_bb0_or23_i1122 & 64'hFFFFFFFF8) ^ (local_bb0_or23_i & 64'hFFFFFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and5250_i1028_stall_local;
wire [31:0] local_bb0_and5250_i1028;
wire [63:0] local_bb0_and5250_i1028$ps;

assign local_bb0_and5250_i1028$ps = (local_bb0_and525051_i1027 & 64'hFFFFFFFF8);
assign local_bb0_and5250_i1028 = local_bb0_and5250_i1028$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_var__u11_stall_local;
wire [31:0] local_bb0_var__u11;

assign local_bb0_var__u11 = ((local_bb0_and5250_i1028 & 32'hFFFFFFF8) >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u12_stall_local;
wire [31:0] local_bb0_var__u12;

assign local_bb0_var__u12 = ((local_bb0_and5250_i1028 & 32'hFFFFFFF8) << 32'h5);

// This section implements an unregistered operation.
// 
wire local_bb0_xor173_i1029_stall_local;
wire [31:0] local_bb0_xor173_i1029;

assign local_bb0_xor173_i1029 = ((local_bb0_var__u11 & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u13_stall_local;
wire [31:0] local_bb0_var__u13;

assign local_bb0_var__u13 = ($signed((local_bb0_var__u12 & 32'hFFFFFF00)) >>> 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_cond175_i1030_stall_local;
wire [31:0] local_bb0_cond175_i1030;

assign local_bb0_cond175_i1030 = ((local_bb0_xor173_i1029 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0__34_i1034_stall_local;
wire [31:0] local_bb0__34_i1034;

assign local_bb0__34_i1034 = (local_bb0_tobool19_i964 ? (local_bb0_cond175_i1030 & 32'h1) : local_bb0_var__u13);

// This section implements an unregistered operation.
// 
wire local_bb0__36_i1038_stall_local;
wire [31:0] local_bb0__36_i1038;

assign local_bb0__36_i1038 = (local_bb0__34_i1034 + local_bb0_xor186_i1035);

// This section implements an unregistered operation.
// 
wire local_bb0_and190_i1039_stall_local;
wire [31:0] local_bb0_and190_i1039;

assign local_bb0_and190_i1039 = (local_bb0__36_i1038 & 32'h1E0);

// This section implements an unregistered operation.
// 
wire local_bb0_and4_i771_valid_out_1;
wire local_bb0_and4_i771_stall_in_1;
wire local_bb0_and4_i415_valid_out_1;
wire local_bb0_and4_i415_stall_in_1;
wire local_bb0_and4_i59_valid_out_1;
wire local_bb0_and4_i59_stall_in_1;
wire local_bb0_var__u3_valid_out;
wire local_bb0_var__u3_stall_in;
wire local_bb0_conv13_i958_valid_out_1;
wire local_bb0_conv13_i958_stall_in_1;
wire local_bb0_var__u4_valid_out;
wire local_bb0_var__u4_stall_in;
wire local_bb0_var__u5_valid_out;
wire local_bb0_var__u5_stall_in;
wire local_bb0_var__u6_valid_out;
wire local_bb0_var__u6_stall_in;
wire local_bb0_var__u7_valid_out;
wire local_bb0_var__u7_stall_in;
wire local_bb0_shr5_i1107_valid_out_2;
wire local_bb0_shr5_i1107_stall_in_2;
wire local_bb0_var__u8_valid_out;
wire local_bb0_var__u8_stall_in;
wire local_bb0_shr5_i751_valid_out_1;
wire local_bb0_shr5_i751_stall_in_1;
wire local_bb0_conv6_i752_valid_out;
wire local_bb0_conv6_i752_stall_in;
wire local_bb0_var__u9_valid_out;
wire local_bb0_var__u9_stall_in;
wire local_bb0_shr5_i395_valid_out_1;
wire local_bb0_shr5_i395_stall_in_1;
wire local_bb0_conv6_i396_valid_out;
wire local_bb0_conv6_i396_stall_in;
wire local_bb0_var__u10_valid_out;
wire local_bb0_var__u10_stall_in;
wire local_bb0_shr5_i39_valid_out_1;
wire local_bb0_shr5_i39_stall_in_1;
wire local_bb0_conv6_i40_valid_out;
wire local_bb0_conv6_i40_stall_in;
wire local_bb0_shl_i_valid_out_1;
wire local_bb0_shl_i_stall_in_1;
wire local_bb0_shl_i783_valid_out;
wire local_bb0_shl_i783_stall_in;
wire local_bb0_shl_i427_valid_out;
wire local_bb0_shl_i427_stall_in;
wire local_bb0_shl_i71_valid_out;
wire local_bb0_shl_i71_stall_in;
wire local_bb0_shl_i762_valid_out;
wire local_bb0_shl_i762_stall_in;
wire local_bb0_shl_i406_valid_out;
wire local_bb0_shl_i406_stall_in;
wire local_bb0_shl_i50_valid_out;
wire local_bb0_shl_i50_stall_in;
wire local_bb0_and18_lobit_i974_valid_out;
wire local_bb0_and18_lobit_i974_stall_in;
wire local_bb0_y_tr_i954_valid_out;
wire local_bb0_y_tr_i954_stall_in;
wire local_bb0_and190_i1039_valid_out;
wire local_bb0_and190_i1039_stall_in;
wire local_bb0_c3_diff_0_op_i1041_valid_out;
wire local_bb0_c3_diff_0_op_i1041_stall_in;
wire local_bb0_c3_diff_0_op_i1041_inputs_ready;
wire local_bb0_c3_diff_0_op_i1041_stall_local;
wire [31:0] local_bb0_c3_diff_0_op_i1041;

assign local_bb0_c3_diff_0_op_i1041_inputs_ready = (local_bb0_c0_enter_c0_eni2_valid_out_0_NO_SHIFT_REG & local_bb0_c0_enter_c0_eni2_valid_out_1_NO_SHIFT_REG);
assign local_bb0_c3_diff_0_op_i1041 = (local_bb0__36_i1038 & 32'h1F);
assign local_bb0_and4_i771_valid_out_1 = 1'b1;
assign local_bb0_and4_i415_valid_out_1 = 1'b1;
assign local_bb0_and4_i59_valid_out_1 = 1'b1;
assign local_bb0_var__u3_valid_out = 1'b1;
assign local_bb0_conv13_i958_valid_out_1 = 1'b1;
assign local_bb0_var__u4_valid_out = 1'b1;
assign local_bb0_var__u5_valid_out = 1'b1;
assign local_bb0_var__u6_valid_out = 1'b1;
assign local_bb0_var__u7_valid_out = 1'b1;
assign local_bb0_shr5_i1107_valid_out_2 = 1'b1;
assign local_bb0_var__u8_valid_out = 1'b1;
assign local_bb0_shr5_i751_valid_out_1 = 1'b1;
assign local_bb0_conv6_i752_valid_out = 1'b1;
assign local_bb0_var__u9_valid_out = 1'b1;
assign local_bb0_shr5_i395_valid_out_1 = 1'b1;
assign local_bb0_conv6_i396_valid_out = 1'b1;
assign local_bb0_var__u10_valid_out = 1'b1;
assign local_bb0_shr5_i39_valid_out_1 = 1'b1;
assign local_bb0_conv6_i40_valid_out = 1'b1;
assign local_bb0_shl_i_valid_out_1 = 1'b1;
assign local_bb0_shl_i783_valid_out = 1'b1;
assign local_bb0_shl_i427_valid_out = 1'b1;
assign local_bb0_shl_i71_valid_out = 1'b1;
assign local_bb0_shl_i762_valid_out = 1'b1;
assign local_bb0_shl_i406_valid_out = 1'b1;
assign local_bb0_shl_i50_valid_out = 1'b1;
assign local_bb0_and18_lobit_i974_valid_out = 1'b1;
assign local_bb0_y_tr_i954_valid_out = 1'b1;
assign local_bb0_and190_i1039_valid_out = 1'b1;
assign local_bb0_c3_diff_0_op_i1041_valid_out = 1'b1;
assign local_bb0_c0_enter_c0_eni2_stall_in_0 = 1'b0;
assign local_bb0_c0_enter_c0_eni2_stall_in_1 = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_and4_i771_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i771_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i771_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i771_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i771_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i771_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i771_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i771_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i771_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i771_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i771_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_and4_i771_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_and4_i771_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_and4_i771_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_and4_i771_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_and4_i771_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_and4_i771 & 32'h1FF)),
	.data_out(rnode_163to164_bb0_and4_i771_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_and4_i771_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_and4_i771_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_and4_i771_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_and4_i771_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_and4_i771_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and4_i771_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_and4_i771_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and4_i771_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_and4_i771_0_NO_SHIFT_REG = rnode_163to164_bb0_and4_i771_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_and4_i771_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_and4_i771_1_NO_SHIFT_REG = rnode_163to164_bb0_and4_i771_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_and4_i415_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i415_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i415_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i415_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i415_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i415_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i415_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i415_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i415_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i415_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i415_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_and4_i415_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_and4_i415_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_and4_i415_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_and4_i415_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_and4_i415_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_and4_i415 & 32'h1FF)),
	.data_out(rnode_163to164_bb0_and4_i415_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_and4_i415_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_and4_i415_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_and4_i415_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_and4_i415_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_and4_i415_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and4_i415_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_and4_i415_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and4_i415_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_and4_i415_0_NO_SHIFT_REG = rnode_163to164_bb0_and4_i415_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_and4_i415_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_and4_i415_1_NO_SHIFT_REG = rnode_163to164_bb0_and4_i415_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_and4_i59_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i59_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i59_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i59_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i59_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i59_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i59_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and4_i59_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i59_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i59_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and4_i59_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_and4_i59_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_and4_i59_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_and4_i59_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_and4_i59_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_and4_i59_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_and4_i59 & 32'h1FF)),
	.data_out(rnode_163to164_bb0_and4_i59_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_and4_i59_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_and4_i59_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_and4_i59_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_and4_i59_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_and4_i59_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and4_i59_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_and4_i59_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and4_i59_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_and4_i59_0_NO_SHIFT_REG = rnode_163to164_bb0_and4_i59_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_and4_i59_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_and4_i59_1_NO_SHIFT_REG = rnode_163to164_bb0_and4_i59_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u3_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u3_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u3_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u3_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u3_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u3_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u3_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u3_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u3_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u3_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u3_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u3_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u3_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u3_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u3_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u3_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u3 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u3_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u3_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u3_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u3_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u3_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u3_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u3_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u3_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u3_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u3_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u3_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u3_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u3_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u3_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_conv13_i958_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv13_i958_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_conv13_i958_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv13_i958_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv13_i958_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_conv13_i958_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv13_i958_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_conv13_i958_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv13_i958_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv13_i958_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv13_i958_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_conv13_i958_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_conv13_i958_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_conv13_i958_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_conv13_i958_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_conv13_i958_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_conv13_i958 & 32'hFF)),
	.data_out(rnode_163to164_bb0_conv13_i958_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_conv13_i958_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_conv13_i958_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_conv13_i958_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_conv13_i958_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_conv13_i958_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv13_i958_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_conv13_i958_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_conv13_i958_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_conv13_i958_0_NO_SHIFT_REG = rnode_163to164_bb0_conv13_i958_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_conv13_i958_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_conv13_i958_1_NO_SHIFT_REG = rnode_163to164_bb0_conv13_i958_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u4_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u4_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u4_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u4_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u4_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u4_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u4_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u4_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u4_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u4_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u4_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u4_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u4_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u4_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u4_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u4_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u4 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u4_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u4_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u4_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u4_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u4_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u4_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u4_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u4_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u4_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u4_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u4_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u4_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u4_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u4_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u5_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u5_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u5_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u5_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u5_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u5_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u5_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u5_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u5_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u5_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u5_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u5_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u5_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u5_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u5_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u5_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u5 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u5_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u5_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u5_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u5_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u5_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u5_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u5_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u5_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u5_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u5_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u5_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u5_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u5_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u5_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u6_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u6_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u6_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u6_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u6_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u6_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u6_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u6_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u6_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u6_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u6_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u6_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u6_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u6_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u6_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u6_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u6 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u6_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u6_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u6_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u6_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u6_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u6_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u6_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u6_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u6_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u6_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u6_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u6_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u6_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u6_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u7_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u7_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u7_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_stall_in_2_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u7_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u7_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u7_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u7_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u7_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u7_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u7_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u7_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u7 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u7_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u7_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u7_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u7_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u7_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u7_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u7_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u7_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u7_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u7_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u7_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u7_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u7_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u7_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u7_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u7_2_NO_SHIFT_REG = rnode_163to165_bb0_var__u7_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shr5_i1107_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i1107_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i1107_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i1107_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i1107_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i1107_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i1107_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i1107_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i1107_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i1107_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i1107_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shr5_i1107_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shr5_i1107_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shr5_i1107_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shr5_i1107_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shr5_i1107_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shr5_i1107 & 32'hFF)),
	.data_out(rnode_163to164_bb0_shr5_i1107_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shr5_i1107_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shr5_i1107_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_shr5_i1107_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shr5_i1107_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shr5_i1107_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr5_i1107_stall_in_2 = 1'b0;
assign rnode_163to164_bb0_shr5_i1107_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i1107_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i1107_0_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i1107_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shr5_i1107_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i1107_1_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i1107_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u8_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u8_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u8_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_stall_in_2_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u8_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u8_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u8_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u8_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u8_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u8_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u8_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u8_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u8 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u8_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u8_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u8_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u8_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u8_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u8_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u8_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u8_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u8_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u8_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u8_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u8_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u8_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u8_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u8_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u8_2_NO_SHIFT_REG = rnode_163to165_bb0_var__u8_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shr5_i751_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i751_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i751_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i751_2_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i751_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i751_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shr5_i751_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shr5_i751_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shr5_i751_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shr5_i751_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shr5_i751_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shr5_i751 & 32'hFF)),
	.data_out(rnode_163to164_bb0_shr5_i751_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shr5_i751_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shr5_i751_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_shr5_i751_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shr5_i751_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shr5_i751_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr5_i751_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_shr5_i751_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i751_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i751_0_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i751_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shr5_i751_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i751_1_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i751_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shr5_i751_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i751_2_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i751_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_conv6_i752_0_valid_out_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i752_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_conv6_i752_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i752_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_conv6_i752_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i752_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i752_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i752_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_conv6_i752_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_conv6_i752_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_conv6_i752_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_conv6_i752_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_conv6_i752_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_conv6_i752 & 64'h1FF)),
	.data_out(rnode_163to164_bb0_conv6_i752_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_conv6_i752_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_conv6_i752_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_conv6_i752_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_conv6_i752_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_conv6_i752_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv6_i752_stall_in = 1'b0;
assign rnode_163to164_bb0_conv6_i752_0_NO_SHIFT_REG = rnode_163to164_bb0_conv6_i752_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_conv6_i752_0_stall_in_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_conv6_i752_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u9_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u9_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u9_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_stall_in_2_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u9_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u9_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u9_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u9_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u9_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u9_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u9_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u9_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u9 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u9_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u9_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u9_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u9_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u9_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u9_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u9_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u9_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u9_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u9_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u9_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u9_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u9_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u9_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u9_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u9_2_NO_SHIFT_REG = rnode_163to165_bb0_var__u9_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shr5_i395_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i395_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i395_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i395_2_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i395_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i395_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shr5_i395_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shr5_i395_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shr5_i395_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shr5_i395_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shr5_i395_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shr5_i395 & 32'hFF)),
	.data_out(rnode_163to164_bb0_shr5_i395_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shr5_i395_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shr5_i395_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_shr5_i395_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shr5_i395_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shr5_i395_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr5_i395_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_shr5_i395_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i395_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i395_0_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i395_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shr5_i395_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i395_1_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i395_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shr5_i395_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i395_2_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i395_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_conv6_i396_0_valid_out_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i396_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_conv6_i396_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i396_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_conv6_i396_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i396_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i396_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i396_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_conv6_i396_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_conv6_i396_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_conv6_i396_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_conv6_i396_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_conv6_i396_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_conv6_i396 & 64'h1FF)),
	.data_out(rnode_163to164_bb0_conv6_i396_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_conv6_i396_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_conv6_i396_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_conv6_i396_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_conv6_i396_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_conv6_i396_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv6_i396_stall_in = 1'b0;
assign rnode_163to164_bb0_conv6_i396_0_NO_SHIFT_REG = rnode_163to164_bb0_conv6_i396_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_conv6_i396_0_stall_in_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_conv6_i396_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_163to165_bb0_var__u10_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u10_0_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u10_1_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_stall_in_2_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u10_2_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to165_bb0_var__u10_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_163to165_bb0_var__u10_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_163to165_bb0_var__u10_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to165_bb0_var__u10_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to165_bb0_var__u10_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_163to165_bb0_var__u10_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_163to165_bb0_var__u10_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_var__u10 & 64'h1)),
	.data_out(rnode_163to165_bb0_var__u10_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_163to165_bb0_var__u10_0_reg_165_fifo.DEPTH = 2;
defparam rnode_163to165_bb0_var__u10_0_reg_165_fifo.DATA_WIDTH = 64;
defparam rnode_163to165_bb0_var__u10_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to165_bb0_var__u10_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_163to165_bb0_var__u10_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u10_stall_in = 1'b0;
assign rnode_163to165_bb0_var__u10_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u10_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u10_0_NO_SHIFT_REG = rnode_163to165_bb0_var__u10_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u10_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u10_1_NO_SHIFT_REG = rnode_163to165_bb0_var__u10_0_reg_165_NO_SHIFT_REG;
assign rnode_163to165_bb0_var__u10_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_163to165_bb0_var__u10_2_NO_SHIFT_REG = rnode_163to165_bb0_var__u10_0_reg_165_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shr5_i39_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i39_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i39_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i39_2_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_shr5_i39_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shr5_i39_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shr5_i39_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shr5_i39_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shr5_i39_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shr5_i39_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shr5_i39_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shr5_i39 & 32'hFF)),
	.data_out(rnode_163to164_bb0_shr5_i39_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shr5_i39_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shr5_i39_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_shr5_i39_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shr5_i39_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shr5_i39_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr5_i39_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_shr5_i39_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i39_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i39_0_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i39_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shr5_i39_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i39_1_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i39_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shr5_i39_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i39_2_NO_SHIFT_REG = rnode_163to164_bb0_shr5_i39_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_conv6_i40_0_valid_out_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i40_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_conv6_i40_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i40_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_conv6_i40_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i40_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i40_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_conv6_i40_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_conv6_i40_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_conv6_i40_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_conv6_i40_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_conv6_i40_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_conv6_i40_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_conv6_i40 & 64'h1FF)),
	.data_out(rnode_163to164_bb0_conv6_i40_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_conv6_i40_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_conv6_i40_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_conv6_i40_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_conv6_i40_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_conv6_i40_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv6_i40_stall_in = 1'b0;
assign rnode_163to164_bb0_conv6_i40_0_NO_SHIFT_REG = rnode_163to164_bb0_conv6_i40_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_conv6_i40_0_stall_in_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_conv6_i40_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shl_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shl_i_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shl_i_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shl_i_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shl_i_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shl_i_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shl_i & 64'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_shl_i_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shl_i_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shl_i_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_shl_i_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shl_i_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shl_i_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl_i_stall_in_1 = 1'b0;
assign rnode_163to164_bb0_shl_i_0_NO_SHIFT_REG = rnode_163to164_bb0_shl_i_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shl_i_0_stall_in_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shl_i783_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i783_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i783_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i783_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i783_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i783_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i783_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i783_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i783_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i783_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i783_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shl_i783_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shl_i783_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shl_i783_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shl_i783_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shl_i783_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shl_i783 & 64'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_shl_i783_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shl_i783_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shl_i783_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_shl_i783_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shl_i783_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shl_i783_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl_i783_stall_in = 1'b0;
assign rnode_163to164_bb0_shl_i783_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i783_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i783_0_NO_SHIFT_REG = rnode_163to164_bb0_shl_i783_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shl_i783_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i783_1_NO_SHIFT_REG = rnode_163to164_bb0_shl_i783_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shl_i427_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i427_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i427_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i427_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i427_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i427_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i427_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i427_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i427_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i427_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i427_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shl_i427_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shl_i427_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shl_i427_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shl_i427_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shl_i427_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shl_i427 & 64'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_shl_i427_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shl_i427_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shl_i427_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_shl_i427_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shl_i427_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shl_i427_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl_i427_stall_in = 1'b0;
assign rnode_163to164_bb0_shl_i427_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i427_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i427_0_NO_SHIFT_REG = rnode_163to164_bb0_shl_i427_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shl_i427_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i427_1_NO_SHIFT_REG = rnode_163to164_bb0_shl_i427_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shl_i71_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i71_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i71_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i71_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i71_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i71_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i71_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i71_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i71_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i71_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i71_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shl_i71_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shl_i71_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shl_i71_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shl_i71_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shl_i71_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shl_i71 & 64'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_shl_i71_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shl_i71_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shl_i71_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_shl_i71_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shl_i71_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shl_i71_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl_i71_stall_in = 1'b0;
assign rnode_163to164_bb0_shl_i71_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i71_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i71_0_NO_SHIFT_REG = rnode_163to164_bb0_shl_i71_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shl_i71_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i71_1_NO_SHIFT_REG = rnode_163to164_bb0_shl_i71_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shl_i762_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i762_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i762_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i762_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i762_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i762_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i762_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i762_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i762_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i762_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i762_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shl_i762_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shl_i762_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shl_i762_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shl_i762_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shl_i762_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shl_i762 & 64'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_shl_i762_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shl_i762_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shl_i762_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_shl_i762_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shl_i762_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shl_i762_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl_i762_stall_in = 1'b0;
assign rnode_163to164_bb0_shl_i762_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i762_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i762_0_NO_SHIFT_REG = rnode_163to164_bb0_shl_i762_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shl_i762_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i762_1_NO_SHIFT_REG = rnode_163to164_bb0_shl_i762_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shl_i406_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i406_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i406_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i406_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i406_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i406_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i406_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i406_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i406_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i406_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i406_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shl_i406_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shl_i406_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shl_i406_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shl_i406_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shl_i406_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shl_i406 & 64'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_shl_i406_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shl_i406_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shl_i406_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_shl_i406_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shl_i406_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shl_i406_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl_i406_stall_in = 1'b0;
assign rnode_163to164_bb0_shl_i406_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i406_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i406_0_NO_SHIFT_REG = rnode_163to164_bb0_shl_i406_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shl_i406_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i406_1_NO_SHIFT_REG = rnode_163to164_bb0_shl_i406_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_shl_i50_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i50_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i50_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i50_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i50_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i50_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i50_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_163to164_bb0_shl_i50_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i50_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i50_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_shl_i50_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_shl_i50_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_shl_i50_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_shl_i50_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_shl_i50_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_shl_i50_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_shl_i50 & 64'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_shl_i50_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_shl_i50_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_shl_i50_0_reg_164_fifo.DATA_WIDTH = 64;
defparam rnode_163to164_bb0_shl_i50_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_shl_i50_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_shl_i50_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl_i50_stall_in = 1'b0;
assign rnode_163to164_bb0_shl_i50_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i50_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i50_0_NO_SHIFT_REG = rnode_163to164_bb0_shl_i50_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_shl_i50_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shl_i50_1_NO_SHIFT_REG = rnode_163to164_bb0_shl_i50_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_and18_lobit_i974_0_valid_out_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and18_lobit_i974_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and18_lobit_i974_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and18_lobit_i974_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and18_lobit_i974_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and18_lobit_i974_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and18_lobit_i974_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and18_lobit_i974_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_and18_lobit_i974_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_and18_lobit_i974_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_and18_lobit_i974_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_and18_lobit_i974_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_and18_lobit_i974_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_and18_lobit_i974 & 32'h1)),
	.data_out(rnode_163to164_bb0_and18_lobit_i974_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_and18_lobit_i974_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_and18_lobit_i974_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_and18_lobit_i974_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_and18_lobit_i974_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_and18_lobit_i974_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and18_lobit_i974_stall_in = 1'b0;
assign rnode_163to164_bb0_and18_lobit_i974_0_NO_SHIFT_REG = rnode_163to164_bb0_and18_lobit_i974_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_and18_lobit_i974_0_stall_in_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and18_lobit_i974_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_y_tr_i954_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_y_tr_i954_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_y_tr_i954_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_y_tr_i954_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_y_tr_i954_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_y_tr_i954_1_NO_SHIFT_REG;
 logic rnode_163to164_bb0_y_tr_i954_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_y_tr_i954_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_y_tr_i954_0_valid_out_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_y_tr_i954_0_stall_in_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_y_tr_i954_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_y_tr_i954_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_y_tr_i954_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_y_tr_i954_0_stall_in_0_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_y_tr_i954_0_valid_out_0_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_y_tr_i954_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_y_tr_i954 & 32'h7FFFFF8)),
	.data_out(rnode_163to164_bb0_y_tr_i954_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_y_tr_i954_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_y_tr_i954_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_y_tr_i954_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_y_tr_i954_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_y_tr_i954_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_y_tr_i954_stall_in = 1'b0;
assign rnode_163to164_bb0_y_tr_i954_0_stall_in_0_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_y_tr_i954_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_y_tr_i954_0_NO_SHIFT_REG = rnode_163to164_bb0_y_tr_i954_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_y_tr_i954_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_y_tr_i954_1_NO_SHIFT_REG = rnode_163to164_bb0_y_tr_i954_0_reg_164_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_and190_i1039_0_valid_out_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and190_i1039_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and190_i1039_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and190_i1039_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_and190_i1039_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and190_i1039_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and190_i1039_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_and190_i1039_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_and190_i1039_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_and190_i1039_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_and190_i1039_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_and190_i1039_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_and190_i1039_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_and190_i1039 & 32'h1E0)),
	.data_out(rnode_163to164_bb0_and190_i1039_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_and190_i1039_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_and190_i1039_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_and190_i1039_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_and190_i1039_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_and190_i1039_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and190_i1039_stall_in = 1'b0;
assign rnode_163to164_bb0_and190_i1039_0_NO_SHIFT_REG = rnode_163to164_bb0_and190_i1039_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_and190_i1039_0_stall_in_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and190_i1039_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_163to164_bb0_c3_diff_0_op_i1041_0_valid_out_NO_SHIFT_REG;
 logic rnode_163to164_bb0_c3_diff_0_op_i1041_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_c3_diff_0_op_i1041_0_NO_SHIFT_REG;
 logic rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_c3_diff_0_op_i1041_0_valid_out_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_c3_diff_0_op_i1041_0_stall_in_reg_164_NO_SHIFT_REG;
 logic rnode_163to164_bb0_c3_diff_0_op_i1041_0_stall_out_reg_164_NO_SHIFT_REG;

acl_data_fifo rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_163to164_bb0_c3_diff_0_op_i1041_0_stall_in_reg_164_NO_SHIFT_REG),
	.valid_out(rnode_163to164_bb0_c3_diff_0_op_i1041_0_valid_out_reg_164_NO_SHIFT_REG),
	.stall_out(rnode_163to164_bb0_c3_diff_0_op_i1041_0_stall_out_reg_164_NO_SHIFT_REG),
	.data_in((local_bb0_c3_diff_0_op_i1041 & 32'h1F)),
	.data_out(rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_NO_SHIFT_REG)
);

defparam rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_fifo.DEPTH = 1;
defparam rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_fifo.DATA_WIDTH = 32;
defparam rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_fifo.IMPL = "shift_reg";

assign rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_c3_diff_0_op_i1041_stall_in = 1'b0;
assign rnode_163to164_bb0_c3_diff_0_op_i1041_0_NO_SHIFT_REG = rnode_163to164_bb0_c3_diff_0_op_i1041_0_reg_164_NO_SHIFT_REG;
assign rnode_163to164_bb0_c3_diff_0_op_i1041_0_stall_in_reg_164_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_c3_diff_0_op_i1041_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i773_stall_local;
wire [63:0] local_bb0_conv6_i773;

assign local_bb0_conv6_i773[63:32] = 32'h0;
assign local_bb0_conv6_i773[31:0] = (rnode_163to164_bb0_and4_i771_0_NO_SHIFT_REG & 32'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv13_i602_stall_local;
wire [31:0] local_bb0_conv13_i602;

assign local_bb0_conv13_i602 = ((rnode_163to164_bb0_and4_i771_1_NO_SHIFT_REG & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i417_stall_local;
wire [63:0] local_bb0_conv6_i417;

assign local_bb0_conv6_i417[63:32] = 32'h0;
assign local_bb0_conv6_i417[31:0] = (rnode_163to164_bb0_and4_i415_0_NO_SHIFT_REG & 32'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv13_i246_stall_local;
wire [31:0] local_bb0_conv13_i246;

assign local_bb0_conv13_i246 = ((rnode_163to164_bb0_and4_i415_1_NO_SHIFT_REG & 32'h1FF) & 32'hFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv6_i61_stall_local;
wire [63:0] local_bb0_conv6_i61;

assign local_bb0_conv6_i61[63:32] = 32'h0;
assign local_bb0_conv6_i61[31:0] = (rnode_163to164_bb0_and4_i59_0_NO_SHIFT_REG & 32'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv13_i_stall_local;
wire [31:0] local_bb0_conv13_i;

assign local_bb0_conv13_i = ((rnode_163to164_bb0_and4_i59_1_NO_SHIFT_REG & 32'h1FF) & 32'hFF);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv13_i958_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i958_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i958_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i958_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i958_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i958_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i958_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i958_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv13_i958_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv13_i958_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv13_i958_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv13_i958_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv13_i958_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((rnode_163to164_bb0_conv13_i958_1_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_164to165_bb0_conv13_i958_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv13_i958_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv13_i958_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv13_i958_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv13_i958_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv13_i958_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_conv13_i958_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i958_0_NO_SHIFT_REG = rnode_164to165_bb0_conv13_i958_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv13_i958_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i958_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_var__u14_stall_local;
wire [31:0] local_bb0_var__u14;
wire [63:0] local_bb0_var__u14$ps;

assign local_bb0_var__u14$ps = (rnode_163to165_bb0_var__u7_0_NO_SHIFT_REG & 64'h1);
assign local_bb0_var__u14 = local_bb0_var__u14$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i965_stall_local;
wire local_bb0_cmp_i965;

assign local_bb0_cmp_i965 = ((rnode_163to164_bb0_conv13_i958_0_NO_SHIFT_REG & 32'hFF) == (rnode_163to164_bb0_shr5_i1107_0_NO_SHIFT_REG & 32'hFF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_shr5_i1107_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i1107_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i1107_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i1107_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i1107_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i1107_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i1107_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i1107_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_shr5_i1107_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_shr5_i1107_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_shr5_i1107_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_shr5_i1107_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_shr5_i1107_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((rnode_163to164_bb0_shr5_i1107_1_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_164to165_bb0_shr5_i1107_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_shr5_i1107_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_shr5_i1107_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_shr5_i1107_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_shr5_i1107_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_shr5_i1107_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i1107_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i1107_0_NO_SHIFT_REG = rnode_164to165_bb0_shr5_i1107_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_shr5_i1107_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i1107_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_var__u15_stall_local;
wire [31:0] local_bb0_var__u15;
wire [63:0] local_bb0_var__u15$ps;

assign local_bb0_var__u15$ps = (rnode_163to165_bb0_var__u8_0_NO_SHIFT_REG & 64'h1);
assign local_bb0_var__u15 = local_bb0_var__u15$ps[31:0];

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_shr5_i751_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i751_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i751_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i751_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i751_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i751_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i751_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i751_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_shr5_i751_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_shr5_i751_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_shr5_i751_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_shr5_i751_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_shr5_i751_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((rnode_163to164_bb0_shr5_i751_2_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_164to165_bb0_shr5_i751_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_shr5_i751_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_shr5_i751_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_shr5_i751_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_shr5_i751_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_shr5_i751_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i751_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i751_0_NO_SHIFT_REG = rnode_164to165_bb0_shr5_i751_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_shr5_i751_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i751_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i764_stall_local;
wire [63:0] local_bb0_shl21_i764;

assign local_bb0_shl21_i764 = ((rnode_163to164_bb0_conv6_i752_0_NO_SHIFT_REG & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u16_stall_local;
wire [31:0] local_bb0_var__u16;
wire [63:0] local_bb0_var__u16$ps;

assign local_bb0_var__u16$ps = (rnode_163to165_bb0_var__u9_0_NO_SHIFT_REG & 64'h1);
assign local_bb0_var__u16 = local_bb0_var__u16$ps[31:0];

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_shr5_i395_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i395_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i395_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i395_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i395_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i395_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i395_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i395_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_shr5_i395_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_shr5_i395_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_shr5_i395_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_shr5_i395_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_shr5_i395_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((rnode_163to164_bb0_shr5_i395_2_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_164to165_bb0_shr5_i395_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_shr5_i395_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_shr5_i395_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_shr5_i395_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_shr5_i395_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_shr5_i395_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i395_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i395_0_NO_SHIFT_REG = rnode_164to165_bb0_shr5_i395_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_shr5_i395_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i395_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i408_stall_local;
wire [63:0] local_bb0_shl21_i408;

assign local_bb0_shl21_i408 = ((rnode_163to164_bb0_conv6_i396_0_NO_SHIFT_REG & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u17_stall_local;
wire [31:0] local_bb0_var__u17;
wire [63:0] local_bb0_var__u17$ps;

assign local_bb0_var__u17$ps = (rnode_163to165_bb0_var__u10_0_NO_SHIFT_REG & 64'h1);
assign local_bb0_var__u17 = local_bb0_var__u17$ps[31:0];

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_shr5_i39_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i39_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i39_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i39_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_shr5_i39_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i39_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i39_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_shr5_i39_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_shr5_i39_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_shr5_i39_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_shr5_i39_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_shr5_i39_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_shr5_i39_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((rnode_163to164_bb0_shr5_i39_2_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_164to165_bb0_shr5_i39_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_shr5_i39_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_shr5_i39_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_shr5_i39_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_shr5_i39_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_shr5_i39_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_shr5_i39_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i39_0_NO_SHIFT_REG = rnode_164to165_bb0_shr5_i39_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_shr5_i39_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i39_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i52_stall_local;
wire [63:0] local_bb0_shl21_i52;

assign local_bb0_shl21_i52 = ((rnode_163to164_bb0_conv6_i40_0_NO_SHIFT_REG & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_x_tr_i952_stall_local;
wire [31:0] local_bb0_x_tr_i952;
wire [63:0] local_bb0_x_tr_i952$ps;

assign local_bb0_x_tr_i952$ps = (rnode_163to164_bb0_shl_i_0_NO_SHIFT_REG & 64'h7FFFFF8);
assign local_bb0_x_tr_i952 = local_bb0_x_tr_i952$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_x_tr_i596_stall_local;
wire [31:0] local_bb0_x_tr_i596;
wire [63:0] local_bb0_x_tr_i596$ps;

assign local_bb0_x_tr_i596$ps = (rnode_163to164_bb0_shl_i783_1_NO_SHIFT_REG & 64'h7FFFFF8);
assign local_bb0_x_tr_i596 = local_bb0_x_tr_i596$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_x_tr_i240_stall_local;
wire [31:0] local_bb0_x_tr_i240;
wire [63:0] local_bb0_x_tr_i240$ps;

assign local_bb0_x_tr_i240$ps = (rnode_163to164_bb0_shl_i427_1_NO_SHIFT_REG & 64'h7FFFFF8);
assign local_bb0_x_tr_i240 = local_bb0_x_tr_i240$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_x_tr_i_stall_local;
wire [31:0] local_bb0_x_tr_i;
wire [63:0] local_bb0_x_tr_i$ps;

assign local_bb0_x_tr_i$ps = (rnode_163to164_bb0_shl_i71_1_NO_SHIFT_REG & 64'h7FFFFF8);
assign local_bb0_x_tr_i = local_bb0_x_tr_i$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_y_tr_i598_stall_local;
wire [31:0] local_bb0_y_tr_i598;
wire [63:0] local_bb0_y_tr_i598$ps;

assign local_bb0_y_tr_i598$ps = (rnode_163to164_bb0_shl_i762_1_NO_SHIFT_REG & 64'h7FFFFF8);
assign local_bb0_y_tr_i598 = local_bb0_y_tr_i598$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_y_tr_i242_stall_local;
wire [31:0] local_bb0_y_tr_i242;
wire [63:0] local_bb0_y_tr_i242$ps;

assign local_bb0_y_tr_i242$ps = (rnode_163to164_bb0_shl_i406_1_NO_SHIFT_REG & 64'h7FFFFF8);
assign local_bb0_y_tr_i242 = local_bb0_y_tr_i242$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_y_tr_i_stall_local;
wire [31:0] local_bb0_y_tr_i;
wire [63:0] local_bb0_y_tr_i$ps;

assign local_bb0_y_tr_i$ps = (rnode_163to164_bb0_shl_i50_1_NO_SHIFT_REG & 64'h7FFFFF8);
assign local_bb0_y_tr_i = local_bb0_y_tr_i$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_conv10_i955_stall_local;
wire [31:0] local_bb0_conv10_i955;

assign local_bb0_conv10_i955 = ((rnode_163to164_bb0_y_tr_i954_0_NO_SHIFT_REG & 32'h7FFFFF8) & 32'h7FFFFF8);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_y_tr_i954_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i954_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i954_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i954_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i954_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i954_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i954_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i954_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_y_tr_i954_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_y_tr_i954_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_y_tr_i954_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_y_tr_i954_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_y_tr_i954_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((rnode_163to164_bb0_y_tr_i954_1_NO_SHIFT_REG & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_y_tr_i954_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_y_tr_i954_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_y_tr_i954_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_y_tr_i954_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_y_tr_i954_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_y_tr_i954_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_163to164_bb0_y_tr_i954_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i954_0_NO_SHIFT_REG = rnode_164to165_bb0_y_tr_i954_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_y_tr_i954_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i954_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i1040_stall_local;
wire local_bb0_tobool191_i1040;

assign local_bb0_tobool191_i1040 = ((rnode_163to164_bb0_and190_i1039_0_NO_SHIFT_REG & 32'h1E0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i785_stall_local;
wire [63:0] local_bb0_shl21_i785;

assign local_bb0_shl21_i785 = ((local_bb0_conv6_i773 & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i606_stall_local;
wire [31:0] local_bb0_sub_i606;

assign local_bb0_sub_i606 = ((local_bb0_conv13_i602 & 32'hFF) - (rnode_163to164_bb0_shr5_i751_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i609_stall_local;
wire local_bb0_cmp_i609;

assign local_bb0_cmp_i609 = ((local_bb0_conv13_i602 & 32'hFF) == (rnode_163to164_bb0_shr5_i751_1_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i429_stall_local;
wire [63:0] local_bb0_shl21_i429;

assign local_bb0_shl21_i429 = ((local_bb0_conv6_i417 & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i250_stall_local;
wire [31:0] local_bb0_sub_i250;

assign local_bb0_sub_i250 = ((local_bb0_conv13_i246 & 32'hFF) - (rnode_163to164_bb0_shr5_i395_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i253_stall_local;
wire local_bb0_cmp_i253;

assign local_bb0_cmp_i253 = ((local_bb0_conv13_i246 & 32'hFF) == (rnode_163to164_bb0_shr5_i395_1_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_shl21_i73_stall_local;
wire [63:0] local_bb0_shl21_i73;

assign local_bb0_shl21_i73 = ((local_bb0_conv6_i61 & 64'h1FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i17_stall_local;
wire [31:0] local_bb0_sub_i17;

assign local_bb0_sub_i17 = ((local_bb0_conv13_i & 32'hFF) - (rnode_163to164_bb0_shr5_i39_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i18_stall_local;
wire local_bb0_cmp_i18;

assign local_bb0_cmp_i18 = ((local_bb0_conv13_i & 32'hFF) == (rnode_163to164_bb0_shr5_i39_1_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext_i979_stall_local;
wire [31:0] local_bb0_lnot_ext_i979;

assign local_bb0_lnot_ext_i979 = ((local_bb0_var__u14 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext_i623_stall_local;
wire [31:0] local_bb0_lnot_ext_i623;

assign local_bb0_lnot_ext_i623 = ((local_bb0_var__u15 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_or23_i766_stall_local;
wire [63:0] local_bb0_or23_i766;

assign local_bb0_or23_i766 = ((local_bb0_shl21_i764 & 64'hFF8000000) | (rnode_163to164_bb0_shl_i762_0_NO_SHIFT_REG & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext_i267_stall_local;
wire [31:0] local_bb0_lnot_ext_i267;

assign local_bb0_lnot_ext_i267 = ((local_bb0_var__u16 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_or23_i410_stall_local;
wire [63:0] local_bb0_or23_i410;

assign local_bb0_or23_i410 = ((local_bb0_shl21_i408 & 64'hFF8000000) | (rnode_163to164_bb0_shl_i406_0_NO_SHIFT_REG & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext_i_stall_local;
wire [31:0] local_bb0_lnot_ext_i;

assign local_bb0_lnot_ext_i = ((local_bb0_var__u17 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_or23_i54_stall_local;
wire [63:0] local_bb0_or23_i54;

assign local_bb0_or23_i54 = ((local_bb0_shl21_i52 & 64'hFF8000000) | (rnode_163to164_bb0_shl_i50_0_NO_SHIFT_REG & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i953_stall_local;
wire [31:0] local_bb0_conv_i953;

assign local_bb0_conv_i953 = ((local_bb0_x_tr_i952 & 32'h7FFFFF8) & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i597_stall_local;
wire [31:0] local_bb0_conv_i597;

assign local_bb0_conv_i597 = ((local_bb0_x_tr_i596 & 32'h7FFFFF8) & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i241_stall_local;
wire [31:0] local_bb0_conv_i241;

assign local_bb0_conv_i241 = ((local_bb0_x_tr_i240 & 32'h7FFFFF8) & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i16_stall_local;
wire [31:0] local_bb0_conv_i16;

assign local_bb0_conv_i16 = ((local_bb0_x_tr_i & 32'h7FFFFF8) & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_conv10_i599_stall_local;
wire [31:0] local_bb0_conv10_i599;

assign local_bb0_conv10_i599 = ((local_bb0_y_tr_i598 & 32'h7FFFFF8) & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_conv10_i243_stall_local;
wire [31:0] local_bb0_conv10_i243;

assign local_bb0_conv10_i243 = ((local_bb0_y_tr_i242 & 32'h7FFFFF8) & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_conv10_i_stall_local;
wire [31:0] local_bb0_conv10_i;

assign local_bb0_conv10_i = ((local_bb0_y_tr_i & 32'h7FFFFF8) & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_and196_i1042_valid_out;
wire local_bb0_and196_i1042_stall_in;
wire local_bb0_and196_i1042_inputs_ready;
wire local_bb0_and196_i1042_stall_local;
wire [31:0] local_bb0_and196_i1042;

assign local_bb0_and196_i1042_inputs_ready = (rnode_163to164_bb0_and190_i1039_0_valid_out_NO_SHIFT_REG & rnode_163to164_bb0_c3_diff_0_op_i1041_0_valid_out_NO_SHIFT_REG);
assign local_bb0_and196_i1042 = (local_bb0_tobool191_i1040 ? 32'h1F : (rnode_163to164_bb0_c3_diff_0_op_i1041_0_NO_SHIFT_REG & 32'h1F));
assign local_bb0_and196_i1042_valid_out = 1'b1;
assign rnode_163to164_bb0_and190_i1039_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_c3_diff_0_op_i1041_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_or23_i787_stall_local;
wire [63:0] local_bb0_or23_i787;

assign local_bb0_or23_i787 = ((local_bb0_shl21_i785 & 64'hFF8000000) | (rnode_163to164_bb0_shl_i783_0_NO_SHIFT_REG & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and18_i607_stall_local;
wire [31:0] local_bb0_and18_i607;

assign local_bb0_and18_i607 = (local_bb0_sub_i606 & 32'h200);

// This section implements an unregistered operation.
// 
wire local_bb0_or23_i431_stall_local;
wire [63:0] local_bb0_or23_i431;

assign local_bb0_or23_i431 = ((local_bb0_shl21_i429 & 64'hFF8000000) | (rnode_163to164_bb0_shl_i427_0_NO_SHIFT_REG & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and18_i251_stall_local;
wire [31:0] local_bb0_and18_i251;

assign local_bb0_and18_i251 = (local_bb0_sub_i250 & 32'h200);

// This section implements an unregistered operation.
// 
wire local_bb0_or23_i75_stall_local;
wire [63:0] local_bb0_or23_i75;

assign local_bb0_or23_i75 = ((local_bb0_shl21_i73 & 64'hFF8000000) | (rnode_163to164_bb0_shl_i71_0_NO_SHIFT_REG & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and18_i_stall_local;
wire [31:0] local_bb0_and18_i;

assign local_bb0_and18_i = (local_bb0_sub_i17 & 32'h200);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i966_stall_local;
wire local_bb0_cmp23_i966;

assign local_bb0_cmp23_i966 = ((local_bb0_conv_i953 & 32'h7FFFFF8) == (local_bb0_conv10_i955 & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp26_i967_stall_local;
wire local_bb0_cmp26_i967;

assign local_bb0_cmp26_i967 = ((local_bb0_conv10_i955 & 32'h7FFFFF8) > (local_bb0_conv_i953 & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i610_stall_local;
wire local_bb0_cmp23_i610;

assign local_bb0_cmp23_i610 = ((local_bb0_conv_i597 & 32'h7FFFFF8) == (local_bb0_conv10_i599 & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp26_i611_stall_local;
wire local_bb0_cmp26_i611;

assign local_bb0_cmp26_i611 = ((local_bb0_conv10_i599 & 32'h7FFFFF8) > (local_bb0_conv_i597 & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i254_stall_local;
wire local_bb0_cmp23_i254;

assign local_bb0_cmp23_i254 = ((local_bb0_conv_i241 & 32'h7FFFFF8) == (local_bb0_conv10_i243 & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp26_i255_stall_local;
wire local_bb0_cmp26_i255;

assign local_bb0_cmp26_i255 = ((local_bb0_conv10_i243 & 32'h7FFFFF8) > (local_bb0_conv_i241 & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i19_stall_local;
wire local_bb0_cmp23_i19;

assign local_bb0_cmp23_i19 = ((local_bb0_conv_i16 & 32'h7FFFFF8) == (local_bb0_conv10_i & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp26_i_stall_local;
wire local_bb0_cmp26_i;

assign local_bb0_cmp26_i = ((local_bb0_conv10_i & 32'h7FFFFF8) > (local_bb0_conv_i16 & 32'h7FFFFF8));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and196_i1042_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and196_i1042_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and196_i1042_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and196_i1042_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and196_i1042_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and196_i1042_1_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and196_i1042_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and196_i1042_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and196_i1042_0_valid_out_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and196_i1042_0_stall_in_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and196_i1042_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and196_i1042_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and196_i1042_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and196_i1042_0_stall_in_0_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and196_i1042_0_valid_out_0_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and196_i1042_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_and196_i1042 & 32'h1F)),
	.data_out(rnode_164to165_bb0_and196_i1042_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and196_i1042_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and196_i1042_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_and196_i1042_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and196_i1042_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and196_i1042_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and196_i1042_stall_in = 1'b0;
assign rnode_164to165_bb0_and196_i1042_0_stall_in_0_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and196_i1042_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_164to165_bb0_and196_i1042_0_NO_SHIFT_REG = rnode_164to165_bb0_and196_i1042_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and196_i1042_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_164to165_bb0_and196_i1042_1_NO_SHIFT_REG = rnode_164to165_bb0_and196_i1042_0_reg_165_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and525051_i671_stall_local;
wire [63:0] local_bb0_and525051_i671;

assign local_bb0_and525051_i671 = ((local_bb0_or23_i766 & 64'hFFFFFFFF8) ^ (local_bb0_or23_i787 & 64'hFFFFFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool19_i608_stall_local;
wire local_bb0_tobool19_i608;

assign local_bb0_tobool19_i608 = ((local_bb0_and18_i607 & 32'h200) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and18_lobit_i618_stall_local;
wire [31:0] local_bb0_and18_lobit_i618;

assign local_bb0_and18_lobit_i618 = ((local_bb0_and18_i607 & 32'h200) >> 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_and525051_i315_stall_local;
wire [63:0] local_bb0_and525051_i315;

assign local_bb0_and525051_i315 = ((local_bb0_or23_i410 & 64'hFFFFFFFF8) ^ (local_bb0_or23_i431 & 64'hFFFFFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool19_i252_stall_local;
wire local_bb0_tobool19_i252;

assign local_bb0_tobool19_i252 = ((local_bb0_and18_i251 & 32'h200) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and18_lobit_i262_stall_local;
wire [31:0] local_bb0_and18_lobit_i262;

assign local_bb0_and18_lobit_i262 = ((local_bb0_and18_i251 & 32'h200) >> 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_and525051_i_stall_local;
wire [63:0] local_bb0_and525051_i;

assign local_bb0_and525051_i = ((local_bb0_or23_i54 & 64'hFFFFFFFF8) ^ (local_bb0_or23_i75 & 64'hFFFFFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool19_i_stall_local;
wire local_bb0_tobool19_i;

assign local_bb0_tobool19_i = ((local_bb0_and18_i & 32'h200) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and18_lobit_i_stall_local;
wire [31:0] local_bb0_and18_lobit_i;

assign local_bb0_and18_lobit_i = ((local_bb0_and18_i & 32'h200) >> 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_and664_i977_stall_local;
wire local_bb0_and664_i977;

assign local_bb0_and664_i977 = (local_bb0_cmp_i965 & local_bb0_cmp23_i966);

// This section implements an unregistered operation.
// 
wire local_bb0_and613_i975_stall_local;
wire local_bb0_and613_i975;

assign local_bb0_and613_i975 = (local_bb0_cmp_i965 & local_bb0_cmp26_i967);

// This section implements an unregistered operation.
// 
wire local_bb0_and664_i621_stall_local;
wire local_bb0_and664_i621;

assign local_bb0_and664_i621 = (local_bb0_cmp_i609 & local_bb0_cmp23_i610);

// This section implements an unregistered operation.
// 
wire local_bb0_and613_i619_stall_local;
wire local_bb0_and613_i619;

assign local_bb0_and613_i619 = (local_bb0_cmp_i609 & local_bb0_cmp26_i611);

// This section implements an unregistered operation.
// 
wire local_bb0_and664_i265_stall_local;
wire local_bb0_and664_i265;

assign local_bb0_and664_i265 = (local_bb0_cmp_i253 & local_bb0_cmp23_i254);

// This section implements an unregistered operation.
// 
wire local_bb0_and613_i263_stall_local;
wire local_bb0_and613_i263;

assign local_bb0_and613_i263 = (local_bb0_cmp_i253 & local_bb0_cmp26_i255);

// This section implements an unregistered operation.
// 
wire local_bb0_and664_i_stall_local;
wire local_bb0_and664_i;

assign local_bb0_and664_i = (local_bb0_cmp_i18 & local_bb0_cmp23_i19);

// This section implements an unregistered operation.
// 
wire local_bb0_and613_i_stall_local;
wire local_bb0_and613_i;

assign local_bb0_and613_i = (local_bb0_cmp_i18 & local_bb0_cmp26_i);

// This section implements an unregistered operation.
// 
wire local_bb0_and225_i1049_stall_local;
wire [31:0] local_bb0_and225_i1049;

assign local_bb0_and225_i1049 = ((rnode_164to165_bb0_and196_i1042_0_NO_SHIFT_REG & 32'h1F) & 32'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_and283_i1075_stall_local;
wire [31:0] local_bb0_and283_i1075;

assign local_bb0_and283_i1075 = ((rnode_164to165_bb0_and196_i1042_1_NO_SHIFT_REG & 32'h1F) & 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_and5250_i672_stall_local;
wire [31:0] local_bb0_and5250_i672;
wire [63:0] local_bb0_and5250_i672$ps;

assign local_bb0_and5250_i672$ps = (local_bb0_and525051_i671 & 64'hFFFFFFFF8);
assign local_bb0_and5250_i672 = local_bb0_and5250_i672$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i670_stall_local;
wire [31:0] local_bb0_cond135_i670;

assign local_bb0_cond135_i670 = (local_bb0_tobool19_i608 ? 32'hFFFF : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and5250_i316_stall_local;
wire [31:0] local_bb0_and5250_i316;
wire [63:0] local_bb0_and5250_i316$ps;

assign local_bb0_and5250_i316$ps = (local_bb0_and525051_i315 & 64'hFFFFFFFF8);
assign local_bb0_and5250_i316 = local_bb0_and5250_i316$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i314_stall_local;
wire [31:0] local_bb0_cond135_i314;

assign local_bb0_cond135_i314 = (local_bb0_tobool19_i252 ? 32'hFFFF : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and5250_i_stall_local;
wire [31:0] local_bb0_and5250_i;
wire [63:0] local_bb0_and5250_i$ps;

assign local_bb0_and5250_i$ps = (local_bb0_and525051_i & 64'hFFFFFFFF8);
assign local_bb0_and5250_i = local_bb0_and5250_i$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i26_stall_local;
wire [31:0] local_bb0_cond135_i26;

assign local_bb0_cond135_i26 = (local_bb0_tobool19_i ? 32'hFFFF : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and61_i976_stall_local;
wire [31:0] local_bb0_and61_i976;

assign local_bb0_and61_i976[31:1] = 31'h0;
assign local_bb0_and61_i976[0] = local_bb0_and613_i975;

// This section implements an unregistered operation.
// 
wire local_bb0_and61_i620_stall_local;
wire [31:0] local_bb0_and61_i620;

assign local_bb0_and61_i620[31:1] = 31'h0;
assign local_bb0_and61_i620[0] = local_bb0_and613_i619;

// This section implements an unregistered operation.
// 
wire local_bb0_and61_i264_stall_local;
wire [31:0] local_bb0_and61_i264;

assign local_bb0_and61_i264[31:1] = 31'h0;
assign local_bb0_and61_i264[0] = local_bb0_and613_i263;

// This section implements an unregistered operation.
// 
wire local_bb0_and61_i_stall_local;
wire [31:0] local_bb0_and61_i;

assign local_bb0_and61_i[31:1] = 31'h0;
assign local_bb0_and61_i[0] = local_bb0_and613_i;

// This section implements an unregistered operation.
// 
wire local_bb0_var__u18_stall_local;
wire [31:0] local_bb0_var__u18;

assign local_bb0_var__u18 = ((local_bb0_and5250_i672 & 32'hFFFFFFF8) >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u19_stall_local;
wire [31:0] local_bb0_var__u19;

assign local_bb0_var__u19 = ((local_bb0_and5250_i672 & 32'hFFFFFFF8) << 32'h5);

// This section implements an unregistered operation.
// 
wire local_bb0_xor186_i679_stall_local;
wire [31:0] local_bb0_xor186_i679;

assign local_bb0_xor186_i679 = ((local_bb0_cond135_i670 & 32'hFFFF) ^ local_bb0_sub_i606);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u20_stall_local;
wire [31:0] local_bb0_var__u20;

assign local_bb0_var__u20 = ((local_bb0_and5250_i316 & 32'hFFFFFFF8) >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u21_stall_local;
wire [31:0] local_bb0_var__u21;

assign local_bb0_var__u21 = ((local_bb0_and5250_i316 & 32'hFFFFFFF8) << 32'h5);

// This section implements an unregistered operation.
// 
wire local_bb0_xor186_i323_stall_local;
wire [31:0] local_bb0_xor186_i323;

assign local_bb0_xor186_i323 = ((local_bb0_cond135_i314 & 32'hFFFF) ^ local_bb0_sub_i250);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u22_stall_local;
wire [31:0] local_bb0_var__u22;

assign local_bb0_var__u22 = ((local_bb0_and5250_i & 32'hFFFFFFF8) >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u23_stall_local;
wire [31:0] local_bb0_var__u23;

assign local_bb0_var__u23 = ((local_bb0_and5250_i & 32'hFFFFFFF8) << 32'h5);

// This section implements an unregistered operation.
// 
wire local_bb0_xor186_i_stall_local;
wire [31:0] local_bb0_xor186_i;

assign local_bb0_xor186_i = ((local_bb0_cond135_i26 & 32'hFFFF) ^ local_bb0_sub_i17);

// This section implements an unregistered operation.
// 
wire local_bb0_and664_i977_valid_out;
wire local_bb0_and664_i977_stall_in;
wire local_bb0_or_i981_valid_out;
wire local_bb0_or_i981_stall_in;
wire local_bb0_x_tr_i952_valid_out_1;
wire local_bb0_x_tr_i952_stall_in_1;
wire local_bb0_conv_i953_valid_out_2;
wire local_bb0_conv_i953_stall_in_2;
wire local_bb0_conv10_i955_valid_out_2;
wire local_bb0_conv10_i955_stall_in_2;
wire local_bb0_or_i981_inputs_ready;
wire local_bb0_or_i981_stall_local;
wire [31:0] local_bb0_or_i981;

assign local_bb0_or_i981_inputs_ready = (rnode_163to164_bb0_conv13_i958_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_shr5_i1107_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_and18_lobit_i974_0_valid_out_NO_SHIFT_REG & rnode_163to164_bb0_shl_i_0_valid_out_NO_SHIFT_REG & rnode_163to164_bb0_y_tr_i954_0_valid_out_0_NO_SHIFT_REG);
assign local_bb0_or_i981 = ((rnode_163to164_bb0_and18_lobit_i974_0_NO_SHIFT_REG & 32'h1) | (local_bb0_and61_i976 & 32'h1));
assign local_bb0_and664_i977_valid_out = 1'b1;
assign local_bb0_or_i981_valid_out = 1'b1;
assign local_bb0_x_tr_i952_valid_out_1 = 1'b1;
assign local_bb0_conv_i953_valid_out_2 = 1'b1;
assign local_bb0_conv10_i955_valid_out_2 = 1'b1;
assign rnode_163to164_bb0_conv13_i958_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i1107_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and18_lobit_i974_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_y_tr_i954_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_or_i625_stall_local;
wire [31:0] local_bb0_or_i625;

assign local_bb0_or_i625 = ((local_bb0_and18_lobit_i618 & 32'h1) | (local_bb0_and61_i620 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_or_i269_stall_local;
wire [31:0] local_bb0_or_i269;

assign local_bb0_or_i269 = ((local_bb0_and18_lobit_i262 & 32'h1) | (local_bb0_and61_i264 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_or_i20_stall_local;
wire [31:0] local_bb0_or_i20;

assign local_bb0_or_i20 = ((local_bb0_and18_lobit_i & 32'h1) | (local_bb0_and61_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_xor173_i673_stall_local;
wire [31:0] local_bb0_xor173_i673;

assign local_bb0_xor173_i673 = ((local_bb0_var__u18 & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u24_stall_local;
wire [31:0] local_bb0_var__u24;

assign local_bb0_var__u24 = ($signed((local_bb0_var__u19 & 32'hFFFFFF00)) >>> 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_xor173_i317_stall_local;
wire [31:0] local_bb0_xor173_i317;

assign local_bb0_xor173_i317 = ((local_bb0_var__u20 & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u25_stall_local;
wire [31:0] local_bb0_var__u25;

assign local_bb0_var__u25 = ($signed((local_bb0_var__u21 & 32'hFFFFFF00)) >>> 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_xor173_i_stall_local;
wire [31:0] local_bb0_xor173_i;

assign local_bb0_xor173_i = ((local_bb0_var__u22 & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u26_stall_local;
wire [31:0] local_bb0_var__u26;

assign local_bb0_var__u26 = ($signed((local_bb0_var__u23 & 32'hFFFFFF00)) >>> 32'h1F);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and664_i977_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i977_0_stall_in_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i977_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i977_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i977_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i977_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i977_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i977_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and664_i977_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and664_i977_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and664_i977_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and664_i977_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and664_i977_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in(local_bb0_and664_i977),
	.data_out(rnode_164to165_bb0_and664_i977_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and664_i977_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and664_i977_0_reg_165_fifo.DATA_WIDTH = 1;
defparam rnode_164to165_bb0_and664_i977_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and664_i977_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and664_i977_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and664_i977_stall_in = 1'b0;
assign rnode_164to165_bb0_and664_i977_0_NO_SHIFT_REG = rnode_164to165_bb0_and664_i977_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and664_i977_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i977_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_or_i981_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i981_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i981_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i981_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i981_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i981_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i981_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i981_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_or_i981_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_or_i981_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_or_i981_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_or_i981_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_or_i981_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_or_i981 & 32'h1)),
	.data_out(rnode_164to165_bb0_or_i981_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_or_i981_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_or_i981_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_or_i981_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_or_i981_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_or_i981_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or_i981_stall_in = 1'b0;
assign rnode_164to165_bb0_or_i981_0_NO_SHIFT_REG = rnode_164to165_bb0_or_i981_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_or_i981_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i981_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_x_tr_i952_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i952_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i952_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i952_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i952_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i952_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i952_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i952_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_x_tr_i952_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_x_tr_i952_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_x_tr_i952_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_x_tr_i952_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_x_tr_i952_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_x_tr_i952 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_x_tr_i952_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_x_tr_i952_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_x_tr_i952_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_x_tr_i952_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_x_tr_i952_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_x_tr_i952_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_x_tr_i952_stall_in_1 = 1'b0;
assign rnode_164to165_bb0_x_tr_i952_0_NO_SHIFT_REG = rnode_164to165_bb0_x_tr_i952_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_x_tr_i952_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i952_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv_i953_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i953_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i953_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i953_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i953_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i953_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i953_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i953_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv_i953_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv_i953_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv_i953_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv_i953_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv_i953_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv_i953 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv_i953_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv_i953_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv_i953_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv_i953_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv_i953_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv_i953_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv_i953_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv_i953_0_NO_SHIFT_REG = rnode_164to165_bb0_conv_i953_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv_i953_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i953_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv10_i955_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i955_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i955_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i955_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i955_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i955_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i955_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i955_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv10_i955_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv10_i955_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv10_i955_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv10_i955_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv10_i955_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv10_i955 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv10_i955_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv10_i955_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv10_i955_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv10_i955_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv10_i955_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv10_i955_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv10_i955_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv10_i955_0_NO_SHIFT_REG = rnode_164to165_bb0_conv10_i955_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv10_i955_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i955_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_cond175_i674_stall_local;
wire [31:0] local_bb0_cond175_i674;

assign local_bb0_cond175_i674 = ((local_bb0_xor173_i673 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_cond175_i318_stall_local;
wire [31:0] local_bb0_cond175_i318;

assign local_bb0_cond175_i318 = ((local_bb0_xor173_i317 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_cond175_i_stall_local;
wire [31:0] local_bb0_cond175_i;

assign local_bb0_cond175_i = ((local_bb0_xor173_i & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and66_i978_stall_local;
wire [31:0] local_bb0_and66_i978;

assign local_bb0_and66_i978[31:1] = 31'h0;
assign local_bb0_and66_i978[0] = rnode_164to165_bb0_and664_i977_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0__34_i678_stall_local;
wire [31:0] local_bb0__34_i678;

assign local_bb0__34_i678 = (local_bb0_tobool19_i608 ? (local_bb0_cond175_i674 & 32'h1) : local_bb0_var__u24);

// This section implements an unregistered operation.
// 
wire local_bb0__34_i322_stall_local;
wire [31:0] local_bb0__34_i322;

assign local_bb0__34_i322 = (local_bb0_tobool19_i252 ? (local_bb0_cond175_i318 & 32'h1) : local_bb0_var__u25);

// This section implements an unregistered operation.
// 
wire local_bb0__34_i_stall_local;
wire [31:0] local_bb0__34_i;

assign local_bb0__34_i = (local_bb0_tobool19_i ? (local_bb0_cond175_i & 32'h1) : local_bb0_var__u26);

// This section implements an unregistered operation.
// 
wire local_bb0_and68_i980_stall_local;
wire [31:0] local_bb0_and68_i980;

assign local_bb0_and68_i980 = ((local_bb0_and66_i978 & 32'h1) & (local_bb0_lnot_ext_i979 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0__36_i682_stall_local;
wire [31:0] local_bb0__36_i682;

assign local_bb0__36_i682 = (local_bb0__34_i678 + local_bb0_xor186_i679);

// This section implements an unregistered operation.
// 
wire local_bb0__36_i326_stall_local;
wire [31:0] local_bb0__36_i326;

assign local_bb0__36_i326 = (local_bb0__34_i322 + local_bb0_xor186_i323);

// This section implements an unregistered operation.
// 
wire local_bb0__36_i_stall_local;
wire [31:0] local_bb0__36_i;

assign local_bb0__36_i = (local_bb0__34_i + local_bb0_xor186_i);

// This section implements an unregistered operation.
// 
wire local_bb0_or69_i982_stall_local;
wire [31:0] local_bb0_or69_i982;

assign local_bb0_or69_i982 = ((rnode_164to165_bb0_or_i981_0_NO_SHIFT_REG & 32'h1) | (local_bb0_and68_i980 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and190_i683_stall_local;
wire [31:0] local_bb0_and190_i683;

assign local_bb0_and190_i683 = (local_bb0__36_i682 & 32'h1E0);

// This section implements an unregistered operation.
// 
wire local_bb0_c3_diff_0_op_i685_stall_local;
wire [31:0] local_bb0_c3_diff_0_op_i685;

assign local_bb0_c3_diff_0_op_i685 = (local_bb0__36_i682 & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_and190_i327_stall_local;
wire [31:0] local_bb0_and190_i327;

assign local_bb0_and190_i327 = (local_bb0__36_i326 & 32'h1E0);

// This section implements an unregistered operation.
// 
wire local_bb0_c3_diff_0_op_i329_stall_local;
wire [31:0] local_bb0_c3_diff_0_op_i329;

assign local_bb0_c3_diff_0_op_i329 = (local_bb0__36_i326 & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_and190_i27_stall_local;
wire [31:0] local_bb0_and190_i27;

assign local_bb0_and190_i27 = (local_bb0__36_i & 32'h1E0);

// This section implements an unregistered operation.
// 
wire local_bb0_c3_diff_0_op_i_stall_local;
wire [31:0] local_bb0_c3_diff_0_op_i;

assign local_bb0_c3_diff_0_op_i = (local_bb0__36_i & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool70_i983_stall_local;
wire local_bb0_tobool70_i983;

assign local_bb0_tobool70_i983 = ((local_bb0_or69_i982 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i684_stall_local;
wire local_bb0_tobool191_i684;

assign local_bb0_tobool191_i684 = ((local_bb0_and190_i683 & 32'h1E0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i328_stall_local;
wire local_bb0_tobool191_i328;

assign local_bb0_tobool191_i328 = ((local_bb0_and190_i327 & 32'h1E0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i28_stall_local;
wire local_bb0_tobool191_i28;

assign local_bb0_tobool191_i28 = ((local_bb0_and190_i27 & 32'h1E0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__25_i1017_stall_local;
wire [31:0] local_bb0__25_i1017;

assign local_bb0__25_i1017 = (local_bb0_tobool70_i983 ? (rnode_164to165_bb0_conv13_i958_0_NO_SHIFT_REG & 32'hFF) : (rnode_164to165_bb0_shr5_i1107_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0__27_i1019_stall_local;
wire [31:0] local_bb0__27_i1019;

assign local_bb0__27_i1019 = (local_bb0_tobool70_i983 ? (rnode_164to165_bb0_conv10_i955_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_conv_i953_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__29_i1021_stall_local;
wire [31:0] local_bb0__29_i1021;

assign local_bb0__29_i1021 = (local_bb0_tobool70_i983 ? (rnode_164to165_bb0_x_tr_i952_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_y_tr_i954_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__31_i1023_v_stall_local;
wire [63:0] local_bb0__31_i1023_v;

assign local_bb0__31_i1023_v = (local_bb0_tobool70_i983 ? (rnode_163to165_bb0_var__u7_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u3_0_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0__33_i1025_v_stall_local;
wire [63:0] local_bb0__33_i1025_v;

assign local_bb0__33_i1025_v = (local_bb0_tobool70_i983 ? (rnode_163to165_bb0_var__u3_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u7_2_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and196_i686_stall_local;
wire [31:0] local_bb0_and196_i686;

assign local_bb0_and196_i686 = (local_bb0_tobool191_i684 ? 32'h1F : (local_bb0_c3_diff_0_op_i685 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_and196_i330_stall_local;
wire [31:0] local_bb0_and196_i330;

assign local_bb0_and196_i330 = (local_bb0_tobool191_i328 ? 32'h1F : (local_bb0_c3_diff_0_op_i329 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_and196_i_stall_local;
wire [31:0] local_bb0_and196_i;

assign local_bb0_and196_i = (local_bb0_tobool191_i28 ? 32'h1F : (local_bb0_c3_diff_0_op_i & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_shr226_i1050_stall_local;
wire [31:0] local_bb0_shr226_i1050;

assign local_bb0_shr226_i1050 = ((local_bb0__27_i1019 & 32'h7FFFFF8) >> (local_bb0_and225_i1049 & 32'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_and225_i693_stall_local;
wire [31:0] local_bb0_and225_i693;

assign local_bb0_and225_i693 = ((local_bb0_and196_i686 & 32'h1F) & 32'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_conv13_i602_valid_out_2;
wire local_bb0_conv13_i602_stall_in_2;
wire local_bb0_and664_i621_valid_out;
wire local_bb0_and664_i621_stall_in;
wire local_bb0_or_i625_valid_out;
wire local_bb0_or_i625_stall_in;
wire local_bb0_x_tr_i596_valid_out_1;
wire local_bb0_x_tr_i596_stall_in_1;
wire local_bb0_conv_i597_valid_out_2;
wire local_bb0_conv_i597_stall_in_2;
wire local_bb0_y_tr_i598_valid_out_1;
wire local_bb0_y_tr_i598_stall_in_1;
wire local_bb0_conv10_i599_valid_out_2;
wire local_bb0_conv10_i599_stall_in_2;
wire local_bb0_and225_i693_valid_out;
wire local_bb0_and225_i693_stall_in;
wire local_bb0_and283_i719_valid_out;
wire local_bb0_and283_i719_stall_in;
wire local_bb0_and283_i719_inputs_ready;
wire local_bb0_and283_i719_stall_local;
wire [31:0] local_bb0_and283_i719;

assign local_bb0_and283_i719_inputs_ready = (rnode_163to164_bb0_and4_i771_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_shl_i783_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_conv6_i752_0_valid_out_NO_SHIFT_REG & rnode_163to164_bb0_shl_i762_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_and4_i771_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shr5_i751_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_shr5_i751_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shl_i783_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shl_i762_0_valid_out_1_NO_SHIFT_REG);
assign local_bb0_and283_i719 = ((local_bb0_and196_i686 & 32'h1F) & 32'h3);
assign local_bb0_conv13_i602_valid_out_2 = 1'b1;
assign local_bb0_and664_i621_valid_out = 1'b1;
assign local_bb0_or_i625_valid_out = 1'b1;
assign local_bb0_x_tr_i596_valid_out_1 = 1'b1;
assign local_bb0_conv_i597_valid_out_2 = 1'b1;
assign local_bb0_y_tr_i598_valid_out_1 = 1'b1;
assign local_bb0_conv10_i599_valid_out_2 = 1'b1;
assign local_bb0_and225_i693_valid_out = 1'b1;
assign local_bb0_and283_i719_valid_out = 1'b1;
assign rnode_163to164_bb0_and4_i771_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i783_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_conv6_i752_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i762_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and4_i771_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i751_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i751_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i783_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i762_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_and225_i337_stall_local;
wire [31:0] local_bb0_and225_i337;

assign local_bb0_and225_i337 = ((local_bb0_and196_i330 & 32'h1F) & 32'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_conv13_i246_valid_out_2;
wire local_bb0_conv13_i246_stall_in_2;
wire local_bb0_and664_i265_valid_out;
wire local_bb0_and664_i265_stall_in;
wire local_bb0_or_i269_valid_out;
wire local_bb0_or_i269_stall_in;
wire local_bb0_x_tr_i240_valid_out_1;
wire local_bb0_x_tr_i240_stall_in_1;
wire local_bb0_conv_i241_valid_out_2;
wire local_bb0_conv_i241_stall_in_2;
wire local_bb0_y_tr_i242_valid_out_1;
wire local_bb0_y_tr_i242_stall_in_1;
wire local_bb0_conv10_i243_valid_out_2;
wire local_bb0_conv10_i243_stall_in_2;
wire local_bb0_and225_i337_valid_out;
wire local_bb0_and225_i337_stall_in;
wire local_bb0_and283_i363_valid_out;
wire local_bb0_and283_i363_stall_in;
wire local_bb0_and283_i363_inputs_ready;
wire local_bb0_and283_i363_stall_local;
wire [31:0] local_bb0_and283_i363;

assign local_bb0_and283_i363_inputs_ready = (rnode_163to164_bb0_and4_i415_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_shl_i427_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_conv6_i396_0_valid_out_NO_SHIFT_REG & rnode_163to164_bb0_shl_i406_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_and4_i415_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shr5_i395_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_shr5_i395_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shl_i427_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shl_i406_0_valid_out_1_NO_SHIFT_REG);
assign local_bb0_and283_i363 = ((local_bb0_and196_i330 & 32'h1F) & 32'h3);
assign local_bb0_conv13_i246_valid_out_2 = 1'b1;
assign local_bb0_and664_i265_valid_out = 1'b1;
assign local_bb0_or_i269_valid_out = 1'b1;
assign local_bb0_x_tr_i240_valid_out_1 = 1'b1;
assign local_bb0_conv_i241_valid_out_2 = 1'b1;
assign local_bb0_y_tr_i242_valid_out_1 = 1'b1;
assign local_bb0_conv10_i243_valid_out_2 = 1'b1;
assign local_bb0_and225_i337_valid_out = 1'b1;
assign local_bb0_and283_i363_valid_out = 1'b1;
assign rnode_163to164_bb0_and4_i415_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i427_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_conv6_i396_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i406_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and4_i415_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i395_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i395_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i427_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i406_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_and225_i_stall_local;
wire [31:0] local_bb0_and225_i;

assign local_bb0_and225_i = ((local_bb0_and196_i & 32'h1F) & 32'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_conv13_i_valid_out_2;
wire local_bb0_conv13_i_stall_in_2;
wire local_bb0_and664_i_valid_out;
wire local_bb0_and664_i_stall_in;
wire local_bb0_or_i20_valid_out;
wire local_bb0_or_i20_stall_in;
wire local_bb0_x_tr_i_valid_out_1;
wire local_bb0_x_tr_i_stall_in_1;
wire local_bb0_conv_i16_valid_out_2;
wire local_bb0_conv_i16_stall_in_2;
wire local_bb0_y_tr_i_valid_out_1;
wire local_bb0_y_tr_i_stall_in_1;
wire local_bb0_conv10_i_valid_out_2;
wire local_bb0_conv10_i_stall_in_2;
wire local_bb0_and225_i_valid_out;
wire local_bb0_and225_i_stall_in;
wire local_bb0_and283_i_valid_out;
wire local_bb0_and283_i_stall_in;
wire local_bb0_and283_i_inputs_ready;
wire local_bb0_and283_i_stall_local;
wire [31:0] local_bb0_and283_i;

assign local_bb0_and283_i_inputs_ready = (rnode_163to164_bb0_and4_i59_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_shl_i71_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_conv6_i40_0_valid_out_NO_SHIFT_REG & rnode_163to164_bb0_shl_i50_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_and4_i59_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shr5_i39_0_valid_out_0_NO_SHIFT_REG & rnode_163to164_bb0_shr5_i39_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shl_i71_0_valid_out_1_NO_SHIFT_REG & rnode_163to164_bb0_shl_i50_0_valid_out_1_NO_SHIFT_REG);
assign local_bb0_and283_i = ((local_bb0_and196_i & 32'h1F) & 32'h3);
assign local_bb0_conv13_i_valid_out_2 = 1'b1;
assign local_bb0_and664_i_valid_out = 1'b1;
assign local_bb0_or_i20_valid_out = 1'b1;
assign local_bb0_x_tr_i_valid_out_1 = 1'b1;
assign local_bb0_conv_i16_valid_out_2 = 1'b1;
assign local_bb0_y_tr_i_valid_out_1 = 1'b1;
assign local_bb0_conv10_i_valid_out_2 = 1'b1;
assign local_bb0_and225_i_valid_out = 1'b1;
assign local_bb0_and283_i_valid_out = 1'b1;
assign rnode_163to164_bb0_and4_i59_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i71_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_conv6_i40_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i50_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_and4_i59_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i39_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shr5_i39_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i71_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to164_bb0_shl_i50_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0__31_i1023_v_valid_out;
wire local_bb0__31_i1023_v_stall_in;
wire local_bb0__25_i1017_valid_out;
wire local_bb0__25_i1017_stall_in;
wire local_bb0__29_i1021_valid_out;
wire local_bb0__29_i1021_stall_in;
wire local_bb0__33_i1025_v_valid_out;
wire local_bb0__33_i1025_v_stall_in;
wire local_bb0_shr284_i1076_valid_out;
wire local_bb0_shr284_i1076_stall_in;
wire local_bb0_shr284_i1076_inputs_ready;
wire local_bb0_shr284_i1076_stall_local;
wire [31:0] local_bb0_shr284_i1076;

assign local_bb0_shr284_i1076_inputs_ready = (rnode_163to165_bb0_var__u7_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u3_0_valid_out_0_NO_SHIFT_REG & rnode_163to165_bb0_var__u7_0_valid_out_0_NO_SHIFT_REG & rnode_164to165_bb0_or_i981_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_and664_i977_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv13_i958_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_shr5_i1107_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv10_i955_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv_i953_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_x_tr_i952_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_y_tr_i954_0_valid_out_NO_SHIFT_REG & rnode_163to165_bb0_var__u3_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u7_0_valid_out_2_NO_SHIFT_REG & rnode_164to165_bb0_and196_i1042_0_valid_out_0_NO_SHIFT_REG & rnode_164to165_bb0_and196_i1042_0_valid_out_1_NO_SHIFT_REG);
assign local_bb0_shr284_i1076 = (local_bb0_shr226_i1050 >> (local_bb0_and283_i1075 & 32'h3));
assign local_bb0__31_i1023_v_valid_out = 1'b1;
assign local_bb0__25_i1017_valid_out = 1'b1;
assign local_bb0__29_i1021_valid_out = 1'b1;
assign local_bb0__33_i1025_v_valid_out = 1'b1;
assign local_bb0_shr284_i1076_valid_out = 1'b1;
assign rnode_163to165_bb0_var__u7_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u3_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u7_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i981_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i977_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i958_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i1107_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i955_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i953_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i952_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i954_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u3_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u7_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and196_i1042_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and196_i1042_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv13_i602_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i602_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i602_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i602_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i602_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i602_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i602_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i602_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv13_i602_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv13_i602_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv13_i602_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv13_i602_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv13_i602_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv13_i602 & 32'hFF)),
	.data_out(rnode_164to165_bb0_conv13_i602_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv13_i602_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv13_i602_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv13_i602_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv13_i602_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv13_i602_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv13_i602_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv13_i602_0_NO_SHIFT_REG = rnode_164to165_bb0_conv13_i602_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv13_i602_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i602_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and664_i621_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i621_0_stall_in_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i621_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i621_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i621_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i621_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i621_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i621_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and664_i621_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and664_i621_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and664_i621_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and664_i621_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and664_i621_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in(local_bb0_and664_i621),
	.data_out(rnode_164to165_bb0_and664_i621_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and664_i621_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and664_i621_0_reg_165_fifo.DATA_WIDTH = 1;
defparam rnode_164to165_bb0_and664_i621_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and664_i621_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and664_i621_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and664_i621_stall_in = 1'b0;
assign rnode_164to165_bb0_and664_i621_0_NO_SHIFT_REG = rnode_164to165_bb0_and664_i621_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and664_i621_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i621_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_or_i625_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i625_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i625_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i625_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i625_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i625_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i625_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i625_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_or_i625_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_or_i625_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_or_i625_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_or_i625_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_or_i625_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_or_i625 & 32'h1)),
	.data_out(rnode_164to165_bb0_or_i625_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_or_i625_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_or_i625_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_or_i625_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_or_i625_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_or_i625_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or_i625_stall_in = 1'b0;
assign rnode_164to165_bb0_or_i625_0_NO_SHIFT_REG = rnode_164to165_bb0_or_i625_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_or_i625_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i625_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_x_tr_i596_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i596_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i596_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i596_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i596_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i596_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i596_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i596_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_x_tr_i596_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_x_tr_i596_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_x_tr_i596_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_x_tr_i596_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_x_tr_i596_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_x_tr_i596 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_x_tr_i596_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_x_tr_i596_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_x_tr_i596_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_x_tr_i596_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_x_tr_i596_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_x_tr_i596_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_x_tr_i596_stall_in_1 = 1'b0;
assign rnode_164to165_bb0_x_tr_i596_0_NO_SHIFT_REG = rnode_164to165_bb0_x_tr_i596_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_x_tr_i596_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i596_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv_i597_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i597_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i597_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i597_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i597_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i597_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i597_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i597_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv_i597_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv_i597_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv_i597_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv_i597_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv_i597_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv_i597 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv_i597_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv_i597_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv_i597_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv_i597_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv_i597_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv_i597_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv_i597_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv_i597_0_NO_SHIFT_REG = rnode_164to165_bb0_conv_i597_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv_i597_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i597_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_y_tr_i598_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i598_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i598_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i598_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i598_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i598_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i598_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i598_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_y_tr_i598_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_y_tr_i598_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_y_tr_i598_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_y_tr_i598_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_y_tr_i598_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_y_tr_i598 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_y_tr_i598_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_y_tr_i598_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_y_tr_i598_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_y_tr_i598_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_y_tr_i598_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_y_tr_i598_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_y_tr_i598_stall_in_1 = 1'b0;
assign rnode_164to165_bb0_y_tr_i598_0_NO_SHIFT_REG = rnode_164to165_bb0_y_tr_i598_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_y_tr_i598_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i598_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv10_i599_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i599_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i599_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i599_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i599_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i599_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i599_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i599_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv10_i599_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv10_i599_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv10_i599_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv10_i599_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv10_i599_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv10_i599 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv10_i599_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv10_i599_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv10_i599_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv10_i599_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv10_i599_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv10_i599_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv10_i599_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv10_i599_0_NO_SHIFT_REG = rnode_164to165_bb0_conv10_i599_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv10_i599_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i599_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and225_i693_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i693_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and225_i693_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i693_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and225_i693_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i693_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i693_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i693_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and225_i693_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and225_i693_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and225_i693_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and225_i693_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and225_i693_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_and225_i693 & 32'h1C)),
	.data_out(rnode_164to165_bb0_and225_i693_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and225_i693_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and225_i693_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_and225_i693_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and225_i693_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and225_i693_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and225_i693_stall_in = 1'b0;
assign rnode_164to165_bb0_and225_i693_0_NO_SHIFT_REG = rnode_164to165_bb0_and225_i693_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and225_i693_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and225_i693_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and283_i719_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i719_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and283_i719_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i719_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and283_i719_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i719_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i719_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i719_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and283_i719_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and283_i719_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and283_i719_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and283_i719_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and283_i719_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_and283_i719 & 32'h3)),
	.data_out(rnode_164to165_bb0_and283_i719_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and283_i719_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and283_i719_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_and283_i719_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and283_i719_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and283_i719_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and283_i719_stall_in = 1'b0;
assign rnode_164to165_bb0_and283_i719_0_NO_SHIFT_REG = rnode_164to165_bb0_and283_i719_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and283_i719_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and283_i719_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv13_i246_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i246_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i246_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i246_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i246_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i246_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i246_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i246_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv13_i246_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv13_i246_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv13_i246_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv13_i246_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv13_i246_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv13_i246 & 32'hFF)),
	.data_out(rnode_164to165_bb0_conv13_i246_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv13_i246_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv13_i246_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv13_i246_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv13_i246_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv13_i246_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv13_i246_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv13_i246_0_NO_SHIFT_REG = rnode_164to165_bb0_conv13_i246_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv13_i246_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i246_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and664_i265_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i265_0_stall_in_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i265_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i265_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i265_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i265_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i265_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i265_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and664_i265_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and664_i265_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and664_i265_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and664_i265_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and664_i265_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in(local_bb0_and664_i265),
	.data_out(rnode_164to165_bb0_and664_i265_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and664_i265_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and664_i265_0_reg_165_fifo.DATA_WIDTH = 1;
defparam rnode_164to165_bb0_and664_i265_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and664_i265_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and664_i265_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and664_i265_stall_in = 1'b0;
assign rnode_164to165_bb0_and664_i265_0_NO_SHIFT_REG = rnode_164to165_bb0_and664_i265_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and664_i265_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i265_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_or_i269_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i269_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i269_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i269_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i269_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i269_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i269_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i269_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_or_i269_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_or_i269_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_or_i269_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_or_i269_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_or_i269_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_or_i269 & 32'h1)),
	.data_out(rnode_164to165_bb0_or_i269_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_or_i269_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_or_i269_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_or_i269_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_or_i269_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_or_i269_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or_i269_stall_in = 1'b0;
assign rnode_164to165_bb0_or_i269_0_NO_SHIFT_REG = rnode_164to165_bb0_or_i269_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_or_i269_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i269_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_x_tr_i240_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i240_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i240_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i240_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i240_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i240_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i240_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i240_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_x_tr_i240_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_x_tr_i240_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_x_tr_i240_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_x_tr_i240_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_x_tr_i240_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_x_tr_i240 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_x_tr_i240_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_x_tr_i240_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_x_tr_i240_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_x_tr_i240_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_x_tr_i240_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_x_tr_i240_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_x_tr_i240_stall_in_1 = 1'b0;
assign rnode_164to165_bb0_x_tr_i240_0_NO_SHIFT_REG = rnode_164to165_bb0_x_tr_i240_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_x_tr_i240_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i240_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv_i241_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i241_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i241_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i241_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i241_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i241_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i241_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i241_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv_i241_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv_i241_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv_i241_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv_i241_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv_i241_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv_i241 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv_i241_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv_i241_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv_i241_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv_i241_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv_i241_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv_i241_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv_i241_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv_i241_0_NO_SHIFT_REG = rnode_164to165_bb0_conv_i241_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv_i241_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i241_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_y_tr_i242_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i242_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i242_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i242_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i242_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i242_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i242_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i242_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_y_tr_i242_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_y_tr_i242_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_y_tr_i242_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_y_tr_i242_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_y_tr_i242_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_y_tr_i242 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_y_tr_i242_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_y_tr_i242_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_y_tr_i242_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_y_tr_i242_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_y_tr_i242_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_y_tr_i242_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_y_tr_i242_stall_in_1 = 1'b0;
assign rnode_164to165_bb0_y_tr_i242_0_NO_SHIFT_REG = rnode_164to165_bb0_y_tr_i242_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_y_tr_i242_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i242_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv10_i243_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i243_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i243_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i243_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i243_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i243_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i243_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i243_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv10_i243_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv10_i243_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv10_i243_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv10_i243_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv10_i243_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv10_i243 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv10_i243_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv10_i243_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv10_i243_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv10_i243_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv10_i243_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv10_i243_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv10_i243_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv10_i243_0_NO_SHIFT_REG = rnode_164to165_bb0_conv10_i243_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv10_i243_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i243_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and225_i337_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i337_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and225_i337_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i337_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and225_i337_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i337_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i337_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i337_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and225_i337_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and225_i337_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and225_i337_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and225_i337_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and225_i337_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_and225_i337 & 32'h1C)),
	.data_out(rnode_164to165_bb0_and225_i337_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and225_i337_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and225_i337_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_and225_i337_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and225_i337_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and225_i337_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and225_i337_stall_in = 1'b0;
assign rnode_164to165_bb0_and225_i337_0_NO_SHIFT_REG = rnode_164to165_bb0_and225_i337_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and225_i337_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and225_i337_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and283_i363_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i363_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and283_i363_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i363_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and283_i363_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i363_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i363_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i363_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and283_i363_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and283_i363_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and283_i363_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and283_i363_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and283_i363_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_and283_i363 & 32'h3)),
	.data_out(rnode_164to165_bb0_and283_i363_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and283_i363_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and283_i363_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_and283_i363_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and283_i363_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and283_i363_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and283_i363_stall_in = 1'b0;
assign rnode_164to165_bb0_and283_i363_0_NO_SHIFT_REG = rnode_164to165_bb0_and283_i363_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and283_i363_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and283_i363_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv13_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv13_i_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv13_i_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv13_i_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv13_i_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv13_i_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv13_i_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv13_i_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv13_i & 32'hFF)),
	.data_out(rnode_164to165_bb0_conv13_i_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv13_i_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv13_i_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv13_i_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv13_i_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv13_i_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv13_i_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv13_i_0_NO_SHIFT_REG = rnode_164to165_bb0_conv13_i_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv13_i_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and664_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i_0_stall_in_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and664_i_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and664_i_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and664_i_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and664_i_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and664_i_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and664_i_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in(local_bb0_and664_i),
	.data_out(rnode_164to165_bb0_and664_i_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and664_i_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and664_i_0_reg_165_fifo.DATA_WIDTH = 1;
defparam rnode_164to165_bb0_and664_i_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and664_i_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and664_i_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and664_i_stall_in = 1'b0;
assign rnode_164to165_bb0_and664_i_0_NO_SHIFT_REG = rnode_164to165_bb0_and664_i_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and664_i_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_or_i20_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i20_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i20_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i20_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_or_i20_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i20_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i20_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_or_i20_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_or_i20_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_or_i20_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_or_i20_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_or_i20_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_or_i20_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_or_i20 & 32'h1)),
	.data_out(rnode_164to165_bb0_or_i20_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_or_i20_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_or_i20_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_or_i20_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_or_i20_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_or_i20_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or_i20_stall_in = 1'b0;
assign rnode_164to165_bb0_or_i20_0_NO_SHIFT_REG = rnode_164to165_bb0_or_i20_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_or_i20_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i20_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_x_tr_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_x_tr_i_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_x_tr_i_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_x_tr_i_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_x_tr_i_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_x_tr_i_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_x_tr_i_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_x_tr_i_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_x_tr_i & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_x_tr_i_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_x_tr_i_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_x_tr_i_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_x_tr_i_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_x_tr_i_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_x_tr_i_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_x_tr_i_stall_in_1 = 1'b0;
assign rnode_164to165_bb0_x_tr_i_0_NO_SHIFT_REG = rnode_164to165_bb0_x_tr_i_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_x_tr_i_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv_i16_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i16_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i16_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i16_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv_i16_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i16_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i16_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv_i16_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv_i16_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv_i16_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv_i16_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv_i16_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv_i16_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv_i16 & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv_i16_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv_i16_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv_i16_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv_i16_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv_i16_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv_i16_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv_i16_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv_i16_0_NO_SHIFT_REG = rnode_164to165_bb0_conv_i16_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv_i16_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i16_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_y_tr_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_y_tr_i_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_y_tr_i_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_y_tr_i_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_y_tr_i_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_y_tr_i_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_y_tr_i_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_y_tr_i_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_y_tr_i & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_y_tr_i_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_y_tr_i_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_y_tr_i_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_y_tr_i_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_y_tr_i_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_y_tr_i_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_y_tr_i_stall_in_1 = 1'b0;
assign rnode_164to165_bb0_y_tr_i_0_NO_SHIFT_REG = rnode_164to165_bb0_y_tr_i_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_y_tr_i_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_conv10_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_conv10_i_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_conv10_i_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_conv10_i_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_conv10_i_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_conv10_i_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_conv10_i_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_conv10_i_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_conv10_i & 32'h7FFFFF8)),
	.data_out(rnode_164to165_bb0_conv10_i_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_conv10_i_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_conv10_i_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_conv10_i_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_conv10_i_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_conv10_i_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv10_i_stall_in_2 = 1'b0;
assign rnode_164to165_bb0_conv10_i_0_NO_SHIFT_REG = rnode_164to165_bb0_conv10_i_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_conv10_i_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and225_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and225_i_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and225_i_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and225_i_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and225_i_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and225_i_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and225_i_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and225_i_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and225_i_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_and225_i & 32'h1C)),
	.data_out(rnode_164to165_bb0_and225_i_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and225_i_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and225_i_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_and225_i_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and225_i_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and225_i_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and225_i_stall_in = 1'b0;
assign rnode_164to165_bb0_and225_i_0_NO_SHIFT_REG = rnode_164to165_bb0_and225_i_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and225_i_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and225_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_164to165_bb0_and283_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and283_i_0_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i_0_reg_165_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_164to165_bb0_and283_i_0_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i_0_valid_out_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i_0_stall_in_reg_165_NO_SHIFT_REG;
 logic rnode_164to165_bb0_and283_i_0_stall_out_reg_165_NO_SHIFT_REG;

acl_data_fifo rnode_164to165_bb0_and283_i_0_reg_165_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_164to165_bb0_and283_i_0_reg_165_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_164to165_bb0_and283_i_0_stall_in_reg_165_NO_SHIFT_REG),
	.valid_out(rnode_164to165_bb0_and283_i_0_valid_out_reg_165_NO_SHIFT_REG),
	.stall_out(rnode_164to165_bb0_and283_i_0_stall_out_reg_165_NO_SHIFT_REG),
	.data_in((local_bb0_and283_i & 32'h3)),
	.data_out(rnode_164to165_bb0_and283_i_0_reg_165_NO_SHIFT_REG)
);

defparam rnode_164to165_bb0_and283_i_0_reg_165_fifo.DEPTH = 1;
defparam rnode_164to165_bb0_and283_i_0_reg_165_fifo.DATA_WIDTH = 32;
defparam rnode_164to165_bb0_and283_i_0_reg_165_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_164to165_bb0_and283_i_0_reg_165_fifo.IMPL = "shift_reg";

assign rnode_164to165_bb0_and283_i_0_reg_165_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and283_i_stall_in = 1'b0;
assign rnode_164to165_bb0_and283_i_0_NO_SHIFT_REG = rnode_164to165_bb0_and283_i_0_reg_165_NO_SHIFT_REG;
assign rnode_164to165_bb0_and283_i_0_stall_in_reg_165_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and283_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__31_i1023_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i1023_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i1023_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i1023_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i1023_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i1023_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i1023_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i1023_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__31_i1023_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__31_i1023_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__31_i1023_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__31_i1023_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__31_i1023_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__31_i1023_v & 64'h1)),
	.data_out(rnode_165to166_bb0__31_i1023_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__31_i1023_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__31_i1023_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__31_i1023_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__31_i1023_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__31_i1023_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__31_i1023_v_stall_in = 1'b0;
assign rnode_165to166_bb0__31_i1023_v_0_NO_SHIFT_REG = rnode_165to166_bb0__31_i1023_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__31_i1023_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__31_i1023_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__25_i1017_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i1017_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i1017_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i1017_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i1017_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i1017_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i1017_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i1017_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i1017_0_valid_out_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i1017_0_stall_in_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i1017_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__25_i1017_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__25_i1017_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__25_i1017_0_stall_in_0_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__25_i1017_0_valid_out_0_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__25_i1017_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__25_i1017 & 32'hFF)),
	.data_out(rnode_165to166_bb0__25_i1017_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__25_i1017_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__25_i1017_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__25_i1017_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__25_i1017_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__25_i1017_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__25_i1017_stall_in = 1'b0;
assign rnode_165to166_bb0__25_i1017_0_stall_in_0_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i1017_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i1017_0_NO_SHIFT_REG = rnode_165to166_bb0__25_i1017_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__25_i1017_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i1017_1_NO_SHIFT_REG = rnode_165to166_bb0__25_i1017_0_reg_166_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__29_i1021_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i1021_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i1021_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i1021_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i1021_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i1021_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i1021_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i1021_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__29_i1021_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__29_i1021_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__29_i1021_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__29_i1021_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__29_i1021_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__29_i1021 & 32'h7FFFFF8)),
	.data_out(rnode_165to166_bb0__29_i1021_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__29_i1021_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__29_i1021_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__29_i1021_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__29_i1021_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__29_i1021_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__29_i1021_stall_in = 1'b0;
assign rnode_165to166_bb0__29_i1021_0_NO_SHIFT_REG = rnode_165to166_bb0__29_i1021_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__29_i1021_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i1021_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__33_i1025_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i1025_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i1025_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i1025_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i1025_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i1025_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i1025_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i1025_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__33_i1025_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__33_i1025_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__33_i1025_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__33_i1025_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__33_i1025_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__33_i1025_v & 64'h1)),
	.data_out(rnode_165to166_bb0__33_i1025_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__33_i1025_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__33_i1025_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__33_i1025_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__33_i1025_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__33_i1025_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__33_i1025_v_stall_in = 1'b0;
assign rnode_165to166_bb0__33_i1025_v_0_NO_SHIFT_REG = rnode_165to166_bb0__33_i1025_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__33_i1025_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i1025_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0_shr284_i1076_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i1076_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i1076_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i1076_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i1076_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i1076_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i1076_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i1076_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0_shr284_i1076_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0_shr284_i1076_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0_shr284_i1076_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0_shr284_i1076_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0_shr284_i1076_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in(local_bb0_shr284_i1076),
	.data_out(rnode_165to166_bb0_shr284_i1076_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0_shr284_i1076_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0_shr284_i1076_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0_shr284_i1076_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0_shr284_i1076_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0_shr284_i1076_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr284_i1076_stall_in = 1'b0;
assign rnode_165to166_bb0_shr284_i1076_0_NO_SHIFT_REG = rnode_165to166_bb0_shr284_i1076_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0_shr284_i1076_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i1076_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_and66_i622_stall_local;
wire [31:0] local_bb0_and66_i622;

assign local_bb0_and66_i622[31:1] = 31'h0;
assign local_bb0_and66_i622[0] = rnode_164to165_bb0_and664_i621_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and66_i266_stall_local;
wire [31:0] local_bb0_and66_i266;

assign local_bb0_and66_i266[31:1] = 31'h0;
assign local_bb0_and66_i266[0] = rnode_164to165_bb0_and664_i265_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and66_i_stall_local;
wire [31:0] local_bb0_and66_i;

assign local_bb0_and66_i[31:1] = 31'h0;
assign local_bb0_and66_i[0] = rnode_164to165_bb0_and664_i_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_shl331_i1096_stall_local;
wire [63:0] local_bb0_shl331_i1096;

assign local_bb0_shl331_i1096 = ((rnode_165to166_bb0__31_i1023_v_0_NO_SHIFT_REG & 64'h1) << 64'h24);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_166to168_bb0__25_i1017_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i1017_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i1017_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i1017_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i1017_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_reg_168_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i1017_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_valid_out_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_stall_in_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i1017_0_stall_out_reg_168_NO_SHIFT_REG;

acl_data_fifo rnode_166to168_bb0__25_i1017_0_reg_168_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to168_bb0__25_i1017_0_reg_168_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to168_bb0__25_i1017_0_stall_in_0_reg_168_NO_SHIFT_REG),
	.valid_out(rnode_166to168_bb0__25_i1017_0_valid_out_0_reg_168_NO_SHIFT_REG),
	.stall_out(rnode_166to168_bb0__25_i1017_0_stall_out_reg_168_NO_SHIFT_REG),
	.data_in((rnode_165to166_bb0__25_i1017_1_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_166to168_bb0__25_i1017_0_reg_168_NO_SHIFT_REG)
);

defparam rnode_166to168_bb0__25_i1017_0_reg_168_fifo.DEPTH = 2;
defparam rnode_166to168_bb0__25_i1017_0_reg_168_fifo.DATA_WIDTH = 32;
defparam rnode_166to168_bb0__25_i1017_0_reg_168_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to168_bb0__25_i1017_0_reg_168_fifo.IMPL = "shift_reg";

assign rnode_166to168_bb0__25_i1017_0_reg_168_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i1017_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i1017_0_stall_in_0_reg_168_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i1017_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i1017_0_NO_SHIFT_REG = rnode_166to168_bb0__25_i1017_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i1017_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i1017_1_NO_SHIFT_REG = rnode_166to168_bb0__25_i1017_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i1017_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i1017_2_NO_SHIFT_REG = rnode_166to168_bb0__25_i1017_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i1017_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i1017_3_NO_SHIFT_REG = rnode_166to168_bb0__25_i1017_0_reg_168_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv327_i1094_stall_local;
wire [63:0] local_bb0_conv327_i1094;

assign local_bb0_conv327_i1094[63:32] = 32'h0;
assign local_bb0_conv327_i1094[31:0] = (rnode_165to166_bb0__29_i1021_0_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__33_i1025_stall_local;
wire [31:0] local_bb0__33_i1025;
wire [63:0] local_bb0__33_i1025$ps;

assign local_bb0__33_i1025$ps = (rnode_165to166_bb0__33_i1025_v_0_NO_SHIFT_REG & 64'h1);
assign local_bb0__33_i1025 = local_bb0__33_i1025$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_conv335_i1100_stall_local;
wire [63:0] local_bb0_conv335_i1100;

assign local_bb0_conv335_i1100[63:32] = 32'h0;
assign local_bb0_conv335_i1100[31:0] = rnode_165to166_bb0_shr284_i1076_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and68_i624_stall_local;
wire [31:0] local_bb0_and68_i624;

assign local_bb0_and68_i624 = ((local_bb0_and66_i622 & 32'h1) & (local_bb0_lnot_ext_i623 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and68_i268_stall_local;
wire [31:0] local_bb0_and68_i268;

assign local_bb0_and68_i268 = ((local_bb0_and66_i266 & 32'h1) & (local_bb0_lnot_ext_i267 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and68_i_stall_local;
wire [31:0] local_bb0_and68_i;

assign local_bb0_and68_i = ((local_bb0_and66_i & 32'h1) & (local_bb0_lnot_ext_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and10_i807_stall_local;
wire [31:0] local_bb0_and10_i807;

assign local_bb0_and10_i807 = ((rnode_166to168_bb0__25_i1017_0_NO_SHIFT_REG & 32'hFF) & 32'hE0);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i809_stall_local;
wire [31:0] local_bb0_sub_i809;

assign local_bb0_sub_i809 = ((rnode_166to168_bb0__25_i1017_1_NO_SHIFT_REG & 32'hFF) + 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i815_stall_local;
wire local_bb0_cmp23_i815;

assign local_bb0_cmp23_i815 = ((rnode_166to168_bb0__25_i1017_2_NO_SHIFT_REG & 32'hFF) == 32'h0);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_168to170_bb0__25_i1017_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i1017_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0__25_i1017_0_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i1017_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0__25_i1017_0_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i1017_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i1017_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i1017_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_168to170_bb0__25_i1017_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to170_bb0__25_i1017_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to170_bb0__25_i1017_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_168to170_bb0__25_i1017_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_168to170_bb0__25_i1017_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((rnode_166to168_bb0__25_i1017_3_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_168to170_bb0__25_i1017_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_168to170_bb0__25_i1017_0_reg_170_fifo.DEPTH = 2;
defparam rnode_168to170_bb0__25_i1017_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_168to170_bb0__25_i1017_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to170_bb0__25_i1017_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_168to170_bb0__25_i1017_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i1017_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0__25_i1017_0_NO_SHIFT_REG = rnode_168to170_bb0__25_i1017_0_reg_170_NO_SHIFT_REG;
assign rnode_168to170_bb0__25_i1017_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0__25_i1017_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i932_stall_local;
wire [63:0] local_bb0_conv_i932;

assign local_bb0_conv_i932 = ((local_bb0_conv327_i1094 & 64'hFFFFFFF8) & 64'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i1090_stall_local;
wire [31:0] local_bb0_shl_i1090;

assign local_bb0_shl_i1090 = ((local_bb0__33_i1025 & 32'h1) << 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u27_stall_local;
wire [31:0] local_bb0_var__u27;

assign local_bb0_var__u27 = ((local_bb0__33_i1025 & 32'h1) << 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv2_i933_stall_local;
wire [63:0] local_bb0_conv2_i933;

assign local_bb0_conv2_i933 = ((local_bb0_conv335_i1100 & 64'hFFFFFFFF) & 64'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_or69_i626_stall_local;
wire [31:0] local_bb0_or69_i626;

assign local_bb0_or69_i626 = ((rnode_164to165_bb0_or_i625_0_NO_SHIFT_REG & 32'h1) | (local_bb0_and68_i624 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_or69_i270_stall_local;
wire [31:0] local_bb0_or69_i270;

assign local_bb0_or69_i270 = ((rnode_164to165_bb0_or_i269_0_NO_SHIFT_REG & 32'h1) | (local_bb0_and68_i268 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_or69_i_stall_local;
wire [31:0] local_bb0_or69_i;

assign local_bb0_or69_i = ((rnode_164to165_bb0_or_i20_0_NO_SHIFT_REG & 32'h1) | (local_bb0_and68_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i808_stall_local;
wire local_bb0_cmp_i808;

assign local_bb0_cmp_i808 = ((local_bb0_and10_i807 & 32'hE0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and17_i810_stall_local;
wire [31:0] local_bb0_and17_i810;

assign local_bb0_and17_i810 = ((local_bb0_sub_i809 & 32'h1FF) & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or324_i1091_stall_local;
wire [31:0] local_bb0_or324_i1091;

assign local_bb0_or324_i1091 = ((local_bb0_shl_i1090 & 32'h200) | (rnode_165to166_bb0__25_i1017_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool70_i627_stall_local;
wire local_bb0_tobool70_i627;

assign local_bb0_tobool70_i627 = ((local_bb0_or69_i626 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool70_i271_stall_local;
wire local_bb0_tobool70_i271;

assign local_bb0_tobool70_i271 = ((local_bb0_or69_i270 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool70_i_stall_local;
wire local_bb0_tobool70_i;

assign local_bb0_tobool70_i = ((local_bb0_or69_i & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv18_i811_stall_local;
wire [31:0] local_bb0_conv18_i811;

assign local_bb0_conv18_i811 = (local_bb0_cmp_i808 ? 32'h1F : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv325_i1092_stall_local;
wire [63:0] local_bb0_conv325_i1092;

assign local_bb0_conv325_i1092[63:32] = 32'h0;
assign local_bb0_conv325_i1092[31:0] = (local_bb0_or324_i1091 & 32'h2FF);

// This section implements an unregistered operation.
// 
wire local_bb0__25_i661_stall_local;
wire [31:0] local_bb0__25_i661;

assign local_bb0__25_i661 = (local_bb0_tobool70_i627 ? (rnode_164to165_bb0_conv13_i602_0_NO_SHIFT_REG & 32'hFF) : (rnode_164to165_bb0_shr5_i751_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0__27_i663_stall_local;
wire [31:0] local_bb0__27_i663;

assign local_bb0__27_i663 = (local_bb0_tobool70_i627 ? (rnode_164to165_bb0_conv10_i599_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_conv_i597_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__29_i665_stall_local;
wire [31:0] local_bb0__29_i665;

assign local_bb0__29_i665 = (local_bb0_tobool70_i627 ? (rnode_164to165_bb0_x_tr_i596_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_y_tr_i598_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__31_i667_v_stall_local;
wire [63:0] local_bb0__31_i667_v;

assign local_bb0__31_i667_v = (local_bb0_tobool70_i627 ? (rnode_163to165_bb0_var__u8_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u4_0_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0__33_i669_v_stall_local;
wire [63:0] local_bb0__33_i669_v;

assign local_bb0__33_i669_v = (local_bb0_tobool70_i627 ? (rnode_163to165_bb0_var__u4_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u8_2_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0__25_i305_stall_local;
wire [31:0] local_bb0__25_i305;

assign local_bb0__25_i305 = (local_bb0_tobool70_i271 ? (rnode_164to165_bb0_conv13_i246_0_NO_SHIFT_REG & 32'hFF) : (rnode_164to165_bb0_shr5_i395_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0__27_i307_stall_local;
wire [31:0] local_bb0__27_i307;

assign local_bb0__27_i307 = (local_bb0_tobool70_i271 ? (rnode_164to165_bb0_conv10_i243_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_conv_i241_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__29_i309_stall_local;
wire [31:0] local_bb0__29_i309;

assign local_bb0__29_i309 = (local_bb0_tobool70_i271 ? (rnode_164to165_bb0_x_tr_i240_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_y_tr_i242_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__31_i311_v_stall_local;
wire [63:0] local_bb0__31_i311_v;

assign local_bb0__31_i311_v = (local_bb0_tobool70_i271 ? (rnode_163to165_bb0_var__u9_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u5_0_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0__33_i313_v_stall_local;
wire [63:0] local_bb0__33_i313_v;

assign local_bb0__33_i313_v = (local_bb0_tobool70_i271 ? (rnode_163to165_bb0_var__u5_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u9_2_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0__25_i_stall_local;
wire [31:0] local_bb0__25_i;

assign local_bb0__25_i = (local_bb0_tobool70_i ? (rnode_164to165_bb0_conv13_i_0_NO_SHIFT_REG & 32'hFF) : (rnode_164to165_bb0_shr5_i39_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0__27_i_stall_local;
wire [31:0] local_bb0__27_i;

assign local_bb0__27_i = (local_bb0_tobool70_i ? (rnode_164to165_bb0_conv10_i_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_conv_i16_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__29_i_stall_local;
wire [31:0] local_bb0__29_i;

assign local_bb0__29_i = (local_bb0_tobool70_i ? (rnode_164to165_bb0_x_tr_i_0_NO_SHIFT_REG & 32'h7FFFFF8) : (rnode_164to165_bb0_y_tr_i_0_NO_SHIFT_REG & 32'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0__31_i_v_stall_local;
wire [63:0] local_bb0__31_i_v;

assign local_bb0__31_i_v = (local_bb0_tobool70_i ? (rnode_163to165_bb0_var__u10_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u6_0_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0__33_i_v_stall_local;
wire [63:0] local_bb0__33_i_v;

assign local_bb0__33_i_v = (local_bb0_tobool70_i ? (rnode_163to165_bb0_var__u6_1_NO_SHIFT_REG & 64'h1) : (rnode_163to165_bb0_var__u10_2_NO_SHIFT_REG & 64'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_or_i812_stall_local;
wire [31:0] local_bb0_or_i812;

assign local_bb0_or_i812 = ((local_bb0_conv18_i811 & 32'h1F) | (local_bb0_and17_i810 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i1093_stall_local;
wire [63:0] local_bb0_shl326_i1093;

assign local_bb0_shl326_i1093 = ((local_bb0_conv325_i1092 & 64'h2FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_shr226_i694_stall_local;
wire [31:0] local_bb0_shr226_i694;

assign local_bb0_shr226_i694 = ((local_bb0__27_i663 & 32'h7FFFFF8) >> (rnode_164to165_bb0_and225_i693_0_NO_SHIFT_REG & 32'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_shr226_i338_stall_local;
wire [31:0] local_bb0_shr226_i338;

assign local_bb0_shr226_i338 = ((local_bb0__27_i307 & 32'h7FFFFF8) >> (rnode_164to165_bb0_and225_i337_0_NO_SHIFT_REG & 32'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_shr226_i_stall_local;
wire [31:0] local_bb0_shr226_i;

assign local_bb0_shr226_i = ((local_bb0__27_i & 32'h7FFFFF8) >> (rnode_164to165_bb0_and225_i_0_NO_SHIFT_REG & 32'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_phitmp_i813_stall_local;
wire [15:0] local_bb0_phitmp_i813;
wire [31:0] local_bb0_phitmp_i813$ps;

assign local_bb0_phitmp_i813$ps = (local_bb0_or_i812 & 32'h1F);
assign local_bb0_phitmp_i813 = local_bb0_phitmp_i813$ps[15:0];

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i1093_masked_stall_local;
wire [63:0] local_bb0_shl326_i1093_masked;

assign local_bb0_shl326_i1093_masked = ((local_bb0_shl326_i1093 & 64'h17F8000000) & 64'h1000000000);

// This section implements an unregistered operation.
// 
wire local_bb0__31_i667_v_valid_out;
wire local_bb0__31_i667_v_stall_in;
wire local_bb0__25_i661_valid_out;
wire local_bb0__25_i661_stall_in;
wire local_bb0__29_i665_valid_out;
wire local_bb0__29_i665_stall_in;
wire local_bb0__33_i669_v_valid_out;
wire local_bb0__33_i669_v_stall_in;
wire local_bb0_shr284_i720_valid_out;
wire local_bb0_shr284_i720_stall_in;
wire local_bb0_shr284_i720_inputs_ready;
wire local_bb0_shr284_i720_stall_local;
wire [31:0] local_bb0_shr284_i720;

assign local_bb0_shr284_i720_inputs_ready = (rnode_163to165_bb0_var__u8_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u4_0_valid_out_0_NO_SHIFT_REG & rnode_163to165_bb0_var__u8_0_valid_out_0_NO_SHIFT_REG & rnode_164to165_bb0_or_i625_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_and664_i621_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv13_i602_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_shr5_i751_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv10_i599_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv_i597_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_x_tr_i596_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_y_tr_i598_0_valid_out_NO_SHIFT_REG & rnode_163to165_bb0_var__u4_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u8_0_valid_out_2_NO_SHIFT_REG & rnode_164to165_bb0_and225_i693_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_and283_i719_0_valid_out_NO_SHIFT_REG);
assign local_bb0_shr284_i720 = (local_bb0_shr226_i694 >> (rnode_164to165_bb0_and283_i719_0_NO_SHIFT_REG & 32'h3));
assign local_bb0__31_i667_v_valid_out = 1'b1;
assign local_bb0__25_i661_valid_out = 1'b1;
assign local_bb0__29_i665_valid_out = 1'b1;
assign local_bb0__33_i669_v_valid_out = 1'b1;
assign local_bb0_shr284_i720_valid_out = 1'b1;
assign rnode_163to165_bb0_var__u8_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u4_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u8_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i625_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i621_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i602_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i751_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i599_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i597_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i596_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i598_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u4_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u8_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and225_i693_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and283_i719_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0__31_i311_v_valid_out;
wire local_bb0__31_i311_v_stall_in;
wire local_bb0__25_i305_valid_out;
wire local_bb0__25_i305_stall_in;
wire local_bb0__29_i309_valid_out;
wire local_bb0__29_i309_stall_in;
wire local_bb0__33_i313_v_valid_out;
wire local_bb0__33_i313_v_stall_in;
wire local_bb0_shr284_i364_valid_out;
wire local_bb0_shr284_i364_stall_in;
wire local_bb0_shr284_i364_inputs_ready;
wire local_bb0_shr284_i364_stall_local;
wire [31:0] local_bb0_shr284_i364;

assign local_bb0_shr284_i364_inputs_ready = (rnode_163to165_bb0_var__u9_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u5_0_valid_out_0_NO_SHIFT_REG & rnode_163to165_bb0_var__u9_0_valid_out_0_NO_SHIFT_REG & rnode_164to165_bb0_or_i269_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_and664_i265_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv13_i246_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_shr5_i395_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv10_i243_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv_i241_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_x_tr_i240_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_y_tr_i242_0_valid_out_NO_SHIFT_REG & rnode_163to165_bb0_var__u5_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u9_0_valid_out_2_NO_SHIFT_REG & rnode_164to165_bb0_and225_i337_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_and283_i363_0_valid_out_NO_SHIFT_REG);
assign local_bb0_shr284_i364 = (local_bb0_shr226_i338 >> (rnode_164to165_bb0_and283_i363_0_NO_SHIFT_REG & 32'h3));
assign local_bb0__31_i311_v_valid_out = 1'b1;
assign local_bb0__25_i305_valid_out = 1'b1;
assign local_bb0__29_i309_valid_out = 1'b1;
assign local_bb0__33_i313_v_valid_out = 1'b1;
assign local_bb0_shr284_i364_valid_out = 1'b1;
assign rnode_163to165_bb0_var__u9_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u5_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u9_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i269_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i265_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i246_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i395_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i243_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i241_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i240_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i242_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u5_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u9_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and225_i337_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and283_i363_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0__31_i_v_valid_out;
wire local_bb0__31_i_v_stall_in;
wire local_bb0__25_i_valid_out;
wire local_bb0__25_i_stall_in;
wire local_bb0__29_i_valid_out;
wire local_bb0__29_i_stall_in;
wire local_bb0__33_i_v_valid_out;
wire local_bb0__33_i_v_stall_in;
wire local_bb0_shr284_i_valid_out;
wire local_bb0_shr284_i_stall_in;
wire local_bb0_shr284_i_inputs_ready;
wire local_bb0_shr284_i_stall_local;
wire [31:0] local_bb0_shr284_i;

assign local_bb0_shr284_i_inputs_ready = (rnode_163to165_bb0_var__u10_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u6_0_valid_out_0_NO_SHIFT_REG & rnode_163to165_bb0_var__u10_0_valid_out_0_NO_SHIFT_REG & rnode_164to165_bb0_or_i20_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_and664_i_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv13_i_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_shr5_i39_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv10_i_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_conv_i16_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_x_tr_i_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_y_tr_i_0_valid_out_NO_SHIFT_REG & rnode_163to165_bb0_var__u6_0_valid_out_1_NO_SHIFT_REG & rnode_163to165_bb0_var__u10_0_valid_out_2_NO_SHIFT_REG & rnode_164to165_bb0_and225_i_0_valid_out_NO_SHIFT_REG & rnode_164to165_bb0_and283_i_0_valid_out_NO_SHIFT_REG);
assign local_bb0_shr284_i = (local_bb0_shr226_i >> (rnode_164to165_bb0_and283_i_0_NO_SHIFT_REG & 32'h3));
assign local_bb0__31_i_v_valid_out = 1'b1;
assign local_bb0__25_i_valid_out = 1'b1;
assign local_bb0__29_i_valid_out = 1'b1;
assign local_bb0__33_i_v_valid_out = 1'b1;
assign local_bb0_shr284_i_valid_out = 1'b1;
assign rnode_163to165_bb0_var__u10_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u6_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u10_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_or_i20_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and664_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv13_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_shr5_i39_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv10_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_conv_i16_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_x_tr_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_y_tr_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u6_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_163to165_bb0_var__u10_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and225_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_164to165_bb0_and283_i_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_i816_stall_local;
wire [15:0] local_bb0_max_shift_0_i816;

assign local_bb0_max_shift_0_i816 = (local_bb0_cmp23_i815 ? 16'h0 : (local_bb0_phitmp_i813 & 16'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_xor_i935_stall_local;
wire [63:0] local_bb0_xor_i935;

assign local_bb0_xor_i935 = ((local_bb0_shl331_i1096 & 64'h1000000000) ^ (local_bb0_shl326_i1093_masked & 64'h1000000000));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool12_i936_stall_local;
wire local_bb0_tobool12_i936;

assign local_bb0_tobool12_i936 = ((local_bb0_shl331_i1096 & 64'h1000000000) != (local_bb0_shl326_i1093_masked & 64'h1000000000));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__31_i667_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i667_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i667_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i667_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i667_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i667_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i667_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i667_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__31_i667_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__31_i667_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__31_i667_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__31_i667_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__31_i667_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__31_i667_v & 64'h1)),
	.data_out(rnode_165to166_bb0__31_i667_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__31_i667_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__31_i667_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__31_i667_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__31_i667_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__31_i667_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__31_i667_v_stall_in = 1'b0;
assign rnode_165to166_bb0__31_i667_v_0_NO_SHIFT_REG = rnode_165to166_bb0__31_i667_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__31_i667_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__31_i667_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__25_i661_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i661_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i661_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i661_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i661_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i661_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i661_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i661_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i661_0_valid_out_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i661_0_stall_in_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i661_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__25_i661_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__25_i661_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__25_i661_0_stall_in_0_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__25_i661_0_valid_out_0_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__25_i661_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__25_i661 & 32'hFF)),
	.data_out(rnode_165to166_bb0__25_i661_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__25_i661_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__25_i661_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__25_i661_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__25_i661_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__25_i661_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__25_i661_stall_in = 1'b0;
assign rnode_165to166_bb0__25_i661_0_stall_in_0_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i661_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i661_0_NO_SHIFT_REG = rnode_165to166_bb0__25_i661_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__25_i661_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i661_1_NO_SHIFT_REG = rnode_165to166_bb0__25_i661_0_reg_166_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__29_i665_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i665_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i665_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i665_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i665_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i665_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i665_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i665_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__29_i665_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__29_i665_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__29_i665_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__29_i665_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__29_i665_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__29_i665 & 32'h7FFFFF8)),
	.data_out(rnode_165to166_bb0__29_i665_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__29_i665_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__29_i665_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__29_i665_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__29_i665_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__29_i665_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__29_i665_stall_in = 1'b0;
assign rnode_165to166_bb0__29_i665_0_NO_SHIFT_REG = rnode_165to166_bb0__29_i665_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__29_i665_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i665_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__33_i669_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i669_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i669_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i669_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i669_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i669_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i669_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i669_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__33_i669_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__33_i669_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__33_i669_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__33_i669_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__33_i669_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__33_i669_v & 64'h1)),
	.data_out(rnode_165to166_bb0__33_i669_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__33_i669_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__33_i669_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__33_i669_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__33_i669_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__33_i669_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__33_i669_v_stall_in = 1'b0;
assign rnode_165to166_bb0__33_i669_v_0_NO_SHIFT_REG = rnode_165to166_bb0__33_i669_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__33_i669_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i669_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0_shr284_i720_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i720_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i720_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i720_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i720_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i720_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i720_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i720_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0_shr284_i720_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0_shr284_i720_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0_shr284_i720_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0_shr284_i720_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0_shr284_i720_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in(local_bb0_shr284_i720),
	.data_out(rnode_165to166_bb0_shr284_i720_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0_shr284_i720_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0_shr284_i720_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0_shr284_i720_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0_shr284_i720_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0_shr284_i720_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr284_i720_stall_in = 1'b0;
assign rnode_165to166_bb0_shr284_i720_0_NO_SHIFT_REG = rnode_165to166_bb0_shr284_i720_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0_shr284_i720_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i720_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__31_i311_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i311_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i311_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i311_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i311_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i311_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i311_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i311_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__31_i311_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__31_i311_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__31_i311_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__31_i311_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__31_i311_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__31_i311_v & 64'h1)),
	.data_out(rnode_165to166_bb0__31_i311_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__31_i311_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__31_i311_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__31_i311_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__31_i311_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__31_i311_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__31_i311_v_stall_in = 1'b0;
assign rnode_165to166_bb0__31_i311_v_0_NO_SHIFT_REG = rnode_165to166_bb0__31_i311_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__31_i311_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__31_i311_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__25_i305_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i305_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i305_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i305_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i305_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i305_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i305_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i305_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i305_0_valid_out_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i305_0_stall_in_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i305_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__25_i305_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__25_i305_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__25_i305_0_stall_in_0_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__25_i305_0_valid_out_0_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__25_i305_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__25_i305 & 32'hFF)),
	.data_out(rnode_165to166_bb0__25_i305_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__25_i305_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__25_i305_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__25_i305_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__25_i305_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__25_i305_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__25_i305_stall_in = 1'b0;
assign rnode_165to166_bb0__25_i305_0_stall_in_0_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i305_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i305_0_NO_SHIFT_REG = rnode_165to166_bb0__25_i305_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__25_i305_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i305_1_NO_SHIFT_REG = rnode_165to166_bb0__25_i305_0_reg_166_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__29_i309_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i309_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i309_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i309_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i309_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i309_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i309_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i309_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__29_i309_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__29_i309_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__29_i309_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__29_i309_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__29_i309_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__29_i309 & 32'h7FFFFF8)),
	.data_out(rnode_165to166_bb0__29_i309_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__29_i309_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__29_i309_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__29_i309_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__29_i309_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__29_i309_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__29_i309_stall_in = 1'b0;
assign rnode_165to166_bb0__29_i309_0_NO_SHIFT_REG = rnode_165to166_bb0__29_i309_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__29_i309_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i309_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__33_i313_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i313_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i313_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i313_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i313_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i313_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i313_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i313_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__33_i313_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__33_i313_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__33_i313_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__33_i313_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__33_i313_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__33_i313_v & 64'h1)),
	.data_out(rnode_165to166_bb0__33_i313_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__33_i313_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__33_i313_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__33_i313_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__33_i313_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__33_i313_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__33_i313_v_stall_in = 1'b0;
assign rnode_165to166_bb0__33_i313_v_0_NO_SHIFT_REG = rnode_165to166_bb0__33_i313_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__33_i313_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i313_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0_shr284_i364_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i364_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i364_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i364_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i364_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i364_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i364_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i364_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0_shr284_i364_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0_shr284_i364_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0_shr284_i364_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0_shr284_i364_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0_shr284_i364_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in(local_bb0_shr284_i364),
	.data_out(rnode_165to166_bb0_shr284_i364_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0_shr284_i364_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0_shr284_i364_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0_shr284_i364_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0_shr284_i364_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0_shr284_i364_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr284_i364_stall_in = 1'b0;
assign rnode_165to166_bb0_shr284_i364_0_NO_SHIFT_REG = rnode_165to166_bb0_shr284_i364_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0_shr284_i364_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i364_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__31_i_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__31_i_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__31_i_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__31_i_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__31_i_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__31_i_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__31_i_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__31_i_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__31_i_v & 64'h1)),
	.data_out(rnode_165to166_bb0__31_i_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__31_i_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__31_i_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__31_i_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__31_i_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__31_i_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__31_i_v_stall_in = 1'b0;
assign rnode_165to166_bb0__31_i_v_0_NO_SHIFT_REG = rnode_165to166_bb0__31_i_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__31_i_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__31_i_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__25_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i_1_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__25_i_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i_0_valid_out_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i_0_stall_in_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__25_i_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__25_i_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__25_i_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__25_i_0_stall_in_0_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__25_i_0_valid_out_0_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__25_i_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__25_i & 32'hFF)),
	.data_out(rnode_165to166_bb0__25_i_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__25_i_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__25_i_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__25_i_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__25_i_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__25_i_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__25_i_stall_in = 1'b0;
assign rnode_165to166_bb0__25_i_0_stall_in_0_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i_0_NO_SHIFT_REG = rnode_165to166_bb0__25_i_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__25_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i_1_NO_SHIFT_REG = rnode_165to166_bb0__25_i_0_reg_166_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__29_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0__29_i_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__29_i_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__29_i_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__29_i_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__29_i_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__29_i_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__29_i_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__29_i & 32'h7FFFFF8)),
	.data_out(rnode_165to166_bb0__29_i_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__29_i_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__29_i_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0__29_i_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__29_i_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__29_i_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__29_i_stall_in = 1'b0;
assign rnode_165to166_bb0__29_i_0_NO_SHIFT_REG = rnode_165to166_bb0__29_i_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__29_i_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0__33_i_v_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i_v_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i_v_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i_v_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_165to166_bb0__33_i_v_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i_v_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i_v_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0__33_i_v_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0__33_i_v_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0__33_i_v_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0__33_i_v_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0__33_i_v_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0__33_i_v_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in((local_bb0__33_i_v & 64'h1)),
	.data_out(rnode_165to166_bb0__33_i_v_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0__33_i_v_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0__33_i_v_0_reg_166_fifo.DATA_WIDTH = 64;
defparam rnode_165to166_bb0__33_i_v_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0__33_i_v_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0__33_i_v_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__33_i_v_stall_in = 1'b0;
assign rnode_165to166_bb0__33_i_v_0_NO_SHIFT_REG = rnode_165to166_bb0__33_i_v_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0__33_i_v_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i_v_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_165to166_bb0_shr284_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i_0_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i_0_reg_166_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_165to166_bb0_shr284_i_0_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i_0_valid_out_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i_0_stall_in_reg_166_NO_SHIFT_REG;
 logic rnode_165to166_bb0_shr284_i_0_stall_out_reg_166_NO_SHIFT_REG;

acl_data_fifo rnode_165to166_bb0_shr284_i_0_reg_166_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_165to166_bb0_shr284_i_0_reg_166_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_165to166_bb0_shr284_i_0_stall_in_reg_166_NO_SHIFT_REG),
	.valid_out(rnode_165to166_bb0_shr284_i_0_valid_out_reg_166_NO_SHIFT_REG),
	.stall_out(rnode_165to166_bb0_shr284_i_0_stall_out_reg_166_NO_SHIFT_REG),
	.data_in(local_bb0_shr284_i),
	.data_out(rnode_165to166_bb0_shr284_i_0_reg_166_NO_SHIFT_REG)
);

defparam rnode_165to166_bb0_shr284_i_0_reg_166_fifo.DEPTH = 1;
defparam rnode_165to166_bb0_shr284_i_0_reg_166_fifo.DATA_WIDTH = 32;
defparam rnode_165to166_bb0_shr284_i_0_reg_166_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_165to166_bb0_shr284_i_0_reg_166_fifo.IMPL = "shift_reg";

assign rnode_165to166_bb0_shr284_i_0_reg_166_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shr284_i_stall_in = 1'b0;
assign rnode_165to166_bb0_shr284_i_0_NO_SHIFT_REG = rnode_165to166_bb0_shr284_i_0_reg_166_NO_SHIFT_REG;
assign rnode_165to166_bb0_shr284_i_0_stall_in_reg_166_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_conv141_i849_stall_local;
wire [31:0] local_bb0_conv141_i849;

assign local_bb0_conv141_i849[31:16] = 16'h0;
assign local_bb0_conv141_i849[15:0] = (local_bb0_max_shift_0_i816 & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or179_i858_stall_local;
wire [15:0] local_bb0_or179_i858;

assign local_bb0_or179_i858 = ((local_bb0_max_shift_0_i816 & 16'h1F) | 16'hF);

// This section implements an unregistered operation.
// 
wire local_bb0_xor_lobit_i939_stall_local;
wire [63:0] local_bb0_xor_lobit_i939;

assign local_bb0_xor_lobit_i939 = ((local_bb0_xor_i935 & 64'h1000000000) >> 64'h24);

// This section implements an unregistered operation.
// 
wire local_bb0_cond_i937_stall_local;
wire [63:0] local_bb0_cond_i937;

assign local_bb0_cond_i937 = (local_bb0_tobool12_i936 ? 64'hFFFFFFF : 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_shl331_i740_stall_local;
wire [63:0] local_bb0_shl331_i740;

assign local_bb0_shl331_i740 = ((rnode_165to166_bb0__31_i667_v_0_NO_SHIFT_REG & 64'h1) << 64'h24);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_166to168_bb0__25_i661_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i661_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i661_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i661_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i661_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_reg_168_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i661_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_valid_out_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_stall_in_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i661_0_stall_out_reg_168_NO_SHIFT_REG;

acl_data_fifo rnode_166to168_bb0__25_i661_0_reg_168_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to168_bb0__25_i661_0_reg_168_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to168_bb0__25_i661_0_stall_in_0_reg_168_NO_SHIFT_REG),
	.valid_out(rnode_166to168_bb0__25_i661_0_valid_out_0_reg_168_NO_SHIFT_REG),
	.stall_out(rnode_166to168_bb0__25_i661_0_stall_out_reg_168_NO_SHIFT_REG),
	.data_in((rnode_165to166_bb0__25_i661_1_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_166to168_bb0__25_i661_0_reg_168_NO_SHIFT_REG)
);

defparam rnode_166to168_bb0__25_i661_0_reg_168_fifo.DEPTH = 2;
defparam rnode_166to168_bb0__25_i661_0_reg_168_fifo.DATA_WIDTH = 32;
defparam rnode_166to168_bb0__25_i661_0_reg_168_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to168_bb0__25_i661_0_reg_168_fifo.IMPL = "shift_reg";

assign rnode_166to168_bb0__25_i661_0_reg_168_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i661_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i661_0_stall_in_0_reg_168_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i661_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i661_0_NO_SHIFT_REG = rnode_166to168_bb0__25_i661_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i661_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i661_1_NO_SHIFT_REG = rnode_166to168_bb0__25_i661_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i661_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i661_2_NO_SHIFT_REG = rnode_166to168_bb0__25_i661_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i661_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i661_3_NO_SHIFT_REG = rnode_166to168_bb0__25_i661_0_reg_168_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv327_i738_stall_local;
wire [63:0] local_bb0_conv327_i738;

assign local_bb0_conv327_i738[63:32] = 32'h0;
assign local_bb0_conv327_i738[31:0] = (rnode_165to166_bb0__29_i665_0_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__33_i669_stall_local;
wire [31:0] local_bb0__33_i669;
wire [63:0] local_bb0__33_i669$ps;

assign local_bb0__33_i669$ps = (rnode_165to166_bb0__33_i669_v_0_NO_SHIFT_REG & 64'h1);
assign local_bb0__33_i669 = local_bb0__33_i669$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_conv335_i744_stall_local;
wire [63:0] local_bb0_conv335_i744;

assign local_bb0_conv335_i744[63:32] = 32'h0;
assign local_bb0_conv335_i744[31:0] = rnode_165to166_bb0_shr284_i720_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_shl331_i384_stall_local;
wire [63:0] local_bb0_shl331_i384;

assign local_bb0_shl331_i384 = ((rnode_165to166_bb0__31_i311_v_0_NO_SHIFT_REG & 64'h1) << 64'h24);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_166to168_bb0__25_i305_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i305_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i305_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i305_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i305_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_reg_168_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i305_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_valid_out_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_stall_in_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i305_0_stall_out_reg_168_NO_SHIFT_REG;

acl_data_fifo rnode_166to168_bb0__25_i305_0_reg_168_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to168_bb0__25_i305_0_reg_168_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to168_bb0__25_i305_0_stall_in_0_reg_168_NO_SHIFT_REG),
	.valid_out(rnode_166to168_bb0__25_i305_0_valid_out_0_reg_168_NO_SHIFT_REG),
	.stall_out(rnode_166to168_bb0__25_i305_0_stall_out_reg_168_NO_SHIFT_REG),
	.data_in((rnode_165to166_bb0__25_i305_1_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_166to168_bb0__25_i305_0_reg_168_NO_SHIFT_REG)
);

defparam rnode_166to168_bb0__25_i305_0_reg_168_fifo.DEPTH = 2;
defparam rnode_166to168_bb0__25_i305_0_reg_168_fifo.DATA_WIDTH = 32;
defparam rnode_166to168_bb0__25_i305_0_reg_168_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to168_bb0__25_i305_0_reg_168_fifo.IMPL = "shift_reg";

assign rnode_166to168_bb0__25_i305_0_reg_168_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i305_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i305_0_stall_in_0_reg_168_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i305_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i305_0_NO_SHIFT_REG = rnode_166to168_bb0__25_i305_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i305_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i305_1_NO_SHIFT_REG = rnode_166to168_bb0__25_i305_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i305_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i305_2_NO_SHIFT_REG = rnode_166to168_bb0__25_i305_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i305_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i305_3_NO_SHIFT_REG = rnode_166to168_bb0__25_i305_0_reg_168_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv327_i382_stall_local;
wire [63:0] local_bb0_conv327_i382;

assign local_bb0_conv327_i382[63:32] = 32'h0;
assign local_bb0_conv327_i382[31:0] = (rnode_165to166_bb0__29_i309_0_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__33_i313_stall_local;
wire [31:0] local_bb0__33_i313;
wire [63:0] local_bb0__33_i313$ps;

assign local_bb0__33_i313$ps = (rnode_165to166_bb0__33_i313_v_0_NO_SHIFT_REG & 64'h1);
assign local_bb0__33_i313 = local_bb0__33_i313$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_conv335_i388_stall_local;
wire [63:0] local_bb0_conv335_i388;

assign local_bb0_conv335_i388[63:32] = 32'h0;
assign local_bb0_conv335_i388[31:0] = rnode_165to166_bb0_shr284_i364_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_shl331_i_stall_local;
wire [63:0] local_bb0_shl331_i;

assign local_bb0_shl331_i = ((rnode_165to166_bb0__31_i_v_0_NO_SHIFT_REG & 64'h1) << 64'h24);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_166to168_bb0__25_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i_0_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i_1_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i_2_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i_3_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_reg_168_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to168_bb0__25_i_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_valid_out_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_stall_in_0_reg_168_NO_SHIFT_REG;
 logic rnode_166to168_bb0__25_i_0_stall_out_reg_168_NO_SHIFT_REG;

acl_data_fifo rnode_166to168_bb0__25_i_0_reg_168_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to168_bb0__25_i_0_reg_168_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to168_bb0__25_i_0_stall_in_0_reg_168_NO_SHIFT_REG),
	.valid_out(rnode_166to168_bb0__25_i_0_valid_out_0_reg_168_NO_SHIFT_REG),
	.stall_out(rnode_166to168_bb0__25_i_0_stall_out_reg_168_NO_SHIFT_REG),
	.data_in((rnode_165to166_bb0__25_i_1_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_166to168_bb0__25_i_0_reg_168_NO_SHIFT_REG)
);

defparam rnode_166to168_bb0__25_i_0_reg_168_fifo.DEPTH = 2;
defparam rnode_166to168_bb0__25_i_0_reg_168_fifo.DATA_WIDTH = 32;
defparam rnode_166to168_bb0__25_i_0_reg_168_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to168_bb0__25_i_0_reg_168_fifo.IMPL = "shift_reg";

assign rnode_166to168_bb0__25_i_0_reg_168_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_165to166_bb0__25_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i_0_stall_in_0_reg_168_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i_0_NO_SHIFT_REG = rnode_166to168_bb0__25_i_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i_1_NO_SHIFT_REG = rnode_166to168_bb0__25_i_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i_2_NO_SHIFT_REG = rnode_166to168_bb0__25_i_0_reg_168_NO_SHIFT_REG;
assign rnode_166to168_bb0__25_i_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i_3_NO_SHIFT_REG = rnode_166to168_bb0__25_i_0_reg_168_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv327_i_stall_local;
wire [63:0] local_bb0_conv327_i;

assign local_bb0_conv327_i[63:32] = 32'h0;
assign local_bb0_conv327_i[31:0] = (rnode_165to166_bb0__29_i_0_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__33_i_stall_local;
wire [31:0] local_bb0__33_i;
wire [63:0] local_bb0__33_i$ps;

assign local_bb0__33_i$ps = (rnode_165to166_bb0__33_i_v_0_NO_SHIFT_REG & 64'h1);
assign local_bb0__33_i = local_bb0__33_i$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_conv335_i_stall_local;
wire [63:0] local_bb0_conv335_i;

assign local_bb0_conv335_i[63:32] = 32'h0;
assign local_bb0_conv335_i[31:0] = rnode_165to166_bb0_shr284_i_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and142_i850_stall_local;
wire [31:0] local_bb0_and142_i850;

assign local_bb0_and142_i850 = ((local_bb0_conv141_i849 & 32'h1F) >> 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb0_add_i940_stall_local;
wire [63:0] local_bb0_add_i940;

assign local_bb0_add_i940 = ((local_bb0_xor_lobit_i939 & 64'h1) | (local_bb0_conv_i932 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_xor16_i938_stall_local;
wire [63:0] local_bb0_xor16_i938;

assign local_bb0_xor16_i938 = ((local_bb0_cond_i937 & 64'hFFFFFFF) ^ (local_bb0_conv2_i933 & 64'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and10_i451_stall_local;
wire [31:0] local_bb0_and10_i451;

assign local_bb0_and10_i451 = ((rnode_166to168_bb0__25_i661_0_NO_SHIFT_REG & 32'hFF) & 32'hE0);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i453_stall_local;
wire [31:0] local_bb0_sub_i453;

assign local_bb0_sub_i453 = ((rnode_166to168_bb0__25_i661_1_NO_SHIFT_REG & 32'hFF) + 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i459_stall_local;
wire local_bb0_cmp23_i459;

assign local_bb0_cmp23_i459 = ((rnode_166to168_bb0__25_i661_2_NO_SHIFT_REG & 32'hFF) == 32'h0);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_168to170_bb0__25_i661_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i661_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0__25_i661_0_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i661_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0__25_i661_0_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i661_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i661_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i661_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_168to170_bb0__25_i661_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to170_bb0__25_i661_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to170_bb0__25_i661_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_168to170_bb0__25_i661_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_168to170_bb0__25_i661_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((rnode_166to168_bb0__25_i661_3_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_168to170_bb0__25_i661_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_168to170_bb0__25_i661_0_reg_170_fifo.DEPTH = 2;
defparam rnode_168to170_bb0__25_i661_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_168to170_bb0__25_i661_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to170_bb0__25_i661_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_168to170_bb0__25_i661_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i661_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0__25_i661_0_NO_SHIFT_REG = rnode_168to170_bb0__25_i661_0_reg_170_NO_SHIFT_REG;
assign rnode_168to170_bb0__25_i661_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0__25_i661_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i576_stall_local;
wire [63:0] local_bb0_conv_i576;

assign local_bb0_conv_i576 = ((local_bb0_conv327_i738 & 64'hFFFFFFF8) & 64'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i734_stall_local;
wire [31:0] local_bb0_shl_i734;

assign local_bb0_shl_i734 = ((local_bb0__33_i669 & 32'h1) << 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u28_stall_local;
wire [31:0] local_bb0_var__u28;

assign local_bb0_var__u28 = ((local_bb0__33_i669 & 32'h1) << 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv2_i577_stall_local;
wire [63:0] local_bb0_conv2_i577;

assign local_bb0_conv2_i577 = ((local_bb0_conv335_i744 & 64'hFFFFFFFF) & 64'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and10_i95_stall_local;
wire [31:0] local_bb0_and10_i95;

assign local_bb0_and10_i95 = ((rnode_166to168_bb0__25_i305_0_NO_SHIFT_REG & 32'hFF) & 32'hE0);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i97_stall_local;
wire [31:0] local_bb0_sub_i97;

assign local_bb0_sub_i97 = ((rnode_166to168_bb0__25_i305_1_NO_SHIFT_REG & 32'hFF) + 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i103_stall_local;
wire local_bb0_cmp23_i103;

assign local_bb0_cmp23_i103 = ((rnode_166to168_bb0__25_i305_2_NO_SHIFT_REG & 32'hFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i220_stall_local;
wire [63:0] local_bb0_conv_i220;

assign local_bb0_conv_i220 = ((local_bb0_conv327_i382 & 64'hFFFFFFF8) & 64'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i378_stall_local;
wire [31:0] local_bb0_shl_i378;

assign local_bb0_shl_i378 = ((local_bb0__33_i313 & 32'h1) << 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u29_stall_local;
wire [31:0] local_bb0_var__u29;

assign local_bb0_var__u29 = ((local_bb0__33_i313 & 32'h1) << 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv2_i221_stall_local;
wire [63:0] local_bb0_conv2_i221;

assign local_bb0_conv2_i221 = ((local_bb0_conv335_i388 & 64'hFFFFFFFF) & 64'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and10_i_stall_local;
wire [31:0] local_bb0_and10_i;

assign local_bb0_and10_i = ((rnode_166to168_bb0__25_i_0_NO_SHIFT_REG & 32'hFF) & 32'hE0);

// This section implements an unregistered operation.
// 
wire local_bb0_sub_i_stall_local;
wire [31:0] local_bb0_sub_i;

assign local_bb0_sub_i = ((rnode_166to168_bb0__25_i_1_NO_SHIFT_REG & 32'hFF) + 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp23_i_stall_local;
wire local_bb0_cmp23_i;

assign local_bb0_cmp23_i = ((rnode_166to168_bb0__25_i_2_NO_SHIFT_REG & 32'hFF) == 32'h0);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_168to170_bb0__25_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0__25_i_0_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0__25_i_0_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0__25_i_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_168to170_bb0__25_i_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to170_bb0__25_i_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to170_bb0__25_i_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_168to170_bb0__25_i_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_168to170_bb0__25_i_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((rnode_166to168_bb0__25_i_3_NO_SHIFT_REG & 32'hFF)),
	.data_out(rnode_168to170_bb0__25_i_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_168to170_bb0__25_i_0_reg_170_fifo.DEPTH = 2;
defparam rnode_168to170_bb0__25_i_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_168to170_bb0__25_i_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to170_bb0__25_i_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_168to170_bb0__25_i_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_166to168_bb0__25_i_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0__25_i_0_NO_SHIFT_REG = rnode_168to170_bb0__25_i_0_reg_170_NO_SHIFT_REG;
assign rnode_168to170_bb0__25_i_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0__25_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_conv_i11_stall_local;
wire [63:0] local_bb0_conv_i11;

assign local_bb0_conv_i11 = ((local_bb0_conv327_i & 64'hFFFFFFF8) & 64'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i33_stall_local;
wire [31:0] local_bb0_shl_i33;

assign local_bb0_shl_i33 = ((local_bb0__33_i & 32'h1) << 32'h9);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u30_stall_local;
wire [31:0] local_bb0_var__u30;

assign local_bb0_var__u30 = ((local_bb0__33_i & 32'h1) << 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv2_i_stall_local;
wire [63:0] local_bb0_conv2_i;

assign local_bb0_conv2_i = ((local_bb0_conv335_i & 64'hFFFFFFFF) & 64'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_add20_i941_valid_out;
wire local_bb0_add20_i941_stall_in;
wire local_bb0_var__u27_valid_out;
wire local_bb0_var__u27_stall_in;
wire local_bb0_conv325_i1092_valid_out_1;
wire local_bb0_conv325_i1092_stall_in_1;
wire local_bb0_add20_i941_inputs_ready;
wire local_bb0_add20_i941_stall_local;
wire [63:0] local_bb0_add20_i941;

assign local_bb0_add20_i941_inputs_ready = (rnode_165to166_bb0__31_i1023_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__33_i1025_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__25_i1017_0_valid_out_0_NO_SHIFT_REG & rnode_165to166_bb0__29_i1021_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0_shr284_i1076_0_valid_out_NO_SHIFT_REG);
assign local_bb0_add20_i941 = ((local_bb0_add_i940 & 64'h7FFFFF9) + (local_bb0_xor16_i938 & 64'hFFFFFFF));
assign local_bb0_add20_i941_valid_out = 1'b1;
assign local_bb0_var__u27_valid_out = 1'b1;
assign local_bb0_conv325_i1092_valid_out_1 = 1'b1;
assign rnode_165to166_bb0__31_i1023_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i1025_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i1017_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i1021_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i1076_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i452_stall_local;
wire local_bb0_cmp_i452;

assign local_bb0_cmp_i452 = ((local_bb0_and10_i451 & 32'hE0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and17_i454_stall_local;
wire [31:0] local_bb0_and17_i454;

assign local_bb0_and17_i454 = ((local_bb0_sub_i453 & 32'h1FF) & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or324_i735_stall_local;
wire [31:0] local_bb0_or324_i735;

assign local_bb0_or324_i735 = ((local_bb0_shl_i734 & 32'h200) | (rnode_165to166_bb0__25_i661_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i96_stall_local;
wire local_bb0_cmp_i96;

assign local_bb0_cmp_i96 = ((local_bb0_and10_i95 & 32'hE0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and17_i98_stall_local;
wire [31:0] local_bb0_and17_i98;

assign local_bb0_and17_i98 = ((local_bb0_sub_i97 & 32'h1FF) & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or324_i379_stall_local;
wire [31:0] local_bb0_or324_i379;

assign local_bb0_or324_i379 = ((local_bb0_shl_i378 & 32'h200) | (rnode_165to166_bb0__25_i305_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cmp_i7_stall_local;
wire local_bb0_cmp_i7;

assign local_bb0_cmp_i7 = ((local_bb0_and10_i & 32'hE0) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and17_i_stall_local;
wire [31:0] local_bb0_and17_i;

assign local_bb0_and17_i = ((local_bb0_sub_i & 32'h1FF) & 32'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or324_i_stall_local;
wire [31:0] local_bb0_or324_i;

assign local_bb0_or324_i = ((local_bb0_shl_i33 & 32'h200) | (rnode_165to166_bb0__25_i_0_NO_SHIFT_REG & 32'hFF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_add20_i941_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i941_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i941_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i941_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i941_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i941_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i941_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i941_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_add20_i941_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_add20_i941_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_add20_i941_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_add20_i941_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_add20_i941_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_add20_i941 & 64'h1FFFFFFF)),
	.data_out(rnode_166to167_bb0_add20_i941_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_add20_i941_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_add20_i941_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_add20_i941_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_add20_i941_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_add20_i941_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_add20_i941_stall_in = 1'b0;
assign rnode_166to167_bb0_add20_i941_0_NO_SHIFT_REG = rnode_166to167_bb0_add20_i941_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_add20_i941_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i941_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_var__u27_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u27_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u27_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u27_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u27_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u27_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u27_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u27_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_var__u27_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_var__u27_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_var__u27_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_var__u27_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_var__u27_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_var__u27 & 32'h80000000)),
	.data_out(rnode_166to167_bb0_var__u27_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_var__u27_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_var__u27_0_reg_167_fifo.DATA_WIDTH = 32;
defparam rnode_166to167_bb0_var__u27_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_var__u27_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_var__u27_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u27_stall_in = 1'b0;
assign rnode_166to167_bb0_var__u27_0_NO_SHIFT_REG = rnode_166to167_bb0_var__u27_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_var__u27_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_var__u27_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_conv325_i1092_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i1092_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i1092_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i1092_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i1092_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i1092_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i1092_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i1092_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_conv325_i1092_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_conv325_i1092_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_conv325_i1092_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_conv325_i1092_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_conv325_i1092_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_conv325_i1092 & 64'h2FF)),
	.data_out(rnode_166to167_bb0_conv325_i1092_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_conv325_i1092_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_conv325_i1092_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_conv325_i1092_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_conv325_i1092_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_conv325_i1092_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv325_i1092_stall_in_1 = 1'b0;
assign rnode_166to167_bb0_conv325_i1092_0_NO_SHIFT_REG = rnode_166to167_bb0_conv325_i1092_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_conv325_i1092_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_conv325_i1092_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_conv18_i455_stall_local;
wire [31:0] local_bb0_conv18_i455;

assign local_bb0_conv18_i455 = (local_bb0_cmp_i452 ? 32'h1F : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv325_i736_stall_local;
wire [63:0] local_bb0_conv325_i736;

assign local_bb0_conv325_i736[63:32] = 32'h0;
assign local_bb0_conv325_i736[31:0] = (local_bb0_or324_i735 & 32'h2FF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv18_i99_stall_local;
wire [31:0] local_bb0_conv18_i99;

assign local_bb0_conv18_i99 = (local_bb0_cmp_i96 ? 32'h1F : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv325_i380_stall_local;
wire [63:0] local_bb0_conv325_i380;

assign local_bb0_conv325_i380[63:32] = 32'h0;
assign local_bb0_conv325_i380[31:0] = (local_bb0_or324_i379 & 32'h2FF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv18_i_stall_local;
wire [31:0] local_bb0_conv18_i;

assign local_bb0_conv18_i = (local_bb0_cmp_i7 ? 32'h1F : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv325_i_stall_local;
wire [63:0] local_bb0_conv325_i;

assign local_bb0_conv325_i[63:32] = 32'h0;
assign local_bb0_conv325_i[31:0] = (local_bb0_or324_i & 32'h2FF);

// This section implements an unregistered operation.
// 
wire local_bb0_and21_i942_stall_local;
wire [63:0] local_bb0_and21_i942;

assign local_bb0_and21_i942 = ((rnode_166to167_bb0_add20_i941_0_NO_SHIFT_REG & 64'h1FFFFFFF) & 64'hFFFFFFF);

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_167to170_bb0_var__u27_0_valid_out_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u27_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u27_0_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u27_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u27_0_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u27_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u27_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u27_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_167to170_bb0_var__u27_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_167to170_bb0_var__u27_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_167to170_bb0_var__u27_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_167to170_bb0_var__u27_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_167to170_bb0_var__u27_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((rnode_166to167_bb0_var__u27_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_167to170_bb0_var__u27_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_167to170_bb0_var__u27_0_reg_170_fifo.DEPTH = 3;
defparam rnode_167to170_bb0_var__u27_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_167to170_bb0_var__u27_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_167to170_bb0_var__u27_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_167to170_bb0_var__u27_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_166to167_bb0_var__u27_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u27_0_NO_SHIFT_REG = rnode_167to170_bb0_var__u27_0_reg_170_NO_SHIFT_REG;
assign rnode_167to170_bb0_var__u27_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u27_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_and23_i943_stall_local;
wire [63:0] local_bb0_and23_i943;

assign local_bb0_and23_i943 = ((rnode_166to167_bb0_conv325_i1092_0_NO_SHIFT_REG & 64'h2FF) << 64'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_or_i456_stall_local;
wire [31:0] local_bb0_or_i456;

assign local_bb0_or_i456 = ((local_bb0_conv18_i455 & 32'h1F) | (local_bb0_and17_i454 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i737_stall_local;
wire [63:0] local_bb0_shl326_i737;

assign local_bb0_shl326_i737 = ((local_bb0_conv325_i736 & 64'h2FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_or_i100_stall_local;
wire [31:0] local_bb0_or_i100;

assign local_bb0_or_i100 = ((local_bb0_conv18_i99 & 32'h1F) | (local_bb0_and17_i98 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i381_stall_local;
wire [63:0] local_bb0_shl326_i381;

assign local_bb0_shl326_i381 = ((local_bb0_conv325_i380 & 64'h2FF) << 64'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_or_i8_stall_local;
wire [31:0] local_bb0_or_i8;

assign local_bb0_or_i8 = ((local_bb0_conv18_i & 32'h1F) | (local_bb0_and17_i & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i_stall_local;
wire [63:0] local_bb0_shl326_i;

assign local_bb0_shl326_i = ((local_bb0_conv325_i & 64'h2FF) << 64'h1B);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_var__u27_0_valid_out_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u27_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u27_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u27_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u27_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u27_0_valid_out_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u27_0_stall_in_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u27_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_var__u27_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_var__u27_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_var__u27_0_stall_in_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_var__u27_0_valid_out_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_var__u27_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in((rnode_167to170_bb0_var__u27_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_170to171_bb0_var__u27_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_var__u27_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_var__u27_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_var__u27_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_var__u27_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_var__u27_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_167to170_bb0_var__u27_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u27_0_NO_SHIFT_REG = rnode_170to171_bb0_var__u27_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_var__u27_0_stall_in_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u27_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_or_i945_valid_out;
wire local_bb0_or_i945_stall_in;
wire local_bb0_or_i945_inputs_ready;
wire local_bb0_or_i945_stall_local;
wire [63:0] local_bb0_or_i945;

assign local_bb0_or_i945_inputs_ready = (rnode_166to167_bb0_conv325_i1092_0_valid_out_NO_SHIFT_REG & rnode_166to167_bb0_add20_i941_0_valid_out_NO_SHIFT_REG);
assign local_bb0_or_i945 = ((local_bb0_and21_i942 & 64'hFFFFFFF) | (local_bb0_and23_i943 & 64'h2FF0000000));
assign local_bb0_or_i945_valid_out = 1'b1;
assign rnode_166to167_bb0_conv325_i1092_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i941_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_phitmp_i457_stall_local;
wire [15:0] local_bb0_phitmp_i457;
wire [31:0] local_bb0_phitmp_i457$ps;

assign local_bb0_phitmp_i457$ps = (local_bb0_or_i456 & 32'h1F);
assign local_bb0_phitmp_i457 = local_bb0_phitmp_i457$ps[15:0];

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i737_masked_stall_local;
wire [63:0] local_bb0_shl326_i737_masked;

assign local_bb0_shl326_i737_masked = ((local_bb0_shl326_i737 & 64'h17F8000000) & 64'h1000000000);

// This section implements an unregistered operation.
// 
wire local_bb0_phitmp_i101_stall_local;
wire [15:0] local_bb0_phitmp_i101;
wire [31:0] local_bb0_phitmp_i101$ps;

assign local_bb0_phitmp_i101$ps = (local_bb0_or_i100 & 32'h1F);
assign local_bb0_phitmp_i101 = local_bb0_phitmp_i101$ps[15:0];

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i381_masked_stall_local;
wire [63:0] local_bb0_shl326_i381_masked;

assign local_bb0_shl326_i381_masked = ((local_bb0_shl326_i381 & 64'h17F8000000) & 64'h1000000000);

// This section implements an unregistered operation.
// 
wire local_bb0_phitmp_i_stall_local;
wire [15:0] local_bb0_phitmp_i;
wire [31:0] local_bb0_phitmp_i$ps;

assign local_bb0_phitmp_i$ps = (local_bb0_or_i8 & 32'h1F);
assign local_bb0_phitmp_i = local_bb0_phitmp_i$ps[15:0];

// This section implements an unregistered operation.
// 
wire local_bb0_shl326_i_masked_stall_local;
wire [63:0] local_bb0_shl326_i_masked;

assign local_bb0_shl326_i_masked = ((local_bb0_shl326_i & 64'h17F8000000) & 64'h1000000000);

// This section implements a registered operation.
// 
wire local_bb0_conv_i801_inputs_ready;
 reg local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_0;
 reg local_bb0_conv_i801_valid_out_1_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_1;
 reg local_bb0_conv_i801_valid_out_2_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_2;
 reg local_bb0_conv_i801_valid_out_3_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_3;
 reg local_bb0_conv_i801_valid_out_4_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_4;
 reg local_bb0_conv_i801_valid_out_5_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_5;
 reg local_bb0_conv_i801_valid_out_6_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_6;
 reg local_bb0_conv_i801_valid_out_7_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_7;
 reg local_bb0_conv_i801_valid_out_8_NO_SHIFT_REG;
wire local_bb0_conv_i801_stall_in_8;
wire local_bb0_conv_i801_output_regs_ready;
 reg [31:0] local_bb0_conv_i801_NO_SHIFT_REG;
wire [63:0] local_bb0_conv_i801$ps;
wire local_bb0_conv_i801_causedstall;

assign local_bb0_conv_i801_inputs_ready = 1'b1;
assign local_bb0_conv_i801_output_regs_ready = 1'b1;
assign local_bb0_conv_i801$ps = (local_bb0_or_i945 & 64'hFFFFFEFFFFFFFFF);
assign local_bb0_or_i945_stall_in = 1'b0;
assign local_bb0_conv_i801_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_i801_NO_SHIFT_REG <= 'x;
		local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_conv_i801_output_regs_ready)
		begin
			local_bb0_conv_i801_NO_SHIFT_REG <= local_bb0_conv_i801$ps[31:0];
			local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb0_conv_i801_stall_in_0))
			begin
				local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	local_bb0_conv_i801_valid_out_1_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i801_valid_out_2_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i801_valid_out_3_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i801_valid_out_4_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i801_valid_out_5_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i801_valid_out_6_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i801_valid_out_7_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i801_valid_out_8_NO_SHIFT_REG = local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG;
end


// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_i460_stall_local;
wire [15:0] local_bb0_max_shift_0_i460;

assign local_bb0_max_shift_0_i460 = (local_bb0_cmp23_i459 ? 16'h0 : (local_bb0_phitmp_i457 & 16'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_xor_i579_stall_local;
wire [63:0] local_bb0_xor_i579;

assign local_bb0_xor_i579 = ((local_bb0_shl331_i740 & 64'h1000000000) ^ (local_bb0_shl326_i737_masked & 64'h1000000000));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool12_i580_stall_local;
wire local_bb0_tobool12_i580;

assign local_bb0_tobool12_i580 = ((local_bb0_shl331_i740 & 64'h1000000000) != (local_bb0_shl326_i737_masked & 64'h1000000000));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_i104_stall_local;
wire [15:0] local_bb0_max_shift_0_i104;

assign local_bb0_max_shift_0_i104 = (local_bb0_cmp23_i103 ? 16'h0 : (local_bb0_phitmp_i101 & 16'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_xor_i223_stall_local;
wire [63:0] local_bb0_xor_i223;

assign local_bb0_xor_i223 = ((local_bb0_shl331_i384 & 64'h1000000000) ^ (local_bb0_shl326_i381_masked & 64'h1000000000));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool12_i224_stall_local;
wire local_bb0_tobool12_i224;

assign local_bb0_tobool12_i224 = ((local_bb0_shl331_i384 & 64'h1000000000) != (local_bb0_shl326_i381_masked & 64'h1000000000));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_i_stall_local;
wire [15:0] local_bb0_max_shift_0_i;

assign local_bb0_max_shift_0_i = (local_bb0_cmp23_i ? 16'h0 : (local_bb0_phitmp_i & 16'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_xor_i_stall_local;
wire [63:0] local_bb0_xor_i;

assign local_bb0_xor_i = ((local_bb0_shl331_i & 64'h1000000000) ^ (local_bb0_shl326_i_masked & 64'h1000000000));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool12_i_stall_local;
wire local_bb0_tobool12_i;

assign local_bb0_tobool12_i = ((local_bb0_shl331_i & 64'h1000000000) != (local_bb0_shl326_i_masked & 64'h1000000000));

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i817_stall_local;
wire [31:0] local_bb0_and26_i817;

assign local_bb0_and26_i817 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h8000000);

// This section implements an unregistered operation.
// 
wire local_bb0_and41_i819_stall_local;
wire [31:0] local_bb0_and41_i819;

assign local_bb0_and41_i819 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h78000);

// This section implements an unregistered operation.
// 
wire local_bb0_and49_i820_stall_local;
wire [31:0] local_bb0_and49_i820;

assign local_bb0_and49_i820 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h7800000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u31_stall_local;
wire [31:0] local_bb0_var__u31;

assign local_bb0_var__u31 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h7F80000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u32_stall_local;
wire [31:0] local_bb0_var__u32;

assign local_bb0_var__u32 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h7FFF800);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u33_stall_local;
wire [31:0] local_bb0_var__u33;

assign local_bb0_var__u33 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u34_stall_local;
wire [31:0] local_bb0_var__u34;

assign local_bb0_var__u34 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h7FFFF80);

// This section implements an unregistered operation.
// 
wire local_bb0_and171_i853_stall_local;
wire [31:0] local_bb0_and171_i853;

assign local_bb0_and171_i853 = (local_bb0_conv_i801_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and_i860_stall_local;
wire [31:0] local_bb0_and_i860;

assign local_bb0_and_i860 = (local_bb0_conv_i801_NO_SHIFT_REG >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_conv141_i493_stall_local;
wire [31:0] local_bb0_conv141_i493;

assign local_bb0_conv141_i493[31:16] = 16'h0;
assign local_bb0_conv141_i493[15:0] = (local_bb0_max_shift_0_i460 & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or179_i502_stall_local;
wire [15:0] local_bb0_or179_i502;

assign local_bb0_or179_i502 = ((local_bb0_max_shift_0_i460 & 16'h1F) | 16'hF);

// This section implements an unregistered operation.
// 
wire local_bb0_xor_lobit_i583_stall_local;
wire [63:0] local_bb0_xor_lobit_i583;

assign local_bb0_xor_lobit_i583 = ((local_bb0_xor_i579 & 64'h1000000000) >> 64'h24);

// This section implements an unregistered operation.
// 
wire local_bb0_cond_i581_stall_local;
wire [63:0] local_bb0_cond_i581;

assign local_bb0_cond_i581 = (local_bb0_tobool12_i580 ? 64'hFFFFFFF : 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv141_i137_stall_local;
wire [31:0] local_bb0_conv141_i137;

assign local_bb0_conv141_i137[31:16] = 16'h0;
assign local_bb0_conv141_i137[15:0] = (local_bb0_max_shift_0_i104 & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or179_i146_stall_local;
wire [15:0] local_bb0_or179_i146;

assign local_bb0_or179_i146 = ((local_bb0_max_shift_0_i104 & 16'h1F) | 16'hF);

// This section implements an unregistered operation.
// 
wire local_bb0_xor_lobit_i227_stall_local;
wire [63:0] local_bb0_xor_lobit_i227;

assign local_bb0_xor_lobit_i227 = ((local_bb0_xor_i223 & 64'h1000000000) >> 64'h24);

// This section implements an unregistered operation.
// 
wire local_bb0_cond_i225_stall_local;
wire [63:0] local_bb0_cond_i225;

assign local_bb0_cond_i225 = (local_bb0_tobool12_i224 ? 64'hFFFFFFF : 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv141_i_stall_local;
wire [31:0] local_bb0_conv141_i;

assign local_bb0_conv141_i[31:16] = 16'h0;
assign local_bb0_conv141_i[15:0] = (local_bb0_max_shift_0_i & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or179_i_stall_local;
wire [15:0] local_bb0_or179_i;

assign local_bb0_or179_i = ((local_bb0_max_shift_0_i & 16'h1F) | 16'hF);

// This section implements an unregistered operation.
// 
wire local_bb0_xor_lobit_i_stall_local;
wire [63:0] local_bb0_xor_lobit_i;

assign local_bb0_xor_lobit_i = ((local_bb0_xor_i & 64'h1000000000) >> 64'h24);

// This section implements an unregistered operation.
// 
wire local_bb0_cond_i_stall_local;
wire [63:0] local_bb0_cond_i;

assign local_bb0_cond_i = (local_bb0_tobool12_i ? 64'hFFFFFFF : 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool27_i818_stall_local;
wire local_bb0_tobool27_i818;

assign local_bb0_tobool27_i818 = ((local_bb0_and26_i817 & 32'h8000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i817_lobit_stall_local;
wire [31:0] local_bb0_and26_i817_lobit;

assign local_bb0_and26_i817_lobit = ((local_bb0_and26_i817 & 32'h8000000) >> 32'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot109_i835_stall_local;
wire local_bb0_lnot109_i835;

assign local_bb0_lnot109_i835 = ((local_bb0_and41_i819 & 32'h78000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot99_i831_stall_local;
wire local_bb0_lnot99_i831;

assign local_bb0_lnot99_i831 = ((local_bb0_and49_i820 & 32'h7800000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot85_i825_stall_local;
wire local_bb0_lnot85_i825;

assign local_bb0_lnot85_i825 = ((local_bb0_var__u31 & 32'h7F80000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_i821_stall_local;
wire local_bb0_lnot_i821;

assign local_bb0_lnot_i821 = ((local_bb0_var__u32 & 32'h7FFF800) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u35_stall_local;
wire local_bb0_var__u35;

assign local_bb0_var__u35 = ((local_bb0_var__u33 & 32'h7FFFFF8) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u36_stall_local;
wire local_bb0_var__u36;

assign local_bb0_var__u36 = ((local_bb0_var__u34 & 32'h7FFFF80) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and142_i494_stall_local;
wire [31:0] local_bb0_and142_i494;

assign local_bb0_and142_i494 = ((local_bb0_conv141_i493 & 32'h1F) >> 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb0_add_i584_stall_local;
wire [63:0] local_bb0_add_i584;

assign local_bb0_add_i584 = ((local_bb0_xor_lobit_i583 & 64'h1) | (local_bb0_conv_i576 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_xor16_i582_stall_local;
wire [63:0] local_bb0_xor16_i582;

assign local_bb0_xor16_i582 = ((local_bb0_cond_i581 & 64'hFFFFFFF) ^ (local_bb0_conv2_i577 & 64'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and142_i138_stall_local;
wire [31:0] local_bb0_and142_i138;

assign local_bb0_and142_i138 = ((local_bb0_conv141_i137 & 32'h1F) >> 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb0_add_i228_stall_local;
wire [63:0] local_bb0_add_i228;

assign local_bb0_add_i228 = ((local_bb0_xor_lobit_i227 & 64'h1) | (local_bb0_conv_i220 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_xor16_i226_stall_local;
wire [63:0] local_bb0_xor16_i226;

assign local_bb0_xor16_i226 = ((local_bb0_cond_i225 & 64'hFFFFFFF) ^ (local_bb0_conv2_i221 & 64'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and142_i_stall_local;
wire [31:0] local_bb0_and142_i;

assign local_bb0_and142_i = ((local_bb0_conv141_i & 32'h1F) >> 32'h4);

// This section implements an unregistered operation.
// 
wire local_bb0_add_i12_stall_local;
wire [63:0] local_bb0_add_i12;

assign local_bb0_add_i12 = ((local_bb0_xor_lobit_i & 64'h1) | (local_bb0_conv_i11 & 64'h7FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_xor16_i_stall_local;
wire [63:0] local_bb0_xor16_i;

assign local_bb0_xor16_i = ((local_bb0_cond_i & 64'hFFFFFFF) ^ (local_bb0_conv2_i & 64'h7FFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext110_i836_stall_local;
wire [31:0] local_bb0_lnot_ext110_i836;

assign local_bb0_lnot_ext110_i836[31:1] = 31'h0;
assign local_bb0_lnot_ext110_i836[0] = local_bb0_lnot109_i835;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext100_i832_stall_local;
wire [31:0] local_bb0_lnot_ext100_i832;

assign local_bb0_lnot_ext100_i832[31:1] = 31'h0;
assign local_bb0_lnot_ext100_i832[0] = local_bb0_lnot99_i831;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext86_i826_stall_local;
wire [31:0] local_bb0_lnot_ext86_i826;

assign local_bb0_lnot_ext86_i826[31:1] = 31'h0;
assign local_bb0_lnot_ext86_i826[0] = local_bb0_lnot85_i825;

// This section implements an unregistered operation.
// 
wire local_bb0_conv67_i822_stall_local;
wire [31:0] local_bb0_conv67_i822;

assign local_bb0_conv67_i822[31:1] = 31'h0;
assign local_bb0_conv67_i822[0] = local_bb0_lnot_i821;

// This section implements an unregistered operation.
// 
wire local_bb0_cond128_i844_stall_local;
wire [15:0] local_bb0_cond128_i844;

assign local_bb0_cond128_i844 = (local_bb0_lnot_i821 ? 16'h10 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and75_i823_stall_local;
wire [31:0] local_bb0_and75_i823;

assign local_bb0_and75_i823[31:1] = 31'h0;
assign local_bb0_and75_i823[0] = local_bb0_var__u35;

// This section implements an unregistered operation.
// 
wire local_bb0_and118_i839_stall_local;
wire [31:0] local_bb0_and118_i839;

assign local_bb0_and118_i839[31:1] = 31'h0;
assign local_bb0_and118_i839[0] = local_bb0_var__u36;

// This section implements an unregistered operation.
// 
wire local_bb0_add20_i585_valid_out;
wire local_bb0_add20_i585_stall_in;
wire local_bb0_var__u28_valid_out;
wire local_bb0_var__u28_stall_in;
wire local_bb0_conv325_i736_valid_out_1;
wire local_bb0_conv325_i736_stall_in_1;
wire local_bb0_add20_i585_inputs_ready;
wire local_bb0_add20_i585_stall_local;
wire [63:0] local_bb0_add20_i585;

assign local_bb0_add20_i585_inputs_ready = (rnode_165to166_bb0__31_i667_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__33_i669_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__25_i661_0_valid_out_0_NO_SHIFT_REG & rnode_165to166_bb0__29_i665_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0_shr284_i720_0_valid_out_NO_SHIFT_REG);
assign local_bb0_add20_i585 = ((local_bb0_add_i584 & 64'h7FFFFF9) + (local_bb0_xor16_i582 & 64'hFFFFFFF));
assign local_bb0_add20_i585_valid_out = 1'b1;
assign local_bb0_var__u28_valid_out = 1'b1;
assign local_bb0_conv325_i736_valid_out_1 = 1'b1;
assign rnode_165to166_bb0__31_i667_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i669_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i661_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i665_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i720_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_add20_i229_valid_out;
wire local_bb0_add20_i229_stall_in;
wire local_bb0_var__u29_valid_out;
wire local_bb0_var__u29_stall_in;
wire local_bb0_conv325_i380_valid_out_1;
wire local_bb0_conv325_i380_stall_in_1;
wire local_bb0_add20_i229_inputs_ready;
wire local_bb0_add20_i229_stall_local;
wire [63:0] local_bb0_add20_i229;

assign local_bb0_add20_i229_inputs_ready = (rnode_165to166_bb0__31_i311_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__33_i313_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__25_i305_0_valid_out_0_NO_SHIFT_REG & rnode_165to166_bb0__29_i309_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0_shr284_i364_0_valid_out_NO_SHIFT_REG);
assign local_bb0_add20_i229 = ((local_bb0_add_i228 & 64'h7FFFFF9) + (local_bb0_xor16_i226 & 64'hFFFFFFF));
assign local_bb0_add20_i229_valid_out = 1'b1;
assign local_bb0_var__u29_valid_out = 1'b1;
assign local_bb0_conv325_i380_valid_out_1 = 1'b1;
assign rnode_165to166_bb0__31_i311_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i313_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i305_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i309_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i364_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_add20_i_valid_out;
wire local_bb0_add20_i_stall_in;
wire local_bb0_var__u30_valid_out;
wire local_bb0_var__u30_stall_in;
wire local_bb0_conv325_i_valid_out_1;
wire local_bb0_conv325_i_stall_in_1;
wire local_bb0_add20_i_inputs_ready;
wire local_bb0_add20_i_stall_local;
wire [63:0] local_bb0_add20_i;

assign local_bb0_add20_i_inputs_ready = (rnode_165to166_bb0__31_i_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__33_i_v_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0__25_i_0_valid_out_0_NO_SHIFT_REG & rnode_165to166_bb0__29_i_0_valid_out_NO_SHIFT_REG & rnode_165to166_bb0_shr284_i_0_valid_out_NO_SHIFT_REG);
assign local_bb0_add20_i = ((local_bb0_add_i12 & 64'h7FFFFF9) + (local_bb0_xor16_i & 64'hFFFFFFF));
assign local_bb0_add20_i_valid_out = 1'b1;
assign local_bb0_var__u30_valid_out = 1'b1;
assign local_bb0_conv325_i_valid_out_1 = 1'b1;
assign rnode_165to166_bb0__31_i_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__33_i_v_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__25_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0__29_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_165to166_bb0_shr284_i_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext78_i824_stall_local;
wire [31:0] local_bb0_lnot_ext78_i824;

assign local_bb0_lnot_ext78_i824 = ((local_bb0_conv67_i822 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and1742_i854_stall_local;
wire [15:0] local_bb0_and1742_i854;

assign local_bb0_and1742_i854 = ((local_bb0_max_shift_0_i816 & 16'h1F) & (local_bb0_cond128_i844 & 16'h10));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_add20_i585_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i585_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i585_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i585_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i585_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i585_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i585_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i585_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_add20_i585_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_add20_i585_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_add20_i585_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_add20_i585_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_add20_i585_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_add20_i585 & 64'h1FFFFFFF)),
	.data_out(rnode_166to167_bb0_add20_i585_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_add20_i585_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_add20_i585_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_add20_i585_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_add20_i585_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_add20_i585_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_add20_i585_stall_in = 1'b0;
assign rnode_166to167_bb0_add20_i585_0_NO_SHIFT_REG = rnode_166to167_bb0_add20_i585_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_add20_i585_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i585_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_var__u28_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u28_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u28_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u28_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u28_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u28_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u28_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u28_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_var__u28_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_var__u28_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_var__u28_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_var__u28_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_var__u28_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_var__u28 & 32'h80000000)),
	.data_out(rnode_166to167_bb0_var__u28_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_var__u28_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_var__u28_0_reg_167_fifo.DATA_WIDTH = 32;
defparam rnode_166to167_bb0_var__u28_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_var__u28_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_var__u28_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u28_stall_in = 1'b0;
assign rnode_166to167_bb0_var__u28_0_NO_SHIFT_REG = rnode_166to167_bb0_var__u28_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_var__u28_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_var__u28_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_conv325_i736_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i736_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i736_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i736_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i736_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i736_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i736_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i736_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_conv325_i736_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_conv325_i736_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_conv325_i736_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_conv325_i736_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_conv325_i736_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_conv325_i736 & 64'h2FF)),
	.data_out(rnode_166to167_bb0_conv325_i736_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_conv325_i736_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_conv325_i736_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_conv325_i736_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_conv325_i736_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_conv325_i736_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv325_i736_stall_in_1 = 1'b0;
assign rnode_166to167_bb0_conv325_i736_0_NO_SHIFT_REG = rnode_166to167_bb0_conv325_i736_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_conv325_i736_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_conv325_i736_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_add20_i229_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i229_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i229_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i229_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i229_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i229_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i229_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i229_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_add20_i229_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_add20_i229_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_add20_i229_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_add20_i229_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_add20_i229_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_add20_i229 & 64'h1FFFFFFF)),
	.data_out(rnode_166to167_bb0_add20_i229_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_add20_i229_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_add20_i229_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_add20_i229_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_add20_i229_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_add20_i229_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_add20_i229_stall_in = 1'b0;
assign rnode_166to167_bb0_add20_i229_0_NO_SHIFT_REG = rnode_166to167_bb0_add20_i229_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_add20_i229_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i229_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_var__u29_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u29_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u29_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u29_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u29_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u29_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u29_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u29_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_var__u29_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_var__u29_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_var__u29_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_var__u29_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_var__u29_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_var__u29 & 32'h80000000)),
	.data_out(rnode_166to167_bb0_var__u29_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_var__u29_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_var__u29_0_reg_167_fifo.DATA_WIDTH = 32;
defparam rnode_166to167_bb0_var__u29_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_var__u29_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_var__u29_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u29_stall_in = 1'b0;
assign rnode_166to167_bb0_var__u29_0_NO_SHIFT_REG = rnode_166to167_bb0_var__u29_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_var__u29_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_var__u29_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_conv325_i380_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i380_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i380_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i380_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i380_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i380_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i380_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i380_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_conv325_i380_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_conv325_i380_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_conv325_i380_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_conv325_i380_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_conv325_i380_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_conv325_i380 & 64'h2FF)),
	.data_out(rnode_166to167_bb0_conv325_i380_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_conv325_i380_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_conv325_i380_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_conv325_i380_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_conv325_i380_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_conv325_i380_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv325_i380_stall_in_1 = 1'b0;
assign rnode_166to167_bb0_conv325_i380_0_NO_SHIFT_REG = rnode_166to167_bb0_conv325_i380_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_conv325_i380_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_conv325_i380_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_add20_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_add20_i_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_add20_i_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_add20_i_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_add20_i_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_add20_i_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_add20_i_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_add20_i_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_add20_i & 64'h1FFFFFFF)),
	.data_out(rnode_166to167_bb0_add20_i_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_add20_i_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_add20_i_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_add20_i_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_add20_i_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_add20_i_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_add20_i_stall_in = 1'b0;
assign rnode_166to167_bb0_add20_i_0_NO_SHIFT_REG = rnode_166to167_bb0_add20_i_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_add20_i_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_var__u30_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u30_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u30_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u30_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_166to167_bb0_var__u30_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u30_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u30_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_var__u30_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_var__u30_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_var__u30_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_var__u30_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_var__u30_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_var__u30_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_var__u30 & 32'h80000000)),
	.data_out(rnode_166to167_bb0_var__u30_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_var__u30_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_var__u30_0_reg_167_fifo.DATA_WIDTH = 32;
defparam rnode_166to167_bb0_var__u30_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_var__u30_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_var__u30_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_var__u30_stall_in = 1'b0;
assign rnode_166to167_bb0_var__u30_0_NO_SHIFT_REG = rnode_166to167_bb0_var__u30_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_var__u30_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_var__u30_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_166to167_bb0_conv325_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i_0_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i_0_reg_167_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_166to167_bb0_conv325_i_0_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i_0_valid_out_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i_0_stall_in_reg_167_NO_SHIFT_REG;
 logic rnode_166to167_bb0_conv325_i_0_stall_out_reg_167_NO_SHIFT_REG;

acl_data_fifo rnode_166to167_bb0_conv325_i_0_reg_167_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_166to167_bb0_conv325_i_0_reg_167_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_166to167_bb0_conv325_i_0_stall_in_reg_167_NO_SHIFT_REG),
	.valid_out(rnode_166to167_bb0_conv325_i_0_valid_out_reg_167_NO_SHIFT_REG),
	.stall_out(rnode_166to167_bb0_conv325_i_0_stall_out_reg_167_NO_SHIFT_REG),
	.data_in((local_bb0_conv325_i & 64'h2FF)),
	.data_out(rnode_166to167_bb0_conv325_i_0_reg_167_NO_SHIFT_REG)
);

defparam rnode_166to167_bb0_conv325_i_0_reg_167_fifo.DEPTH = 1;
defparam rnode_166to167_bb0_conv325_i_0_reg_167_fifo.DATA_WIDTH = 64;
defparam rnode_166to167_bb0_conv325_i_0_reg_167_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_166to167_bb0_conv325_i_0_reg_167_fifo.IMPL = "shift_reg";

assign rnode_166to167_bb0_conv325_i_0_reg_167_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv325_i_stall_in_1 = 1'b0;
assign rnode_166to167_bb0_conv325_i_0_NO_SHIFT_REG = rnode_166to167_bb0_conv325_i_0_reg_167_NO_SHIFT_REG;
assign rnode_166to167_bb0_conv325_i_0_stall_in_reg_167_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_conv325_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_and87_i827_stall_local;
wire [31:0] local_bb0_and87_i827;

assign local_bb0_and87_i827 = ((local_bb0_lnot_ext78_i824 & 32'h1) & (local_bb0_lnot_ext86_i826 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and97_i833_stall_local;
wire [31:0] local_bb0_and97_i833;

assign local_bb0_and97_i833 = ((local_bb0_lnot_ext78_i824 & 32'h1) & (local_bb0_lnot_ext100_i832 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and107_i837_stall_local;
wire [31:0] local_bb0_and107_i837;

assign local_bb0_and107_i837 = ((local_bb0_lnot_ext78_i824 & 32'h1) & (local_bb0_lnot_ext110_i836 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and145_i851_stall_local;
wire [31:0] local_bb0_and145_i851;

assign local_bb0_and145_i851 = ((local_bb0_lnot_ext78_i824 & 32'h1) & (local_bb0_and142_i850 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and174_i855_stall_local;
wire [31:0] local_bb0_and174_i855;

assign local_bb0_and174_i855[31:16] = 16'h0;
assign local_bb0_and174_i855[15:0] = (local_bb0_and1742_i854 & 16'h10);

// This section implements an unregistered operation.
// 
wire local_bb0_and21_i586_stall_local;
wire [63:0] local_bb0_and21_i586;

assign local_bb0_and21_i586 = ((rnode_166to167_bb0_add20_i585_0_NO_SHIFT_REG & 64'h1FFFFFFF) & 64'hFFFFFFF);

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_167to170_bb0_var__u28_0_valid_out_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u28_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u28_0_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u28_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u28_0_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u28_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u28_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u28_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_167to170_bb0_var__u28_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_167to170_bb0_var__u28_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_167to170_bb0_var__u28_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_167to170_bb0_var__u28_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_167to170_bb0_var__u28_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((rnode_166to167_bb0_var__u28_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_167to170_bb0_var__u28_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_167to170_bb0_var__u28_0_reg_170_fifo.DEPTH = 3;
defparam rnode_167to170_bb0_var__u28_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_167to170_bb0_var__u28_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_167to170_bb0_var__u28_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_167to170_bb0_var__u28_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_166to167_bb0_var__u28_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u28_0_NO_SHIFT_REG = rnode_167to170_bb0_var__u28_0_reg_170_NO_SHIFT_REG;
assign rnode_167to170_bb0_var__u28_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u28_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_and23_i587_stall_local;
wire [63:0] local_bb0_and23_i587;

assign local_bb0_and23_i587 = ((rnode_166to167_bb0_conv325_i736_0_NO_SHIFT_REG & 64'h2FF) << 64'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_and21_i230_stall_local;
wire [63:0] local_bb0_and21_i230;

assign local_bb0_and21_i230 = ((rnode_166to167_bb0_add20_i229_0_NO_SHIFT_REG & 64'h1FFFFFFF) & 64'hFFFFFFF);

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_167to170_bb0_var__u29_0_valid_out_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u29_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u29_0_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u29_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u29_0_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u29_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u29_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u29_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_167to170_bb0_var__u29_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_167to170_bb0_var__u29_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_167to170_bb0_var__u29_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_167to170_bb0_var__u29_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_167to170_bb0_var__u29_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((rnode_166to167_bb0_var__u29_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_167to170_bb0_var__u29_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_167to170_bb0_var__u29_0_reg_170_fifo.DEPTH = 3;
defparam rnode_167to170_bb0_var__u29_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_167to170_bb0_var__u29_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_167to170_bb0_var__u29_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_167to170_bb0_var__u29_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_166to167_bb0_var__u29_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u29_0_NO_SHIFT_REG = rnode_167to170_bb0_var__u29_0_reg_170_NO_SHIFT_REG;
assign rnode_167to170_bb0_var__u29_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u29_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_and23_i231_stall_local;
wire [63:0] local_bb0_and23_i231;

assign local_bb0_and23_i231 = ((rnode_166to167_bb0_conv325_i380_0_NO_SHIFT_REG & 64'h2FF) << 64'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_and21_i_stall_local;
wire [63:0] local_bb0_and21_i;

assign local_bb0_and21_i = ((rnode_166to167_bb0_add20_i_0_NO_SHIFT_REG & 64'h1FFFFFFF) & 64'hFFFFFFF);

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_167to170_bb0_var__u30_0_valid_out_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u30_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u30_0_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u30_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_167to170_bb0_var__u30_0_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u30_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u30_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_167to170_bb0_var__u30_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_167to170_bb0_var__u30_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_167to170_bb0_var__u30_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_167to170_bb0_var__u30_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_167to170_bb0_var__u30_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_167to170_bb0_var__u30_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((rnode_166to167_bb0_var__u30_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_167to170_bb0_var__u30_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_167to170_bb0_var__u30_0_reg_170_fifo.DEPTH = 3;
defparam rnode_167to170_bb0_var__u30_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_167to170_bb0_var__u30_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_167to170_bb0_var__u30_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_167to170_bb0_var__u30_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_166to167_bb0_var__u30_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u30_0_NO_SHIFT_REG = rnode_167to170_bb0_var__u30_0_reg_170_NO_SHIFT_REG;
assign rnode_167to170_bb0_var__u30_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_167to170_bb0_var__u30_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_and23_i_stall_local;
wire [63:0] local_bb0_and23_i;

assign local_bb0_and23_i = ((rnode_166to167_bb0_conv325_i_0_NO_SHIFT_REG & 64'h2FF) << 64'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_or88_i828_stall_local;
wire [31:0] local_bb0_or88_i828;

assign local_bb0_or88_i828 = ((local_bb0_and87_i827 & 32'h1) | (local_bb0_and75_i823 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool146_i852_stall_local;
wire local_bb0_tobool146_i852;

assign local_bb0_tobool146_i852 = ((local_bb0_and145_i851 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and175_i856_stall_local;
wire [31:0] local_bb0_and175_i856;

assign local_bb0_and175_i856 = ((local_bb0_and174_i855 & 32'h10) & 32'h10);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_var__u28_0_valid_out_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u28_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u28_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u28_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u28_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u28_0_valid_out_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u28_0_stall_in_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u28_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_var__u28_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_var__u28_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_var__u28_0_stall_in_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_var__u28_0_valid_out_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_var__u28_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in((rnode_167to170_bb0_var__u28_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_170to171_bb0_var__u28_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_var__u28_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_var__u28_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_var__u28_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_var__u28_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_var__u28_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_167to170_bb0_var__u28_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u28_0_NO_SHIFT_REG = rnode_170to171_bb0_var__u28_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_var__u28_0_stall_in_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u28_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_or_i589_valid_out;
wire local_bb0_or_i589_stall_in;
wire local_bb0_or_i589_inputs_ready;
wire local_bb0_or_i589_stall_local;
wire [63:0] local_bb0_or_i589;

assign local_bb0_or_i589_inputs_ready = (rnode_166to167_bb0_conv325_i736_0_valid_out_NO_SHIFT_REG & rnode_166to167_bb0_add20_i585_0_valid_out_NO_SHIFT_REG);
assign local_bb0_or_i589 = ((local_bb0_and21_i586 & 64'hFFFFFFF) | (local_bb0_and23_i587 & 64'h2FF0000000));
assign local_bb0_or_i589_valid_out = 1'b1;
assign rnode_166to167_bb0_conv325_i736_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i585_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_var__u29_0_valid_out_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u29_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u29_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u29_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u29_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u29_0_valid_out_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u29_0_stall_in_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u29_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_var__u29_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_var__u29_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_var__u29_0_stall_in_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_var__u29_0_valid_out_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_var__u29_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in((rnode_167to170_bb0_var__u29_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_170to171_bb0_var__u29_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_var__u29_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_var__u29_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_var__u29_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_var__u29_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_var__u29_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_167to170_bb0_var__u29_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u29_0_NO_SHIFT_REG = rnode_170to171_bb0_var__u29_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_var__u29_0_stall_in_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u29_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_or_i233_valid_out;
wire local_bb0_or_i233_stall_in;
wire local_bb0_or_i233_inputs_ready;
wire local_bb0_or_i233_stall_local;
wire [63:0] local_bb0_or_i233;

assign local_bb0_or_i233_inputs_ready = (rnode_166to167_bb0_conv325_i380_0_valid_out_NO_SHIFT_REG & rnode_166to167_bb0_add20_i229_0_valid_out_NO_SHIFT_REG);
assign local_bb0_or_i233 = ((local_bb0_and21_i230 & 64'hFFFFFFF) | (local_bb0_and23_i231 & 64'h2FF0000000));
assign local_bb0_or_i233_valid_out = 1'b1;
assign rnode_166to167_bb0_conv325_i380_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i229_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_var__u30_0_valid_out_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u30_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u30_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u30_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_var__u30_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u30_0_valid_out_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u30_0_stall_in_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_var__u30_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_var__u30_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_var__u30_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_var__u30_0_stall_in_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_var__u30_0_valid_out_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_var__u30_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in((rnode_167to170_bb0_var__u30_0_NO_SHIFT_REG & 32'h80000000)),
	.data_out(rnode_170to171_bb0_var__u30_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_var__u30_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_var__u30_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_var__u30_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_var__u30_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_var__u30_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_167to170_bb0_var__u30_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u30_0_NO_SHIFT_REG = rnode_170to171_bb0_var__u30_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_var__u30_0_stall_in_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u30_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_or_i14_valid_out;
wire local_bb0_or_i14_stall_in;
wire local_bb0_or_i14_inputs_ready;
wire local_bb0_or_i14_stall_local;
wire [63:0] local_bb0_or_i14;

assign local_bb0_or_i14_inputs_ready = (rnode_166to167_bb0_conv325_i_0_valid_out_NO_SHIFT_REG & rnode_166to167_bb0_add20_i_0_valid_out_NO_SHIFT_REG);
assign local_bb0_or_i14 = ((local_bb0_and21_i & 64'hFFFFFFF) | (local_bb0_and23_i & 64'h2FF0000000));
assign local_bb0_or_i14_valid_out = 1'b1;
assign rnode_166to167_bb0_conv325_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_166to167_bb0_add20_i_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_tobool89_i829_stall_local;
wire local_bb0_tobool89_i829;

assign local_bb0_tobool89_i829 = ((local_bb0_or88_i828 & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext96_i830_stall_local;
wire [31:0] local_bb0_lnot_ext96_i830;

assign local_bb0_lnot_ext96_i830 = ((local_bb0_or88_i828 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and111_i838_stall_local;
wire [31:0] local_bb0_and111_i838;

assign local_bb0_and111_i838 = ((local_bb0_and107_i837 & 32'h1) & (local_bb0_or88_i828 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_or179_i859_stall_local;
wire [15:0] local_bb0_max_shift_0_or179_i859;

assign local_bb0_max_shift_0_or179_i859 = (local_bb0_tobool146_i852 ? (local_bb0_max_shift_0_i816 & 16'h1F) : ((local_bb0_or179_i858 & 16'h1F) | 16'hF));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i857_stall_local;
wire [31:0] local_bb0_shl_i857;

assign local_bb0_shl_i857 = ((local_bb0_and171_i853 & 32'h7FFFFFF) << (local_bb0_and175_i856 & 32'h10));

// This section implements a registered operation.
// 
wire local_bb0_conv_i445_inputs_ready;
 reg local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_0;
 reg local_bb0_conv_i445_valid_out_1_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_1;
 reg local_bb0_conv_i445_valid_out_2_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_2;
 reg local_bb0_conv_i445_valid_out_3_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_3;
 reg local_bb0_conv_i445_valid_out_4_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_4;
 reg local_bb0_conv_i445_valid_out_5_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_5;
 reg local_bb0_conv_i445_valid_out_6_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_6;
 reg local_bb0_conv_i445_valid_out_7_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_7;
 reg local_bb0_conv_i445_valid_out_8_NO_SHIFT_REG;
wire local_bb0_conv_i445_stall_in_8;
wire local_bb0_conv_i445_output_regs_ready;
 reg [31:0] local_bb0_conv_i445_NO_SHIFT_REG;
wire [63:0] local_bb0_conv_i445$ps;
wire local_bb0_conv_i445_causedstall;

assign local_bb0_conv_i445_inputs_ready = 1'b1;
assign local_bb0_conv_i445_output_regs_ready = 1'b1;
assign local_bb0_conv_i445$ps = (local_bb0_or_i589 & 64'hFFFFFEFFFFFFFFF);
assign local_bb0_or_i589_stall_in = 1'b0;
assign local_bb0_conv_i445_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_i445_NO_SHIFT_REG <= 'x;
		local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_conv_i445_output_regs_ready)
		begin
			local_bb0_conv_i445_NO_SHIFT_REG <= local_bb0_conv_i445$ps[31:0];
			local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb0_conv_i445_stall_in_0))
			begin
				local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	local_bb0_conv_i445_valid_out_1_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i445_valid_out_2_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i445_valid_out_3_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i445_valid_out_4_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i445_valid_out_5_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i445_valid_out_6_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i445_valid_out_7_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i445_valid_out_8_NO_SHIFT_REG = local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG;
end


// This section implements a registered operation.
// 
wire local_bb0_conv_i89_inputs_ready;
 reg local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_0;
 reg local_bb0_conv_i89_valid_out_1_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_1;
 reg local_bb0_conv_i89_valid_out_2_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_2;
 reg local_bb0_conv_i89_valid_out_3_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_3;
 reg local_bb0_conv_i89_valid_out_4_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_4;
 reg local_bb0_conv_i89_valid_out_5_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_5;
 reg local_bb0_conv_i89_valid_out_6_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_6;
 reg local_bb0_conv_i89_valid_out_7_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_7;
 reg local_bb0_conv_i89_valid_out_8_NO_SHIFT_REG;
wire local_bb0_conv_i89_stall_in_8;
wire local_bb0_conv_i89_output_regs_ready;
 reg [31:0] local_bb0_conv_i89_NO_SHIFT_REG;
wire [63:0] local_bb0_conv_i89$ps;
wire local_bb0_conv_i89_causedstall;

assign local_bb0_conv_i89_inputs_ready = 1'b1;
assign local_bb0_conv_i89_output_regs_ready = 1'b1;
assign local_bb0_conv_i89$ps = (local_bb0_or_i233 & 64'hFFFFFEFFFFFFFFF);
assign local_bb0_or_i233_stall_in = 1'b0;
assign local_bb0_conv_i89_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_i89_NO_SHIFT_REG <= 'x;
		local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_conv_i89_output_regs_ready)
		begin
			local_bb0_conv_i89_NO_SHIFT_REG <= local_bb0_conv_i89$ps[31:0];
			local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb0_conv_i89_stall_in_0))
			begin
				local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	local_bb0_conv_i89_valid_out_1_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i89_valid_out_2_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i89_valid_out_3_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i89_valid_out_4_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i89_valid_out_5_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i89_valid_out_6_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i89_valid_out_7_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i89_valid_out_8_NO_SHIFT_REG = local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG;
end


// This section implements a registered operation.
// 
wire local_bb0_conv_i4_inputs_ready;
 reg local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_0;
 reg local_bb0_conv_i4_valid_out_1_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_1;
 reg local_bb0_conv_i4_valid_out_2_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_2;
 reg local_bb0_conv_i4_valid_out_3_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_3;
 reg local_bb0_conv_i4_valid_out_4_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_4;
 reg local_bb0_conv_i4_valid_out_5_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_5;
 reg local_bb0_conv_i4_valid_out_6_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_6;
 reg local_bb0_conv_i4_valid_out_7_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_7;
 reg local_bb0_conv_i4_valid_out_8_NO_SHIFT_REG;
wire local_bb0_conv_i4_stall_in_8;
wire local_bb0_conv_i4_output_regs_ready;
 reg [31:0] local_bb0_conv_i4_NO_SHIFT_REG;
wire [63:0] local_bb0_conv_i4$ps;
wire local_bb0_conv_i4_causedstall;

assign local_bb0_conv_i4_inputs_ready = 1'b1;
assign local_bb0_conv_i4_output_regs_ready = 1'b1;
assign local_bb0_conv_i4$ps = (local_bb0_or_i14 & 64'hFFFFFEFFFFFFFFF);
assign local_bb0_or_i14_stall_in = 1'b0;
assign local_bb0_conv_i4_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_i4_NO_SHIFT_REG <= 'x;
		local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_conv_i4_output_regs_ready)
		begin
			local_bb0_conv_i4_NO_SHIFT_REG <= local_bb0_conv_i4$ps[31:0];
			local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb0_conv_i4_stall_in_0))
			begin
				local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	local_bb0_conv_i4_valid_out_1_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i4_valid_out_2_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i4_valid_out_3_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i4_valid_out_4_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i4_valid_out_5_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i4_valid_out_6_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i4_valid_out_7_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
	local_bb0_conv_i4_valid_out_8_NO_SHIFT_REG = local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG;
end


// This section implements an unregistered operation.
// 
wire local_bb0_cond131_i845_stall_local;
wire [15:0] local_bb0_cond131_i845;

assign local_bb0_cond131_i845 = (local_bb0_tobool89_i829 ? 16'h8 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and101_i834_stall_local;
wire [31:0] local_bb0_and101_i834;

assign local_bb0_and101_i834 = ((local_bb0_and97_i833 & 32'h1) & (local_bb0_lnot_ext96_i830 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and122_i840_stall_local;
wire [31:0] local_bb0_and122_i840;

assign local_bb0_and122_i840 = ((local_bb0_and118_i839 & 32'h1) & (local_bb0_lnot_ext96_i830 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and187_lobit_i873_stall_local;
wire [31:0] local_bb0_and187_lobit_i873;

assign local_bb0_and187_lobit_i873 = ((local_bb0_lnot_ext96_i830 & 32'h1) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0__16_i868_stall_local;
wire [15:0] local_bb0__16_i868;

assign local_bb0__16_i868 = (local_bb0_tobool27_i818 ? (local_bb0_max_shift_0_or179_i859 & 16'h1F) : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__15_i867_stall_local;
wire [31:0] local_bb0__15_i867;

assign local_bb0__15_i867 = (local_bb0_tobool27_i818 ? local_bb0_shl_i857 : (local_bb0_and_i860 & 32'h7FFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i461_stall_local;
wire [31:0] local_bb0_and26_i461;

assign local_bb0_and26_i461 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h8000000);

// This section implements an unregistered operation.
// 
wire local_bb0_and41_i463_stall_local;
wire [31:0] local_bb0_and41_i463;

assign local_bb0_and41_i463 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h78000);

// This section implements an unregistered operation.
// 
wire local_bb0_and49_i464_stall_local;
wire [31:0] local_bb0_and49_i464;

assign local_bb0_and49_i464 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h7800000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u37_stall_local;
wire [31:0] local_bb0_var__u37;

assign local_bb0_var__u37 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h7F80000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u38_stall_local;
wire [31:0] local_bb0_var__u38;

assign local_bb0_var__u38 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h7FFF800);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u39_stall_local;
wire [31:0] local_bb0_var__u39;

assign local_bb0_var__u39 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u40_stall_local;
wire [31:0] local_bb0_var__u40;

assign local_bb0_var__u40 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h7FFFF80);

// This section implements an unregistered operation.
// 
wire local_bb0_and171_i497_stall_local;
wire [31:0] local_bb0_and171_i497;

assign local_bb0_and171_i497 = (local_bb0_conv_i445_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and_i504_stall_local;
wire [31:0] local_bb0_and_i504;

assign local_bb0_and_i504 = (local_bb0_conv_i445_NO_SHIFT_REG >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i105_stall_local;
wire [31:0] local_bb0_and26_i105;

assign local_bb0_and26_i105 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h8000000);

// This section implements an unregistered operation.
// 
wire local_bb0_and41_i107_stall_local;
wire [31:0] local_bb0_and41_i107;

assign local_bb0_and41_i107 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h78000);

// This section implements an unregistered operation.
// 
wire local_bb0_and49_i108_stall_local;
wire [31:0] local_bb0_and49_i108;

assign local_bb0_and49_i108 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h7800000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u41_stall_local;
wire [31:0] local_bb0_var__u41;

assign local_bb0_var__u41 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h7F80000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u42_stall_local;
wire [31:0] local_bb0_var__u42;

assign local_bb0_var__u42 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h7FFF800);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u43_stall_local;
wire [31:0] local_bb0_var__u43;

assign local_bb0_var__u43 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u44_stall_local;
wire [31:0] local_bb0_var__u44;

assign local_bb0_var__u44 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h7FFFF80);

// This section implements an unregistered operation.
// 
wire local_bb0_and171_i141_stall_local;
wire [31:0] local_bb0_and171_i141;

assign local_bb0_and171_i141 = (local_bb0_conv_i89_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and_i148_stall_local;
wire [31:0] local_bb0_and_i148;

assign local_bb0_and_i148 = (local_bb0_conv_i89_NO_SHIFT_REG >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i_stall_local;
wire [31:0] local_bb0_and26_i;

assign local_bb0_and26_i = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h8000000);

// This section implements an unregistered operation.
// 
wire local_bb0_and41_i_stall_local;
wire [31:0] local_bb0_and41_i;

assign local_bb0_and41_i = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h78000);

// This section implements an unregistered operation.
// 
wire local_bb0_and49_i_stall_local;
wire [31:0] local_bb0_and49_i;

assign local_bb0_and49_i = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h7800000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u45_stall_local;
wire [31:0] local_bb0_var__u45;

assign local_bb0_var__u45 = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h7F80000);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u46_stall_local;
wire [31:0] local_bb0_var__u46;

assign local_bb0_var__u46 = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h7FFF800);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u47_stall_local;
wire [31:0] local_bb0_var__u47;

assign local_bb0_var__u47 = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h7FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u48_stall_local;
wire [31:0] local_bb0_var__u48;

assign local_bb0_var__u48 = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h7FFFF80);

// This section implements an unregistered operation.
// 
wire local_bb0_and171_i_stall_local;
wire [31:0] local_bb0_and171_i;

assign local_bb0_and171_i = (local_bb0_conv_i4_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and_i_stall_local;
wire [31:0] local_bb0_and_i;

assign local_bb0_and_i = (local_bb0_conv_i4_NO_SHIFT_REG >> 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_or132_i847_stall_local;
wire [15:0] local_bb0_or132_i847;

assign local_bb0_or132_i847 = ((local_bb0_cond131_i845 & 16'h8) | (local_bb0_cond128_i844 & 16'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_or112_i841_stall_local;
wire [31:0] local_bb0_or112_i841;

assign local_bb0_or112_i841 = ((local_bb0_and122_i840 & 32'h1) | (local_bb0_and111_i838 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool27_i462_stall_local;
wire local_bb0_tobool27_i462;

assign local_bb0_tobool27_i462 = ((local_bb0_and26_i461 & 32'h8000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot109_i479_stall_local;
wire local_bb0_lnot109_i479;

assign local_bb0_lnot109_i479 = ((local_bb0_and41_i463 & 32'h78000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot99_i475_stall_local;
wire local_bb0_lnot99_i475;

assign local_bb0_lnot99_i475 = ((local_bb0_and49_i464 & 32'h7800000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot85_i469_stall_local;
wire local_bb0_lnot85_i469;

assign local_bb0_lnot85_i469 = ((local_bb0_var__u37 & 32'h7F80000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_i465_stall_local;
wire local_bb0_lnot_i465;

assign local_bb0_lnot_i465 = ((local_bb0_var__u38 & 32'h7FFF800) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u49_stall_local;
wire local_bb0_var__u49;

assign local_bb0_var__u49 = ((local_bb0_var__u39 & 32'h7FFFFF8) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u50_stall_local;
wire local_bb0_var__u50;

assign local_bb0_var__u50 = ((local_bb0_var__u40 & 32'h7FFFF80) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool27_i106_stall_local;
wire local_bb0_tobool27_i106;

assign local_bb0_tobool27_i106 = ((local_bb0_and26_i105 & 32'h8000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i105_lobit_stall_local;
wire [31:0] local_bb0_and26_i105_lobit;

assign local_bb0_and26_i105_lobit = ((local_bb0_and26_i105 & 32'h8000000) >> 32'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot109_i123_stall_local;
wire local_bb0_lnot109_i123;

assign local_bb0_lnot109_i123 = ((local_bb0_and41_i107 & 32'h78000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot99_i119_stall_local;
wire local_bb0_lnot99_i119;

assign local_bb0_lnot99_i119 = ((local_bb0_and49_i108 & 32'h7800000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot85_i113_stall_local;
wire local_bb0_lnot85_i113;

assign local_bb0_lnot85_i113 = ((local_bb0_var__u41 & 32'h7F80000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_i109_stall_local;
wire local_bb0_lnot_i109;

assign local_bb0_lnot_i109 = ((local_bb0_var__u42 & 32'h7FFF800) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u51_stall_local;
wire local_bb0_var__u51;

assign local_bb0_var__u51 = ((local_bb0_var__u43 & 32'h7FFFFF8) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u52_stall_local;
wire local_bb0_var__u52;

assign local_bb0_var__u52 = ((local_bb0_var__u44 & 32'h7FFFF80) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool27_i_stall_local;
wire local_bb0_tobool27_i;

assign local_bb0_tobool27_i = ((local_bb0_and26_i & 32'h8000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot109_i_stall_local;
wire local_bb0_lnot109_i;

assign local_bb0_lnot109_i = ((local_bb0_and41_i & 32'h78000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot99_i_stall_local;
wire local_bb0_lnot99_i;

assign local_bb0_lnot99_i = ((local_bb0_and49_i & 32'h7800000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot85_i_stall_local;
wire local_bb0_lnot85_i;

assign local_bb0_lnot85_i = ((local_bb0_var__u45 & 32'h7F80000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_i_stall_local;
wire local_bb0_lnot_i;

assign local_bb0_lnot_i = ((local_bb0_var__u46 & 32'h7FFF800) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u53_stall_local;
wire local_bb0_var__u53;

assign local_bb0_var__u53 = ((local_bb0_var__u47 & 32'h7FFFFF8) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u54_stall_local;
wire local_bb0_var__u54;

assign local_bb0_var__u54 = ((local_bb0_var__u48 & 32'h7FFFF80) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__16_i868_valid_out;
wire local_bb0__16_i868_stall_in;
wire local_bb0__15_i867_valid_out;
wire local_bb0__15_i867_stall_in;
wire local_bb0_and26_i817_lobit_valid_out;
wire local_bb0_and26_i817_lobit_stall_in;
wire local_bb0_or132_i847_valid_out;
wire local_bb0_or132_i847_stall_in;
wire local_bb0_or123_i842_valid_out;
wire local_bb0_or123_i842_stall_in;
wire local_bb0_and187_lobit_i873_valid_out;
wire local_bb0_and187_lobit_i873_stall_in;
wire local_bb0_or123_i842_inputs_ready;
wire local_bb0_or123_i842_stall_local;
wire [31:0] local_bb0_or123_i842;

assign local_bb0_or123_i842_inputs_ready = (rnode_166to168_bb0__25_i1017_0_valid_out_0_NO_SHIFT_REG & rnode_166to168_bb0__25_i1017_0_valid_out_1_NO_SHIFT_REG & rnode_166to168_bb0__25_i1017_0_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_7_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_8_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_0_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_4_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_3_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_5_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_1_NO_SHIFT_REG & local_bb0_conv_i801_valid_out_6_NO_SHIFT_REG);
assign local_bb0_or123_i842 = ((local_bb0_or112_i841 & 32'h1) | (local_bb0_and101_i834 & 32'h1));
assign local_bb0__16_i868_valid_out = 1'b1;
assign local_bb0__15_i867_valid_out = 1'b1;
assign local_bb0_and26_i817_lobit_valid_out = 1'b1;
assign local_bb0_or132_i847_valid_out = 1'b1;
assign local_bb0_or123_i842_valid_out = 1'b1;
assign local_bb0_and187_lobit_i873_valid_out = 1'b1;
assign rnode_166to168_bb0__25_i1017_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i1017_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i1017_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign local_bb0_conv_i801_stall_in_7 = 1'b0;
assign local_bb0_conv_i801_stall_in_8 = 1'b0;
assign local_bb0_conv_i801_stall_in_0 = 1'b0;
assign local_bb0_conv_i801_stall_in_4 = 1'b0;
assign local_bb0_conv_i801_stall_in_3 = 1'b0;
assign local_bb0_conv_i801_stall_in_5 = 1'b0;
assign local_bb0_conv_i801_stall_in_2 = 1'b0;
assign local_bb0_conv_i801_stall_in_1 = 1'b0;
assign local_bb0_conv_i801_stall_in_6 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext110_i480_stall_local;
wire [31:0] local_bb0_lnot_ext110_i480;

assign local_bb0_lnot_ext110_i480[31:1] = 31'h0;
assign local_bb0_lnot_ext110_i480[0] = local_bb0_lnot109_i479;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext100_i476_stall_local;
wire [31:0] local_bb0_lnot_ext100_i476;

assign local_bb0_lnot_ext100_i476[31:1] = 31'h0;
assign local_bb0_lnot_ext100_i476[0] = local_bb0_lnot99_i475;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext86_i470_stall_local;
wire [31:0] local_bb0_lnot_ext86_i470;

assign local_bb0_lnot_ext86_i470[31:1] = 31'h0;
assign local_bb0_lnot_ext86_i470[0] = local_bb0_lnot85_i469;

// This section implements an unregistered operation.
// 
wire local_bb0_conv67_i466_stall_local;
wire [31:0] local_bb0_conv67_i466;

assign local_bb0_conv67_i466[31:1] = 31'h0;
assign local_bb0_conv67_i466[0] = local_bb0_lnot_i465;

// This section implements an unregistered operation.
// 
wire local_bb0_cond128_i488_stall_local;
wire [15:0] local_bb0_cond128_i488;

assign local_bb0_cond128_i488 = (local_bb0_lnot_i465 ? 16'h10 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and75_i467_stall_local;
wire [31:0] local_bb0_and75_i467;

assign local_bb0_and75_i467[31:1] = 31'h0;
assign local_bb0_and75_i467[0] = local_bb0_var__u49;

// This section implements an unregistered operation.
// 
wire local_bb0_and118_i483_stall_local;
wire [31:0] local_bb0_and118_i483;

assign local_bb0_and118_i483[31:1] = 31'h0;
assign local_bb0_and118_i483[0] = local_bb0_var__u50;

// This section implements an unregistered operation.
// 
wire local_bb0_add_i197_stall_local;
wire [31:0] local_bb0_add_i197;

assign local_bb0_add_i197 = ((local_bb0_and26_i105_lobit & 32'h1) + (rnode_166to168_bb0__25_i305_3_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext110_i124_stall_local;
wire [31:0] local_bb0_lnot_ext110_i124;

assign local_bb0_lnot_ext110_i124[31:1] = 31'h0;
assign local_bb0_lnot_ext110_i124[0] = local_bb0_lnot109_i123;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext100_i120_stall_local;
wire [31:0] local_bb0_lnot_ext100_i120;

assign local_bb0_lnot_ext100_i120[31:1] = 31'h0;
assign local_bb0_lnot_ext100_i120[0] = local_bb0_lnot99_i119;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext86_i114_stall_local;
wire [31:0] local_bb0_lnot_ext86_i114;

assign local_bb0_lnot_ext86_i114[31:1] = 31'h0;
assign local_bb0_lnot_ext86_i114[0] = local_bb0_lnot85_i113;

// This section implements an unregistered operation.
// 
wire local_bb0_conv67_i110_stall_local;
wire [31:0] local_bb0_conv67_i110;

assign local_bb0_conv67_i110[31:1] = 31'h0;
assign local_bb0_conv67_i110[0] = local_bb0_lnot_i109;

// This section implements an unregistered operation.
// 
wire local_bb0_cond128_i132_stall_local;
wire [15:0] local_bb0_cond128_i132;

assign local_bb0_cond128_i132 = (local_bb0_lnot_i109 ? 16'h10 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and75_i111_stall_local;
wire [31:0] local_bb0_and75_i111;

assign local_bb0_and75_i111[31:1] = 31'h0;
assign local_bb0_and75_i111[0] = local_bb0_var__u51;

// This section implements an unregistered operation.
// 
wire local_bb0_and118_i127_stall_local;
wire [31:0] local_bb0_and118_i127;

assign local_bb0_and118_i127[31:1] = 31'h0;
assign local_bb0_and118_i127[0] = local_bb0_var__u52;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext110_i_stall_local;
wire [31:0] local_bb0_lnot_ext110_i;

assign local_bb0_lnot_ext110_i[31:1] = 31'h0;
assign local_bb0_lnot_ext110_i[0] = local_bb0_lnot109_i;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext100_i_stall_local;
wire [31:0] local_bb0_lnot_ext100_i;

assign local_bb0_lnot_ext100_i[31:1] = 31'h0;
assign local_bb0_lnot_ext100_i[0] = local_bb0_lnot99_i;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext86_i_stall_local;
wire [31:0] local_bb0_lnot_ext86_i;

assign local_bb0_lnot_ext86_i[31:1] = 31'h0;
assign local_bb0_lnot_ext86_i[0] = local_bb0_lnot85_i;

// This section implements an unregistered operation.
// 
wire local_bb0_conv67_i_stall_local;
wire [31:0] local_bb0_conv67_i;

assign local_bb0_conv67_i[31:1] = 31'h0;
assign local_bb0_conv67_i[0] = local_bb0_lnot_i;

// This section implements an unregistered operation.
// 
wire local_bb0_cond128_i_stall_local;
wire [15:0] local_bb0_cond128_i;

assign local_bb0_cond128_i = (local_bb0_lnot_i ? 16'h10 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and75_i_stall_local;
wire [31:0] local_bb0_and75_i;

assign local_bb0_and75_i[31:1] = 31'h0;
assign local_bb0_and75_i[0] = local_bb0_var__u53;

// This section implements an unregistered operation.
// 
wire local_bb0_and118_i_stall_local;
wire [31:0] local_bb0_and118_i;

assign local_bb0_and118_i[31:1] = 31'h0;
assign local_bb0_and118_i[0] = local_bb0_var__u54;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__16_i868_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_stall_in_0_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i868_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_stall_in_1_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i868_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_stall_in_2_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i868_2_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i868_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i868_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__16_i868_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__16_i868_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__16_i868_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__16_i868_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__16_i868_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0__16_i868 & 16'h1F)),
	.data_out(rnode_168to169_bb0__16_i868_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__16_i868_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__16_i868_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0__16_i868_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__16_i868_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__16_i868_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__16_i868_stall_in = 1'b0;
assign rnode_168to169_bb0__16_i868_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i868_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i868_0_NO_SHIFT_REG = rnode_168to169_bb0__16_i868_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__16_i868_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i868_1_NO_SHIFT_REG = rnode_168to169_bb0__16_i868_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__16_i868_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i868_2_NO_SHIFT_REG = rnode_168to169_bb0__16_i868_0_reg_169_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__15_i867_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i867_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i867_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i867_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i867_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i867_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i867_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i867_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__15_i867_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__15_i867_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__15_i867_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__15_i867_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__15_i867_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in(local_bb0__15_i867),
	.data_out(rnode_168to169_bb0__15_i867_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__15_i867_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__15_i867_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0__15_i867_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__15_i867_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__15_i867_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__15_i867_stall_in = 1'b0;
assign rnode_168to169_bb0__15_i867_0_NO_SHIFT_REG = rnode_168to169_bb0__15_i867_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__15_i867_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i867_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_168to170_bb0_and26_i817_lobit_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i817_lobit_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_and26_i817_lobit_0_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i817_lobit_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_and26_i817_lobit_0_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i817_lobit_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i817_lobit_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i817_lobit_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_168to170_bb0_and26_i817_lobit_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to170_bb0_and26_i817_lobit_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to170_bb0_and26_i817_lobit_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_168to170_bb0_and26_i817_lobit_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_168to170_bb0_and26_i817_lobit_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_and26_i817_lobit & 32'h1)),
	.data_out(rnode_168to170_bb0_and26_i817_lobit_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_168to170_bb0_and26_i817_lobit_0_reg_170_fifo.DEPTH = 2;
defparam rnode_168to170_bb0_and26_i817_lobit_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_168to170_bb0_and26_i817_lobit_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to170_bb0_and26_i817_lobit_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_168to170_bb0_and26_i817_lobit_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and26_i817_lobit_stall_in = 1'b0;
assign rnode_168to170_bb0_and26_i817_lobit_0_NO_SHIFT_REG = rnode_168to170_bb0_and26_i817_lobit_0_reg_170_NO_SHIFT_REG;
assign rnode_168to170_bb0_and26_i817_lobit_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0_and26_i817_lobit_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or132_i847_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i847_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_or132_i847_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i847_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_or132_i847_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i847_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i847_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i847_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or132_i847_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or132_i847_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or132_i847_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or132_i847_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or132_i847_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or132_i847 & 16'h18)),
	.data_out(rnode_168to169_bb0_or132_i847_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or132_i847_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or132_i847_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0_or132_i847_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or132_i847_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or132_i847_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or132_i847_stall_in = 1'b0;
assign rnode_168to169_bb0_or132_i847_0_NO_SHIFT_REG = rnode_168to169_bb0_or132_i847_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or132_i847_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or132_i847_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or123_i842_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i842_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i842_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i842_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i842_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i842_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i842_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i842_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i842_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i842_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i842_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or123_i842_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or123_i842_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or123_i842_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or123_i842_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or123_i842_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or123_i842 & 32'h1)),
	.data_out(rnode_168to169_bb0_or123_i842_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or123_i842_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or123_i842_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_or123_i842_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or123_i842_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or123_i842_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or123_i842_stall_in = 1'b0;
assign rnode_168to169_bb0_or123_i842_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i842_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i842_0_NO_SHIFT_REG = rnode_168to169_bb0_or123_i842_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or123_i842_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i842_1_NO_SHIFT_REG = rnode_168to169_bb0_or123_i842_0_reg_169_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_and187_lobit_i873_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and187_lobit_i873_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and187_lobit_i873_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and187_lobit_i873_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and187_lobit_i873_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and187_lobit_i873_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and187_lobit_i873_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and187_lobit_i873_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_and187_lobit_i873_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_and187_lobit_i873_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_and187_lobit_i873_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_and187_lobit_i873_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_and187_lobit_i873_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_and187_lobit_i873 & 32'h1)),
	.data_out(rnode_168to169_bb0_and187_lobit_i873_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_and187_lobit_i873_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_and187_lobit_i873_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_and187_lobit_i873_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_and187_lobit_i873_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_and187_lobit_i873_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and187_lobit_i873_stall_in = 1'b0;
assign rnode_168to169_bb0_and187_lobit_i873_0_NO_SHIFT_REG = rnode_168to169_bb0_and187_lobit_i873_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_and187_lobit_i873_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and187_lobit_i873_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext78_i468_stall_local;
wire [31:0] local_bb0_lnot_ext78_i468;

assign local_bb0_lnot_ext78_i468 = ((local_bb0_conv67_i466 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and1742_i498_stall_local;
wire [15:0] local_bb0_and1742_i498;

assign local_bb0_and1742_i498 = ((local_bb0_max_shift_0_i460 & 16'h1F) & (local_bb0_cond128_i488 & 16'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext78_i112_stall_local;
wire [31:0] local_bb0_lnot_ext78_i112;

assign local_bb0_lnot_ext78_i112 = ((local_bb0_conv67_i110 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and1742_i142_stall_local;
wire [15:0] local_bb0_and1742_i142;

assign local_bb0_and1742_i142 = ((local_bb0_max_shift_0_i104 & 16'h1F) & (local_bb0_cond128_i132 & 16'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext78_i_stall_local;
wire [31:0] local_bb0_lnot_ext78_i;

assign local_bb0_lnot_ext78_i = ((local_bb0_conv67_i & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and1742_i_stall_local;
wire [15:0] local_bb0_and1742_i;

assign local_bb0_and1742_i = ((local_bb0_max_shift_0_i & 16'h1F) & (local_bb0_cond128_i & 16'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_conv186_i871_stall_local;
wire [31:0] local_bb0_conv186_i871;

assign local_bb0_conv186_i871[31:16] = 16'h0;
assign local_bb0_conv186_i871[15:0] = (rnode_168to169_bb0__16_i868_0_NO_SHIFT_REG & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or196_i875_stall_local;
wire [15:0] local_bb0_or196_i875;

assign local_bb0_or196_i875 = ((rnode_168to169_bb0__16_i868_1_NO_SHIFT_REG & 16'h1F) | 16'h7);

// This section implements an unregistered operation.
// 
wire local_bb0_and219_i887_stall_local;
wire [31:0] local_bb0_and219_i887;

assign local_bb0_and219_i887 = (rnode_168to169_bb0__15_i867_0_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_add_i909_stall_local;
wire [31:0] local_bb0_add_i909;

assign local_bb0_add_i909 = ((rnode_168to170_bb0_and26_i817_lobit_0_NO_SHIFT_REG & 32'h1) + (rnode_168to170_bb0__25_i1017_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool124_i843_stall_local;
wire local_bb0_tobool124_i843;

assign local_bb0_tobool124_i843 = ((rnode_168to169_bb0_or123_i842_0_NO_SHIFT_REG & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and203_lobit_i880_stall_local;
wire [31:0] local_bb0_and203_lobit_i880;

assign local_bb0_and203_lobit_i880 = ((rnode_168to169_bb0_or123_i842_1_NO_SHIFT_REG & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and87_i471_stall_local;
wire [31:0] local_bb0_and87_i471;

assign local_bb0_and87_i471 = ((local_bb0_lnot_ext78_i468 & 32'h1) & (local_bb0_lnot_ext86_i470 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and97_i477_stall_local;
wire [31:0] local_bb0_and97_i477;

assign local_bb0_and97_i477 = ((local_bb0_lnot_ext78_i468 & 32'h1) & (local_bb0_lnot_ext100_i476 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and107_i481_stall_local;
wire [31:0] local_bb0_and107_i481;

assign local_bb0_and107_i481 = ((local_bb0_lnot_ext78_i468 & 32'h1) & (local_bb0_lnot_ext110_i480 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and145_i495_stall_local;
wire [31:0] local_bb0_and145_i495;

assign local_bb0_and145_i495 = ((local_bb0_lnot_ext78_i468 & 32'h1) & (local_bb0_and142_i494 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and174_i499_stall_local;
wire [31:0] local_bb0_and174_i499;

assign local_bb0_and174_i499[31:16] = 16'h0;
assign local_bb0_and174_i499[15:0] = (local_bb0_and1742_i498 & 16'h10);

// This section implements an unregistered operation.
// 
wire local_bb0_and87_i115_stall_local;
wire [31:0] local_bb0_and87_i115;

assign local_bb0_and87_i115 = ((local_bb0_lnot_ext78_i112 & 32'h1) & (local_bb0_lnot_ext86_i114 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and97_i121_stall_local;
wire [31:0] local_bb0_and97_i121;

assign local_bb0_and97_i121 = ((local_bb0_lnot_ext78_i112 & 32'h1) & (local_bb0_lnot_ext100_i120 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and107_i125_stall_local;
wire [31:0] local_bb0_and107_i125;

assign local_bb0_and107_i125 = ((local_bb0_lnot_ext78_i112 & 32'h1) & (local_bb0_lnot_ext110_i124 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and145_i139_stall_local;
wire [31:0] local_bb0_and145_i139;

assign local_bb0_and145_i139 = ((local_bb0_lnot_ext78_i112 & 32'h1) & (local_bb0_and142_i138 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and174_i143_stall_local;
wire [31:0] local_bb0_and174_i143;

assign local_bb0_and174_i143[31:16] = 16'h0;
assign local_bb0_and174_i143[15:0] = (local_bb0_and1742_i142 & 16'h10);

// This section implements an unregistered operation.
// 
wire local_bb0_and87_i_stall_local;
wire [31:0] local_bb0_and87_i;

assign local_bb0_and87_i = ((local_bb0_lnot_ext78_i & 32'h1) & (local_bb0_lnot_ext86_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and97_i_stall_local;
wire [31:0] local_bb0_and97_i;

assign local_bb0_and97_i = ((local_bb0_lnot_ext78_i & 32'h1) & (local_bb0_lnot_ext100_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and107_i_stall_local;
wire [31:0] local_bb0_and107_i;

assign local_bb0_and107_i = ((local_bb0_lnot_ext78_i & 32'h1) & (local_bb0_lnot_ext110_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and145_i_stall_local;
wire [31:0] local_bb0_and145_i;

assign local_bb0_and145_i = ((local_bb0_lnot_ext78_i & 32'h1) & (local_bb0_and142_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and174_i_stall_local;
wire [31:0] local_bb0_and174_i;

assign local_bb0_and174_i[31:16] = 16'h0;
assign local_bb0_and174_i[15:0] = (local_bb0_and1742_i & 16'h10);

// This section implements an unregistered operation.
// 
wire local_bb0_and187_i872_stall_local;
wire [31:0] local_bb0_and187_i872;

assign local_bb0_and187_i872 = ((local_bb0_conv186_i871 & 32'h1F) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i846_stall_local;
wire [15:0] local_bb0_cond135_i846;

assign local_bb0_cond135_i846 = (local_bb0_tobool124_i843 ? 16'h4 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or88_i472_stall_local;
wire [31:0] local_bb0_or88_i472;

assign local_bb0_or88_i472 = ((local_bb0_and87_i471 & 32'h1) | (local_bb0_and75_i467 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool146_i496_stall_local;
wire local_bb0_tobool146_i496;

assign local_bb0_tobool146_i496 = ((local_bb0_and145_i495 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and175_i500_stall_local;
wire [31:0] local_bb0_and175_i500;

assign local_bb0_and175_i500 = ((local_bb0_and174_i499 & 32'h10) & 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb0_or88_i116_stall_local;
wire [31:0] local_bb0_or88_i116;

assign local_bb0_or88_i116 = ((local_bb0_and87_i115 & 32'h1) | (local_bb0_and75_i111 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool146_i140_stall_local;
wire local_bb0_tobool146_i140;

assign local_bb0_tobool146_i140 = ((local_bb0_and145_i139 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and175_i144_stall_local;
wire [31:0] local_bb0_and175_i144;

assign local_bb0_and175_i144 = ((local_bb0_and174_i143 & 32'h10) & 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb0_or88_i_stall_local;
wire [31:0] local_bb0_or88_i;

assign local_bb0_or88_i = ((local_bb0_and87_i & 32'h1) | (local_bb0_and75_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool146_i_stall_local;
wire local_bb0_tobool146_i;

assign local_bb0_tobool146_i = ((local_bb0_and145_i & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and175_i_stall_local;
wire [31:0] local_bb0_and175_i;

assign local_bb0_and175_i = ((local_bb0_and174_i & 32'h10) & 32'h10);

// This section implements an unregistered operation.
// 
wire local_bb0_and190_i874_stall_local;
wire [31:0] local_bb0_and190_i874;

assign local_bb0_and190_i874 = ((rnode_168to169_bb0_and187_lobit_i873_0_NO_SHIFT_REG & 32'h1) & (local_bb0_and187_i872 & 32'h1FFF));

// This section implements an unregistered operation.
// 
wire local_bb0_or136_i848_stall_local;
wire [15:0] local_bb0_or136_i848;

assign local_bb0_or136_i848 = ((rnode_168to169_bb0_or132_i847_0_NO_SHIFT_REG & 16'h18) | (local_bb0_cond135_i846 & 16'h4));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool89_i473_stall_local;
wire local_bb0_tobool89_i473;

assign local_bb0_tobool89_i473 = ((local_bb0_or88_i472 & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext96_i474_stall_local;
wire [31:0] local_bb0_lnot_ext96_i474;

assign local_bb0_lnot_ext96_i474 = ((local_bb0_or88_i472 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and111_i482_stall_local;
wire [31:0] local_bb0_and111_i482;

assign local_bb0_and111_i482 = ((local_bb0_and107_i481 & 32'h1) & (local_bb0_or88_i472 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_or179_i503_stall_local;
wire [15:0] local_bb0_max_shift_0_or179_i503;

assign local_bb0_max_shift_0_or179_i503 = (local_bb0_tobool146_i496 ? (local_bb0_max_shift_0_i460 & 16'h1F) : ((local_bb0_or179_i502 & 16'h1F) | 16'hF));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i501_stall_local;
wire [31:0] local_bb0_shl_i501;

assign local_bb0_shl_i501 = ((local_bb0_and171_i497 & 32'h7FFFFFF) << (local_bb0_and175_i500 & 32'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext96_i118_stall_local;
wire [31:0] local_bb0_lnot_ext96_i118;

assign local_bb0_lnot_ext96_i118 = ((local_bb0_or88_i116 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and111_i126_stall_local;
wire [31:0] local_bb0_and111_i126;

assign local_bb0_and111_i126 = ((local_bb0_and107_i125 & 32'h1) & (local_bb0_or88_i116 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_or179_i147_stall_local;
wire [15:0] local_bb0_max_shift_0_or179_i147;

assign local_bb0_max_shift_0_or179_i147 = (local_bb0_tobool146_i140 ? (local_bb0_max_shift_0_i104 & 16'h1F) : ((local_bb0_or179_i146 & 16'h1F) | 16'hF));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i145_stall_local;
wire [31:0] local_bb0_shl_i145;

assign local_bb0_shl_i145 = ((local_bb0_and171_i141 & 32'h7FFFFFF) << (local_bb0_and175_i144 & 32'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext96_i_stall_local;
wire [31:0] local_bb0_lnot_ext96_i;

assign local_bb0_lnot_ext96_i = ((local_bb0_or88_i & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and111_i_stall_local;
wire [31:0] local_bb0_and111_i;

assign local_bb0_and111_i = ((local_bb0_and107_i & 32'h1) & (local_bb0_or88_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_0_or179_i_stall_local;
wire [15:0] local_bb0_max_shift_0_or179_i;

assign local_bb0_max_shift_0_or179_i = (local_bb0_tobool146_i ? (local_bb0_max_shift_0_i & 16'h1F) : ((local_bb0_or179_i & 16'h1F) | 16'hF));

// This section implements an unregistered operation.
// 
wire local_bb0_shl_i10_stall_local;
wire [31:0] local_bb0_shl_i10;

assign local_bb0_shl_i10 = ((local_bb0_and171_i & 32'h7FFFFFF) << (local_bb0_and175_i & 32'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i876_stall_local;
wire local_bb0_tobool191_i876;

assign local_bb0_tobool191_i876 = ((local_bb0_and190_i874 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_cond131_i489_stall_local;
wire [15:0] local_bb0_cond131_i489;

assign local_bb0_cond131_i489 = (local_bb0_tobool89_i473 ? 16'h8 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and101_i478_stall_local;
wire [31:0] local_bb0_and101_i478;

assign local_bb0_and101_i478 = ((local_bb0_and97_i477 & 32'h1) & (local_bb0_lnot_ext96_i474 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and122_i484_stall_local;
wire [31:0] local_bb0_and122_i484;

assign local_bb0_and122_i484 = ((local_bb0_and118_i483 & 32'h1) & (local_bb0_lnot_ext96_i474 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and187_lobit_i517_stall_local;
wire [31:0] local_bb0_and187_lobit_i517;

assign local_bb0_and187_lobit_i517 = ((local_bb0_lnot_ext96_i474 & 32'h1) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0__16_i512_stall_local;
wire [15:0] local_bb0__16_i512;

assign local_bb0__16_i512 = (local_bb0_tobool27_i462 ? (local_bb0_max_shift_0_or179_i503 & 16'h1F) : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__15_i511_stall_local;
wire [31:0] local_bb0__15_i511;

assign local_bb0__15_i511 = (local_bb0_tobool27_i462 ? local_bb0_shl_i501 : (local_bb0_and_i504 & 32'h7FFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and101_i122_stall_local;
wire [31:0] local_bb0_and101_i122;

assign local_bb0_and101_i122 = ((local_bb0_and97_i121 & 32'h1) & (local_bb0_lnot_ext96_i118 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and122_i128_stall_local;
wire [31:0] local_bb0_and122_i128;

assign local_bb0_and122_i128 = ((local_bb0_and118_i127 & 32'h1) & (local_bb0_lnot_ext96_i118 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and187_lobit_i161_stall_local;
wire [31:0] local_bb0_and187_lobit_i161;

assign local_bb0_and187_lobit_i161 = ((local_bb0_lnot_ext96_i118 & 32'h1) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0__16_i156_stall_local;
wire [15:0] local_bb0__16_i156;

assign local_bb0__16_i156 = (local_bb0_tobool27_i106 ? (local_bb0_max_shift_0_or179_i147 & 16'h1F) : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__15_i155_stall_local;
wire [31:0] local_bb0__15_i155;

assign local_bb0__15_i155 = (local_bb0_tobool27_i106 ? local_bb0_shl_i145 : (local_bb0_and_i148 & 32'h7FFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and101_i_stall_local;
wire [31:0] local_bb0_and101_i;

assign local_bb0_and101_i = ((local_bb0_and97_i & 32'h1) & (local_bb0_lnot_ext96_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and122_i_stall_local;
wire [31:0] local_bb0_and122_i;

assign local_bb0_and122_i = ((local_bb0_and118_i & 32'h1) & (local_bb0_lnot_ext96_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and187_lobit_i_stall_local;
wire [31:0] local_bb0_and187_lobit_i;

assign local_bb0_and187_lobit_i = ((local_bb0_lnot_ext96_i & 32'h1) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0__16_i_stall_local;
wire [15:0] local_bb0__16_i;

assign local_bb0__16_i = (local_bb0_tobool27_i ? (local_bb0_max_shift_0_or179_i & 16'h1F) : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__15_i_stall_local;
wire [31:0] local_bb0__15_i;

assign local_bb0__15_i = (local_bb0_tobool27_i ? local_bb0_shl_i10 : (local_bb0_and_i & 32'h7FFFFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_1_or196_i877_stall_local;
wire [15:0] local_bb0_max_shift_1_or196_i877;

assign local_bb0_max_shift_1_or196_i877 = (local_bb0_tobool191_i876 ? (rnode_168to169_bb0__16_i868_2_NO_SHIFT_REG & 16'h1F) : ((local_bb0_or196_i875 & 16'h1F) | 16'h7));

// This section implements an unregistered operation.
// 
wire local_bb0_or132_i491_stall_local;
wire [15:0] local_bb0_or132_i491;

assign local_bb0_or132_i491 = ((local_bb0_cond131_i489 & 16'h8) | (local_bb0_cond128_i488 & 16'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_or112_i485_stall_local;
wire [31:0] local_bb0_or112_i485;

assign local_bb0_or112_i485 = ((local_bb0_and122_i484 & 32'h1) | (local_bb0_and111_i482 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_conv186_i515_stall_local;
wire [31:0] local_bb0_conv186_i515;

assign local_bb0_conv186_i515[31:16] = 16'h0;
assign local_bb0_conv186_i515[15:0] = (local_bb0__16_i512 & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or112_i129_stall_local;
wire [31:0] local_bb0_or112_i129;

assign local_bb0_or112_i129 = ((local_bb0_and122_i128 & 32'h1) | (local_bb0_and111_i126 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_conv186_i159_stall_local;
wire [31:0] local_bb0_conv186_i159;

assign local_bb0_conv186_i159[31:16] = 16'h0;
assign local_bb0_conv186_i159[15:0] = (local_bb0__16_i156 & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_or112_i_stall_local;
wire [31:0] local_bb0_or112_i;

assign local_bb0_or112_i = ((local_bb0_and122_i & 32'h1) | (local_bb0_and111_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_conv186_i_stall_local;
wire [31:0] local_bb0_conv186_i;

assign local_bb0_conv186_i[31:16] = 16'h0;
assign local_bb0_conv186_i[15:0] = (local_bb0__16_i & 16'h1F);

// This section implements an unregistered operation.
// 
wire local_bb0_conv202_i878_stall_local;
wire [31:0] local_bb0_conv202_i878;

assign local_bb0_conv202_i878[31:16] = 16'h0;
assign local_bb0_conv202_i878[15:0] = local_bb0_max_shift_1_or196_i877;

// This section implements an unregistered operation.
// 
wire local_bb0_or212_i883_stall_local;
wire [15:0] local_bb0_or212_i883;

assign local_bb0_or212_i883 = (local_bb0_max_shift_1_or196_i877 | 16'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_or123_i486_stall_local;
wire [31:0] local_bb0_or123_i486;

assign local_bb0_or123_i486 = ((local_bb0_or112_i485 & 32'h1) | (local_bb0_and101_i478 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and187_i516_stall_local;
wire [31:0] local_bb0_and187_i516;

assign local_bb0_and187_i516 = ((local_bb0_conv186_i515 & 32'h1F) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_or123_i130_stall_local;
wire [31:0] local_bb0_or123_i130;

assign local_bb0_or123_i130 = ((local_bb0_or112_i129 & 32'h1) | (local_bb0_and101_i122 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and187_i160_stall_local;
wire [31:0] local_bb0_and187_i160;

assign local_bb0_and187_i160 = ((local_bb0_conv186_i159 & 32'h1F) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_or123_i_stall_local;
wire [31:0] local_bb0_or123_i;

assign local_bb0_or123_i = ((local_bb0_or112_i & 32'h1) | (local_bb0_and101_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and187_i_stall_local;
wire [31:0] local_bb0_and187_i;

assign local_bb0_and187_i = ((local_bb0_conv186_i & 32'h1F) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_and203_i879_stall_local;
wire [31:0] local_bb0_and203_i879;

assign local_bb0_and203_i879 = ((local_bb0_conv202_i878 & 32'hFFFF) >> 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb0__16_i512_valid_out_1;
wire local_bb0__16_i512_stall_in_1;
wire local_bb0__15_i511_valid_out;
wire local_bb0__15_i511_stall_in;
wire local_bb0_and190_i518_valid_out;
wire local_bb0_and190_i518_stall_in;
wire local_bb0_and26_i461_valid_out_1;
wire local_bb0_and26_i461_stall_in_1;
wire local_bb0_or132_i491_valid_out;
wire local_bb0_or132_i491_stall_in;
wire local_bb0_or123_i486_valid_out;
wire local_bb0_or123_i486_stall_in;
wire local_bb0_and190_i518_inputs_ready;
wire local_bb0_and190_i518_stall_local;
wire [31:0] local_bb0_and190_i518;

assign local_bb0_and190_i518_inputs_ready = (rnode_166to168_bb0__25_i661_0_valid_out_0_NO_SHIFT_REG & rnode_166to168_bb0__25_i661_0_valid_out_1_NO_SHIFT_REG & rnode_166to168_bb0__25_i661_0_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_7_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_8_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_0_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_4_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_3_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_5_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_1_NO_SHIFT_REG & local_bb0_conv_i445_valid_out_6_NO_SHIFT_REG);
assign local_bb0_and190_i518 = ((local_bb0_and187_lobit_i517 & 32'h1) & (local_bb0_and187_i516 & 32'h1FFF));
assign local_bb0__16_i512_valid_out_1 = 1'b1;
assign local_bb0__15_i511_valid_out = 1'b1;
assign local_bb0_and190_i518_valid_out = 1'b1;
assign local_bb0_and26_i461_valid_out_1 = 1'b1;
assign local_bb0_or132_i491_valid_out = 1'b1;
assign local_bb0_or123_i486_valid_out = 1'b1;
assign rnode_166to168_bb0__25_i661_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i661_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i661_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign local_bb0_conv_i445_stall_in_7 = 1'b0;
assign local_bb0_conv_i445_stall_in_8 = 1'b0;
assign local_bb0_conv_i445_stall_in_0 = 1'b0;
assign local_bb0_conv_i445_stall_in_4 = 1'b0;
assign local_bb0_conv_i445_stall_in_3 = 1'b0;
assign local_bb0_conv_i445_stall_in_5 = 1'b0;
assign local_bb0_conv_i445_stall_in_2 = 1'b0;
assign local_bb0_conv_i445_stall_in_1 = 1'b0;
assign local_bb0_conv_i445_stall_in_6 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0__16_i156_valid_out_1;
wire local_bb0__16_i156_stall_in_1;
wire local_bb0__15_i155_valid_out;
wire local_bb0__15_i155_stall_in;
wire local_bb0_and190_i162_valid_out;
wire local_bb0_and190_i162_stall_in;
wire local_bb0_add_i197_valid_out;
wire local_bb0_add_i197_stall_in;
wire local_bb0_cond128_i132_valid_out_1;
wire local_bb0_cond128_i132_stall_in_1;
wire local_bb0_or88_i116_valid_out_2;
wire local_bb0_or88_i116_stall_in_2;
wire local_bb0_or123_i130_valid_out;
wire local_bb0_or123_i130_stall_in;
wire local_bb0_and190_i162_inputs_ready;
wire local_bb0_and190_i162_stall_local;
wire [31:0] local_bb0_and190_i162;

assign local_bb0_and190_i162_inputs_ready = (rnode_166to168_bb0__25_i305_0_valid_out_0_NO_SHIFT_REG & rnode_166to168_bb0__25_i305_0_valid_out_1_NO_SHIFT_REG & rnode_166to168_bb0__25_i305_0_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_7_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_8_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_0_NO_SHIFT_REG & rnode_166to168_bb0__25_i305_0_valid_out_3_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_4_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_3_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_5_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_1_NO_SHIFT_REG & local_bb0_conv_i89_valid_out_6_NO_SHIFT_REG);
assign local_bb0_and190_i162 = ((local_bb0_and187_lobit_i161 & 32'h1) & (local_bb0_and187_i160 & 32'h1FFF));
assign local_bb0__16_i156_valid_out_1 = 1'b1;
assign local_bb0__15_i155_valid_out = 1'b1;
assign local_bb0_and190_i162_valid_out = 1'b1;
assign local_bb0_add_i197_valid_out = 1'b1;
assign local_bb0_cond128_i132_valid_out_1 = 1'b1;
assign local_bb0_or88_i116_valid_out_2 = 1'b1;
assign local_bb0_or123_i130_valid_out = 1'b1;
assign rnode_166to168_bb0__25_i305_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i305_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i305_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign local_bb0_conv_i89_stall_in_7 = 1'b0;
assign local_bb0_conv_i89_stall_in_8 = 1'b0;
assign local_bb0_conv_i89_stall_in_0 = 1'b0;
assign rnode_166to168_bb0__25_i305_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign local_bb0_conv_i89_stall_in_4 = 1'b0;
assign local_bb0_conv_i89_stall_in_3 = 1'b0;
assign local_bb0_conv_i89_stall_in_5 = 1'b0;
assign local_bb0_conv_i89_stall_in_2 = 1'b0;
assign local_bb0_conv_i89_stall_in_1 = 1'b0;
assign local_bb0_conv_i89_stall_in_6 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0__16_i_valid_out_1;
wire local_bb0__16_i_stall_in_1;
wire local_bb0__15_i_valid_out;
wire local_bb0__15_i_stall_in;
wire local_bb0_and190_i_valid_out;
wire local_bb0_and190_i_stall_in;
wire local_bb0_and26_i_valid_out_1;
wire local_bb0_and26_i_stall_in_1;
wire local_bb0_cond128_i_valid_out_1;
wire local_bb0_cond128_i_stall_in_1;
wire local_bb0_or88_i_valid_out_2;
wire local_bb0_or88_i_stall_in_2;
wire local_bb0_or123_i_valid_out;
wire local_bb0_or123_i_stall_in;
wire local_bb0_and190_i_inputs_ready;
wire local_bb0_and190_i_stall_local;
wire [31:0] local_bb0_and190_i;

assign local_bb0_and190_i_inputs_ready = (rnode_166to168_bb0__25_i_0_valid_out_0_NO_SHIFT_REG & rnode_166to168_bb0__25_i_0_valid_out_1_NO_SHIFT_REG & rnode_166to168_bb0__25_i_0_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_7_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_8_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_0_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_4_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_3_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_5_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_2_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_1_NO_SHIFT_REG & local_bb0_conv_i4_valid_out_6_NO_SHIFT_REG);
assign local_bb0_and190_i = ((local_bb0_and187_lobit_i & 32'h1) & (local_bb0_and187_i & 32'h1FFF));
assign local_bb0__16_i_valid_out_1 = 1'b1;
assign local_bb0__15_i_valid_out = 1'b1;
assign local_bb0_and190_i_valid_out = 1'b1;
assign local_bb0_and26_i_valid_out_1 = 1'b1;
assign local_bb0_cond128_i_valid_out_1 = 1'b1;
assign local_bb0_or88_i_valid_out_2 = 1'b1;
assign local_bb0_or123_i_valid_out = 1'b1;
assign rnode_166to168_bb0__25_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_166to168_bb0__25_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign local_bb0_conv_i4_stall_in_7 = 1'b0;
assign local_bb0_conv_i4_stall_in_8 = 1'b0;
assign local_bb0_conv_i4_stall_in_0 = 1'b0;
assign local_bb0_conv_i4_stall_in_4 = 1'b0;
assign local_bb0_conv_i4_stall_in_3 = 1'b0;
assign local_bb0_conv_i4_stall_in_5 = 1'b0;
assign local_bb0_conv_i4_stall_in_2 = 1'b0;
assign local_bb0_conv_i4_stall_in_1 = 1'b0;
assign local_bb0_conv_i4_stall_in_6 = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_and206_i881_stall_local;
wire [31:0] local_bb0_and206_i881;

assign local_bb0_and206_i881 = ((local_bb0_and203_lobit_i880 & 32'h1) & (local_bb0_and203_i879 & 32'h3FFF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__16_i512_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i512_0_stall_in_0_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i512_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i512_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i512_0_stall_in_1_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i512_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i512_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i512_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i512_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i512_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i512_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__16_i512_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__16_i512_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__16_i512_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__16_i512_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__16_i512_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0__16_i512 & 16'h1F)),
	.data_out(rnode_168to169_bb0__16_i512_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__16_i512_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__16_i512_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0__16_i512_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__16_i512_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__16_i512_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__16_i512_stall_in_1 = 1'b0;
assign rnode_168to169_bb0__16_i512_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i512_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i512_0_NO_SHIFT_REG = rnode_168to169_bb0__16_i512_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__16_i512_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i512_1_NO_SHIFT_REG = rnode_168to169_bb0__16_i512_0_reg_169_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__15_i511_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i511_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i511_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i511_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i511_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i511_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i511_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i511_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__15_i511_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__15_i511_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__15_i511_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__15_i511_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__15_i511_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in(local_bb0__15_i511),
	.data_out(rnode_168to169_bb0__15_i511_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__15_i511_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__15_i511_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0__15_i511_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__15_i511_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__15_i511_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__15_i511_stall_in = 1'b0;
assign rnode_168to169_bb0__15_i511_0_NO_SHIFT_REG = rnode_168to169_bb0__15_i511_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__15_i511_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i511_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_and190_i518_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i518_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and190_i518_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i518_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and190_i518_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i518_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i518_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i518_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_and190_i518_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_and190_i518_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_and190_i518_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_and190_i518_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_and190_i518_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_and190_i518 & 32'h1)),
	.data_out(rnode_168to169_bb0_and190_i518_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_and190_i518_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_and190_i518_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_and190_i518_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_and190_i518_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_and190_i518_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and190_i518_stall_in = 1'b0;
assign rnode_168to169_bb0_and190_i518_0_NO_SHIFT_REG = rnode_168to169_bb0_and190_i518_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_and190_i518_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and190_i518_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_168to170_bb0_and26_i461_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i461_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_and26_i461_0_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i461_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_and26_i461_0_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i461_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i461_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i461_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_168to170_bb0_and26_i461_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to170_bb0_and26_i461_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to170_bb0_and26_i461_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_168to170_bb0_and26_i461_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_168to170_bb0_and26_i461_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_and26_i461 & 32'h8000000)),
	.data_out(rnode_168to170_bb0_and26_i461_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_168to170_bb0_and26_i461_0_reg_170_fifo.DEPTH = 2;
defparam rnode_168to170_bb0_and26_i461_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_168to170_bb0_and26_i461_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to170_bb0_and26_i461_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_168to170_bb0_and26_i461_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and26_i461_stall_in_1 = 1'b0;
assign rnode_168to170_bb0_and26_i461_0_NO_SHIFT_REG = rnode_168to170_bb0_and26_i461_0_reg_170_NO_SHIFT_REG;
assign rnode_168to170_bb0_and26_i461_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0_and26_i461_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or132_i491_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i491_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_or132_i491_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i491_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_or132_i491_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i491_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i491_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or132_i491_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or132_i491_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or132_i491_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or132_i491_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or132_i491_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or132_i491_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or132_i491 & 16'h18)),
	.data_out(rnode_168to169_bb0_or132_i491_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or132_i491_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or132_i491_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0_or132_i491_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or132_i491_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or132_i491_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or132_i491_stall_in = 1'b0;
assign rnode_168to169_bb0_or132_i491_0_NO_SHIFT_REG = rnode_168to169_bb0_or132_i491_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or132_i491_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or132_i491_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or123_i486_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i486_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i486_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i486_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i486_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i486_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i486_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i486_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i486_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i486_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i486_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or123_i486_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or123_i486_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or123_i486_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or123_i486_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or123_i486_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or123_i486 & 32'h1)),
	.data_out(rnode_168to169_bb0_or123_i486_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or123_i486_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or123_i486_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_or123_i486_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or123_i486_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or123_i486_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or123_i486_stall_in = 1'b0;
assign rnode_168to169_bb0_or123_i486_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i486_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i486_0_NO_SHIFT_REG = rnode_168to169_bb0_or123_i486_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or123_i486_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i486_1_NO_SHIFT_REG = rnode_168to169_bb0_or123_i486_0_reg_169_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__16_i156_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i156_0_stall_in_0_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i156_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i156_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i156_0_stall_in_1_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i156_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i156_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i156_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i156_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i156_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i156_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__16_i156_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__16_i156_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__16_i156_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__16_i156_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__16_i156_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0__16_i156 & 16'h1F)),
	.data_out(rnode_168to169_bb0__16_i156_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__16_i156_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__16_i156_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0__16_i156_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__16_i156_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__16_i156_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__16_i156_stall_in_1 = 1'b0;
assign rnode_168to169_bb0__16_i156_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i156_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i156_0_NO_SHIFT_REG = rnode_168to169_bb0__16_i156_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__16_i156_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i156_1_NO_SHIFT_REG = rnode_168to169_bb0__16_i156_0_reg_169_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__15_i155_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i155_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i155_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i155_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i155_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i155_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i155_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i155_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__15_i155_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__15_i155_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__15_i155_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__15_i155_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__15_i155_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in(local_bb0__15_i155),
	.data_out(rnode_168to169_bb0__15_i155_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__15_i155_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__15_i155_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0__15_i155_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__15_i155_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__15_i155_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__15_i155_stall_in = 1'b0;
assign rnode_168to169_bb0__15_i155_0_NO_SHIFT_REG = rnode_168to169_bb0__15_i155_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__15_i155_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i155_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_and190_i162_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i162_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and190_i162_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i162_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and190_i162_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i162_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i162_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i162_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_and190_i162_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_and190_i162_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_and190_i162_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_and190_i162_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_and190_i162_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_and190_i162 & 32'h1)),
	.data_out(rnode_168to169_bb0_and190_i162_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_and190_i162_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_and190_i162_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_and190_i162_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_and190_i162_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_and190_i162_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and190_i162_stall_in = 1'b0;
assign rnode_168to169_bb0_and190_i162_0_NO_SHIFT_REG = rnode_168to169_bb0_and190_i162_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_and190_i162_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and190_i162_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_168to170_bb0_add_i197_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to170_bb0_add_i197_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_add_i197_0_NO_SHIFT_REG;
 logic rnode_168to170_bb0_add_i197_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_add_i197_0_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_add_i197_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_add_i197_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_add_i197_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_168to170_bb0_add_i197_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to170_bb0_add_i197_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to170_bb0_add_i197_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_168to170_bb0_add_i197_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_168to170_bb0_add_i197_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_add_i197 & 32'h1FF)),
	.data_out(rnode_168to170_bb0_add_i197_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_168to170_bb0_add_i197_0_reg_170_fifo.DEPTH = 2;
defparam rnode_168to170_bb0_add_i197_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_168to170_bb0_add_i197_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to170_bb0_add_i197_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_168to170_bb0_add_i197_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_add_i197_stall_in = 1'b0;
assign rnode_168to170_bb0_add_i197_0_NO_SHIFT_REG = rnode_168to170_bb0_add_i197_0_reg_170_NO_SHIFT_REG;
assign rnode_168to170_bb0_add_i197_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0_add_i197_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_cond128_i132_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i132_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_cond128_i132_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i132_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_cond128_i132_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i132_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i132_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i132_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_cond128_i132_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_cond128_i132_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_cond128_i132_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_cond128_i132_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_cond128_i132_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_cond128_i132 & 16'h10)),
	.data_out(rnode_168to169_bb0_cond128_i132_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_cond128_i132_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_cond128_i132_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0_cond128_i132_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_cond128_i132_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_cond128_i132_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_cond128_i132_stall_in_1 = 1'b0;
assign rnode_168to169_bb0_cond128_i132_0_NO_SHIFT_REG = rnode_168to169_bb0_cond128_i132_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_cond128_i132_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_cond128_i132_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or88_i116_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i116_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or88_i116_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i116_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or88_i116_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i116_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i116_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i116_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or88_i116_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or88_i116_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or88_i116_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or88_i116_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or88_i116_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or88_i116 & 32'h1)),
	.data_out(rnode_168to169_bb0_or88_i116_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or88_i116_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or88_i116_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_or88_i116_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or88_i116_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or88_i116_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or88_i116_stall_in_2 = 1'b0;
assign rnode_168to169_bb0_or88_i116_0_NO_SHIFT_REG = rnode_168to169_bb0_or88_i116_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or88_i116_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or88_i116_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or123_i130_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i130_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i130_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i130_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i130_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i130_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i130_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i130_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i130_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i130_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i130_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or123_i130_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or123_i130_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or123_i130_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or123_i130_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or123_i130_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or123_i130 & 32'h1)),
	.data_out(rnode_168to169_bb0_or123_i130_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or123_i130_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or123_i130_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_or123_i130_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or123_i130_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or123_i130_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or123_i130_stall_in = 1'b0;
assign rnode_168to169_bb0_or123_i130_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i130_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i130_0_NO_SHIFT_REG = rnode_168to169_bb0_or123_i130_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or123_i130_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i130_1_NO_SHIFT_REG = rnode_168to169_bb0_or123_i130_0_reg_169_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__16_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i_0_stall_in_0_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i_0_stall_in_1_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0__16_i_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__16_i_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__16_i_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__16_i_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__16_i_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__16_i_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__16_i_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0__16_i & 16'h1F)),
	.data_out(rnode_168to169_bb0__16_i_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__16_i_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__16_i_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0__16_i_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__16_i_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__16_i_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__16_i_stall_in_1 = 1'b0;
assign rnode_168to169_bb0__16_i_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i_0_NO_SHIFT_REG = rnode_168to169_bb0__16_i_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__16_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0__16_i_1_NO_SHIFT_REG = rnode_168to169_bb0__16_i_0_reg_169_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0__15_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0__15_i_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0__15_i_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0__15_i_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0__15_i_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0__15_i_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0__15_i_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0__15_i_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in(local_bb0__15_i),
	.data_out(rnode_168to169_bb0__15_i_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0__15_i_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0__15_i_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0__15_i_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0__15_i_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0__15_i_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0__15_i_stall_in = 1'b0;
assign rnode_168to169_bb0__15_i_0_NO_SHIFT_REG = rnode_168to169_bb0__15_i_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0__15_i_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_and190_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and190_i_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_and190_i_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_and190_i_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_and190_i_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_and190_i_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_and190_i_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_and190_i_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_and190_i_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_and190_i & 32'h1)),
	.data_out(rnode_168to169_bb0_and190_i_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_and190_i_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_and190_i_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_and190_i_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_and190_i_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_and190_i_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and190_i_stall_in = 1'b0;
assign rnode_168to169_bb0_and190_i_0_NO_SHIFT_REG = rnode_168to169_bb0_and190_i_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_and190_i_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and190_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_168to170_bb0_and26_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_and26_i_0_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to170_bb0_and26_i_0_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_168to170_bb0_and26_i_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_168to170_bb0_and26_i_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to170_bb0_and26_i_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to170_bb0_and26_i_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_168to170_bb0_and26_i_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_168to170_bb0_and26_i_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_and26_i & 32'h8000000)),
	.data_out(rnode_168to170_bb0_and26_i_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_168to170_bb0_and26_i_0_reg_170_fifo.DEPTH = 2;
defparam rnode_168to170_bb0_and26_i_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_168to170_bb0_and26_i_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to170_bb0_and26_i_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_168to170_bb0_and26_i_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_and26_i_stall_in_1 = 1'b0;
assign rnode_168to170_bb0_and26_i_0_NO_SHIFT_REG = rnode_168to170_bb0_and26_i_0_reg_170_NO_SHIFT_REG;
assign rnode_168to170_bb0_and26_i_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0_and26_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_cond128_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_cond128_i_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_168to169_bb0_cond128_i_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_cond128_i_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_cond128_i_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_cond128_i_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_cond128_i_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_cond128_i_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_cond128_i_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_cond128_i & 16'h10)),
	.data_out(rnode_168to169_bb0_cond128_i_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_cond128_i_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_cond128_i_0_reg_169_fifo.DATA_WIDTH = 16;
defparam rnode_168to169_bb0_cond128_i_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_cond128_i_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_cond128_i_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_cond128_i_stall_in_1 = 1'b0;
assign rnode_168to169_bb0_cond128_i_0_NO_SHIFT_REG = rnode_168to169_bb0_cond128_i_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_cond128_i_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_cond128_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or88_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or88_i_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or88_i_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i_0_valid_out_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i_0_stall_in_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or88_i_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or88_i_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or88_i_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or88_i_0_stall_in_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or88_i_0_valid_out_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or88_i_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or88_i & 32'h1)),
	.data_out(rnode_168to169_bb0_or88_i_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or88_i_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or88_i_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_or88_i_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or88_i_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or88_i_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or88_i_stall_in_2 = 1'b0;
assign rnode_168to169_bb0_or88_i_0_NO_SHIFT_REG = rnode_168to169_bb0_or88_i_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or88_i_0_stall_in_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or88_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_168to169_bb0_or123_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i_0_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i_1_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i_0_reg_169_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_168to169_bb0_or123_i_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i_0_valid_out_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i_0_stall_in_0_reg_169_NO_SHIFT_REG;
 logic rnode_168to169_bb0_or123_i_0_stall_out_reg_169_NO_SHIFT_REG;

acl_data_fifo rnode_168to169_bb0_or123_i_0_reg_169_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_168to169_bb0_or123_i_0_reg_169_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_168to169_bb0_or123_i_0_stall_in_0_reg_169_NO_SHIFT_REG),
	.valid_out(rnode_168to169_bb0_or123_i_0_valid_out_0_reg_169_NO_SHIFT_REG),
	.stall_out(rnode_168to169_bb0_or123_i_0_stall_out_reg_169_NO_SHIFT_REG),
	.data_in((local_bb0_or123_i & 32'h1)),
	.data_out(rnode_168to169_bb0_or123_i_0_reg_169_NO_SHIFT_REG)
);

defparam rnode_168to169_bb0_or123_i_0_reg_169_fifo.DEPTH = 1;
defparam rnode_168to169_bb0_or123_i_0_reg_169_fifo.DATA_WIDTH = 32;
defparam rnode_168to169_bb0_or123_i_0_reg_169_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_168to169_bb0_or123_i_0_reg_169_fifo.IMPL = "shift_reg";

assign rnode_168to169_bb0_or123_i_0_reg_169_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_or123_i_stall_in = 1'b0;
assign rnode_168to169_bb0_or123_i_0_stall_in_0_reg_169_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i_0_NO_SHIFT_REG = rnode_168to169_bb0_or123_i_0_reg_169_NO_SHIFT_REG;
assign rnode_168to169_bb0_or123_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_168to169_bb0_or123_i_1_NO_SHIFT_REG = rnode_168to169_bb0_or123_i_0_reg_169_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_tobool207_i882_stall_local;
wire local_bb0_tobool207_i882;

assign local_bb0_tobool207_i882 = ((local_bb0_and206_i881 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_or196_i519_stall_local;
wire [15:0] local_bb0_or196_i519;

assign local_bb0_or196_i519 = ((rnode_168to169_bb0__16_i512_0_NO_SHIFT_REG & 16'h1F) | 16'h7);

// This section implements an unregistered operation.
// 
wire local_bb0_and219_i531_stall_local;
wire [31:0] local_bb0_and219_i531;

assign local_bb0_and219_i531 = (rnode_168to169_bb0__15_i511_0_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i520_stall_local;
wire local_bb0_tobool191_i520;

assign local_bb0_tobool191_i520 = ((rnode_168to169_bb0_and190_i518_0_NO_SHIFT_REG & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i461_lobit_stall_local;
wire [31:0] local_bb0_and26_i461_lobit;

assign local_bb0_and26_i461_lobit = ((rnode_168to170_bb0_and26_i461_0_NO_SHIFT_REG & 32'h8000000) >> 32'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool124_i487_stall_local;
wire local_bb0_tobool124_i487;

assign local_bb0_tobool124_i487 = ((rnode_168to169_bb0_or123_i486_0_NO_SHIFT_REG & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and203_lobit_i524_stall_local;
wire [31:0] local_bb0_and203_lobit_i524;

assign local_bb0_and203_lobit_i524 = ((rnode_168to169_bb0_or123_i486_1_NO_SHIFT_REG & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_or196_i163_stall_local;
wire [15:0] local_bb0_or196_i163;

assign local_bb0_or196_i163 = ((rnode_168to169_bb0__16_i156_0_NO_SHIFT_REG & 16'h1F) | 16'h7);

// This section implements an unregistered operation.
// 
wire local_bb0_and219_i175_stall_local;
wire [31:0] local_bb0_and219_i175;

assign local_bb0_and219_i175 = (rnode_168to169_bb0__15_i155_0_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i164_stall_local;
wire local_bb0_tobool191_i164;

assign local_bb0_tobool191_i164 = ((rnode_168to169_bb0_and190_i162_0_NO_SHIFT_REG & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool89_i117_stall_local;
wire local_bb0_tobool89_i117;

assign local_bb0_tobool89_i117 = ((rnode_168to169_bb0_or88_i116_0_NO_SHIFT_REG & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool124_i131_stall_local;
wire local_bb0_tobool124_i131;

assign local_bb0_tobool124_i131 = ((rnode_168to169_bb0_or123_i130_0_NO_SHIFT_REG & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and203_lobit_i168_stall_local;
wire [31:0] local_bb0_and203_lobit_i168;

assign local_bb0_and203_lobit_i168 = ((rnode_168to169_bb0_or123_i130_1_NO_SHIFT_REG & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_or196_i_stall_local;
wire [15:0] local_bb0_or196_i;

assign local_bb0_or196_i = ((rnode_168to169_bb0__16_i_0_NO_SHIFT_REG & 16'h1F) | 16'h7);

// This section implements an unregistered operation.
// 
wire local_bb0_and219_i_stall_local;
wire [31:0] local_bb0_and219_i;

assign local_bb0_and219_i = (rnode_168to169_bb0__15_i_0_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool191_i_stall_local;
wire local_bb0_tobool191_i;

assign local_bb0_tobool191_i = ((rnode_168to169_bb0_and190_i_0_NO_SHIFT_REG & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and26_i_lobit_stall_local;
wire [31:0] local_bb0_and26_i_lobit;

assign local_bb0_and26_i_lobit = ((rnode_168to170_bb0_and26_i_0_NO_SHIFT_REG & 32'h8000000) >> 32'h1B);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool89_i_stall_local;
wire local_bb0_tobool89_i;

assign local_bb0_tobool89_i = ((rnode_168to169_bb0_or88_i_0_NO_SHIFT_REG & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool124_i_stall_local;
wire local_bb0_tobool124_i;

assign local_bb0_tobool124_i = ((rnode_168to169_bb0_or123_i_0_NO_SHIFT_REG & 32'h1) != 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and203_lobit_i_stall_local;
wire [31:0] local_bb0_and203_lobit_i;

assign local_bb0_and203_lobit_i = ((rnode_168to169_bb0_or123_i_1_NO_SHIFT_REG & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i884_stall_local;
wire [15:0] local_bb0_max_shift_3_i884;

assign local_bb0_max_shift_3_i884 = (local_bb0_tobool207_i882 ? local_bb0_max_shift_1_or196_i877 : (local_bb0_or212_i883 | 16'h3));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_1_or196_i521_stall_local;
wire [15:0] local_bb0_max_shift_1_or196_i521;

assign local_bb0_max_shift_1_or196_i521 = (local_bb0_tobool191_i520 ? (rnode_168to169_bb0__16_i512_1_NO_SHIFT_REG & 16'h1F) : ((local_bb0_or196_i519 & 16'h1F) | 16'h7));

// This section implements an unregistered operation.
// 
wire local_bb0_add_i553_stall_local;
wire [31:0] local_bb0_add_i553;

assign local_bb0_add_i553 = ((local_bb0_and26_i461_lobit & 32'h1) + (rnode_168to170_bb0__25_i661_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i490_stall_local;
wire [15:0] local_bb0_cond135_i490;

assign local_bb0_cond135_i490 = (local_bb0_tobool124_i487 ? 16'h4 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_1_or196_i165_stall_local;
wire [15:0] local_bb0_max_shift_1_or196_i165;

assign local_bb0_max_shift_1_or196_i165 = (local_bb0_tobool191_i164 ? (rnode_168to169_bb0__16_i156_1_NO_SHIFT_REG & 16'h1F) : ((local_bb0_or196_i163 & 16'h1F) | 16'h7));

// This section implements an unregistered operation.
// 
wire local_bb0_cond131_i133_stall_local;
wire [15:0] local_bb0_cond131_i133;

assign local_bb0_cond131_i133 = (local_bb0_tobool89_i117 ? 16'h8 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i134_stall_local;
wire [15:0] local_bb0_cond135_i134;

assign local_bb0_cond135_i134 = (local_bb0_tobool124_i131 ? 16'h4 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_1_or196_i_stall_local;
wire [15:0] local_bb0_max_shift_1_or196_i;

assign local_bb0_max_shift_1_or196_i = (local_bb0_tobool191_i ? (rnode_168to169_bb0__16_i_1_NO_SHIFT_REG & 16'h1F) : ((local_bb0_or196_i & 16'h1F) | 16'h7));

// This section implements an unregistered operation.
// 
wire local_bb0_add_i_stall_local;
wire [31:0] local_bb0_add_i;

assign local_bb0_add_i = ((local_bb0_and26_i_lobit & 32'h1) + (rnode_168to170_bb0__25_i_0_NO_SHIFT_REG & 32'hFF));

// This section implements an unregistered operation.
// 
wire local_bb0_cond131_i_stall_local;
wire [15:0] local_bb0_cond131_i;

assign local_bb0_cond131_i = (local_bb0_tobool89_i ? 16'h8 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_cond135_i_stall_local;
wire [15:0] local_bb0_cond135_i;

assign local_bb0_cond135_i = (local_bb0_tobool124_i ? 16'h4 : 16'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and2173_i886_stall_local;
wire [15:0] local_bb0_and2173_i886;

assign local_bb0_and2173_i886 = (local_bb0_max_shift_3_i884 & (local_bb0_or136_i848 & 16'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_conv202_i522_stall_local;
wire [31:0] local_bb0_conv202_i522;

assign local_bb0_conv202_i522[31:16] = 16'h0;
assign local_bb0_conv202_i522[15:0] = local_bb0_max_shift_1_or196_i521;

// This section implements an unregistered operation.
// 
wire local_bb0_or212_i527_stall_local;
wire [15:0] local_bb0_or212_i527;

assign local_bb0_or212_i527 = (local_bb0_max_shift_1_or196_i521 | 16'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_or136_i492_stall_local;
wire [15:0] local_bb0_or136_i492;

assign local_bb0_or136_i492 = ((rnode_168to169_bb0_or132_i491_0_NO_SHIFT_REG & 16'h18) | (local_bb0_cond135_i490 & 16'h4));

// This section implements an unregistered operation.
// 
wire local_bb0_conv202_i166_stall_local;
wire [31:0] local_bb0_conv202_i166;

assign local_bb0_conv202_i166[31:16] = 16'h0;
assign local_bb0_conv202_i166[15:0] = local_bb0_max_shift_1_or196_i165;

// This section implements an unregistered operation.
// 
wire local_bb0_or212_i171_stall_local;
wire [15:0] local_bb0_or212_i171;

assign local_bb0_or212_i171 = (local_bb0_max_shift_1_or196_i165 | 16'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_or132_i135_stall_local;
wire [15:0] local_bb0_or132_i135;

assign local_bb0_or132_i135 = ((local_bb0_cond131_i133 & 16'h8) | (rnode_168to169_bb0_cond128_i132_0_NO_SHIFT_REG & 16'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_conv202_i_stall_local;
wire [31:0] local_bb0_conv202_i;

assign local_bb0_conv202_i[31:16] = 16'h0;
assign local_bb0_conv202_i[15:0] = local_bb0_max_shift_1_or196_i;

// This section implements an unregistered operation.
// 
wire local_bb0_or212_i_stall_local;
wire [15:0] local_bb0_or212_i;

assign local_bb0_or212_i = (local_bb0_max_shift_1_or196_i | 16'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_or132_i_stall_local;
wire [15:0] local_bb0_or132_i;

assign local_bb0_or132_i = ((local_bb0_cond131_i & 16'h8) | (rnode_168to169_bb0_cond128_i_0_NO_SHIFT_REG & 16'h10));

// This section implements an unregistered operation.
// 
wire local_bb0_conv220_i888_stall_local;
wire [31:0] local_bb0_conv220_i888;

assign local_bb0_conv220_i888[31:16] = 16'h0;
assign local_bb0_conv220_i888[15:0] = (local_bb0_and2173_i886 & 16'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_and203_i523_stall_local;
wire [31:0] local_bb0_and203_i523;

assign local_bb0_and203_i523 = ((local_bb0_conv202_i522 & 32'hFFFF) >> 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb0_and203_i167_stall_local;
wire [31:0] local_bb0_and203_i167;

assign local_bb0_and203_i167 = ((local_bb0_conv202_i166 & 32'hFFFF) >> 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb0_or136_i136_stall_local;
wire [15:0] local_bb0_or136_i136;

assign local_bb0_or136_i136 = ((local_bb0_or132_i135 & 16'h18) | (local_bb0_cond135_i134 & 16'h4));

// This section implements an unregistered operation.
// 
wire local_bb0_and203_i_stall_local;
wire [31:0] local_bb0_and203_i;

assign local_bb0_and203_i = ((local_bb0_conv202_i & 32'hFFFF) >> 32'h2);

// This section implements an unregistered operation.
// 
wire local_bb0_or136_i_stall_local;
wire [15:0] local_bb0_or136_i;

assign local_bb0_or136_i = ((local_bb0_or132_i & 16'h18) | (local_bb0_cond135_i & 16'h4));

// This section implements an unregistered operation.
// 
wire local_bb0_and221_i889_stall_local;
wire [31:0] local_bb0_and221_i889;

assign local_bb0_and221_i889 = ((local_bb0_conv220_i888 & 32'h1C) & 32'hC);

// This section implements an unregistered operation.
// 
wire local_bb0_and206_i525_stall_local;
wire [31:0] local_bb0_and206_i525;

assign local_bb0_and206_i525 = ((local_bb0_and203_lobit_i524 & 32'h1) & (local_bb0_and203_i523 & 32'h3FFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and206_i169_stall_local;
wire [31:0] local_bb0_and206_i169;

assign local_bb0_and206_i169 = ((local_bb0_and203_lobit_i168 & 32'h1) & (local_bb0_and203_i167 & 32'h3FFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and206_i_stall_local;
wire [31:0] local_bb0_and206_i;

assign local_bb0_and206_i = ((local_bb0_and203_lobit_i & 32'h1) & (local_bb0_and203_i & 32'h3FFF));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i884_valid_out_1;
wire local_bb0_max_shift_3_i884_stall_in_1;
wire local_bb0_conv220_i888_valid_out_1;
wire local_bb0_conv220_i888_stall_in_1;
wire local_bb0_shl222_i890_valid_out;
wire local_bb0_shl222_i890_stall_in;
wire local_bb0_shl222_i890_inputs_ready;
wire local_bb0_shl222_i890_stall_local;
wire [31:0] local_bb0_shl222_i890;

assign local_bb0_shl222_i890_inputs_ready = (rnode_168to169_bb0__16_i868_0_valid_out_0_NO_SHIFT_REG & rnode_168to169_bb0_and187_lobit_i873_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0__16_i868_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0__16_i868_0_valid_out_2_NO_SHIFT_REG & rnode_168to169_bb0__15_i867_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or132_i847_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or123_i842_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0_or123_i842_0_valid_out_0_NO_SHIFT_REG);
assign local_bb0_shl222_i890 = ((local_bb0_and219_i887 & 32'h7FFFFFF) << (local_bb0_and221_i889 & 32'hC));
assign local_bb0_max_shift_3_i884_valid_out_1 = 1'b1;
assign local_bb0_conv220_i888_valid_out_1 = 1'b1;
assign local_bb0_shl222_i890_valid_out = 1'b1;
assign rnode_168to169_bb0__16_i868_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and187_lobit_i873_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i868_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i868_0_stall_in_2_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i867_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or132_i847_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i842_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i842_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_tobool207_i526_stall_local;
wire local_bb0_tobool207_i526;

assign local_bb0_tobool207_i526 = ((local_bb0_and206_i525 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool207_i170_stall_local;
wire local_bb0_tobool207_i170;

assign local_bb0_tobool207_i170 = ((local_bb0_and206_i169 & 32'h1) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool207_i_stall_local;
wire local_bb0_tobool207_i;

assign local_bb0_tobool207_i = ((local_bb0_and206_i & 32'h1) == 32'h0);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_max_shift_3_i884_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i884_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i884_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i884_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i884_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i884_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i884_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i884_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_max_shift_3_i884_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_max_shift_3_i884_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_max_shift_3_i884_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_max_shift_3_i884_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_max_shift_3_i884_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_max_shift_3_i884),
	.data_out(rnode_169to170_bb0_max_shift_3_i884_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_max_shift_3_i884_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_max_shift_3_i884_0_reg_170_fifo.DATA_WIDTH = 16;
defparam rnode_169to170_bb0_max_shift_3_i884_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_max_shift_3_i884_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_max_shift_3_i884_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_max_shift_3_i884_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i884_0_NO_SHIFT_REG = rnode_169to170_bb0_max_shift_3_i884_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_max_shift_3_i884_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i884_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_conv220_i888_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i888_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i888_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i888_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i888_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i888_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i888_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i888_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_conv220_i888_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_conv220_i888_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_conv220_i888_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_conv220_i888_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_conv220_i888_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_conv220_i888 & 32'h1C)),
	.data_out(rnode_169to170_bb0_conv220_i888_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_conv220_i888_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_conv220_i888_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_conv220_i888_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_conv220_i888_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_conv220_i888_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv220_i888_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_conv220_i888_0_NO_SHIFT_REG = rnode_169to170_bb0_conv220_i888_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_conv220_i888_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i888_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_shl222_i890_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i890_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i890_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i890_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i890_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i890_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_valid_out_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_stall_in_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i890_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_shl222_i890_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_shl222_i890_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_shl222_i890_0_stall_in_0_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_shl222_i890_0_valid_out_0_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_shl222_i890_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_shl222_i890),
	.data_out(rnode_169to170_bb0_shl222_i890_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_shl222_i890_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_shl222_i890_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_shl222_i890_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_shl222_i890_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_shl222_i890_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl222_i890_stall_in = 1'b0;
assign rnode_169to170_bb0_shl222_i890_0_stall_in_0_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i890_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i890_0_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i890_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i890_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i890_1_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i890_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i890_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i890_2_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i890_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i890_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i890_3_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i890_0_reg_170_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i528_stall_local;
wire [15:0] local_bb0_max_shift_3_i528;

assign local_bb0_max_shift_3_i528 = (local_bb0_tobool207_i526 ? local_bb0_max_shift_1_or196_i521 : (local_bb0_or212_i527 | 16'h3));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i172_stall_local;
wire [15:0] local_bb0_max_shift_3_i172;

assign local_bb0_max_shift_3_i172 = (local_bb0_tobool207_i170 ? local_bb0_max_shift_1_or196_i165 : (local_bb0_or212_i171 | 16'h3));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i_stall_local;
wire [15:0] local_bb0_max_shift_3_i;

assign local_bb0_max_shift_3_i = (local_bb0_tobool207_i ? local_bb0_max_shift_1_or196_i : (local_bb0_or212_i | 16'h3));

// This section implements an unregistered operation.
// 
wire local_bb0_conv216_i885_stall_local;
wire [31:0] local_bb0_conv216_i885;

assign local_bb0_conv216_i885[31:16] = 16'h0;
assign local_bb0_conv216_i885[15:0] = rnode_169to170_bb0_max_shift_3_i884_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and224_i891_stall_local;
wire [31:0] local_bb0_and224_i891;

assign local_bb0_and224_i891 = (rnode_169to170_bb0_shl222_i890_0_NO_SHIFT_REG >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_i893_stall_local;
wire [31:0] local_bb0_and228_i893;

assign local_bb0_and228_i893 = (rnode_169to170_bb0_shl222_i890_1_NO_SHIFT_REG >> 32'h19);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_i899_stall_local;
wire [31:0] local_bb0_and232_i899;

assign local_bb0_and232_i899 = (rnode_169to170_bb0_shl222_i890_2_NO_SHIFT_REG >> 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb0_and269_i906_stall_local;
wire [31:0] local_bb0_and269_i906;

assign local_bb0_and269_i906 = (rnode_169to170_bb0_shl222_i890_3_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and2173_i530_stall_local;
wire [15:0] local_bb0_and2173_i530;

assign local_bb0_and2173_i530 = (local_bb0_max_shift_3_i528 & (local_bb0_or136_i492 & 16'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_and2173_i174_stall_local;
wire [15:0] local_bb0_and2173_i174;

assign local_bb0_and2173_i174 = (local_bb0_max_shift_3_i172 & (local_bb0_or136_i136 & 16'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_and2173_i_stall_local;
wire [15:0] local_bb0_and2173_i;

assign local_bb0_and2173_i = (local_bb0_max_shift_3_i & (local_bb0_or136_i & 16'h1C));

// This section implements an unregistered operation.
// 
wire local_bb0_and224_lobit_i892_stall_local;
wire [31:0] local_bb0_and224_lobit_i892;

assign local_bb0_and224_lobit_i892 = ((local_bb0_and224_i891 & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_lobit_i894_stall_local;
wire [31:0] local_bb0_and228_lobit_i894;

assign local_bb0_and228_lobit_i894 = ((local_bb0_and228_i893 & 32'h7F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_lobit_i900_stall_local;
wire [31:0] local_bb0_and232_lobit_i900;

assign local_bb0_and232_lobit_i900 = ((local_bb0_and232_i899 & 32'hFF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_conv220_i532_stall_local;
wire [31:0] local_bb0_conv220_i532;

assign local_bb0_conv220_i532[31:16] = 16'h0;
assign local_bb0_conv220_i532[15:0] = (local_bb0_and2173_i530 & 16'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_conv220_i176_stall_local;
wire [31:0] local_bb0_conv220_i176;

assign local_bb0_conv220_i176[31:16] = 16'h0;
assign local_bb0_conv220_i176[15:0] = (local_bb0_and2173_i174 & 16'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_conv220_i_stall_local;
wire [31:0] local_bb0_conv220_i;

assign local_bb0_conv220_i[31:16] = 16'h0;
assign local_bb0_conv220_i[15:0] = (local_bb0_and2173_i & 16'h1C);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u55_stall_local;
wire [31:0] local_bb0_var__u55;

assign local_bb0_var__u55 = ((local_bb0_and224_lobit_i892 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext241_i895_stall_local;
wire [31:0] local_bb0_lnot_ext241_i895;

assign local_bb0_lnot_ext241_i895 = ((local_bb0_and228_lobit_i894 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u56_stall_local;
wire [31:0] local_bb0_var__u56;

assign local_bb0_var__u56 = ((local_bb0_and232_lobit_i900 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and221_i533_stall_local;
wire [31:0] local_bb0_and221_i533;

assign local_bb0_and221_i533 = ((local_bb0_conv220_i532 & 32'h1C) & 32'hC);

// This section implements an unregistered operation.
// 
wire local_bb0_and221_i177_stall_local;
wire [31:0] local_bb0_and221_i177;

assign local_bb0_and221_i177 = ((local_bb0_conv220_i176 & 32'h1C) & 32'hC);

// This section implements an unregistered operation.
// 
wire local_bb0_and221_i_stall_local;
wire [31:0] local_bb0_and221_i;

assign local_bb0_and221_i = ((local_bb0_conv220_i & 32'h1C) & 32'hC);

// This section implements an unregistered operation.
// 
wire local_bb0_and250_i898_stall_local;
wire [31:0] local_bb0_and250_i898;

assign local_bb0_and250_i898 = ((local_bb0_var__u55 & 32'h1) & (local_bb0_and228_i893 & 32'h7F));

// This section implements an unregistered operation.
// 
wire local_bb0_and242_i896_stall_local;
wire [31:0] local_bb0_and242_i896;

assign local_bb0_and242_i896 = ((local_bb0_var__u55 & 32'h1) & (local_bb0_lnot_ext241_i895 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i528_valid_out_1;
wire local_bb0_max_shift_3_i528_stall_in_1;
wire local_bb0_conv220_i532_valid_out_1;
wire local_bb0_conv220_i532_stall_in_1;
wire local_bb0_shl222_i534_valid_out;
wire local_bb0_shl222_i534_stall_in;
wire local_bb0_shl222_i534_inputs_ready;
wire local_bb0_shl222_i534_stall_local;
wire [31:0] local_bb0_shl222_i534;

assign local_bb0_shl222_i534_inputs_ready = (rnode_168to169_bb0__16_i512_0_valid_out_0_NO_SHIFT_REG & rnode_168to169_bb0__16_i512_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0_and190_i518_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0__15_i511_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or132_i491_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or123_i486_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0_or123_i486_0_valid_out_0_NO_SHIFT_REG);
assign local_bb0_shl222_i534 = ((local_bb0_and219_i531 & 32'h7FFFFFF) << (local_bb0_and221_i533 & 32'hC));
assign local_bb0_max_shift_3_i528_valid_out_1 = 1'b1;
assign local_bb0_conv220_i532_valid_out_1 = 1'b1;
assign local_bb0_shl222_i534_valid_out = 1'b1;
assign rnode_168to169_bb0__16_i512_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i512_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and190_i518_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i511_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or132_i491_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i486_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i486_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i172_valid_out_1;
wire local_bb0_max_shift_3_i172_stall_in_1;
wire local_bb0_conv220_i176_valid_out_1;
wire local_bb0_conv220_i176_stall_in_1;
wire local_bb0_shl222_i178_valid_out;
wire local_bb0_shl222_i178_stall_in;
wire local_bb0_shl222_i178_inputs_ready;
wire local_bb0_shl222_i178_stall_local;
wire [31:0] local_bb0_shl222_i178;

assign local_bb0_shl222_i178_inputs_ready = (rnode_168to169_bb0__16_i156_0_valid_out_0_NO_SHIFT_REG & rnode_168to169_bb0__16_i156_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0_and190_i162_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0__15_i155_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_cond128_i132_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or88_i116_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or123_i130_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0_or123_i130_0_valid_out_0_NO_SHIFT_REG);
assign local_bb0_shl222_i178 = ((local_bb0_and219_i175 & 32'h7FFFFFF) << (local_bb0_and221_i177 & 32'hC));
assign local_bb0_max_shift_3_i172_valid_out_1 = 1'b1;
assign local_bb0_conv220_i176_valid_out_1 = 1'b1;
assign local_bb0_shl222_i178_valid_out = 1'b1;
assign rnode_168to169_bb0__16_i156_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i156_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and190_i162_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i155_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_cond128_i132_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or88_i116_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i130_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i130_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_max_shift_3_i_valid_out_1;
wire local_bb0_max_shift_3_i_stall_in_1;
wire local_bb0_conv220_i_valid_out_1;
wire local_bb0_conv220_i_stall_in_1;
wire local_bb0_shl222_i_valid_out;
wire local_bb0_shl222_i_stall_in;
wire local_bb0_shl222_i_inputs_ready;
wire local_bb0_shl222_i_stall_local;
wire [31:0] local_bb0_shl222_i;

assign local_bb0_shl222_i_inputs_ready = (rnode_168to169_bb0__16_i_0_valid_out_0_NO_SHIFT_REG & rnode_168to169_bb0__16_i_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0_and190_i_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0__15_i_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_cond128_i_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or88_i_0_valid_out_NO_SHIFT_REG & rnode_168to169_bb0_or123_i_0_valid_out_1_NO_SHIFT_REG & rnode_168to169_bb0_or123_i_0_valid_out_0_NO_SHIFT_REG);
assign local_bb0_shl222_i = ((local_bb0_and219_i & 32'h7FFFFFF) << (local_bb0_and221_i & 32'hC));
assign local_bb0_max_shift_3_i_valid_out_1 = 1'b1;
assign local_bb0_conv220_i_valid_out_1 = 1'b1;
assign local_bb0_shl222_i_valid_out = 1'b1;
assign rnode_168to169_bb0__16_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__16_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_and190_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0__15_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_cond128_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or88_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_168to169_bb0_or123_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_shl243_i897_stall_local;
wire [31:0] local_bb0_shl243_i897;

assign local_bb0_shl243_i897 = ((local_bb0_and242_i896 & 32'h1) << 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and261_i901_stall_local;
wire [31:0] local_bb0_and261_i901;

assign local_bb0_and261_i901 = ((local_bb0_and242_i896 & 32'h1) & (local_bb0_var__u56 & 32'h1));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_max_shift_3_i528_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i528_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i528_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i528_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i528_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i528_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i528_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i528_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_max_shift_3_i528_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_max_shift_3_i528_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_max_shift_3_i528_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_max_shift_3_i528_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_max_shift_3_i528_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_max_shift_3_i528),
	.data_out(rnode_169to170_bb0_max_shift_3_i528_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_max_shift_3_i528_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_max_shift_3_i528_0_reg_170_fifo.DATA_WIDTH = 16;
defparam rnode_169to170_bb0_max_shift_3_i528_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_max_shift_3_i528_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_max_shift_3_i528_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_max_shift_3_i528_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i528_0_NO_SHIFT_REG = rnode_169to170_bb0_max_shift_3_i528_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_max_shift_3_i528_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i528_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_conv220_i532_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i532_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i532_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i532_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i532_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i532_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i532_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i532_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_conv220_i532_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_conv220_i532_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_conv220_i532_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_conv220_i532_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_conv220_i532_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_conv220_i532 & 32'h1C)),
	.data_out(rnode_169to170_bb0_conv220_i532_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_conv220_i532_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_conv220_i532_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_conv220_i532_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_conv220_i532_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_conv220_i532_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv220_i532_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_conv220_i532_0_NO_SHIFT_REG = rnode_169to170_bb0_conv220_i532_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_conv220_i532_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i532_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_shl222_i534_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i534_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i534_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i534_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i534_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i534_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_valid_out_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_stall_in_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i534_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_shl222_i534_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_shl222_i534_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_shl222_i534_0_stall_in_0_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_shl222_i534_0_valid_out_0_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_shl222_i534_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_shl222_i534),
	.data_out(rnode_169to170_bb0_shl222_i534_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_shl222_i534_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_shl222_i534_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_shl222_i534_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_shl222_i534_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_shl222_i534_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl222_i534_stall_in = 1'b0;
assign rnode_169to170_bb0_shl222_i534_0_stall_in_0_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i534_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i534_0_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i534_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i534_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i534_1_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i534_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i534_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i534_2_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i534_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i534_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i534_3_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i534_0_reg_170_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_max_shift_3_i172_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i172_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i172_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i172_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i172_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i172_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i172_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i172_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_max_shift_3_i172_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_max_shift_3_i172_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_max_shift_3_i172_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_max_shift_3_i172_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_max_shift_3_i172_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_max_shift_3_i172),
	.data_out(rnode_169to170_bb0_max_shift_3_i172_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_max_shift_3_i172_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_max_shift_3_i172_0_reg_170_fifo.DATA_WIDTH = 16;
defparam rnode_169to170_bb0_max_shift_3_i172_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_max_shift_3_i172_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_max_shift_3_i172_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_max_shift_3_i172_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i172_0_NO_SHIFT_REG = rnode_169to170_bb0_max_shift_3_i172_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_max_shift_3_i172_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i172_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_conv220_i176_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i176_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i176_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i176_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i176_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i176_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i176_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i176_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_conv220_i176_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_conv220_i176_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_conv220_i176_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_conv220_i176_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_conv220_i176_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_conv220_i176 & 32'h1C)),
	.data_out(rnode_169to170_bb0_conv220_i176_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_conv220_i176_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_conv220_i176_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_conv220_i176_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_conv220_i176_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_conv220_i176_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv220_i176_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_conv220_i176_0_NO_SHIFT_REG = rnode_169to170_bb0_conv220_i176_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_conv220_i176_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i176_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_shl222_i178_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i178_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i178_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i178_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i178_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i178_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_valid_out_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_stall_in_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i178_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_shl222_i178_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_shl222_i178_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_shl222_i178_0_stall_in_0_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_shl222_i178_0_valid_out_0_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_shl222_i178_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_shl222_i178),
	.data_out(rnode_169to170_bb0_shl222_i178_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_shl222_i178_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_shl222_i178_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_shl222_i178_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_shl222_i178_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_shl222_i178_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl222_i178_stall_in = 1'b0;
assign rnode_169to170_bb0_shl222_i178_0_stall_in_0_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i178_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i178_0_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i178_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i178_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i178_1_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i178_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i178_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i178_2_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i178_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i178_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i178_3_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i178_0_reg_170_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_max_shift_3_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i_0_stall_in_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [15:0] rnode_169to170_bb0_max_shift_3_i_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_max_shift_3_i_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_max_shift_3_i_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_max_shift_3_i_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_max_shift_3_i_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_max_shift_3_i_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_max_shift_3_i_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_max_shift_3_i),
	.data_out(rnode_169to170_bb0_max_shift_3_i_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_max_shift_3_i_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_max_shift_3_i_0_reg_170_fifo.DATA_WIDTH = 16;
defparam rnode_169to170_bb0_max_shift_3_i_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_max_shift_3_i_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_max_shift_3_i_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_max_shift_3_i_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i_0_NO_SHIFT_REG = rnode_169to170_bb0_max_shift_3_i_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_max_shift_3_i_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_conv220_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i_0_stall_in_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_conv220_i_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i_0_valid_out_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i_0_stall_in_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_conv220_i_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_conv220_i_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_conv220_i_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_conv220_i_0_stall_in_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_conv220_i_0_valid_out_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_conv220_i_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in((local_bb0_conv220_i & 32'h1C)),
	.data_out(rnode_169to170_bb0_conv220_i_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_conv220_i_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_conv220_i_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_conv220_i_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_conv220_i_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_conv220_i_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_conv220_i_stall_in_1 = 1'b0;
assign rnode_169to170_bb0_conv220_i_0_NO_SHIFT_REG = rnode_169to170_bb0_conv220_i_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_conv220_i_0_stall_in_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_169to170_bb0_shl222_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i_0_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i_1_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_valid_out_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_stall_in_2_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i_2_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_valid_out_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_stall_in_3_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i_3_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_reg_170_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_169to170_bb0_shl222_i_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_valid_out_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_stall_in_0_reg_170_NO_SHIFT_REG;
 logic rnode_169to170_bb0_shl222_i_0_stall_out_reg_170_NO_SHIFT_REG;

acl_data_fifo rnode_169to170_bb0_shl222_i_0_reg_170_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_169to170_bb0_shl222_i_0_reg_170_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_169to170_bb0_shl222_i_0_stall_in_0_reg_170_NO_SHIFT_REG),
	.valid_out(rnode_169to170_bb0_shl222_i_0_valid_out_0_reg_170_NO_SHIFT_REG),
	.stall_out(rnode_169to170_bb0_shl222_i_0_stall_out_reg_170_NO_SHIFT_REG),
	.data_in(local_bb0_shl222_i),
	.data_out(rnode_169to170_bb0_shl222_i_0_reg_170_NO_SHIFT_REG)
);

defparam rnode_169to170_bb0_shl222_i_0_reg_170_fifo.DEPTH = 1;
defparam rnode_169to170_bb0_shl222_i_0_reg_170_fifo.DATA_WIDTH = 32;
defparam rnode_169to170_bb0_shl222_i_0_reg_170_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_169to170_bb0_shl222_i_0_reg_170_fifo.IMPL = "shift_reg";

assign rnode_169to170_bb0_shl222_i_0_reg_170_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl222_i_stall_in = 1'b0;
assign rnode_169to170_bb0_shl222_i_0_stall_in_0_reg_170_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i_0_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i_1_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i_0_valid_out_2_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i_2_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i_0_reg_170_NO_SHIFT_REG;
assign rnode_169to170_bb0_shl222_i_0_valid_out_3_NO_SHIFT_REG = 1'b1;
assign rnode_169to170_bb0_shl222_i_3_NO_SHIFT_REG = rnode_169to170_bb0_shl222_i_0_reg_170_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_1_i903_stall_local;
wire [31:0] local_bb0_reduction_1_i903;

assign local_bb0_reduction_1_i903 = ((rnode_169to170_bb0_conv220_i888_0_NO_SHIFT_REG & 32'h1C) | (local_bb0_shl243_i897 & 32'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_0_i902_stall_local;
wire [31:0] local_bb0_reduction_0_i902;

assign local_bb0_reduction_0_i902 = ((local_bb0_and250_i898 & 32'h1) | (local_bb0_and261_i901 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_conv216_i529_stall_local;
wire [31:0] local_bb0_conv216_i529;

assign local_bb0_conv216_i529[31:16] = 16'h0;
assign local_bb0_conv216_i529[15:0] = rnode_169to170_bb0_max_shift_3_i528_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and224_i535_stall_local;
wire [31:0] local_bb0_and224_i535;

assign local_bb0_and224_i535 = (rnode_169to170_bb0_shl222_i534_0_NO_SHIFT_REG >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_i537_stall_local;
wire [31:0] local_bb0_and228_i537;

assign local_bb0_and228_i537 = (rnode_169to170_bb0_shl222_i534_1_NO_SHIFT_REG >> 32'h19);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_i543_stall_local;
wire [31:0] local_bb0_and232_i543;

assign local_bb0_and232_i543 = (rnode_169to170_bb0_shl222_i534_2_NO_SHIFT_REG >> 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb0_and269_i550_stall_local;
wire [31:0] local_bb0_and269_i550;

assign local_bb0_and269_i550 = (rnode_169to170_bb0_shl222_i534_3_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv216_i173_stall_local;
wire [31:0] local_bb0_conv216_i173;

assign local_bb0_conv216_i173[31:16] = 16'h0;
assign local_bb0_conv216_i173[15:0] = rnode_169to170_bb0_max_shift_3_i172_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and224_i179_stall_local;
wire [31:0] local_bb0_and224_i179;

assign local_bb0_and224_i179 = (rnode_169to170_bb0_shl222_i178_0_NO_SHIFT_REG >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_i181_stall_local;
wire [31:0] local_bb0_and228_i181;

assign local_bb0_and228_i181 = (rnode_169to170_bb0_shl222_i178_1_NO_SHIFT_REG >> 32'h19);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_i187_stall_local;
wire [31:0] local_bb0_and232_i187;

assign local_bb0_and232_i187 = (rnode_169to170_bb0_shl222_i178_2_NO_SHIFT_REG >> 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb0_and269_i194_stall_local;
wire [31:0] local_bb0_and269_i194;

assign local_bb0_and269_i194 = (rnode_169to170_bb0_shl222_i178_3_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_conv216_i_stall_local;
wire [31:0] local_bb0_conv216_i;

assign local_bb0_conv216_i[31:16] = 16'h0;
assign local_bb0_conv216_i[15:0] = rnode_169to170_bb0_max_shift_3_i_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_and224_i_stall_local;
wire [31:0] local_bb0_and224_i;

assign local_bb0_and224_i = (rnode_169to170_bb0_shl222_i_0_NO_SHIFT_REG >> 32'h1A);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_i_stall_local;
wire [31:0] local_bb0_and228_i;

assign local_bb0_and228_i = (rnode_169to170_bb0_shl222_i_1_NO_SHIFT_REG >> 32'h19);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_i_stall_local;
wire [31:0] local_bb0_and232_i;

assign local_bb0_and232_i = (rnode_169to170_bb0_shl222_i_2_NO_SHIFT_REG >> 32'h18);

// This section implements an unregistered operation.
// 
wire local_bb0_and269_i_stall_local;
wire [31:0] local_bb0_and269_i;

assign local_bb0_and269_i = (rnode_169to170_bb0_shl222_i_3_NO_SHIFT_REG & 32'h7FFFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_2_i904_stall_local;
wire [31:0] local_bb0_reduction_2_i904;

assign local_bb0_reduction_2_i904 = ((local_bb0_reduction_0_i902 & 32'h1) | (local_bb0_reduction_1_i903 & 32'h1E));

// This section implements an unregistered operation.
// 
wire local_bb0_and224_lobit_i536_stall_local;
wire [31:0] local_bb0_and224_lobit_i536;

assign local_bb0_and224_lobit_i536 = ((local_bb0_and224_i535 & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_lobit_i538_stall_local;
wire [31:0] local_bb0_and228_lobit_i538;

assign local_bb0_and228_lobit_i538 = ((local_bb0_and228_i537 & 32'h7F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_lobit_i544_stall_local;
wire [31:0] local_bb0_and232_lobit_i544;

assign local_bb0_and232_lobit_i544 = ((local_bb0_and232_i543 & 32'hFF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and224_lobit_i180_stall_local;
wire [31:0] local_bb0_and224_lobit_i180;

assign local_bb0_and224_lobit_i180 = ((local_bb0_and224_i179 & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_lobit_i182_stall_local;
wire [31:0] local_bb0_and228_lobit_i182;

assign local_bb0_and228_lobit_i182 = ((local_bb0_and228_i181 & 32'h7F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_lobit_i188_stall_local;
wire [31:0] local_bb0_and232_lobit_i188;

assign local_bb0_and232_lobit_i188 = ((local_bb0_and232_i187 & 32'hFF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and224_lobit_i_stall_local;
wire [31:0] local_bb0_and224_lobit_i;

assign local_bb0_and224_lobit_i = ((local_bb0_and224_i & 32'h3F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and228_lobit_i_stall_local;
wire [31:0] local_bb0_and228_lobit_i;

assign local_bb0_and228_lobit_i = ((local_bb0_and228_i & 32'h7F) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and232_lobit_i_stall_local;
wire [31:0] local_bb0_and232_lobit_i;

assign local_bb0_and232_lobit_i = ((local_bb0_and232_i & 32'hFF) & 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and267_i905_stall_local;
wire [31:0] local_bb0_and267_i905;

assign local_bb0_and267_i905 = ((local_bb0_reduction_2_i904 & 32'h1F) & (local_bb0_conv216_i885 & 32'hFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_var__u57_stall_local;
wire [31:0] local_bb0_var__u57;

assign local_bb0_var__u57 = ((local_bb0_and224_lobit_i536 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext241_i539_stall_local;
wire [31:0] local_bb0_lnot_ext241_i539;

assign local_bb0_lnot_ext241_i539 = ((local_bb0_and228_lobit_i538 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u58_stall_local;
wire [31:0] local_bb0_var__u58;

assign local_bb0_var__u58 = ((local_bb0_and232_lobit_i544 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u59_stall_local;
wire [31:0] local_bb0_var__u59;

assign local_bb0_var__u59 = ((local_bb0_and224_lobit_i180 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext241_i183_stall_local;
wire [31:0] local_bb0_lnot_ext241_i183;

assign local_bb0_lnot_ext241_i183 = ((local_bb0_and228_lobit_i182 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u60_stall_local;
wire [31:0] local_bb0_var__u60;

assign local_bb0_var__u60 = ((local_bb0_and232_lobit_i188 & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u61_stall_local;
wire [31:0] local_bb0_var__u61;

assign local_bb0_var__u61 = ((local_bb0_and224_lobit_i & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_lnot_ext241_i_stall_local;
wire [31:0] local_bb0_lnot_ext241_i;

assign local_bb0_lnot_ext241_i = ((local_bb0_and228_lobit_i & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u62_stall_local;
wire [31:0] local_bb0_var__u62;

assign local_bb0_var__u62 = ((local_bb0_and232_lobit_i & 32'h1) ^ 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and271_i907_stall_local;
wire [31:0] local_bb0_and271_i907;

assign local_bb0_and271_i907 = ((local_bb0_and267_i905 & 32'h1F) & 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i910_stall_local;
wire [31:0] local_bb0_sub276_i910;

assign local_bb0_sub276_i910 = ((local_bb0_add_i909 & 32'h1FF) - (local_bb0_and267_i905 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_and250_i542_stall_local;
wire [31:0] local_bb0_and250_i542;

assign local_bb0_and250_i542 = ((local_bb0_var__u57 & 32'h1) & (local_bb0_and228_i537 & 32'h7F));

// This section implements an unregistered operation.
// 
wire local_bb0_and242_i540_stall_local;
wire [31:0] local_bb0_and242_i540;

assign local_bb0_and242_i540 = ((local_bb0_var__u57 & 32'h1) & (local_bb0_lnot_ext241_i539 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and250_i186_stall_local;
wire [31:0] local_bb0_and250_i186;

assign local_bb0_and250_i186 = ((local_bb0_var__u59 & 32'h1) & (local_bb0_and228_i181 & 32'h7F));

// This section implements an unregistered operation.
// 
wire local_bb0_and242_i184_stall_local;
wire [31:0] local_bb0_and242_i184;

assign local_bb0_and242_i184 = ((local_bb0_var__u59 & 32'h1) & (local_bb0_lnot_ext241_i183 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_and250_i_stall_local;
wire [31:0] local_bb0_and250_i;

assign local_bb0_and250_i = ((local_bb0_var__u61 & 32'h1) & (local_bb0_and228_i & 32'h7F));

// This section implements an unregistered operation.
// 
wire local_bb0_and242_i_stall_local;
wire [31:0] local_bb0_and242_i;

assign local_bb0_and242_i = ((local_bb0_var__u61 & 32'h1) & (local_bb0_lnot_ext241_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i910_valid_out;
wire local_bb0_sub276_i910_stall_in;
wire local_bb0_shl272_i908_valid_out;
wire local_bb0_shl272_i908_stall_in;
wire local_bb0_shl272_i908_inputs_ready;
wire local_bb0_shl272_i908_stall_local;
wire [31:0] local_bb0_shl272_i908;

assign local_bb0_shl272_i908_inputs_ready = (rnode_168to170_bb0_and26_i817_lobit_0_valid_out_NO_SHIFT_REG & rnode_168to170_bb0__25_i1017_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_max_shift_3_i884_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i890_0_valid_out_3_NO_SHIFT_REG & rnode_169to170_bb0_conv220_i888_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i890_0_valid_out_0_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i890_0_valid_out_1_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i890_0_valid_out_2_NO_SHIFT_REG);
assign local_bb0_shl272_i908 = ((local_bb0_and269_i906 & 32'h7FFFFFF) << (local_bb0_and271_i907 & 32'h3));
assign local_bb0_sub276_i910_valid_out = 1'b1;
assign local_bb0_shl272_i908_valid_out = 1'b1;
assign rnode_168to170_bb0_and26_i817_lobit_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0__25_i1017_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i884_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i890_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i888_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i890_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i890_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i890_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_shl243_i541_stall_local;
wire [31:0] local_bb0_shl243_i541;

assign local_bb0_shl243_i541 = ((local_bb0_and242_i540 & 32'h1) << 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and261_i545_stall_local;
wire [31:0] local_bb0_and261_i545;

assign local_bb0_and261_i545 = ((local_bb0_and242_i540 & 32'h1) & (local_bb0_var__u58 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_shl243_i185_stall_local;
wire [31:0] local_bb0_shl243_i185;

assign local_bb0_shl243_i185 = ((local_bb0_and242_i184 & 32'h1) << 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and261_i189_stall_local;
wire [31:0] local_bb0_and261_i189;

assign local_bb0_and261_i189 = ((local_bb0_and242_i184 & 32'h1) & (local_bb0_var__u60 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_shl243_i_stall_local;
wire [31:0] local_bb0_shl243_i;

assign local_bb0_shl243_i = ((local_bb0_and242_i & 32'h1) << 32'h1);

// This section implements an unregistered operation.
// 
wire local_bb0_and261_i_stall_local;
wire [31:0] local_bb0_and261_i;

assign local_bb0_and261_i = ((local_bb0_and242_i & 32'h1) & (local_bb0_var__u62 & 32'h1));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_sub276_i910_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i910_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i910_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i910_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i910_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i910_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i910_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i910_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i910_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i910_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i910_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_sub276_i910_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_sub276_i910_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_sub276_i910_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_sub276_i910_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_sub276_i910_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_sub276_i910),
	.data_out(rnode_170to171_bb0_sub276_i910_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_sub276_i910_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_sub276_i910_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_sub276_i910_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_sub276_i910_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_sub276_i910_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_sub276_i910_stall_in = 1'b0;
assign rnode_170to171_bb0_sub276_i910_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i910_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i910_0_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i910_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_sub276_i910_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i910_1_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i910_0_reg_171_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_shl272_i908_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i908_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i908_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i908_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i908_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i908_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i908_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i908_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i908_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i908_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i908_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_shl272_i908_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_shl272_i908_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_shl272_i908_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_shl272_i908_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_shl272_i908_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_shl272_i908),
	.data_out(rnode_170to171_bb0_shl272_i908_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_shl272_i908_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_shl272_i908_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_shl272_i908_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_shl272_i908_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_shl272_i908_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl272_i908_stall_in = 1'b0;
assign rnode_170to171_bb0_shl272_i908_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i908_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i908_0_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i908_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_shl272_i908_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i908_1_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i908_0_reg_171_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_1_i547_stall_local;
wire [31:0] local_bb0_reduction_1_i547;

assign local_bb0_reduction_1_i547 = ((rnode_169to170_bb0_conv220_i532_0_NO_SHIFT_REG & 32'h1C) | (local_bb0_shl243_i541 & 32'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_0_i546_stall_local;
wire [31:0] local_bb0_reduction_0_i546;

assign local_bb0_reduction_0_i546 = ((local_bb0_and250_i542 & 32'h1) | (local_bb0_and261_i545 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_1_i191_stall_local;
wire [31:0] local_bb0_reduction_1_i191;

assign local_bb0_reduction_1_i191 = ((rnode_169to170_bb0_conv220_i176_0_NO_SHIFT_REG & 32'h1C) | (local_bb0_shl243_i185 & 32'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_0_i190_stall_local;
wire [31:0] local_bb0_reduction_0_i190;

assign local_bb0_reduction_0_i190 = ((local_bb0_and250_i186 & 32'h1) | (local_bb0_and261_i189 & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_1_i_stall_local;
wire [31:0] local_bb0_reduction_1_i;

assign local_bb0_reduction_1_i = ((rnode_169to170_bb0_conv220_i_0_NO_SHIFT_REG & 32'h1C) | (local_bb0_shl243_i & 32'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_0_i_stall_local;
wire [31:0] local_bb0_reduction_0_i;

assign local_bb0_reduction_0_i = ((local_bb0_and250_i & 32'h1) | (local_bb0_and261_i & 32'h1));

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_i913_stall_local;
wire [63:0] local_bb0_conv277_i913;

assign local_bb0_conv277_i913[63:32] = 32'h0;
assign local_bb0_conv277_i913[31:0] = rnode_170to171_bb0_sub276_i910_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv281_i914_stall_local;
wire [31:0] local_bb0_conv281_i914;

assign local_bb0_conv281_i914 = (rnode_170to171_bb0_sub276_i910_1_NO_SHIFT_REG & 32'hFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and278_i911_stall_local;
wire [31:0] local_bb0_and278_i911;

assign local_bb0_and278_i911 = (rnode_170to171_bb0_shl272_i908_0_NO_SHIFT_REG & 32'h4000000);

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_2_i548_stall_local;
wire [31:0] local_bb0_reduction_2_i548;

assign local_bb0_reduction_2_i548 = ((local_bb0_reduction_0_i546 & 32'h1) | (local_bb0_reduction_1_i547 & 32'h1E));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_2_i192_stall_local;
wire [31:0] local_bb0_reduction_2_i192;

assign local_bb0_reduction_2_i192 = ((local_bb0_reduction_0_i190 & 32'h1) | (local_bb0_reduction_1_i191 & 32'h1E));

// This section implements an unregistered operation.
// 
wire local_bb0_reduction_2_i_stall_local;
wire [31:0] local_bb0_reduction_2_i;

assign local_bb0_reduction_2_i = ((local_bb0_reduction_0_i & 32'h1) | (local_bb0_reduction_1_i & 32'h1E));

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_op_i923_stall_local;
wire [63:0] local_bb0_conv277_op_i923;

assign local_bb0_conv277_op_i923 = ((local_bb0_conv277_i913 & 64'hFFFFFFFF) & 64'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp282_i915_stall_local;
wire local_bb0_cmp282_i915;

assign local_bb0_cmp282_i915 = ((local_bb0_conv281_i914 & 32'hFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool279_i912_stall_local;
wire local_bb0_tobool279_i912;

assign local_bb0_tobool279_i912 = ((local_bb0_and278_i911 & 32'h4000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_and267_i549_stall_local;
wire [31:0] local_bb0_and267_i549;

assign local_bb0_and267_i549 = ((local_bb0_reduction_2_i548 & 32'h1F) & (local_bb0_conv216_i529 & 32'hFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and267_i193_stall_local;
wire [31:0] local_bb0_and267_i193;

assign local_bb0_and267_i193 = ((local_bb0_reduction_2_i192 & 32'h1F) & (local_bb0_conv216_i173 & 32'hFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and267_i_stall_local;
wire [31:0] local_bb0_and267_i;

assign local_bb0_and267_i = ((local_bb0_reduction_2_i & 32'h1F) & (local_bb0_conv216_i & 32'hFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0__19_demorgan_i916_stall_local;
wire local_bb0__19_demorgan_i916;

assign local_bb0__19_demorgan_i916 = (local_bb0_tobool279_i912 | local_bb0_cmp282_i915);

// This section implements an unregistered operation.
// 
wire local_bb0_not_tobool279_i917_stall_local;
wire local_bb0_not_tobool279_i917;

assign local_bb0_not_tobool279_i917 = (local_bb0_tobool279_i912 ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb0_and271_i551_stall_local;
wire [31:0] local_bb0_and271_i551;

assign local_bb0_and271_i551 = ((local_bb0_and267_i549 & 32'h1F) & 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i554_stall_local;
wire [31:0] local_bb0_sub276_i554;

assign local_bb0_sub276_i554 = ((local_bb0_add_i553 & 32'h1FF) - (local_bb0_and267_i549 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_and271_i195_stall_local;
wire [31:0] local_bb0_and271_i195;

assign local_bb0_and271_i195 = ((local_bb0_and267_i193 & 32'h1F) & 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i198_stall_local;
wire [31:0] local_bb0_sub276_i198;

assign local_bb0_sub276_i198 = ((rnode_168to170_bb0_add_i197_0_NO_SHIFT_REG & 32'h1FF) - (local_bb0_and267_i193 & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_and271_i_stall_local;
wire [31:0] local_bb0_and271_i;

assign local_bb0_and271_i = ((local_bb0_and267_i & 32'h1F) & 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i_stall_local;
wire [31:0] local_bb0_sub276_i;

assign local_bb0_sub276_i = ((local_bb0_add_i & 32'h1FF) - (local_bb0_and267_i & 32'h1F));

// This section implements an unregistered operation.
// 
wire local_bb0_and290_i919_stall_local;
wire [31:0] local_bb0_and290_i919;

assign local_bb0_and290_i919 = (local_bb0__19_demorgan_i916 ? 32'h0 : 32'h3FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__20_op_i924_stall_local;
wire [63:0] local_bb0__20_op_i924;

assign local_bb0__20_op_i924 = (local_bb0__19_demorgan_i916 ? 64'h0 : (local_bb0_conv277_op_i923 & 64'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb0__21_i918_stall_local;
wire local_bb0__21_i918;

assign local_bb0__21_i918 = (local_bb0_cmp282_i915 & local_bb0_not_tobool279_i917);

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i554_valid_out;
wire local_bb0_sub276_i554_stall_in;
wire local_bb0_shl272_i552_valid_out;
wire local_bb0_shl272_i552_stall_in;
wire local_bb0_shl272_i552_inputs_ready;
wire local_bb0_shl272_i552_stall_local;
wire [31:0] local_bb0_shl272_i552;

assign local_bb0_shl272_i552_inputs_ready = (rnode_168to170_bb0__25_i661_0_valid_out_NO_SHIFT_REG & rnode_168to170_bb0_and26_i461_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_max_shift_3_i528_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i534_0_valid_out_3_NO_SHIFT_REG & rnode_169to170_bb0_conv220_i532_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i534_0_valid_out_0_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i534_0_valid_out_1_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i534_0_valid_out_2_NO_SHIFT_REG);
assign local_bb0_shl272_i552 = ((local_bb0_and269_i550 & 32'h7FFFFFF) << (local_bb0_and271_i551 & 32'h3));
assign local_bb0_sub276_i554_valid_out = 1'b1;
assign local_bb0_shl272_i552_valid_out = 1'b1;
assign rnode_168to170_bb0__25_i661_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0_and26_i461_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i528_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i534_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i532_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i534_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i534_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i534_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i198_valid_out;
wire local_bb0_sub276_i198_stall_in;
wire local_bb0_shl272_i196_valid_out;
wire local_bb0_shl272_i196_stall_in;
wire local_bb0_shl272_i196_inputs_ready;
wire local_bb0_shl272_i196_stall_local;
wire [31:0] local_bb0_shl272_i196;

assign local_bb0_shl272_i196_inputs_ready = (rnode_168to170_bb0_add_i197_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_max_shift_3_i172_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i178_0_valid_out_3_NO_SHIFT_REG & rnode_169to170_bb0_conv220_i176_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i178_0_valid_out_0_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i178_0_valid_out_1_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i178_0_valid_out_2_NO_SHIFT_REG);
assign local_bb0_shl272_i196 = ((local_bb0_and269_i194 & 32'h7FFFFFF) << (local_bb0_and271_i195 & 32'h3));
assign local_bb0_sub276_i198_valid_out = 1'b1;
assign local_bb0_shl272_i196_valid_out = 1'b1;
assign rnode_168to170_bb0_add_i197_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i172_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i178_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i176_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i178_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i178_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i178_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0_sub276_i_valid_out;
wire local_bb0_sub276_i_stall_in;
wire local_bb0_shl272_i_valid_out;
wire local_bb0_shl272_i_stall_in;
wire local_bb0_shl272_i_inputs_ready;
wire local_bb0_shl272_i_stall_local;
wire [31:0] local_bb0_shl272_i;

assign local_bb0_shl272_i_inputs_ready = (rnode_168to170_bb0__25_i_0_valid_out_NO_SHIFT_REG & rnode_168to170_bb0_and26_i_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_max_shift_3_i_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i_0_valid_out_3_NO_SHIFT_REG & rnode_169to170_bb0_conv220_i_0_valid_out_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i_0_valid_out_0_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i_0_valid_out_1_NO_SHIFT_REG & rnode_169to170_bb0_shl222_i_0_valid_out_2_NO_SHIFT_REG);
assign local_bb0_shl272_i = ((local_bb0_and269_i & 32'h7FFFFFF) << (local_bb0_and271_i & 32'h3));
assign local_bb0_sub276_i_valid_out = 1'b1;
assign local_bb0_shl272_i_valid_out = 1'b1;
assign rnode_168to170_bb0__25_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_168to170_bb0_and26_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_max_shift_3_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i_0_stall_in_3_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_conv220_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_169to170_bb0_shl222_i_0_stall_in_2_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb0__23_i920_stall_local;
wire [31:0] local_bb0__23_i920;

assign local_bb0__23_i920 = (local_bb0__21_i918 ? 32'h3FFFFF8 : (local_bb0_and290_i919 & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_exponent_0_op_i925_stall_local;
wire [63:0] local_bb0_exponent_0_op_i925;

assign local_bb0_exponent_0_op_i925 = (local_bb0__21_i918 ? 64'h1 : (local_bb0__20_op_i924 & 64'h1FF));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_sub276_i554_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i554_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i554_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i554_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i554_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i554_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i554_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i554_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i554_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i554_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i554_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_sub276_i554_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_sub276_i554_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_sub276_i554_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_sub276_i554_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_sub276_i554_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_sub276_i554),
	.data_out(rnode_170to171_bb0_sub276_i554_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_sub276_i554_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_sub276_i554_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_sub276_i554_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_sub276_i554_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_sub276_i554_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_sub276_i554_stall_in = 1'b0;
assign rnode_170to171_bb0_sub276_i554_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i554_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i554_0_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i554_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_sub276_i554_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i554_1_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i554_0_reg_171_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_shl272_i552_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i552_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i552_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i552_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i552_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i552_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i552_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i552_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i552_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i552_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i552_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_shl272_i552_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_shl272_i552_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_shl272_i552_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_shl272_i552_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_shl272_i552_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_shl272_i552),
	.data_out(rnode_170to171_bb0_shl272_i552_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_shl272_i552_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_shl272_i552_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_shl272_i552_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_shl272_i552_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_shl272_i552_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl272_i552_stall_in = 1'b0;
assign rnode_170to171_bb0_shl272_i552_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i552_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i552_0_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i552_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_shl272_i552_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i552_1_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i552_0_reg_171_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_sub276_i198_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i198_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i198_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i198_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i198_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i198_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i198_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i198_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i198_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i198_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i198_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_sub276_i198_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_sub276_i198_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_sub276_i198_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_sub276_i198_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_sub276_i198_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_sub276_i198),
	.data_out(rnode_170to171_bb0_sub276_i198_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_sub276_i198_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_sub276_i198_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_sub276_i198_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_sub276_i198_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_sub276_i198_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_sub276_i198_stall_in = 1'b0;
assign rnode_170to171_bb0_sub276_i198_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i198_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i198_0_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i198_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_sub276_i198_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i198_1_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i198_0_reg_171_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_shl272_i196_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i196_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i196_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i196_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i196_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i196_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i196_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i196_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i196_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i196_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i196_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_shl272_i196_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_shl272_i196_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_shl272_i196_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_shl272_i196_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_shl272_i196_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_shl272_i196),
	.data_out(rnode_170to171_bb0_shl272_i196_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_shl272_i196_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_shl272_i196_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_shl272_i196_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_shl272_i196_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_shl272_i196_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl272_i196_stall_in = 1'b0;
assign rnode_170to171_bb0_shl272_i196_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i196_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i196_0_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i196_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_shl272_i196_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i196_1_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i196_0_reg_171_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_sub276_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_sub276_i_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_sub276_i_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_sub276_i_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_sub276_i_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_sub276_i_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_sub276_i_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_sub276_i_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_sub276_i),
	.data_out(rnode_170to171_bb0_sub276_i_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_sub276_i_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_sub276_i_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_sub276_i_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_sub276_i_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_sub276_i_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_sub276_i_stall_in = 1'b0;
assign rnode_170to171_bb0_sub276_i_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i_0_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_sub276_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_sub276_i_1_NO_SHIFT_REG = rnode_170to171_bb0_sub276_i_0_reg_171_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_170to171_bb0_shl272_i_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i_0_stall_in_0_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i_0_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i_0_stall_in_1_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i_1_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i_0_reg_171_inputs_ready_NO_SHIFT_REG;
 logic [31:0] rnode_170to171_bb0_shl272_i_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i_0_valid_out_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i_0_stall_in_0_reg_171_NO_SHIFT_REG;
 logic rnode_170to171_bb0_shl272_i_0_stall_out_reg_171_NO_SHIFT_REG;

acl_data_fifo rnode_170to171_bb0_shl272_i_0_reg_171_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_170to171_bb0_shl272_i_0_reg_171_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_170to171_bb0_shl272_i_0_stall_in_0_reg_171_NO_SHIFT_REG),
	.valid_out(rnode_170to171_bb0_shl272_i_0_valid_out_0_reg_171_NO_SHIFT_REG),
	.stall_out(rnode_170to171_bb0_shl272_i_0_stall_out_reg_171_NO_SHIFT_REG),
	.data_in(local_bb0_shl272_i),
	.data_out(rnode_170to171_bb0_shl272_i_0_reg_171_NO_SHIFT_REG)
);

defparam rnode_170to171_bb0_shl272_i_0_reg_171_fifo.DEPTH = 1;
defparam rnode_170to171_bb0_shl272_i_0_reg_171_fifo.DATA_WIDTH = 32;
defparam rnode_170to171_bb0_shl272_i_0_reg_171_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_170to171_bb0_shl272_i_0_reg_171_fifo.IMPL = "shift_reg";

assign rnode_170to171_bb0_shl272_i_0_reg_171_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb0_shl272_i_stall_in = 1'b0;
assign rnode_170to171_bb0_shl272_i_0_stall_in_0_reg_171_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i_0_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i_0_reg_171_NO_SHIFT_REG;
assign rnode_170to171_bb0_shl272_i_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_170to171_bb0_shl272_i_1_NO_SHIFT_REG = rnode_170to171_bb0_shl272_i_0_reg_171_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_mantissa_2_op_i929_stall_local;
wire [31:0] local_bb0_mantissa_2_op_i929;

assign local_bb0_mantissa_2_op_i929 = (rnode_170to171_bb0_shl272_i908_1_NO_SHIFT_REG & (local_bb0__23_i920 & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and6_i791_stall_local;
wire [63:0] local_bb0_and6_i791;

assign local_bb0_and6_i791 = ((local_bb0_exponent_0_op_i925 & 64'h1FF) & 64'h100);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u63_stall_local;
wire [63:0] local_bb0_var__u63;

assign local_bb0_var__u63 = ((local_bb0_exponent_0_op_i925 & 64'h1FF) << 64'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_i557_stall_local;
wire [63:0] local_bb0_conv277_i557;

assign local_bb0_conv277_i557[63:32] = 32'h0;
assign local_bb0_conv277_i557[31:0] = rnode_170to171_bb0_sub276_i554_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv281_i558_stall_local;
wire [31:0] local_bb0_conv281_i558;

assign local_bb0_conv281_i558 = (rnode_170to171_bb0_sub276_i554_1_NO_SHIFT_REG & 32'hFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and278_i555_stall_local;
wire [31:0] local_bb0_and278_i555;

assign local_bb0_and278_i555 = (rnode_170to171_bb0_shl272_i552_0_NO_SHIFT_REG & 32'h4000000);

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_i201_stall_local;
wire [63:0] local_bb0_conv277_i201;

assign local_bb0_conv277_i201[63:32] = 32'h0;
assign local_bb0_conv277_i201[31:0] = rnode_170to171_bb0_sub276_i198_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv281_i202_stall_local;
wire [31:0] local_bb0_conv281_i202;

assign local_bb0_conv281_i202 = (rnode_170to171_bb0_sub276_i198_1_NO_SHIFT_REG & 32'hFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and278_i199_stall_local;
wire [31:0] local_bb0_and278_i199;

assign local_bb0_and278_i199 = (rnode_170to171_bb0_shl272_i196_0_NO_SHIFT_REG & 32'h4000000);

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_i_stall_local;
wire [63:0] local_bb0_conv277_i;

assign local_bb0_conv277_i[63:32] = 32'h0;
assign local_bb0_conv277_i[31:0] = rnode_170to171_bb0_sub276_i_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_conv281_i_stall_local;
wire [31:0] local_bb0_conv281_i;

assign local_bb0_conv281_i = (rnode_170to171_bb0_sub276_i_1_NO_SHIFT_REG & 32'hFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_and278_i_stall_local;
wire [31:0] local_bb0_and278_i;

assign local_bb0_and278_i = (rnode_170to171_bb0_shl272_i_0_NO_SHIFT_REG & 32'h4000000);

// This section implements an unregistered operation.
// 
wire local_bb0_shr3_i788_stall_local;
wire [31:0] local_bb0_shr3_i788;

assign local_bb0_shr3_i788 = ((local_bb0_mantissa_2_op_i929 & 32'h3FFFFF8) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool_i792_stall_local;
wire local_bb0_tobool_i792;

assign local_bb0_tobool_i792 = ((local_bb0_and6_i791 & 64'h100) == 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__tr6_i795_stall_local;
wire [31:0] local_bb0__tr6_i795;
wire [63:0] local_bb0__tr6_i795$ps;

assign local_bb0__tr6_i795$ps = (local_bb0_var__u63 & 64'hFF800000);
assign local_bb0__tr6_i795 = local_bb0__tr6_i795$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_op_i567_stall_local;
wire [63:0] local_bb0_conv277_op_i567;

assign local_bb0_conv277_op_i567 = ((local_bb0_conv277_i557 & 64'hFFFFFFFF) & 64'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp282_i559_stall_local;
wire local_bb0_cmp282_i559;

assign local_bb0_cmp282_i559 = ((local_bb0_conv281_i558 & 32'hFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool279_i556_stall_local;
wire local_bb0_tobool279_i556;

assign local_bb0_tobool279_i556 = ((local_bb0_and278_i555 & 32'h4000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_op_i211_stall_local;
wire [63:0] local_bb0_conv277_op_i211;

assign local_bb0_conv277_op_i211 = ((local_bb0_conv277_i201 & 64'hFFFFFFFF) & 64'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp282_i203_stall_local;
wire local_bb0_cmp282_i203;

assign local_bb0_cmp282_i203 = ((local_bb0_conv281_i202 & 32'hFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool279_i200_stall_local;
wire local_bb0_tobool279_i200;

assign local_bb0_tobool279_i200 = ((local_bb0_and278_i199 & 32'h4000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv277_op_i_stall_local;
wire [63:0] local_bb0_conv277_op_i;

assign local_bb0_conv277_op_i = ((local_bb0_conv277_i & 64'hFFFFFFFF) & 64'h1FF);

// This section implements an unregistered operation.
// 
wire local_bb0_cmp282_i_stall_local;
wire local_bb0_cmp282_i;

assign local_bb0_cmp282_i = ((local_bb0_conv281_i & 32'hFFFF) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool279_i_stall_local;
wire local_bb0_tobool279_i;

assign local_bb0_tobool279_i = ((local_bb0_and278_i & 32'h4000000) == 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb0_conv5_i790_stall_local;
wire [31:0] local_bb0_conv5_i790;

assign local_bb0_conv5_i790 = ((local_bb0_shr3_i788 & 32'h7FFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shl7_i797_stall_local;
wire [31:0] local_bb0_shl7_i797;

assign local_bb0_shl7_i797 = (local_bb0_tobool_i792 ? (local_bb0__tr6_i795 & 32'hFF800000) : 32'h7F800000);

// This section implements an unregistered operation.
// 
wire local_bb0__19_demorgan_i560_stall_local;
wire local_bb0__19_demorgan_i560;

assign local_bb0__19_demorgan_i560 = (local_bb0_tobool279_i556 | local_bb0_cmp282_i559);

// This section implements an unregistered operation.
// 
wire local_bb0_not_tobool279_i561_stall_local;
wire local_bb0_not_tobool279_i561;

assign local_bb0_not_tobool279_i561 = (local_bb0_tobool279_i556 ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb0__19_demorgan_i204_stall_local;
wire local_bb0__19_demorgan_i204;

assign local_bb0__19_demorgan_i204 = (local_bb0_tobool279_i200 | local_bb0_cmp282_i203);

// This section implements an unregistered operation.
// 
wire local_bb0_not_tobool279_i205_stall_local;
wire local_bb0_not_tobool279_i205;

assign local_bb0_not_tobool279_i205 = (local_bb0_tobool279_i200 ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb0__19_demorgan_i_stall_local;
wire local_bb0__19_demorgan_i;

assign local_bb0__19_demorgan_i = (local_bb0_tobool279_i | local_bb0_cmp282_i);

// This section implements an unregistered operation.
// 
wire local_bb0_not_tobool279_i_stall_local;
wire local_bb0_not_tobool279_i;

assign local_bb0_not_tobool279_i = (local_bb0_tobool279_i ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb0_or_i798_stall_local;
wire [31:0] local_bb0_or_i798;

assign local_bb0_or_i798 = ((rnode_170to171_bb0_var__u27_0_NO_SHIFT_REG & 32'h80000000) | (local_bb0_conv5_i790 & 32'h7FFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_and290_i563_stall_local;
wire [31:0] local_bb0_and290_i563;

assign local_bb0_and290_i563 = (local_bb0__19_demorgan_i560 ? 32'h0 : 32'h3FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__20_op_i568_stall_local;
wire [63:0] local_bb0__20_op_i568;

assign local_bb0__20_op_i568 = (local_bb0__19_demorgan_i560 ? 64'h0 : (local_bb0_conv277_op_i567 & 64'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb0__21_i562_stall_local;
wire local_bb0__21_i562;

assign local_bb0__21_i562 = (local_bb0_cmp282_i559 & local_bb0_not_tobool279_i561);

// This section implements an unregistered operation.
// 
wire local_bb0_and290_i207_stall_local;
wire [31:0] local_bb0_and290_i207;

assign local_bb0_and290_i207 = (local_bb0__19_demorgan_i204 ? 32'h0 : 32'h3FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__20_op_i212_stall_local;
wire [63:0] local_bb0__20_op_i212;

assign local_bb0__20_op_i212 = (local_bb0__19_demorgan_i204 ? 64'h0 : (local_bb0_conv277_op_i211 & 64'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb0__21_i206_stall_local;
wire local_bb0__21_i206;

assign local_bb0__21_i206 = (local_bb0_cmp282_i203 & local_bb0_not_tobool279_i205);

// This section implements an unregistered operation.
// 
wire local_bb0_and290_i_stall_local;
wire [31:0] local_bb0_and290_i;

assign local_bb0_and290_i = (local_bb0__19_demorgan_i ? 32'h0 : 32'h3FFFFF8);

// This section implements an unregistered operation.
// 
wire local_bb0__20_op_i_stall_local;
wire [63:0] local_bb0__20_op_i;

assign local_bb0__20_op_i = (local_bb0__19_demorgan_i ? 64'h0 : (local_bb0_conv277_op_i & 64'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb0__21_i_stall_local;
wire local_bb0__21_i;

assign local_bb0__21_i = (local_bb0_cmp282_i & local_bb0_not_tobool279_i);

// This section implements an unregistered operation.
// 
wire local_bb0_or8_i799_stall_local;
wire [31:0] local_bb0_or8_i799;

assign local_bb0_or8_i799 = ((local_bb0_or_i798 & 32'h807FFFFF) | (local_bb0_shl7_i797 & 32'hFF800000));

// This section implements an unregistered operation.
// 
wire local_bb0__23_i564_stall_local;
wire [31:0] local_bb0__23_i564;

assign local_bb0__23_i564 = (local_bb0__21_i562 ? 32'h3FFFFF8 : (local_bb0_and290_i563 & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_exponent_0_op_i569_stall_local;
wire [63:0] local_bb0_exponent_0_op_i569;

assign local_bb0_exponent_0_op_i569 = (local_bb0__21_i562 ? 64'h1 : (local_bb0__20_op_i568 & 64'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb0__23_i208_stall_local;
wire [31:0] local_bb0__23_i208;

assign local_bb0__23_i208 = (local_bb0__21_i206 ? 32'h3FFFFF8 : (local_bb0_and290_i207 & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_exponent_0_op_i213_stall_local;
wire [63:0] local_bb0_exponent_0_op_i213;

assign local_bb0_exponent_0_op_i213 = (local_bb0__21_i206 ? 64'h1 : (local_bb0__20_op_i212 & 64'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb0__23_i_stall_local;
wire [31:0] local_bb0__23_i;

assign local_bb0__23_i = (local_bb0__21_i ? 32'h3FFFFF8 : (local_bb0_and290_i & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_exponent_0_op_i_stall_local;
wire [63:0] local_bb0_exponent_0_op_i;

assign local_bb0_exponent_0_op_i = (local_bb0__21_i ? 64'h1 : (local_bb0__20_op_i & 64'h1FF));

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i800_stall_local;
wire [31:0] local_bb0_astype_i800;

assign local_bb0_astype_i800 = local_bb0_or8_i799;

// This section implements an unregistered operation.
// 
wire local_bb0_mantissa_2_op_i573_stall_local;
wire [31:0] local_bb0_mantissa_2_op_i573;

assign local_bb0_mantissa_2_op_i573 = (rnode_170to171_bb0_shl272_i552_1_NO_SHIFT_REG & (local_bb0__23_i564 & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and6_i435_stall_local;
wire [63:0] local_bb0_and6_i435;

assign local_bb0_and6_i435 = ((local_bb0_exponent_0_op_i569 & 64'h1FF) & 64'h100);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u64_stall_local;
wire [63:0] local_bb0_var__u64;

assign local_bb0_var__u64 = ((local_bb0_exponent_0_op_i569 & 64'h1FF) << 64'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_mantissa_2_op_i217_stall_local;
wire [31:0] local_bb0_mantissa_2_op_i217;

assign local_bb0_mantissa_2_op_i217 = (rnode_170to171_bb0_shl272_i196_1_NO_SHIFT_REG & (local_bb0__23_i208 & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and6_i79_stall_local;
wire [63:0] local_bb0_and6_i79;

assign local_bb0_and6_i79 = ((local_bb0_exponent_0_op_i213 & 64'h1FF) & 64'h100);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u65_stall_local;
wire [63:0] local_bb0_var__u65;

assign local_bb0_var__u65 = ((local_bb0_exponent_0_op_i213 & 64'h1FF) << 64'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_mantissa_2_op_i_stall_local;
wire [31:0] local_bb0_mantissa_2_op_i;

assign local_bb0_mantissa_2_op_i = (rnode_170to171_bb0_shl272_i_1_NO_SHIFT_REG & (local_bb0__23_i & 32'h3FFFFF8));

// This section implements an unregistered operation.
// 
wire local_bb0_and6_i_stall_local;
wire [63:0] local_bb0_and6_i;

assign local_bb0_and6_i = ((local_bb0_exponent_0_op_i & 64'h1FF) & 64'h100);

// This section implements an unregistered operation.
// 
wire local_bb0_var__u66_stall_local;
wire [63:0] local_bb0_var__u66;

assign local_bb0_var__u66 = ((local_bb0_exponent_0_op_i & 64'h1FF) << 64'h17);

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_result_insertValue_1_stall_local;
wire [127:0] local_bb0_memcoalesce_result_insertValue_1;

assign local_bb0_memcoalesce_result_insertValue_1[31:0] = 32'bx;
assign local_bb0_memcoalesce_result_insertValue_1[63:32] = local_bb0_astype_i800;
assign local_bb0_memcoalesce_result_insertValue_1[127:64] = 64'bx;

// This section implements an unregistered operation.
// 
wire local_bb0_shr3_i432_stall_local;
wire [31:0] local_bb0_shr3_i432;

assign local_bb0_shr3_i432 = ((local_bb0_mantissa_2_op_i573 & 32'h3FFFFF8) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool_i436_stall_local;
wire local_bb0_tobool_i436;

assign local_bb0_tobool_i436 = ((local_bb0_and6_i435 & 64'h100) == 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__tr6_i439_stall_local;
wire [31:0] local_bb0__tr6_i439;
wire [63:0] local_bb0__tr6_i439$ps;

assign local_bb0__tr6_i439$ps = (local_bb0_var__u64 & 64'hFF800000);
assign local_bb0__tr6_i439 = local_bb0__tr6_i439$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_shr3_i76_stall_local;
wire [31:0] local_bb0_shr3_i76;

assign local_bb0_shr3_i76 = ((local_bb0_mantissa_2_op_i217 & 32'h3FFFFF8) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool_i80_stall_local;
wire local_bb0_tobool_i80;

assign local_bb0_tobool_i80 = ((local_bb0_and6_i79 & 64'h100) == 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__tr6_i83_stall_local;
wire [31:0] local_bb0__tr6_i83;
wire [63:0] local_bb0__tr6_i83$ps;

assign local_bb0__tr6_i83$ps = (local_bb0_var__u65 & 64'hFF800000);
assign local_bb0__tr6_i83 = local_bb0__tr6_i83$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_shr3_i_stall_local;
wire [31:0] local_bb0_shr3_i;

assign local_bb0_shr3_i = ((local_bb0_mantissa_2_op_i & 32'h3FFFFF8) >> 32'h3);

// This section implements an unregistered operation.
// 
wire local_bb0_tobool_i_stall_local;
wire local_bb0_tobool_i;

assign local_bb0_tobool_i = ((local_bb0_and6_i & 64'h100) == 64'h0);

// This section implements an unregistered operation.
// 
wire local_bb0__tr6_i_stall_local;
wire [31:0] local_bb0__tr6_i;
wire [63:0] local_bb0__tr6_i$ps;

assign local_bb0__tr6_i$ps = (local_bb0_var__u66 & 64'hFF800000);
assign local_bb0__tr6_i = local_bb0__tr6_i$ps[31:0];

// This section implements an unregistered operation.
// 
wire local_bb0_conv5_i434_stall_local;
wire [31:0] local_bb0_conv5_i434;

assign local_bb0_conv5_i434 = ((local_bb0_shr3_i432 & 32'h7FFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shl7_i441_stall_local;
wire [31:0] local_bb0_shl7_i441;

assign local_bb0_shl7_i441 = (local_bb0_tobool_i436 ? (local_bb0__tr6_i439 & 32'hFF800000) : 32'h7F800000);

// This section implements an unregistered operation.
// 
wire local_bb0_conv5_i78_stall_local;
wire [31:0] local_bb0_conv5_i78;

assign local_bb0_conv5_i78 = ((local_bb0_shr3_i76 & 32'h7FFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shl7_i85_stall_local;
wire [31:0] local_bb0_shl7_i85;

assign local_bb0_shl7_i85 = (local_bb0_tobool_i80 ? (local_bb0__tr6_i83 & 32'hFF800000) : 32'h7F800000);

// This section implements an unregistered operation.
// 
wire local_bb0_conv5_i_stall_local;
wire [31:0] local_bb0_conv5_i;

assign local_bb0_conv5_i = ((local_bb0_shr3_i & 32'h7FFFFF) & 32'h7FFFFF);

// This section implements an unregistered operation.
// 
wire local_bb0_shl7_i_stall_local;
wire [31:0] local_bb0_shl7_i;

assign local_bb0_shl7_i = (local_bb0_tobool_i ? (local_bb0__tr6_i & 32'hFF800000) : 32'h7F800000);

// This section implements an unregistered operation.
// 
wire local_bb0_or_i442_stall_local;
wire [31:0] local_bb0_or_i442;

assign local_bb0_or_i442 = ((rnode_170to171_bb0_var__u28_0_NO_SHIFT_REG & 32'h80000000) | (local_bb0_conv5_i434 & 32'h7FFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_or_i86_stall_local;
wire [31:0] local_bb0_or_i86;

assign local_bb0_or_i86 = ((rnode_170to171_bb0_var__u29_0_NO_SHIFT_REG & 32'h80000000) | (local_bb0_conv5_i78 & 32'h7FFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_or_i2_stall_local;
wire [31:0] local_bb0_or_i2;

assign local_bb0_or_i2 = ((rnode_170to171_bb0_var__u30_0_NO_SHIFT_REG & 32'h80000000) | (local_bb0_conv5_i & 32'h7FFFFF));

// This section implements an unregistered operation.
// 
wire local_bb0_or8_i443_stall_local;
wire [31:0] local_bb0_or8_i443;

assign local_bb0_or8_i443 = ((local_bb0_or_i442 & 32'h807FFFFF) | (local_bb0_shl7_i441 & 32'hFF800000));

// This section implements an unregistered operation.
// 
wire local_bb0_or8_i87_stall_local;
wire [31:0] local_bb0_or8_i87;

assign local_bb0_or8_i87 = ((local_bb0_or_i86 & 32'h807FFFFF) | (local_bb0_shl7_i85 & 32'hFF800000));

// This section implements an unregistered operation.
// 
wire local_bb0_or8_i_stall_local;
wire [31:0] local_bb0_or8_i;

assign local_bb0_or8_i = ((local_bb0_or_i2 & 32'h807FFFFF) | (local_bb0_shl7_i & 32'hFF800000));

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i444_stall_local;
wire [31:0] local_bb0_astype_i444;

assign local_bb0_astype_i444 = local_bb0_or8_i443;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i88_stall_local;
wire [31:0] local_bb0_astype_i88;

assign local_bb0_astype_i88 = local_bb0_or8_i87;

// This section implements an unregistered operation.
// 
wire local_bb0_astype_i3_stall_local;
wire [31:0] local_bb0_astype_i3;

assign local_bb0_astype_i3 = local_bb0_or8_i;

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_result_insertValue_2_stall_local;
wire [127:0] local_bb0_memcoalesce_result_insertValue_2;

assign local_bb0_memcoalesce_result_insertValue_2[63:0] = local_bb0_memcoalesce_result_insertValue_1[63:0];
assign local_bb0_memcoalesce_result_insertValue_2[95:64] = local_bb0_astype_i444;
assign local_bb0_memcoalesce_result_insertValue_2[127:96] = local_bb0_memcoalesce_result_insertValue_1[127:96];

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_result_insertValue_3_stall_local;
wire [127:0] local_bb0_memcoalesce_result_insertValue_3;

assign local_bb0_memcoalesce_result_insertValue_3[95:0] = local_bb0_memcoalesce_result_insertValue_2[95:0];
assign local_bb0_memcoalesce_result_insertValue_3[127:96] = local_bb0_astype_i88;

// This section implements an unregistered operation.
// 
wire local_bb0_memcoalesce_result_insertValue_0_stall_local;
wire [127:0] local_bb0_memcoalesce_result_insertValue_0;

assign local_bb0_memcoalesce_result_insertValue_0[31:0] = local_bb0_astype_i3;
assign local_bb0_memcoalesce_result_insertValue_0[127:32] = local_bb0_memcoalesce_result_insertValue_3[127:32];

// This section implements an unregistered operation.
// 
wire local_bb0_c0_exi1_valid_out;
wire local_bb0_c0_exi1_stall_in;
wire local_bb0_c0_exi1_inputs_ready;
wire local_bb0_c0_exi1_stall_local;
wire [135:0] local_bb0_c0_exi1;

assign local_bb0_c0_exi1_inputs_ready = (rnode_170to171_bb0_var__u27_0_valid_out_NO_SHIFT_REG & rnode_170to171_bb0_var__u28_0_valid_out_NO_SHIFT_REG & rnode_170to171_bb0_var__u29_0_valid_out_NO_SHIFT_REG & rnode_170to171_bb0_var__u30_0_valid_out_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i910_0_valid_out_0_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i910_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i908_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i554_0_valid_out_0_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i554_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i552_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i198_0_valid_out_0_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i198_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i196_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i_0_valid_out_0_NO_SHIFT_REG & rnode_170to171_bb0_sub276_i_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i_0_valid_out_1_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i908_0_valid_out_0_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i552_0_valid_out_0_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i196_0_valid_out_0_NO_SHIFT_REG & rnode_170to171_bb0_shl272_i_0_valid_out_0_NO_SHIFT_REG);
assign local_bb0_c0_exi1[7:0] = 8'bx;
assign local_bb0_c0_exi1[135:8] = local_bb0_memcoalesce_result_insertValue_0;
assign local_bb0_c0_exi1_valid_out = 1'b1;
assign rnode_170to171_bb0_var__u27_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u28_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u29_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_var__u30_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i910_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i910_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i908_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i554_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i554_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i552_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i198_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i198_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i196_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_sub276_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i908_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i552_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i196_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_170to171_bb0_shl272_i_0_stall_in_0_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire local_bb0_c0_exit_c0_exi1_inputs_ready;
 reg local_bb0_c0_exit_c0_exi1_valid_out_NO_SHIFT_REG;
wire local_bb0_c0_exit_c0_exi1_stall_in;
 reg [135:0] local_bb0_c0_exit_c0_exi1_NO_SHIFT_REG;
wire [135:0] local_bb0_c0_exit_c0_exi1_in;
wire local_bb0_c0_exit_c0_exi1_valid;
wire local_bb0_c0_exit_c0_exi1_causedstall;

acl_stall_free_sink local_bb0_c0_exit_c0_exi1_instance (
	.clock(clock),
	.resetn(resetn),
	.data_in(local_bb0_c0_exi1),
	.data_out(local_bb0_c0_exit_c0_exi1_in),
	.input_accepted(local_bb0_c0_enter_c0_eni2_input_accepted),
	.valid_out(local_bb0_c0_exit_c0_exi1_valid),
	.stall_in(~(local_bb0_c0_exit_c0_exi1_output_regs_ready)),
	.stall_entry(local_bb0_c0_exit_c0_exi1_entry_stall),
	.valid_in(local_bb0_c0_exit_c0_exi1_valid_in),
	.IIphases(local_bb0_c0_exit_c0_exi1_phases),
	.inc_pipelined_thread(local_bb0_c0_enter_c0_eni2_inc_pipelined_thread),
	.dec_pipelined_thread(local_bb0_c0_enter_c0_eni2_dec_pipelined_thread)
);

defparam local_bb0_c0_exit_c0_exi1_instance.DATA_WIDTH = 136;
defparam local_bb0_c0_exit_c0_exi1_instance.PIPELINE_DEPTH = 14;
defparam local_bb0_c0_exit_c0_exi1_instance.SHARINGII = 1;
defparam local_bb0_c0_exit_c0_exi1_instance.SCHEDULEII = 1;
defparam local_bb0_c0_exit_c0_exi1_instance.ALWAYS_THROTTLE = 0;

assign local_bb0_c0_exit_c0_exi1_inputs_ready = 1'b1;
assign local_bb0_c0_exit_c0_exi1_output_regs_ready = (&(~(local_bb0_c0_exit_c0_exi1_valid_out_NO_SHIFT_REG) | ~(local_bb0_c0_exit_c0_exi1_stall_in)));
assign local_bb0_c0_exit_c0_exi1_valid_in = SFC_1_VALID_170_171_0_NO_SHIFT_REG;
assign local_bb0_c0_exi1_stall_in = 1'b0;
assign SFC_1_VALID_170_171_0_stall_in = 1'b0;
assign local_bb0_c0_exit_c0_exi1_causedstall = (1'b1 && (1'b0 && !(~(local_bb0_c0_exit_c0_exi1_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_c0_exit_c0_exi1_NO_SHIFT_REG <= 'x;
		local_bb0_c0_exit_c0_exi1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_c0_exit_c0_exi1_output_regs_ready)
		begin
			local_bb0_c0_exit_c0_exi1_NO_SHIFT_REG <= local_bb0_c0_exit_c0_exi1_in;
			local_bb0_c0_exit_c0_exi1_valid_out_NO_SHIFT_REG <= local_bb0_c0_exit_c0_exi1_valid;
		end
		else
		begin
			if (~(local_bb0_c0_exit_c0_exi1_stall_in))
			begin
				local_bb0_c0_exit_c0_exi1_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_c0_exe1_valid_out;
wire local_bb0_c0_exe1_stall_in;
wire local_bb0_c0_exe1_inputs_ready;
wire local_bb0_c0_exe1_stall_local;
wire [127:0] local_bb0_c0_exe1;

assign local_bb0_c0_exe1_inputs_ready = local_bb0_c0_exit_c0_exi1_valid_out_NO_SHIFT_REG;
assign local_bb0_c0_exe1[31:0] = local_bb0_c0_exit_c0_exi1_NO_SHIFT_REG[39:8];
assign local_bb0_c0_exe1[63:32] = local_bb0_c0_exit_c0_exi1_NO_SHIFT_REG[71:40];
assign local_bb0_c0_exe1[95:64] = local_bb0_c0_exit_c0_exi1_NO_SHIFT_REG[103:72];
assign local_bb0_c0_exe1[127:96] = local_bb0_c0_exit_c0_exi1_NO_SHIFT_REG[135:104];
assign local_bb0_c0_exe1_valid_out = local_bb0_c0_exe1_inputs_ready;
assign local_bb0_c0_exe1_stall_local = local_bb0_c0_exe1_stall_in;
assign local_bb0_c0_exit_c0_exi1_stall_in = (|local_bb0_c0_exe1_stall_local);

// This section implements a registered operation.
// 
wire local_bb0_st_c0_exe1_inputs_ready;
 reg local_bb0_st_c0_exe1_valid_out_NO_SHIFT_REG;
wire local_bb0_st_c0_exe1_stall_in;
wire local_bb0_st_c0_exe1_output_regs_ready;
wire local_bb0_st_c0_exe1_fu_stall_out;
wire local_bb0_st_c0_exe1_fu_valid_out;
wire local_bb0_st_c0_exe1_causedstall;

lsu_top lsu_local_bb0_st_c0_exe1 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb0_st_c0_exe1_fu_stall_out),
	.i_valid(local_bb0_st_c0_exe1_inputs_ready),
	.i_address((local_bb0_memcoalesce_result_bitcast_0 & 64'hFFFFFFFFFFFFFFF0)),
	.i_writedata(local_bb0_c0_exe1),
	.i_cmpdata(),
	.i_predicate(rnode_175to176_bb0_reduction_2_0_NO_SHIFT_REG),
	.i_bitwiseor(64'h0),
	.i_byteenable(local_bb0_reduction_8_compressed),
	.i_stall(~(local_bb0_st_c0_exe1_output_regs_ready)),
	.o_valid(local_bb0_st_c0_exe1_fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_st_c0_exe1_active),
	.avm_address(avm_local_bb0_st_c0_exe1_address),
	.avm_read(avm_local_bb0_st_c0_exe1_read),
	.avm_enable(avm_local_bb0_st_c0_exe1_enable),
	.avm_readdata(avm_local_bb0_st_c0_exe1_readdata),
	.avm_write(avm_local_bb0_st_c0_exe1_write),
	.avm_writeack(avm_local_bb0_st_c0_exe1_writeack),
	.avm_burstcount(avm_local_bb0_st_c0_exe1_burstcount),
	.avm_writedata(avm_local_bb0_st_c0_exe1_writedata),
	.avm_byteenable(avm_local_bb0_st_c0_exe1_byteenable),
	.avm_waitrequest(avm_local_bb0_st_c0_exe1_waitrequest),
	.avm_readdatavalid(avm_local_bb0_st_c0_exe1_readdatavalid),
	.profile_bw(),
	.profile_bw_incr(),
	.profile_total_ivalid(),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(),
	.profile_avm_burstcount_total(),
	.profile_avm_burstcount_total_incr(),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall()
);

defparam lsu_local_bb0_st_c0_exe1.AWIDTH = 32;
defparam lsu_local_bb0_st_c0_exe1.WIDTH_BYTES = 16;
defparam lsu_local_bb0_st_c0_exe1.MWIDTH_BYTES = 64;
defparam lsu_local_bb0_st_c0_exe1.WRITEDATAWIDTH_BYTES = 64;
defparam lsu_local_bb0_st_c0_exe1.ALIGNMENT_BYTES = 16;
defparam lsu_local_bb0_st_c0_exe1.READ = 0;
defparam lsu_local_bb0_st_c0_exe1.ATOMIC = 0;
defparam lsu_local_bb0_st_c0_exe1.WIDTH = 128;
defparam lsu_local_bb0_st_c0_exe1.MWIDTH = 512;
defparam lsu_local_bb0_st_c0_exe1.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_st_c0_exe1.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_st_c0_exe1.KERNEL_SIDE_MEM_LATENCY = 4;
defparam lsu_local_bb0_st_c0_exe1.MEMORY_SIDE_MEM_LATENCY = 8;
defparam lsu_local_bb0_st_c0_exe1.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_st_c0_exe1.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_st_c0_exe1.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_st_c0_exe1.NUMBER_BANKS = 1;
defparam lsu_local_bb0_st_c0_exe1.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_st_c0_exe1.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb0_st_c0_exe1.USEINPUTFIFO = 0;
defparam lsu_local_bb0_st_c0_exe1.USECACHING = 0;
defparam lsu_local_bb0_st_c0_exe1.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_st_c0_exe1.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_st_c0_exe1.ADDRSPACE = 1;
defparam lsu_local_bb0_st_c0_exe1.STYLE = "BURST-COALESCED";
defparam lsu_local_bb0_st_c0_exe1.USE_BYTE_EN = 1;

assign local_bb0_st_c0_exe1_inputs_ready = (local_bb0_c0_exe1_valid_out & local_bb0_memcoalesce_result_bitcast_0_valid_out & local_bb0_reduction_8_compressed_valid_out & rnode_175to176_bb0_reduction_2_0_valid_out_NO_SHIFT_REG);
assign local_bb0_st_c0_exe1_output_regs_ready = (&(~(local_bb0_st_c0_exe1_valid_out_NO_SHIFT_REG) | ~(local_bb0_st_c0_exe1_stall_in)));
assign local_bb0_c0_exe1_stall_in = (local_bb0_st_c0_exe1_fu_stall_out | ~(local_bb0_st_c0_exe1_inputs_ready));
assign local_bb0_memcoalesce_result_bitcast_0_stall_in = (local_bb0_st_c0_exe1_fu_stall_out | ~(local_bb0_st_c0_exe1_inputs_ready));
assign local_bb0_reduction_8_compressed_stall_in = (local_bb0_st_c0_exe1_fu_stall_out | ~(local_bb0_st_c0_exe1_inputs_ready));
assign rnode_175to176_bb0_reduction_2_0_stall_in_NO_SHIFT_REG = (local_bb0_st_c0_exe1_fu_stall_out | ~(local_bb0_st_c0_exe1_inputs_ready));
assign local_bb0_st_c0_exe1_causedstall = (local_bb0_st_c0_exe1_inputs_ready && (local_bb0_st_c0_exe1_fu_stall_out && !(~(local_bb0_st_c0_exe1_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_st_c0_exe1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_st_c0_exe1_output_regs_ready)
		begin
			local_bb0_st_c0_exe1_valid_out_NO_SHIFT_REG <= local_bb0_st_c0_exe1_fu_valid_out;
		end
		else
		begin
			if (~(local_bb0_st_c0_exe1_stall_in))
			begin
				local_bb0_st_c0_exe1_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_180to180_bb0_st_c0_exe1_valid_out;
wire rstag_180to180_bb0_st_c0_exe1_stall_in;
wire rstag_180to180_bb0_st_c0_exe1_inputs_ready;
wire rstag_180to180_bb0_st_c0_exe1_stall_local;
 reg rstag_180to180_bb0_st_c0_exe1_staging_valid_NO_SHIFT_REG;
wire rstag_180to180_bb0_st_c0_exe1_combined_valid;

assign rstag_180to180_bb0_st_c0_exe1_inputs_ready = local_bb0_st_c0_exe1_valid_out_NO_SHIFT_REG;
assign rstag_180to180_bb0_st_c0_exe1_combined_valid = (rstag_180to180_bb0_st_c0_exe1_staging_valid_NO_SHIFT_REG | rstag_180to180_bb0_st_c0_exe1_inputs_ready);
assign rstag_180to180_bb0_st_c0_exe1_valid_out = rstag_180to180_bb0_st_c0_exe1_combined_valid;
assign rstag_180to180_bb0_st_c0_exe1_stall_local = rstag_180to180_bb0_st_c0_exe1_stall_in;
assign local_bb0_st_c0_exe1_stall_in = (|rstag_180to180_bb0_st_c0_exe1_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_180to180_bb0_st_c0_exe1_staging_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (rstag_180to180_bb0_st_c0_exe1_stall_local)
		begin
			if (~(rstag_180to180_bb0_st_c0_exe1_staging_valid_NO_SHIFT_REG))
			begin
				rstag_180to180_bb0_st_c0_exe1_staging_valid_NO_SHIFT_REG <= rstag_180to180_bb0_st_c0_exe1_inputs_ready;
			end
		end
		else
		begin
			rstag_180to180_bb0_st_c0_exe1_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
	end
end


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
wire branch_var__output_regs_ready;

assign branch_var__inputs_ready = rstag_180to180_bb0_st_c0_exe1_valid_out;
assign branch_var__output_regs_ready = ~(stall_in);
assign rstag_180to180_bb0_st_c0_exe1_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out = branch_var__inputs_ready;

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vadd_function
	(
		input 		clock,
		input 		resetn,
		input [31:0] 		input_global_id_0,
		output 		stall_out,
		input 		valid_in,
		output 		valid_out,
		input 		stall_in,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_enable,
		input [511:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_waitrequest,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_address,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_read,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_write,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_writeack,
		output [511:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_writedata,
		output [63:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_burstcount,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_enable,
		input [511:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_waitrequest,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_address,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_read,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_write,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_writeack,
		output [511:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_writedata,
		output [63:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_burstcount,
		output 		avm_local_bb0_st_c0_exe1_enable,
		input [511:0] 		avm_local_bb0_st_c0_exe1_readdata,
		input 		avm_local_bb0_st_c0_exe1_readdatavalid,
		input 		avm_local_bb0_st_c0_exe1_waitrequest,
		output [31:0] 		avm_local_bb0_st_c0_exe1_address,
		output 		avm_local_bb0_st_c0_exe1_read,
		output 		avm_local_bb0_st_c0_exe1_write,
		input 		avm_local_bb0_st_c0_exe1_writeack,
		output [511:0] 		avm_local_bb0_st_c0_exe1_writedata,
		output [63:0] 		avm_local_bb0_st_c0_exe1_byteenable,
		output [4:0] 		avm_local_bb0_st_c0_exe1_burstcount,
		input 		clock2x,
		input 		start,
		input [31:0] 		input_N,
		input [63:0] 		input_a,
		input [63:0] 		input_b,
		input [63:0] 		input_result,
		output reg 		has_a_write_pending,
		output reg 		has_a_lsu_active
	);


wire [31:0] workgroup_size;
wire [31:0] cur_cycle;
wire bb_0_stall_out;
wire bb_0_valid_out;
wire bb_0_local_bb0_ld_memcoalesce_b_load_0_active;
wire bb_0_local_bb0_ld_memcoalesce_a_load_0_active;
wire bb_0_local_bb0_st_c0_exe1_active;
wire writes_pending;
wire [2:0] lsus_active;

vadd_sys_cycle_time system_cycle_time_module (
	.clock(clock),
	.resetn(resetn),
	.cur_cycle(cur_cycle)
);


vadd_basic_block_0 vadd_basic_block_0 (
	.clock(clock),
	.resetn(resetn),
	.input_N(input_N),
	.input_a(input_a),
	.input_b(input_b),
	.input_result(input_result),
	.valid_in(valid_in),
	.stall_out(bb_0_stall_out),
	.input_global_id_0(input_global_id_0),
	.valid_out(bb_0_valid_out),
	.stall_in(stall_in),
	.workgroup_size(workgroup_size),
	.start(start),
	.avm_local_bb0_ld_memcoalesce_b_load_0_enable(avm_local_bb0_ld_memcoalesce_b_load_0_enable),
	.avm_local_bb0_ld_memcoalesce_b_load_0_readdata(avm_local_bb0_ld_memcoalesce_b_load_0_readdata),
	.avm_local_bb0_ld_memcoalesce_b_load_0_readdatavalid(avm_local_bb0_ld_memcoalesce_b_load_0_readdatavalid),
	.avm_local_bb0_ld_memcoalesce_b_load_0_waitrequest(avm_local_bb0_ld_memcoalesce_b_load_0_waitrequest),
	.avm_local_bb0_ld_memcoalesce_b_load_0_address(avm_local_bb0_ld_memcoalesce_b_load_0_address),
	.avm_local_bb0_ld_memcoalesce_b_load_0_read(avm_local_bb0_ld_memcoalesce_b_load_0_read),
	.avm_local_bb0_ld_memcoalesce_b_load_0_write(avm_local_bb0_ld_memcoalesce_b_load_0_write),
	.avm_local_bb0_ld_memcoalesce_b_load_0_writeack(avm_local_bb0_ld_memcoalesce_b_load_0_writeack),
	.avm_local_bb0_ld_memcoalesce_b_load_0_writedata(avm_local_bb0_ld_memcoalesce_b_load_0_writedata),
	.avm_local_bb0_ld_memcoalesce_b_load_0_byteenable(avm_local_bb0_ld_memcoalesce_b_load_0_byteenable),
	.avm_local_bb0_ld_memcoalesce_b_load_0_burstcount(avm_local_bb0_ld_memcoalesce_b_load_0_burstcount),
	.local_bb0_ld_memcoalesce_b_load_0_active(bb_0_local_bb0_ld_memcoalesce_b_load_0_active),
	.clock2x(clock2x),
	.avm_local_bb0_ld_memcoalesce_a_load_0_enable(avm_local_bb0_ld_memcoalesce_a_load_0_enable),
	.avm_local_bb0_ld_memcoalesce_a_load_0_readdata(avm_local_bb0_ld_memcoalesce_a_load_0_readdata),
	.avm_local_bb0_ld_memcoalesce_a_load_0_readdatavalid(avm_local_bb0_ld_memcoalesce_a_load_0_readdatavalid),
	.avm_local_bb0_ld_memcoalesce_a_load_0_waitrequest(avm_local_bb0_ld_memcoalesce_a_load_0_waitrequest),
	.avm_local_bb0_ld_memcoalesce_a_load_0_address(avm_local_bb0_ld_memcoalesce_a_load_0_address),
	.avm_local_bb0_ld_memcoalesce_a_load_0_read(avm_local_bb0_ld_memcoalesce_a_load_0_read),
	.avm_local_bb0_ld_memcoalesce_a_load_0_write(avm_local_bb0_ld_memcoalesce_a_load_0_write),
	.avm_local_bb0_ld_memcoalesce_a_load_0_writeack(avm_local_bb0_ld_memcoalesce_a_load_0_writeack),
	.avm_local_bb0_ld_memcoalesce_a_load_0_writedata(avm_local_bb0_ld_memcoalesce_a_load_0_writedata),
	.avm_local_bb0_ld_memcoalesce_a_load_0_byteenable(avm_local_bb0_ld_memcoalesce_a_load_0_byteenable),
	.avm_local_bb0_ld_memcoalesce_a_load_0_burstcount(avm_local_bb0_ld_memcoalesce_a_load_0_burstcount),
	.local_bb0_ld_memcoalesce_a_load_0_active(bb_0_local_bb0_ld_memcoalesce_a_load_0_active),
	.avm_local_bb0_st_c0_exe1_enable(avm_local_bb0_st_c0_exe1_enable),
	.avm_local_bb0_st_c0_exe1_readdata(avm_local_bb0_st_c0_exe1_readdata),
	.avm_local_bb0_st_c0_exe1_readdatavalid(avm_local_bb0_st_c0_exe1_readdatavalid),
	.avm_local_bb0_st_c0_exe1_waitrequest(avm_local_bb0_st_c0_exe1_waitrequest),
	.avm_local_bb0_st_c0_exe1_address(avm_local_bb0_st_c0_exe1_address),
	.avm_local_bb0_st_c0_exe1_read(avm_local_bb0_st_c0_exe1_read),
	.avm_local_bb0_st_c0_exe1_write(avm_local_bb0_st_c0_exe1_write),
	.avm_local_bb0_st_c0_exe1_writeack(avm_local_bb0_st_c0_exe1_writeack),
	.avm_local_bb0_st_c0_exe1_writedata(avm_local_bb0_st_c0_exe1_writedata),
	.avm_local_bb0_st_c0_exe1_byteenable(avm_local_bb0_st_c0_exe1_byteenable),
	.avm_local_bb0_st_c0_exe1_burstcount(avm_local_bb0_st_c0_exe1_burstcount),
	.local_bb0_st_c0_exe1_active(bb_0_local_bb0_st_c0_exe1_active)
);


assign workgroup_size = 32'h40;
assign valid_out = bb_0_valid_out;
assign stall_out = bb_0_stall_out;
assign writes_pending = bb_0_local_bb0_st_c0_exe1_active;
assign lsus_active[0] = bb_0_local_bb0_ld_memcoalesce_b_load_0_active;
assign lsus_active[1] = bb_0_local_bb0_ld_memcoalesce_a_load_0_active;
assign lsus_active[2] = bb_0_local_bb0_st_c0_exe1_active;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		has_a_write_pending <= 1'b0;
		has_a_lsu_active <= 1'b0;
	end
	else
	begin
		has_a_write_pending <= (|writes_pending);
		has_a_lsu_active <= (|lsus_active);
	end
end

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vadd_function_cra_slave
	(
		input 		clock,
		input 		resetn,
		output reg [223:0] 		kernel_arguments,
		output reg 		start,
		input 		finish,
		output reg [31:0] 		global_size_0,
		output reg [31:0] 		global_size_1,
		output reg [31:0] 		global_size_2,
		output reg [31:0] 		num_groups_0,
		output reg [31:0] 		num_groups_1,
		output reg [31:0] 		num_groups_2,
		output reg [31:0] 		local_size_0,
		output reg [31:0] 		local_size_1,
		output reg [31:0] 		local_size_2,
		output reg [31:0] 		global_offset_0,
		output reg [31:0] 		global_offset_1,
		output reg [31:0] 		global_offset_2,
		output reg [31:0] 		work_dim,
		output reg [31:0] 		workgroup_size,
		input 		has_a_lsu_active,
		input 		has_a_write_pending,
		input 		valid_in,
		input 		avs_cra_enable,
		input 		avs_cra_read,
		input 		avs_cra_write,
		input [3:0] 		avs_cra_address,
		input [63:0] 		avs_cra_writedata,
		input [7:0] 		avs_cra_byteenable,
		output reg [63:0] 		avs_cra_readdata,
		output reg 		avs_cra_readdatavalid,
		output 		cra_irq
	);


// This section of the wrapper implements an Avalon Slave Interface used to configure a kernel invocation.
// The few words words contain the status and the workgroup size registers.
// The remaining addressable space is reserved for kernel arguments.
 reg started_NO_SHIFT_REG;
 reg [31:0] status_NO_SHIFT_REG;
 reg [63:0] profile_data_NO_SHIFT_REG;
 reg [31:0] profile_ctrl_NO_SHIFT_REG;
 reg [63:0] profile_start_cycle_NO_SHIFT_REG;
 reg [63:0] profile_stop_cycle_NO_SHIFT_REG;
 reg [63:0] cra_readdata_st1_NO_SHIFT_REG;
 reg [3:0] cra_addr_st1_NO_SHIFT_REG;
 reg cra_read_st1_NO_SHIFT_REG;
wire [63:0] bitenable;

assign bitenable[7:0] = (avs_cra_byteenable[0] ? 8'hFF : 8'h0);
assign bitenable[15:8] = (avs_cra_byteenable[1] ? 8'hFF : 8'h0);
assign bitenable[23:16] = (avs_cra_byteenable[2] ? 8'hFF : 8'h0);
assign bitenable[31:24] = (avs_cra_byteenable[3] ? 8'hFF : 8'h0);
assign bitenable[39:32] = (avs_cra_byteenable[4] ? 8'hFF : 8'h0);
assign bitenable[47:40] = (avs_cra_byteenable[5] ? 8'hFF : 8'h0);
assign bitenable[55:48] = (avs_cra_byteenable[6] ? 8'hFF : 8'h0);
assign bitenable[63:56] = (avs_cra_byteenable[7] ? 8'hFF : 8'h0);
assign cra_irq = (status_NO_SHIFT_REG[1] | status_NO_SHIFT_REG[3]);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		start <= 1'b0;
		started_NO_SHIFT_REG <= 1'b0;
		kernel_arguments <= 224'h0;
		status_NO_SHIFT_REG <= 32'h30000;
		profile_ctrl_NO_SHIFT_REG <= 32'h4;
		profile_start_cycle_NO_SHIFT_REG <= 64'h0;
		profile_stop_cycle_NO_SHIFT_REG <= 64'hFFFFFFFFFFFFFFFF;
		work_dim <= 32'h0;
		workgroup_size <= 32'h0;
		global_size_0 <= 32'h0;
		global_size_1 <= 32'h0;
		global_size_2 <= 32'h0;
		num_groups_0 <= 32'h0;
		num_groups_1 <= 32'h0;
		num_groups_2 <= 32'h0;
		local_size_0 <= 32'h0;
		local_size_1 <= 32'h0;
		local_size_2 <= 32'h0;
		global_offset_0 <= 32'h0;
		global_offset_1 <= 32'h0;
		global_offset_2 <= 32'h0;
	end
	else
	begin
		if (avs_cra_write)
		begin
			case (avs_cra_address)
				4'h0:
				begin
					status_NO_SHIFT_REG[31:16] <= 16'h3;
					status_NO_SHIFT_REG[15:0] <= ((status_NO_SHIFT_REG[15:0] & ~(bitenable[15:0])) | (avs_cra_writedata[15:0] & bitenable[15:0]));
				end

				4'h1:
				begin
					profile_ctrl_NO_SHIFT_REG <= ((profile_ctrl_NO_SHIFT_REG & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h3:
				begin
					profile_start_cycle_NO_SHIFT_REG[31:0] <= ((profile_start_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_start_cycle_NO_SHIFT_REG[63:32] <= ((profile_start_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h4:
				begin
					profile_stop_cycle_NO_SHIFT_REG[31:0] <= ((profile_stop_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_stop_cycle_NO_SHIFT_REG[63:32] <= ((profile_stop_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h5:
				begin
					work_dim <= ((work_dim & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					workgroup_size <= ((workgroup_size & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h6:
				begin
					global_size_0 <= ((global_size_0 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_size_1 <= ((global_size_1 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h7:
				begin
					global_size_2 <= ((global_size_2 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_0 <= ((num_groups_0 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h8:
				begin
					num_groups_1 <= ((num_groups_1 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_2 <= ((num_groups_2 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h9:
				begin
					local_size_0 <= ((local_size_0 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					local_size_1 <= ((local_size_1 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hA:
				begin
					local_size_2 <= ((local_size_2 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_0 <= ((global_offset_0 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hB:
				begin
					global_offset_1 <= ((global_offset_1 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_2 <= ((global_offset_2 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hC:
				begin
					kernel_arguments[31:0] <= ((kernel_arguments[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[63:32] <= ((kernel_arguments[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hD:
				begin
					kernel_arguments[95:64] <= ((kernel_arguments[95:64] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[127:96] <= ((kernel_arguments[127:96] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hE:
				begin
					kernel_arguments[159:128] <= ((kernel_arguments[159:128] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[191:160] <= ((kernel_arguments[191:160] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hF:
				begin
					kernel_arguments[223:192] <= ((kernel_arguments[223:192] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
				end

				default:
				begin
				end

			endcase
		end
		else
		begin
			if (status_NO_SHIFT_REG[0])
			begin
				start <= 1'b1;
			end
			if (start)
			begin
				status_NO_SHIFT_REG[0] <= 1'b0;
				started_NO_SHIFT_REG <= 1'b1;
			end
			if (started_NO_SHIFT_REG)
			begin
				start <= 1'b0;
			end
			if (finish)
			begin
				status_NO_SHIFT_REG[1] <= 1'b1;
				started_NO_SHIFT_REG <= 1'b0;
			end
		end
		status_NO_SHIFT_REG[11] <= 1'b0;
		status_NO_SHIFT_REG[12] <= (|has_a_lsu_active);
		status_NO_SHIFT_REG[13] <= (|has_a_write_pending);
		status_NO_SHIFT_REG[14] <= (|valid_in);
		status_NO_SHIFT_REG[15] <= started_NO_SHIFT_REG;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		cra_read_st1_NO_SHIFT_REG <= 1'b0;
		cra_addr_st1_NO_SHIFT_REG <= 4'h0;
		cra_readdata_st1_NO_SHIFT_REG <= 64'h0;
	end
	else
	begin
		cra_read_st1_NO_SHIFT_REG <= avs_cra_read;
		cra_addr_st1_NO_SHIFT_REG <= avs_cra_address;
		case (avs_cra_address)
			4'h0:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= status_NO_SHIFT_REG;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= 32'h0;
			end

			4'h1:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= 'x;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= 32'h0;
			end

			4'h2:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			4'h3:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			4'h4:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			default:
			begin
				cra_readdata_st1_NO_SHIFT_REG <= status_NO_SHIFT_REG;
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		avs_cra_readdatavalid <= 1'b0;
		avs_cra_readdata <= 64'h0;
	end
	else
	begin
		avs_cra_readdatavalid <= cra_read_st1_NO_SHIFT_REG;
		case (cra_addr_st1_NO_SHIFT_REG)
			4'h2:
			begin
				avs_cra_readdata[63:0] <= profile_data_NO_SHIFT_REG;
			end

			default:
			begin
				avs_cra_readdata <= cra_readdata_st1_NO_SHIFT_REG;
			end

		endcase
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vadd_function_wrapper
	(
		input 		clock,
		input 		resetn,
		input 		clock2x,
		input 		local_router_hang,
		output 		has_a_write_pending,
		output 		has_a_lsu_active,
		input [223:0] 		kernel_arguments,
		input 		start,
		input [31:0] 		global_offset_0,
		input [31:0] 		global_offset_1,
		input [31:0] 		global_offset_2,
		input [31:0] 		work_dim,
		output 		kernel_valid_out,
		input [31:0] 		workgroup_size,
		input [31:0] 		global_size_0,
		input [31:0] 		global_size_1,
		input [31:0] 		global_size_2,
		input [31:0] 		num_groups_0,
		input [31:0] 		num_groups_1,
		input [31:0] 		num_groups_2,
		input [31:0] 		local_size_0,
		input [31:0] 		local_size_1,
		input [31:0] 		local_size_2,
		input [31:0] 		local_id_0,
		input [31:0] 		local_id_1,
		input [31:0] 		local_id_2,
		input [31:0] 		global_id_0,
		input [31:0] 		global_id_1,
		input [31:0] 		global_id_2,
		input [31:0] 		group_id_0,
		input [31:0] 		group_id_1,
		input [31:0] 		group_id_2,
		output 		kernel_stall_out,
		input 		kernel_valid_in,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_enable,
		input [511:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_waitrequest,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_address,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_read,
		output 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_write,
		input 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writeack,
		output [511:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writedata,
		output [63:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_b_load_0_inst0_burstcount,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_enable,
		input [511:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdata,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdatavalid,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_waitrequest,
		output [31:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_address,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_read,
		output 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_write,
		input 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writeack,
		output [511:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writedata,
		output [63:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_byteenable,
		output [4:0] 		avm_local_bb0_ld_memcoalesce_a_load_0_inst0_burstcount,
		output 		avm_local_bb0_st_c0_exe1_inst0_enable,
		input [511:0] 		avm_local_bb0_st_c0_exe1_inst0_readdata,
		input 		avm_local_bb0_st_c0_exe1_inst0_readdatavalid,
		input 		avm_local_bb0_st_c0_exe1_inst0_waitrequest,
		output [31:0] 		avm_local_bb0_st_c0_exe1_inst0_address,
		output 		avm_local_bb0_st_c0_exe1_inst0_read,
		output 		avm_local_bb0_st_c0_exe1_inst0_write,
		input 		avm_local_bb0_st_c0_exe1_inst0_writeack,
		output [511:0] 		avm_local_bb0_st_c0_exe1_inst0_writedata,
		output [63:0] 		avm_local_bb0_st_c0_exe1_inst0_byteenable,
		output [4:0] 		avm_local_bb0_st_c0_exe1_inst0_burstcount
	);

// Responsible for interfacing a kernel with the outside world.

// twoXclock_consumer uses clock2x, even if nobody inside the kernel does. Keeps interface to acl_iface consistent for all kernels.
 reg twoXclock_consumer_NO_SHIFT_REG /* synthesis  preserve  noprune  */;
wire stall_in;
wire stall_out;
wire valid_in;
wire valid_out;

assign kernel_valid_out = valid_out;
assign valid_in = kernel_valid_in;
assign kernel_stall_out = stall_out;
assign stall_in = 1'b0;

always @(posedge clock2x or negedge resetn)
begin
	if (~(resetn))
	begin
		twoXclock_consumer_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		twoXclock_consumer_NO_SHIFT_REG <= 1'b1;
	end
end



// This section instantiates a kernel function block
vadd_function vadd_function_inst0 (
	.clock(clock),
	.resetn(resetn),
	.input_global_id_0(global_id_0),
	.stall_out(stall_out),
	.valid_in(valid_in),
	.valid_out(valid_out),
	.stall_in(stall_in),
	.avm_local_bb0_ld_memcoalesce_b_load_0_enable(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_enable),
	.avm_local_bb0_ld_memcoalesce_b_load_0_readdata(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdata),
	.avm_local_bb0_ld_memcoalesce_b_load_0_readdatavalid(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_readdatavalid),
	.avm_local_bb0_ld_memcoalesce_b_load_0_waitrequest(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_waitrequest),
	.avm_local_bb0_ld_memcoalesce_b_load_0_address(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_address),
	.avm_local_bb0_ld_memcoalesce_b_load_0_read(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_read),
	.avm_local_bb0_ld_memcoalesce_b_load_0_write(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_write),
	.avm_local_bb0_ld_memcoalesce_b_load_0_writeack(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writeack),
	.avm_local_bb0_ld_memcoalesce_b_load_0_writedata(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_writedata),
	.avm_local_bb0_ld_memcoalesce_b_load_0_byteenable(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_byteenable),
	.avm_local_bb0_ld_memcoalesce_b_load_0_burstcount(avm_local_bb0_ld_memcoalesce_b_load_0_inst0_burstcount),
	.avm_local_bb0_ld_memcoalesce_a_load_0_enable(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_enable),
	.avm_local_bb0_ld_memcoalesce_a_load_0_readdata(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdata),
	.avm_local_bb0_ld_memcoalesce_a_load_0_readdatavalid(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_readdatavalid),
	.avm_local_bb0_ld_memcoalesce_a_load_0_waitrequest(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_waitrequest),
	.avm_local_bb0_ld_memcoalesce_a_load_0_address(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_address),
	.avm_local_bb0_ld_memcoalesce_a_load_0_read(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_read),
	.avm_local_bb0_ld_memcoalesce_a_load_0_write(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_write),
	.avm_local_bb0_ld_memcoalesce_a_load_0_writeack(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writeack),
	.avm_local_bb0_ld_memcoalesce_a_load_0_writedata(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_writedata),
	.avm_local_bb0_ld_memcoalesce_a_load_0_byteenable(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_byteenable),
	.avm_local_bb0_ld_memcoalesce_a_load_0_burstcount(avm_local_bb0_ld_memcoalesce_a_load_0_inst0_burstcount),
	.avm_local_bb0_st_c0_exe1_enable(avm_local_bb0_st_c0_exe1_inst0_enable),
	.avm_local_bb0_st_c0_exe1_readdata(avm_local_bb0_st_c0_exe1_inst0_readdata),
	.avm_local_bb0_st_c0_exe1_readdatavalid(avm_local_bb0_st_c0_exe1_inst0_readdatavalid),
	.avm_local_bb0_st_c0_exe1_waitrequest(avm_local_bb0_st_c0_exe1_inst0_waitrequest),
	.avm_local_bb0_st_c0_exe1_address(avm_local_bb0_st_c0_exe1_inst0_address),
	.avm_local_bb0_st_c0_exe1_read(avm_local_bb0_st_c0_exe1_inst0_read),
	.avm_local_bb0_st_c0_exe1_write(avm_local_bb0_st_c0_exe1_inst0_write),
	.avm_local_bb0_st_c0_exe1_writeack(avm_local_bb0_st_c0_exe1_inst0_writeack),
	.avm_local_bb0_st_c0_exe1_writedata(avm_local_bb0_st_c0_exe1_inst0_writedata),
	.avm_local_bb0_st_c0_exe1_byteenable(avm_local_bb0_st_c0_exe1_inst0_byteenable),
	.avm_local_bb0_st_c0_exe1_burstcount(avm_local_bb0_st_c0_exe1_inst0_burstcount),
	.clock2x(clock2x),
	.start(start),
	.input_N(kernel_arguments[223:192]),
	.input_a(kernel_arguments[63:0]),
	.input_b(kernel_arguments[127:64]),
	.input_result(kernel_arguments[191:128]),
	.has_a_write_pending(has_a_write_pending),
	.has_a_lsu_active(has_a_lsu_active)
);



endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vadd_sys_cycle_time
	(
		input 		clock,
		input 		resetn,
		output [31:0] 		cur_cycle
	);


 reg [31:0] cur_count_NO_SHIFT_REG;

assign cur_cycle = cur_count_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		cur_count_NO_SHIFT_REG <= 32'h0;
	end
	else
	begin
		cur_count_NO_SHIFT_REG <= (cur_count_NO_SHIFT_REG + 32'h1);
	end
end

endmodule

