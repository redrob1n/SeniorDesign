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
module genetic_algorithm_basic_block_0
	(
		input 		clock,
		input 		resetn,
		input 		start,
		input [31:0] 		input_pop_size,
		input [31:0] 		input_chrom_size,
		input 		valid_in,
		output 		stall_out,
		output 		valid_out,
		input 		stall_in,
		output [63:0] 		lvb_bb0_conv,
		output 		lvb_bb0_cmp11,
		output [63:0] 		lvb_bb0_conv_i19_i,
		output 		lvb_bb0_cmp_i20_i1,
		output 		lvb_bb0_var_,
		output 		lvb_bb0_var__u0,
		output 		lvb_bb0_var__u1,
		input [31:0] 		workgroup_size
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
wire merge_node_stall_in_0;
 reg merge_node_valid_out_0_NO_SHIFT_REG;
wire merge_node_stall_in_1;
 reg merge_node_valid_out_1_NO_SHIFT_REG;
wire merge_node_stall_in_2;
 reg merge_node_valid_out_2_NO_SHIFT_REG;
wire merge_node_stall_in_3;
 reg merge_node_valid_out_3_NO_SHIFT_REG;
wire merge_node_stall_in_4;
 reg merge_node_valid_out_4_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_staging_reg_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = ((merge_node_stall_in_0 & merge_node_valid_out_0_NO_SHIFT_REG) | (merge_node_stall_in_1 & merge_node_valid_out_1_NO_SHIFT_REG) | (merge_node_stall_in_2 & merge_node_valid_out_2_NO_SHIFT_REG) | (merge_node_stall_in_3 & merge_node_valid_out_3_NO_SHIFT_REG) | (merge_node_stall_in_4 & merge_node_valid_out_4_NO_SHIFT_REG));
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
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_3_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_4_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_0_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_1_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_2_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_3_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_4_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in_0))
			begin
				merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_1))
			begin
				merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_2))
			begin
				merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_3))
			begin
				merge_node_valid_out_3_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_4))
			begin
				merge_node_valid_out_4_NO_SHIFT_REG <= 1'b0;
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


// This section implements a registered operation.
// 
wire local_bb0_conv_inputs_ready;
 reg local_bb0_conv_wii_reg_NO_SHIFT_REG;
 reg local_bb0_conv_valid_out_NO_SHIFT_REG;
wire local_bb0_conv_stall_in;
wire local_bb0_conv_output_regs_ready;
 reg [63:0] local_bb0_conv_NO_SHIFT_REG;
wire local_bb0_conv_causedstall;

assign local_bb0_conv_inputs_ready = merge_node_valid_out_0_NO_SHIFT_REG;
assign local_bb0_conv_output_regs_ready = (~(local_bb0_conv_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_conv_valid_out_NO_SHIFT_REG) | ~(local_bb0_conv_stall_in))));
assign merge_node_stall_in_0 = (~(local_bb0_conv_wii_reg_NO_SHIFT_REG) & (~(local_bb0_conv_output_regs_ready) | ~(local_bb0_conv_inputs_ready)));
assign local_bb0_conv_causedstall = (local_bb0_conv_inputs_ready && (~(local_bb0_conv_output_regs_ready) && !(~(local_bb0_conv_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_NO_SHIFT_REG <= 'x;
		local_bb0_conv_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_conv_NO_SHIFT_REG <= 'x;
			local_bb0_conv_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_conv_output_regs_ready)
			begin
				local_bb0_conv_NO_SHIFT_REG <= $signed(input_pop_size);
				local_bb0_conv_valid_out_NO_SHIFT_REG <= local_bb0_conv_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_conv_stall_in))
				begin
					local_bb0_conv_valid_out_NO_SHIFT_REG <= local_bb0_conv_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_conv_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_conv_inputs_ready)
			begin
				local_bb0_conv_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_cmp11_inputs_ready;
 reg local_bb0_cmp11_wii_reg_NO_SHIFT_REG;
 reg local_bb0_cmp11_valid_out_0_NO_SHIFT_REG;
wire local_bb0_cmp11_stall_in_0;
 reg local_bb0_cmp11_valid_out_1_NO_SHIFT_REG;
wire local_bb0_cmp11_stall_in_1;
 reg local_bb0_cmp11_valid_out_2_NO_SHIFT_REG;
wire local_bb0_cmp11_stall_in_2;
wire local_bb0_cmp11_output_regs_ready;
 reg local_bb0_cmp11_NO_SHIFT_REG;
wire local_bb0_cmp11_causedstall;

assign local_bb0_cmp11_inputs_ready = merge_node_valid_out_1_NO_SHIFT_REG;
assign local_bb0_cmp11_output_regs_ready = (~(local_bb0_cmp11_wii_reg_NO_SHIFT_REG) & ((~(local_bb0_cmp11_valid_out_0_NO_SHIFT_REG) | ~(local_bb0_cmp11_stall_in_0)) & (~(local_bb0_cmp11_valid_out_1_NO_SHIFT_REG) | ~(local_bb0_cmp11_stall_in_1)) & (~(local_bb0_cmp11_valid_out_2_NO_SHIFT_REG) | ~(local_bb0_cmp11_stall_in_2))));
assign merge_node_stall_in_1 = (~(local_bb0_cmp11_wii_reg_NO_SHIFT_REG) & (~(local_bb0_cmp11_output_regs_ready) | ~(local_bb0_cmp11_inputs_ready)));
assign local_bb0_cmp11_causedstall = (local_bb0_cmp11_inputs_ready && (~(local_bb0_cmp11_output_regs_ready) && !(~(local_bb0_cmp11_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp11_NO_SHIFT_REG <= 'x;
		local_bb0_cmp11_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_cmp11_valid_out_1_NO_SHIFT_REG <= 1'b0;
		local_bb0_cmp11_valid_out_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp11_NO_SHIFT_REG <= 'x;
			local_bb0_cmp11_valid_out_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_cmp11_valid_out_1_NO_SHIFT_REG <= 1'b0;
			local_bb0_cmp11_valid_out_2_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp11_output_regs_ready)
			begin
				local_bb0_cmp11_NO_SHIFT_REG <= (input_pop_size == 32'h0);
				local_bb0_cmp11_valid_out_0_NO_SHIFT_REG <= local_bb0_cmp11_inputs_ready;
				local_bb0_cmp11_valid_out_1_NO_SHIFT_REG <= local_bb0_cmp11_inputs_ready;
				local_bb0_cmp11_valid_out_2_NO_SHIFT_REG <= local_bb0_cmp11_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_cmp11_stall_in_0))
				begin
					local_bb0_cmp11_valid_out_0_NO_SHIFT_REG <= local_bb0_cmp11_wii_reg_NO_SHIFT_REG;
				end
				if (~(local_bb0_cmp11_stall_in_1))
				begin
					local_bb0_cmp11_valid_out_1_NO_SHIFT_REG <= local_bb0_cmp11_wii_reg_NO_SHIFT_REG;
				end
				if (~(local_bb0_cmp11_stall_in_2))
				begin
					local_bb0_cmp11_valid_out_2_NO_SHIFT_REG <= local_bb0_cmp11_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp11_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp11_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp11_inputs_ready)
			begin
				local_bb0_cmp11_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_conv_i19_i_inputs_ready;
 reg local_bb0_conv_i19_i_wii_reg_NO_SHIFT_REG;
 reg local_bb0_conv_i19_i_valid_out_NO_SHIFT_REG;
wire local_bb0_conv_i19_i_stall_in;
wire local_bb0_conv_i19_i_output_regs_ready;
 reg [63:0] local_bb0_conv_i19_i_NO_SHIFT_REG;
wire local_bb0_conv_i19_i_causedstall;

assign local_bb0_conv_i19_i_inputs_ready = merge_node_valid_out_2_NO_SHIFT_REG;
assign local_bb0_conv_i19_i_output_regs_ready = (~(local_bb0_conv_i19_i_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_conv_i19_i_valid_out_NO_SHIFT_REG) | ~(local_bb0_conv_i19_i_stall_in))));
assign merge_node_stall_in_2 = (~(local_bb0_conv_i19_i_wii_reg_NO_SHIFT_REG) & (~(local_bb0_conv_i19_i_output_regs_ready) | ~(local_bb0_conv_i19_i_inputs_ready)));
assign local_bb0_conv_i19_i_causedstall = (local_bb0_conv_i19_i_inputs_ready && (~(local_bb0_conv_i19_i_output_regs_ready) && !(~(local_bb0_conv_i19_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_i19_i_NO_SHIFT_REG <= 'x;
		local_bb0_conv_i19_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_conv_i19_i_NO_SHIFT_REG <= 'x;
			local_bb0_conv_i19_i_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_conv_i19_i_output_regs_ready)
			begin
				local_bb0_conv_i19_i_NO_SHIFT_REG <= $signed(input_chrom_size);
				local_bb0_conv_i19_i_valid_out_NO_SHIFT_REG <= local_bb0_conv_i19_i_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_conv_i19_i_stall_in))
				begin
					local_bb0_conv_i19_i_valid_out_NO_SHIFT_REG <= local_bb0_conv_i19_i_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_conv_i19_i_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_conv_i19_i_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_conv_i19_i_inputs_ready)
			begin
				local_bb0_conv_i19_i_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_cmp_i20_i1_inputs_ready;
 reg local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG;
 reg local_bb0_cmp_i20_i1_valid_out_0_NO_SHIFT_REG;
wire local_bb0_cmp_i20_i1_stall_in_0;
 reg local_bb0_cmp_i20_i1_valid_out_1_NO_SHIFT_REG;
wire local_bb0_cmp_i20_i1_stall_in_1;
wire local_bb0_cmp_i20_i1_output_regs_ready;
 reg local_bb0_cmp_i20_i1_NO_SHIFT_REG;
wire local_bb0_cmp_i20_i1_causedstall;

assign local_bb0_cmp_i20_i1_inputs_ready = merge_node_valid_out_3_NO_SHIFT_REG;
assign local_bb0_cmp_i20_i1_output_regs_ready = (~(local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG) & ((~(local_bb0_cmp_i20_i1_valid_out_0_NO_SHIFT_REG) | ~(local_bb0_cmp_i20_i1_stall_in_0)) & (~(local_bb0_cmp_i20_i1_valid_out_1_NO_SHIFT_REG) | ~(local_bb0_cmp_i20_i1_stall_in_1))));
assign merge_node_stall_in_3 = (~(local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG) & (~(local_bb0_cmp_i20_i1_output_regs_ready) | ~(local_bb0_cmp_i20_i1_inputs_ready)));
assign local_bb0_cmp_i20_i1_causedstall = (local_bb0_cmp_i20_i1_inputs_ready && (~(local_bb0_cmp_i20_i1_output_regs_ready) && !(~(local_bb0_cmp_i20_i1_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp_i20_i1_NO_SHIFT_REG <= 'x;
		local_bb0_cmp_i20_i1_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_cmp_i20_i1_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp_i20_i1_NO_SHIFT_REG <= 'x;
			local_bb0_cmp_i20_i1_valid_out_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_cmp_i20_i1_valid_out_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp_i20_i1_output_regs_ready)
			begin
				local_bb0_cmp_i20_i1_NO_SHIFT_REG <= (input_chrom_size == 32'h0);
				local_bb0_cmp_i20_i1_valid_out_0_NO_SHIFT_REG <= local_bb0_cmp_i20_i1_inputs_ready;
				local_bb0_cmp_i20_i1_valid_out_1_NO_SHIFT_REG <= local_bb0_cmp_i20_i1_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_cmp_i20_i1_stall_in_0))
				begin
					local_bb0_cmp_i20_i1_valid_out_0_NO_SHIFT_REG <= local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG;
				end
				if (~(local_bb0_cmp_i20_i1_stall_in_1))
				begin
					local_bb0_cmp_i20_i1_valid_out_1_NO_SHIFT_REG <= local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_cmp_i20_i1_inputs_ready)
			begin
				local_bb0_cmp_i20_i1_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_var__u1_inputs_ready;
 reg local_bb0_var__u1_wii_reg_NO_SHIFT_REG;
 reg local_bb0_var__u1_valid_out_NO_SHIFT_REG;
wire local_bb0_var__u1_stall_in;
wire local_bb0_var__u1_output_regs_ready;
 reg local_bb0_var__u1_NO_SHIFT_REG;
wire local_bb0_var__u1_causedstall;

assign local_bb0_var__u1_inputs_ready = local_bb0_cmp11_valid_out_1_NO_SHIFT_REG;
assign local_bb0_var__u1_output_regs_ready = (~(local_bb0_var__u1_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_var__u1_valid_out_NO_SHIFT_REG) | ~(local_bb0_var__u1_stall_in))));
assign local_bb0_cmp11_stall_in_1 = (~(local_bb0_var__u1_wii_reg_NO_SHIFT_REG) & (~(local_bb0_var__u1_output_regs_ready) | ~(local_bb0_var__u1_inputs_ready)));
assign local_bb0_var__u1_causedstall = (local_bb0_var__u1_inputs_ready && (~(local_bb0_var__u1_output_regs_ready) && !(~(local_bb0_var__u1_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__u1_NO_SHIFT_REG <= 'x;
		local_bb0_var__u1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__u1_NO_SHIFT_REG <= 'x;
			local_bb0_var__u1_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__u1_output_regs_ready)
			begin
				local_bb0_var__u1_NO_SHIFT_REG <= (local_bb0_cmp11_NO_SHIFT_REG ^ 1'b1);
				local_bb0_var__u1_valid_out_NO_SHIFT_REG <= local_bb0_var__u1_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_var__u1_stall_in))
				begin
					local_bb0_var__u1_valid_out_NO_SHIFT_REG <= local_bb0_var__u1_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__u1_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__u1_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__u1_inputs_ready)
			begin
				local_bb0_var__u1_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_var__inputs_ready;
 reg local_bb0_var__wii_reg_NO_SHIFT_REG;
 reg local_bb0_var__valid_out_0_NO_SHIFT_REG;
wire local_bb0_var__stall_in_0;
 reg local_bb0_var__valid_out_1_NO_SHIFT_REG;
wire local_bb0_var__stall_in_1;
wire local_bb0_var__output_regs_ready;
 reg local_bb0_var__NO_SHIFT_REG;
wire local_bb0_var__causedstall;

assign local_bb0_var__inputs_ready = (local_bb0_cmp11_valid_out_0_NO_SHIFT_REG & local_bb0_cmp_i20_i1_valid_out_0_NO_SHIFT_REG);
assign local_bb0_var__output_regs_ready = (~(local_bb0_var__wii_reg_NO_SHIFT_REG) & ((~(local_bb0_var__valid_out_0_NO_SHIFT_REG) | ~(local_bb0_var__stall_in_0)) & (~(local_bb0_var__valid_out_1_NO_SHIFT_REG) | ~(local_bb0_var__stall_in_1))));
assign local_bb0_cmp11_stall_in_0 = (~(local_bb0_var__wii_reg_NO_SHIFT_REG) & (~(local_bb0_var__output_regs_ready) | ~(local_bb0_var__inputs_ready)));
assign local_bb0_cmp_i20_i1_stall_in_0 = (~(local_bb0_var__wii_reg_NO_SHIFT_REG) & (~(local_bb0_var__output_regs_ready) | ~(local_bb0_var__inputs_ready)));
assign local_bb0_var__causedstall = (local_bb0_var__inputs_ready && (~(local_bb0_var__output_regs_ready) && !(~(local_bb0_var__output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__NO_SHIFT_REG <= 'x;
		local_bb0_var__valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_var__valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__NO_SHIFT_REG <= 'x;
			local_bb0_var__valid_out_0_NO_SHIFT_REG <= 1'b0;
			local_bb0_var__valid_out_1_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__output_regs_ready)
			begin
				local_bb0_var__NO_SHIFT_REG <= (local_bb0_cmp11_NO_SHIFT_REG | local_bb0_cmp_i20_i1_NO_SHIFT_REG);
				local_bb0_var__valid_out_0_NO_SHIFT_REG <= local_bb0_var__inputs_ready;
				local_bb0_var__valid_out_1_NO_SHIFT_REG <= local_bb0_var__inputs_ready;
			end
			else
			begin
				if (~(local_bb0_var__stall_in_0))
				begin
					local_bb0_var__valid_out_0_NO_SHIFT_REG <= local_bb0_var__wii_reg_NO_SHIFT_REG;
				end
				if (~(local_bb0_var__stall_in_1))
				begin
					local_bb0_var__valid_out_1_NO_SHIFT_REG <= local_bb0_var__wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__inputs_ready)
			begin
				local_bb0_var__wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_var__u0_inputs_ready;
 reg local_bb0_var__u0_wii_reg_NO_SHIFT_REG;
 reg local_bb0_var__u0_valid_out_NO_SHIFT_REG;
wire local_bb0_var__u0_stall_in;
wire local_bb0_var__u0_output_regs_ready;
 reg local_bb0_var__u0_NO_SHIFT_REG;
wire local_bb0_var__u0_causedstall;

assign local_bb0_var__u0_inputs_ready = local_bb0_var__valid_out_0_NO_SHIFT_REG;
assign local_bb0_var__u0_output_regs_ready = (~(local_bb0_var__u0_wii_reg_NO_SHIFT_REG) & (&(~(local_bb0_var__u0_valid_out_NO_SHIFT_REG) | ~(local_bb0_var__u0_stall_in))));
assign local_bb0_var__stall_in_0 = (~(local_bb0_var__u0_wii_reg_NO_SHIFT_REG) & (~(local_bb0_var__u0_output_regs_ready) | ~(local_bb0_var__u0_inputs_ready)));
assign local_bb0_var__u0_causedstall = (local_bb0_var__u0_inputs_ready && (~(local_bb0_var__u0_output_regs_ready) && !(~(local_bb0_var__u0_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__u0_NO_SHIFT_REG <= 'x;
		local_bb0_var__u0_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__u0_NO_SHIFT_REG <= 'x;
			local_bb0_var__u0_valid_out_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__u0_output_regs_ready)
			begin
				local_bb0_var__u0_NO_SHIFT_REG <= (local_bb0_var__NO_SHIFT_REG ^ 1'b1);
				local_bb0_var__u0_valid_out_NO_SHIFT_REG <= local_bb0_var__u0_inputs_ready;
			end
			else
			begin
				if (~(local_bb0_var__u0_stall_in))
				begin
					local_bb0_var__u0_valid_out_NO_SHIFT_REG <= local_bb0_var__u0_wii_reg_NO_SHIFT_REG;
				end
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_var__u0_wii_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (start)
		begin
			local_bb0_var__u0_wii_reg_NO_SHIFT_REG <= 1'b0;
		end
		else
		begin
			if (local_bb0_var__u0_inputs_ready)
			begin
				local_bb0_var__u0_wii_reg_NO_SHIFT_REG <= 1'b1;
			end
		end
	end
end


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;
 reg [63:0] lvb_bb0_conv_reg_NO_SHIFT_REG;
 reg lvb_bb0_cmp11_reg_NO_SHIFT_REG;
 reg [63:0] lvb_bb0_conv_i19_i_reg_NO_SHIFT_REG;
 reg lvb_bb0_cmp_i20_i1_reg_NO_SHIFT_REG;
 reg lvb_bb0_var__reg_NO_SHIFT_REG;
 reg lvb_bb0_var__u0_reg_NO_SHIFT_REG;
 reg lvb_bb0_var__u1_reg_NO_SHIFT_REG;

assign branch_var__inputs_ready = (merge_node_valid_out_4_NO_SHIFT_REG & local_bb0_var__u1_valid_out_NO_SHIFT_REG & local_bb0_var__u0_valid_out_NO_SHIFT_REG & local_bb0_conv_i19_i_valid_out_NO_SHIFT_REG & local_bb0_conv_valid_out_NO_SHIFT_REG & local_bb0_cmp11_valid_out_2_NO_SHIFT_REG & local_bb0_cmp_i20_i1_valid_out_1_NO_SHIFT_REG & local_bb0_var__valid_out_1_NO_SHIFT_REG);
assign branch_var__output_regs_ready = (~(stall_in) | ~(branch_node_valid_out_NO_SHIFT_REG));
assign merge_node_stall_in_4 = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_var__u1_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_var__u0_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_conv_i19_i_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_conv_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_cmp11_stall_in_2 = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_cmp_i20_i1_stall_in_1 = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign local_bb0_var__stall_in_1 = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign lvb_bb0_conv = lvb_bb0_conv_reg_NO_SHIFT_REG;
assign lvb_bb0_cmp11 = lvb_bb0_cmp11_reg_NO_SHIFT_REG;
assign lvb_bb0_conv_i19_i = lvb_bb0_conv_i19_i_reg_NO_SHIFT_REG;
assign lvb_bb0_cmp_i20_i1 = lvb_bb0_cmp_i20_i1_reg_NO_SHIFT_REG;
assign lvb_bb0_var_ = lvb_bb0_var__reg_NO_SHIFT_REG;
assign lvb_bb0_var__u0 = lvb_bb0_var__u0_reg_NO_SHIFT_REG;
assign lvb_bb0_var__u1 = lvb_bb0_var__u1_reg_NO_SHIFT_REG;
assign combined_branch_stall_in_signal = stall_in;
assign valid_out = branch_node_valid_out_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
		lvb_bb0_conv_reg_NO_SHIFT_REG <= 'x;
		lvb_bb0_cmp11_reg_NO_SHIFT_REG <= 'x;
		lvb_bb0_conv_i19_i_reg_NO_SHIFT_REG <= 'x;
		lvb_bb0_cmp_i20_i1_reg_NO_SHIFT_REG <= 'x;
		lvb_bb0_var__reg_NO_SHIFT_REG <= 'x;
		lvb_bb0_var__u0_reg_NO_SHIFT_REG <= 'x;
		lvb_bb0_var__u1_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_NO_SHIFT_REG <= branch_var__inputs_ready;
			lvb_bb0_conv_reg_NO_SHIFT_REG <= local_bb0_conv_NO_SHIFT_REG;
			lvb_bb0_cmp11_reg_NO_SHIFT_REG <= local_bb0_cmp11_NO_SHIFT_REG;
			lvb_bb0_conv_i19_i_reg_NO_SHIFT_REG <= local_bb0_conv_i19_i_NO_SHIFT_REG;
			lvb_bb0_cmp_i20_i1_reg_NO_SHIFT_REG <= local_bb0_cmp_i20_i1_NO_SHIFT_REG;
			lvb_bb0_var__reg_NO_SHIFT_REG <= local_bb0_var__NO_SHIFT_REG;
			lvb_bb0_var__u0_reg_NO_SHIFT_REG <= local_bb0_var__u0_NO_SHIFT_REG;
			lvb_bb0_var__u1_reg_NO_SHIFT_REG <= local_bb0_var__u1_NO_SHIFT_REG;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_1
	(
		input 		clock,
		input 		resetn,
		input [31:0] 		input_min_fit_fun,
		input [63:0] 		input_wii_conv,
		input 		input_wii_cmp11,
		input [63:0] 		input_wii_conv_i19_i,
		input 		input_wii_cmp_i20_i1,
		input 		input_wii_var_,
		input 		input_wii_var__u2,
		input 		input_wii_var__u3,
		input 		valid_in_0,
		output 		stall_out_0,
		input 		input_forked_0,
		input 		valid_in_1,
		output 		stall_out_1,
		input 		input_forked_1,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		input 		start,
		input [63:0] 		ffwd_7_0,
		input [31:0] 		ffwd_6_0,
		output [63:0] 		ffwd_0_0,
		output [31:0] 		ffwd_1_0,
		output [63:0] 		ffwd_2_0
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((valid_in_0 & valid_in_1) & ~((stall_out_0 | stall_out_1)));
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
wire merge_node_stall_in_0;
 reg merge_node_valid_out_0_NO_SHIFT_REG;
wire merge_node_stall_in_1;
 reg merge_node_valid_out_1_NO_SHIFT_REG;
wire merge_node_stall_in_2;
 reg merge_node_valid_out_2_NO_SHIFT_REG;
wire merge_node_stall_in_3;
 reg merge_node_valid_out_3_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
 reg input_forked_0_staging_reg_NO_SHIFT_REG;
 reg local_lvm_forked_NO_SHIFT_REG;
 reg merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;
 reg input_forked_1_staging_reg_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = ((merge_node_stall_in_0 & merge_node_valid_out_0_NO_SHIFT_REG) | (merge_node_stall_in_1 & merge_node_valid_out_1_NO_SHIFT_REG) | (merge_node_stall_in_2 & merge_node_valid_out_2_NO_SHIFT_REG) | (merge_node_stall_in_3 & merge_node_valid_out_3_NO_SHIFT_REG));
assign stall_out_0 = merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
assign stall_out_1 = merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_0_staging_reg_NO_SHIFT_REG | valid_in_0))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		if ((merge_node_valid_in_1_staging_reg_NO_SHIFT_REG | valid_in_1))
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b1;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
		end
		else
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b0;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_forked_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		input_forked_1_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_0_staging_reg_NO_SHIFT_REG))
			begin
				input_forked_0_staging_reg_NO_SHIFT_REG <= input_forked_0;
				merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= valid_in_0;
			end
		end
		else
		begin
			merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
		if (((merge_block_selector_NO_SHIFT_REG != 1'b1) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_1_staging_reg_NO_SHIFT_REG))
			begin
				input_forked_1_staging_reg_NO_SHIFT_REG <= input_forked_1;
				merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= valid_in_1;
			end
		end
		else
		begin
			merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
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
				if (merge_node_valid_in_0_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked_NO_SHIFT_REG <= input_forked_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked_NO_SHIFT_REG <= input_forked_0;
				end
			end

			1'b1:
			begin
				if (merge_node_valid_in_1_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked_NO_SHIFT_REG <= input_forked_1_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked_NO_SHIFT_REG <= input_forked_1;
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
		merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_0_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_2_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in_0))
			begin
				merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_2))
			begin
				merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	merge_node_valid_out_1_NO_SHIFT_REG = merge_node_valid_out_0_NO_SHIFT_REG;
	merge_node_valid_out_3_NO_SHIFT_REG = merge_node_valid_out_2_NO_SHIFT_REG;
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
wire local_bb1_inc14134_acl_ffwd_dest_i64_7_stall_local;
wire [63:0] local_bb1_inc14134_acl_ffwd_dest_i64_7;

assign local_bb1_inc14134_acl_ffwd_dest_i64_7 = ffwd_7_0;

// This section implements an unregistered operation.
// 
wire local_bb1_do_directly_for_inc13_loopexit_select133_acl_ffwd_dest_i32_6_stall_local;
wire [31:0] local_bb1_do_directly_for_inc13_loopexit_select133_acl_ffwd_dest_i32_6;

assign local_bb1_do_directly_for_inc13_loopexit_select133_acl_ffwd_dest_i32_6 = ffwd_6_0;

// This section implements an unregistered operation.
// 
wire local_bb1_j_013_replace_phi_stall_local;
wire [63:0] local_bb1_j_013_replace_phi;

assign local_bb1_j_013_replace_phi = (local_lvm_forked_NO_SHIFT_REG ? 64'h0 : local_bb1_inc14134_acl_ffwd_dest_i64_7);

// This section implements an unregistered operation.
// 
wire local_bb1_min_fit_fun_addr_012_replace_phi_stall_local;
wire [31:0] local_bb1_min_fit_fun_addr_012_replace_phi;

assign local_bb1_min_fit_fun_addr_012_replace_phi = (local_lvm_forked_NO_SHIFT_REG ? input_min_fit_fun : local_bb1_do_directly_for_inc13_loopexit_select133_acl_ffwd_dest_i32_6);

// This section implements an unregistered operation.
// 
wire local_bb1_var__stall_local;
wire [63:0] local_bb1_var_;

assign local_bb1_var_ = (local_bb1_j_013_replace_phi << 64'h6);

// This section implements an unregistered operation.
// 
wire local_bb1__j_013_replace_phi_stall_local;
wire local_bb1__j_013_replace_phi;
 reg [63:0] ffwd_0_0_reg_NO_SHIFT_REG;
wire local_bb1__j_013_replace_phi_inputs_ready;

assign ffwd_0_0 = ffwd_0_0_reg_NO_SHIFT_REG;

always @(posedge clock)
begin
	if ((1'b1 & local_bb1__j_013_replace_phi_inputs_ready))
	begin
		ffwd_0_0_reg_NO_SHIFT_REG <= local_bb1_j_013_replace_phi;
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1__min_fit_fun_addr_012_replace_phi_valid_out;
wire local_bb1__min_fit_fun_addr_012_replace_phi_stall_in;
wire local_bb1__min_fit_fun_addr_012_replace_phi_inputs_ready;
wire local_bb1__min_fit_fun_addr_012_replace_phi_stall_local;
wire local_bb1__min_fit_fun_addr_012_replace_phi;
 reg [31:0] ffwd_1_0_reg_NO_SHIFT_REG;

assign local_bb1__min_fit_fun_addr_012_replace_phi_inputs_ready = (merge_node_valid_out_2_NO_SHIFT_REG & merge_node_valid_out_3_NO_SHIFT_REG);
assign ffwd_1_0 = ffwd_1_0_reg_NO_SHIFT_REG;
assign local_bb1__min_fit_fun_addr_012_replace_phi_valid_out = local_bb1__min_fit_fun_addr_012_replace_phi_inputs_ready;
assign local_bb1__min_fit_fun_addr_012_replace_phi_stall_local = local_bb1__min_fit_fun_addr_012_replace_phi_stall_in;
assign merge_node_stall_in_2 = (local_bb1__min_fit_fun_addr_012_replace_phi_stall_local | ~(local_bb1__min_fit_fun_addr_012_replace_phi_inputs_ready));
assign merge_node_stall_in_3 = (local_bb1__min_fit_fun_addr_012_replace_phi_stall_local | ~(local_bb1__min_fit_fun_addr_012_replace_phi_inputs_ready));

always @(posedge clock)
begin
	if ((1'b1 & local_bb1__min_fit_fun_addr_012_replace_phi_inputs_ready))
	begin
		ffwd_1_0_reg_NO_SHIFT_REG <= local_bb1_min_fit_fun_addr_012_replace_phi;
	end
end


// This section implements an unregistered operation.
// 
wire local_bb1__add126_stall_local;
wire [63:0] local_bb1__add126;

assign local_bb1__add126 = (local_bb1_j_013_replace_phi + (local_bb1_var_ & 64'hFFFFFFFFFFFFFFC0));

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_NO_SHIFT_REG;
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb1__min_fit_fun_addr_012_replace_phi),
	.data_out(rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb1__min_fit_fun_addr_012_replace_phi_valid_out;
assign local_bb1__min_fit_fun_addr_012_replace_phi_stall_in = rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_NO_SHIFT_REG = rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_valid_out_reg_2_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb1__j_013_replace_phi_valid_out;
wire local_bb1__j_013_replace_phi_stall_in;
wire local_bb1___add126_valid_out;
wire local_bb1___add126_stall_in;
wire local_bb1___add126_inputs_ready;
wire local_bb1___add126_stall_local;
wire local_bb1___add126;
 reg [63:0] ffwd_2_0_reg_NO_SHIFT_REG;
 reg local_bb1__j_013_replace_phi_consumed_0_NO_SHIFT_REG;
 reg local_bb1___add126_consumed_0_NO_SHIFT_REG;

assign local_bb1___add126_inputs_ready = (merge_node_valid_out_0_NO_SHIFT_REG & merge_node_valid_out_1_NO_SHIFT_REG);
assign local_bb1__j_013_replace_phi_inputs_ready = (merge_node_valid_out_0_NO_SHIFT_REG & merge_node_valid_out_1_NO_SHIFT_REG);
assign ffwd_2_0 = ffwd_2_0_reg_NO_SHIFT_REG;
assign local_bb1___add126_stall_local = ((local_bb1__j_013_replace_phi_stall_in & ~(local_bb1__j_013_replace_phi_consumed_0_NO_SHIFT_REG)) | (local_bb1___add126_stall_in & ~(local_bb1___add126_consumed_0_NO_SHIFT_REG)));
assign local_bb1__j_013_replace_phi_valid_out = (local_bb1___add126_inputs_ready & ~(local_bb1__j_013_replace_phi_consumed_0_NO_SHIFT_REG));
assign local_bb1___add126_valid_out = (local_bb1___add126_inputs_ready & ~(local_bb1___add126_consumed_0_NO_SHIFT_REG));
assign merge_node_stall_in_0 = (local_bb1___add126_stall_local | ~(local_bb1___add126_inputs_ready));
assign merge_node_stall_in_1 = (local_bb1___add126_stall_local | ~(local_bb1___add126_inputs_ready));

always @(posedge clock)
begin
	if ((1'b1 & local_bb1___add126_inputs_ready))
	begin
		ffwd_2_0_reg_NO_SHIFT_REG <= local_bb1__add126;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb1__j_013_replace_phi_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb1___add126_consumed_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		local_bb1__j_013_replace_phi_consumed_0_NO_SHIFT_REG <= (local_bb1___add126_inputs_ready & (local_bb1__j_013_replace_phi_consumed_0_NO_SHIFT_REG | ~(local_bb1__j_013_replace_phi_stall_in)) & local_bb1___add126_stall_local);
		local_bb1___add126_consumed_0_NO_SHIFT_REG <= (local_bb1___add126_inputs_ready & (local_bb1___add126_consumed_0_NO_SHIFT_REG | ~(local_bb1___add126_stall_in)) & local_bb1___add126_stall_local);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb1__j_013_replace_phi_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb1__j_013_replace_phi_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb1__j_013_replace_phi_0_NO_SHIFT_REG;
 logic rnode_1to2_bb1__j_013_replace_phi_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb1__j_013_replace_phi_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1__j_013_replace_phi_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1__j_013_replace_phi_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1__j_013_replace_phi_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb1__j_013_replace_phi_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb1__j_013_replace_phi_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb1__j_013_replace_phi_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb1__j_013_replace_phi_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb1__j_013_replace_phi_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb1__j_013_replace_phi),
	.data_out(rnode_1to2_bb1__j_013_replace_phi_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb1__j_013_replace_phi_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb1__j_013_replace_phi_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb1__j_013_replace_phi_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb1__j_013_replace_phi_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb1__j_013_replace_phi_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb1__j_013_replace_phi_valid_out;
assign local_bb1__j_013_replace_phi_stall_in = rnode_1to2_bb1__j_013_replace_phi_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1__j_013_replace_phi_0_NO_SHIFT_REG = rnode_1to2_bb1__j_013_replace_phi_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1__j_013_replace_phi_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb1__j_013_replace_phi_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb1__j_013_replace_phi_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb1__j_013_replace_phi_0_valid_out_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb1___add126_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb1___add126_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb1___add126_0_NO_SHIFT_REG;
 logic rnode_1to2_bb1___add126_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb1___add126_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1___add126_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1___add126_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb1___add126_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb1___add126_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb1___add126_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb1___add126_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb1___add126_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb1___add126_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb1___add126),
	.data_out(rnode_1to2_bb1___add126_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb1___add126_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb1___add126_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb1___add126_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb1___add126_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb1___add126_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb1___add126_valid_out;
assign local_bb1___add126_stall_in = rnode_1to2_bb1___add126_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1___add126_0_NO_SHIFT_REG = rnode_1to2_bb1___add126_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb1___add126_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb1___add126_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb1___add126_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb1___add126_0_valid_out_reg_2_NO_SHIFT_REG;

// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;

assign branch_var__inputs_ready = (rnode_1to2_bb1___add126_0_valid_out_NO_SHIFT_REG & rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_valid_out_NO_SHIFT_REG & rnode_1to2_bb1__j_013_replace_phi_0_valid_out_NO_SHIFT_REG);
assign branch_var__output_regs_ready = (~(stall_in) | ~(branch_node_valid_out_NO_SHIFT_REG));
assign rnode_1to2_bb1___add126_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rnode_1to2_bb1__min_fit_fun_addr_012_replace_phi_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rnode_1to2_bb1__j_013_replace_phi_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign combined_branch_stall_in_signal = stall_in;
assign valid_out = branch_node_valid_out_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_NO_SHIFT_REG <= branch_var__inputs_ready;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_2
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_pop1,
		input [63:0] 		input_wii_conv,
		input 		input_wii_cmp11,
		input [63:0] 		input_wii_conv_i19_i,
		input 		input_wii_cmp_i20_i1,
		input 		input_wii_var_,
		input 		input_wii_var__u4,
		input 		input_wii_var__u5,
		input 		valid_in_0,
		output 		stall_out_0,
		input 		input_forked154_0,
		input 		valid_in_1,
		output 		stall_out_1,
		input 		input_forked154_1,
		output 		valid_out_0,
		input 		stall_in_0,
		output 		valid_out_1,
		input 		stall_in_1,
		input [31:0] 		workgroup_size,
		input 		start,
		input 		feedback_valid_in_11,
		output 		feedback_stall_out_11,
		input [63:0] 		feedback_data_in_11,
		output 		feedback_stall_out_0,
		input 		feedback_valid_in_1,
		output 		feedback_stall_out_1,
		input 		feedback_data_in_1,
		output 		acl_pipelined_valid,
		input 		acl_pipelined_stall,
		output 		acl_pipelined_exiting_valid,
		output 		acl_pipelined_exiting_stall,
		output 		feedback_valid_out_11,
		input 		feedback_stall_in_11,
		output [63:0] 		feedback_data_out_11,
		output 		feedback_valid_out_1,
		input 		feedback_stall_in_1,
		output 		feedback_data_out_1,
		output 		avm_local_bb2_ld__enable,
		input [511:0] 		avm_local_bb2_ld__readdata,
		input 		avm_local_bb2_ld__readdatavalid,
		input 		avm_local_bb2_ld__waitrequest,
		output [31:0] 		avm_local_bb2_ld__address,
		output 		avm_local_bb2_ld__read,
		output 		avm_local_bb2_ld__write,
		input 		avm_local_bb2_ld__writeack,
		output [511:0] 		avm_local_bb2_ld__writedata,
		output [63:0] 		avm_local_bb2_ld__byteenable,
		output [4:0] 		avm_local_bb2_ld__burstcount,
		output 		local_bb2_ld__active,
		input 		clock2x,
		output 		avm_local_bb2_st__enable,
		input [7:0] 		avm_local_bb2_st__readdata,
		input 		avm_local_bb2_st__readdatavalid,
		input 		avm_local_bb2_st__waitrequest,
		output [31:0] 		avm_local_bb2_st__address,
		output 		avm_local_bb2_st__read,
		output 		avm_local_bb2_st__write,
		input 		avm_local_bb2_st__writeack,
		output [7:0] 		avm_local_bb2_st__writedata,
		output 		avm_local_bb2_st__byteenable,
		output 		avm_local_bb2_st__burstcount,
		output [7:0] 		local_bb2_st__input_fifo_depth
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((valid_in_0 & valid_in_1) & ~((stall_out_0 | stall_out_1)));
assign _exit = ((valid_out_0 & valid_out_1) & ~((stall_in_0 | stall_in_1)));
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
wire merge_node_stall_in_0;
 reg merge_node_valid_out_0_NO_SHIFT_REG;
wire merge_node_stall_in_1;
 reg merge_node_valid_out_1_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
 reg input_forked154_0_staging_reg_NO_SHIFT_REG;
 reg local_lvm_forked154_NO_SHIFT_REG;
 reg merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;
 reg input_forked154_1_staging_reg_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = ((merge_node_stall_in_0 & merge_node_valid_out_0_NO_SHIFT_REG) | (merge_node_stall_in_1 & merge_node_valid_out_1_NO_SHIFT_REG));
assign stall_out_0 = merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
assign stall_out_1 = merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_0_staging_reg_NO_SHIFT_REG | valid_in_0))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		if ((merge_node_valid_in_1_staging_reg_NO_SHIFT_REG | valid_in_1))
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b1;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
		end
		else
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b0;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_forked154_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		input_forked154_1_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_0_staging_reg_NO_SHIFT_REG))
			begin
				input_forked154_0_staging_reg_NO_SHIFT_REG <= input_forked154_0;
				merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= valid_in_0;
			end
		end
		else
		begin
			merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
		if (((merge_block_selector_NO_SHIFT_REG != 1'b1) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_1_staging_reg_NO_SHIFT_REG))
			begin
				input_forked154_1_staging_reg_NO_SHIFT_REG <= input_forked154_1;
				merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= valid_in_1;
			end
		end
		else
		begin
			merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
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
				if (merge_node_valid_in_0_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked154_NO_SHIFT_REG <= input_forked154_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked154_NO_SHIFT_REG <= input_forked154_0;
				end
			end

			1'b1:
			begin
				if (merge_node_valid_in_1_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked154_NO_SHIFT_REG <= input_forked154_1_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked154_NO_SHIFT_REG <= input_forked154_1;
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
		merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_0_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_1_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in_0))
			begin
				merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_1))
			begin
				merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
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
wire local_bb2_c0_eni1_valid_out;
wire local_bb2_c0_eni1_stall_in;
wire local_bb2_c0_eni1_inputs_ready;
wire local_bb2_c0_eni1_stall_local;
wire [15:0] local_bb2_c0_eni1;

assign local_bb2_c0_eni1_inputs_ready = merge_node_valid_out_0_NO_SHIFT_REG;
assign local_bb2_c0_eni1[7:0] = 8'bx;
assign local_bb2_c0_eni1[8] = local_lvm_forked154_NO_SHIFT_REG;
assign local_bb2_c0_eni1[15:9] = 7'bx;
assign local_bb2_c0_eni1_valid_out = local_bb2_c0_eni1_inputs_ready;
assign local_bb2_c0_eni1_stall_local = local_bb2_c0_eni1_stall_in;
assign merge_node_stall_in_0 = (|local_bb2_c0_eni1_stall_local);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_1to3_var__0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to3_var__0_stall_in_0_NO_SHIFT_REG;
 logic rnode_1to3_var__0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to3_var__0_stall_in_1_NO_SHIFT_REG;
 logic rnode_1to3_var__0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to3_var__0_valid_out_0_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_var__0_stall_in_0_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_var__0_stall_out_reg_3_NO_SHIFT_REG;
 reg rnode_1to3_var__0_consumed_0_NO_SHIFT_REG;
 reg rnode_1to3_var__0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_1to3_var__0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to3_var__0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to3_var__0_stall_in_0_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_1to3_var__0_valid_out_0_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_1to3_var__0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_1to3_var__0_reg_3_fifo.DEPTH = 3;
defparam rnode_1to3_var__0_reg_3_fifo.DATA_WIDTH = 0;
defparam rnode_1to3_var__0_reg_3_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to3_var__0_reg_3_fifo.IMPL = "ll_reg";

assign rnode_1to3_var__0_reg_3_inputs_ready_NO_SHIFT_REG = merge_node_valid_out_1_NO_SHIFT_REG;
assign merge_node_stall_in_1 = rnode_1to3_var__0_stall_out_reg_3_NO_SHIFT_REG;
assign rnode_1to3_var__0_stall_in_0_reg_3_NO_SHIFT_REG = ((rnode_1to3_var__0_stall_in_0_NO_SHIFT_REG & ~(rnode_1to3_var__0_consumed_0_NO_SHIFT_REG)) | (rnode_1to3_var__0_stall_in_1_NO_SHIFT_REG & ~(rnode_1to3_var__0_consumed_1_NO_SHIFT_REG)));
assign rnode_1to3_var__0_valid_out_0_NO_SHIFT_REG = (rnode_1to3_var__0_valid_out_0_reg_3_NO_SHIFT_REG & ~(rnode_1to3_var__0_consumed_0_NO_SHIFT_REG));
assign rnode_1to3_var__0_valid_out_1_NO_SHIFT_REG = (rnode_1to3_var__0_valid_out_0_reg_3_NO_SHIFT_REG & ~(rnode_1to3_var__0_consumed_1_NO_SHIFT_REG));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_1to3_var__0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_1to3_var__0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_1to3_var__0_consumed_0_NO_SHIFT_REG <= (rnode_1to3_var__0_valid_out_0_reg_3_NO_SHIFT_REG & (rnode_1to3_var__0_consumed_0_NO_SHIFT_REG | ~(rnode_1to3_var__0_stall_in_0_NO_SHIFT_REG)) & rnode_1to3_var__0_stall_in_0_reg_3_NO_SHIFT_REG);
		rnode_1to3_var__0_consumed_1_NO_SHIFT_REG <= (rnode_1to3_var__0_valid_out_0_reg_3_NO_SHIFT_REG & (rnode_1to3_var__0_consumed_1_NO_SHIFT_REG | ~(rnode_1to3_var__0_stall_in_1_NO_SHIFT_REG)) & rnode_1to3_var__0_stall_in_0_reg_3_NO_SHIFT_REG);
	end
end


// This section implements an unregistered operation.
// 
wire local_bb2_c0_enter_c0_eni1_valid_out_0;
wire local_bb2_c0_enter_c0_eni1_stall_in_0;
wire local_bb2_c0_enter_c0_eni1_valid_out_1;
wire local_bb2_c0_enter_c0_eni1_stall_in_1;
wire local_bb2_c0_enter_c0_eni1_inputs_ready;
wire local_bb2_c0_enter_c0_eni1_stall_local;
wire local_bb2_c0_enter_c0_eni1_input_accepted;
wire [15:0] local_bb2_c0_enter_c0_eni1;
wire local_bb2_c0_exit_c0_exi4_enable;
wire local_bb2_c0_exit_c0_exi4_entry_stall;
wire local_bb2_c0_enter_c0_eni1_valid_bit;
wire local_bb2_c0_exit_c0_exi4_output_regs_ready;
wire local_bb2_c0_exit_c0_exi4_valid_in;
wire local_bb2_c0_exit_c0_exi4_phases;
wire local_bb2_c0_enter_c0_eni1_inc_pipelined_thread;
wire local_bb2_c0_enter_c0_eni1_dec_pipelined_thread;
wire local_bb2_c0_enter_c0_eni1_fu_stall_out;

assign local_bb2_c0_enter_c0_eni1_inputs_ready = local_bb2_c0_eni1_valid_out;
assign local_bb2_c0_enter_c0_eni1 = local_bb2_c0_eni1;
assign local_bb2_c0_enter_c0_eni1_input_accepted = (local_bb2_c0_enter_c0_eni1_inputs_ready && !(local_bb2_c0_exit_c0_exi4_entry_stall));
assign local_bb2_c0_enter_c0_eni1_valid_bit = local_bb2_c0_enter_c0_eni1_input_accepted;
assign local_bb2_c0_enter_c0_eni1_inc_pipelined_thread = 1'b1;
assign local_bb2_c0_enter_c0_eni1_dec_pipelined_thread = ~(1'b0);
assign local_bb2_c0_enter_c0_eni1_fu_stall_out = (~(local_bb2_c0_enter_c0_eni1_inputs_ready) | local_bb2_c0_exit_c0_exi4_entry_stall);
assign local_bb2_c0_enter_c0_eni1_stall_local = (local_bb2_c0_enter_c0_eni1_stall_in_0 | local_bb2_c0_enter_c0_eni1_stall_in_1);
assign local_bb2_c0_enter_c0_eni1_valid_out_0 = local_bb2_c0_enter_c0_eni1_inputs_ready;
assign local_bb2_c0_enter_c0_eni1_valid_out_1 = local_bb2_c0_enter_c0_eni1_inputs_ready;
assign local_bb2_c0_eni1_stall_in = (|local_bb2_c0_enter_c0_eni1_fu_stall_out);

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_3to6_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_3to6_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_3to6_var__0_reg_6_inputs_ready_NO_SHIFT_REG;
 logic rnode_3to6_var__0_valid_out_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_var__0_stall_in_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_var__0_stall_out_reg_6_NO_SHIFT_REG;

acl_data_fifo rnode_3to6_var__0_reg_6_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to6_var__0_reg_6_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to6_var__0_stall_in_reg_6_NO_SHIFT_REG),
	.valid_out(rnode_3to6_var__0_valid_out_reg_6_NO_SHIFT_REG),
	.stall_out(rnode_3to6_var__0_stall_out_reg_6_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_3to6_var__0_reg_6_fifo.DEPTH = 4;
defparam rnode_3to6_var__0_reg_6_fifo.DATA_WIDTH = 0;
defparam rnode_3to6_var__0_reg_6_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_3to6_var__0_reg_6_fifo.IMPL = "ll_reg";

assign rnode_3to6_var__0_reg_6_inputs_ready_NO_SHIFT_REG = rnode_1to3_var__0_valid_out_1_NO_SHIFT_REG;
assign rnode_1to3_var__0_stall_in_1_NO_SHIFT_REG = rnode_3to6_var__0_stall_out_reg_6_NO_SHIFT_REG;
assign rnode_3to6_var__0_stall_in_reg_6_NO_SHIFT_REG = rnode_3to6_var__0_stall_in_NO_SHIFT_REG;
assign rnode_3to6_var__0_valid_out_NO_SHIFT_REG = rnode_3to6_var__0_valid_out_reg_6_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb2_c0_ene1_stall_local;
wire local_bb2_c0_ene1;

assign local_bb2_c0_ene1 = local_bb2_c0_enter_c0_eni1[8];

// This section implements an unregistered operation.
// 
wire SFC_1_VALID_1_1_0_stall_local;
wire SFC_1_VALID_1_1_0;

assign SFC_1_VALID_1_1_0 = local_bb2_c0_enter_c0_eni1_valid_bit;

// This section implements an unregistered operation.
// 
wire local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_stall_local;
wire [63:0] local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0;
wire local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_fu_valid_out;
wire local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_fu_stall_out;

acl_pop local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(local_bb2_c0_ene1),
	.predicate(1'b0),
	.data_in(64'h0),
	.stall_out(local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_fu_stall_out),
	.valid_in(SFC_1_VALID_1_1_0),
	.valid_out(local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_fu_valid_out),
	.stall_in(local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_stall_local),
	.data_out(local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0),
	.feedback_in(feedback_data_in_11),
	.feedback_valid_in(feedback_valid_in_11),
	.feedback_stall_out(feedback_stall_out_11)
);

defparam local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_feedback.COALESCE_DISTANCE = 1;
defparam local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_feedback.DATA_WIDTH = 64;
defparam local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_feedback.STYLE = "REGULAR";

assign local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_stall_local = ~(local_bb2_c0_exit_c0_exi4_enable);

// This section implements an unregistered operation.
// 
wire local_bb2_inc_i17_i_stall_local;
wire [63:0] local_bb2_inc_i17_i;

assign local_bb2_inc_i17_i = (local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0 + 64'h1);

// This section implements an unregistered operation.
// 
wire local_bb2_cmp_i12_i_stall_local;
wire [64:0] cmprep_local_bb2_cmp_i12_i;
wire local_bb2_cmp_i12_i;

assign cmprep_local_bb2_cmp_i12_i = (local_bb2_inc_i17_i - input_wii_conv_i19_i);
assign local_bb2_cmp_i12_i = cmprep_local_bb2_cmp_i12_i[64];

// This section implements an unregistered operation.
// 
wire local_bb2_var__stall_local;
wire local_bb2_var_;

assign local_bb2_var_ = (local_bb2_cmp_i12_i & input_wii_var__u4);

// This section implements an unregistered operation.
// 
wire local_bb2_c0_ene1_valid_out_1;
wire local_bb2_c0_ene1_stall_in_1;
wire local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_valid_out_1;
wire local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_stall_in_1;
wire SFC_1_VALID_1_1_0_valid_out_0;
wire SFC_1_VALID_1_1_0_stall_in_0;
wire SFC_1_VALID_1_1_0_valid_out_2;
wire SFC_1_VALID_1_1_0_stall_in_2;
wire SFC_1_VALID_1_1_0_valid_out_3;
wire SFC_1_VALID_1_1_0_stall_in_3;
wire SFC_1_VALID_1_1_0_valid_out_4;
wire SFC_1_VALID_1_1_0_stall_in_4;
wire local_bb2_inc_i17_i_valid_out_1;
wire local_bb2_inc_i17_i_stall_in_1;
wire local_bb2_var__valid_out_0;
wire local_bb2_var__stall_in_0;
wire local_bb2_var__valid_out_1;
wire local_bb2_var__stall_in_1;
wire local_bb2_var__valid_out_2;
wire local_bb2_var__stall_in_2;
wire local_bb2_cmp_i12_i_not_valid_out;
wire local_bb2_cmp_i12_i_not_stall_in;
wire local_bb2_cmp_i12_i_not_inputs_ready;
wire local_bb2_cmp_i12_i_not_stall_local;
wire local_bb2_cmp_i12_i_not;

assign local_bb2_cmp_i12_i_not_inputs_ready = (local_bb2_c0_enter_c0_eni1_valid_out_0 & local_bb2_c0_enter_c0_eni1_valid_out_1);
assign local_bb2_cmp_i12_i_not = (local_bb2_cmp_i12_i ^ 1'b1);
assign local_bb2_c0_ene1_valid_out_1 = 1'b1;
assign local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_valid_out_1 = 1'b1;
assign SFC_1_VALID_1_1_0_valid_out_0 = 1'b1;
assign SFC_1_VALID_1_1_0_valid_out_2 = 1'b1;
assign SFC_1_VALID_1_1_0_valid_out_3 = 1'b1;
assign SFC_1_VALID_1_1_0_valid_out_4 = 1'b1;
assign local_bb2_inc_i17_i_valid_out_1 = 1'b1;
assign local_bb2_var__valid_out_0 = 1'b1;
assign local_bb2_var__valid_out_1 = 1'b1;
assign local_bb2_var__valid_out_2 = 1'b1;
assign local_bb2_cmp_i12_i_not_valid_out = 1'b1;
assign local_bb2_c0_enter_c0_eni1_stall_in_0 = 1'b0;
assign local_bb2_c0_enter_c0_eni1_stall_in_1 = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_NO_SHIFT_REG;
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_1_NO_SHIFT_REG;
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0),
	.data_out(rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_stall_in_1 = 1'b0;
assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG = ~(local_bb2_c0_exit_c0_exi4_enable);
assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_NO_SHIFT_REG = rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_1_NO_SHIFT_REG = rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire SFC_1_VALID_1_2_0_inputs_ready;
 reg SFC_1_VALID_1_2_0_valid_out_NO_SHIFT_REG;
wire SFC_1_VALID_1_2_0_stall_in;
wire SFC_1_VALID_1_2_0_output_regs_ready;
 reg SFC_1_VALID_1_2_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_1_VALID_1_2_0_causedstall;

assign SFC_1_VALID_1_2_0_inputs_ready = 1'b1;
assign SFC_1_VALID_1_2_0_output_regs_ready = local_bb2_c0_exit_c0_exi4_enable;
assign SFC_1_VALID_1_1_0_stall_in_0 = 1'b0;
assign SFC_1_VALID_1_2_0_causedstall = (1'b1 && (1'b0 && !(~(local_bb2_c0_exit_c0_exi4_enable))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_1_VALID_1_2_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_1_VALID_1_2_0_output_regs_ready)
		begin
			SFC_1_VALID_1_2_0_NO_SHIFT_REG <= SFC_1_VALID_1_1_0;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb2_keep_going_acl_pipeline_1_inputs_ready;
 reg local_bb2_keep_going_acl_pipeline_1_valid_out_NO_SHIFT_REG;
wire local_bb2_keep_going_acl_pipeline_1_stall_in;
wire local_bb2_keep_going_acl_pipeline_1_output_regs_ready;
wire local_bb2_keep_going_acl_pipeline_1_keep_going;
wire local_bb2_keep_going_acl_pipeline_1_fu_valid_out;
wire local_bb2_keep_going_acl_pipeline_1_fu_stall_out;
 reg local_bb2_keep_going_acl_pipeline_1_NO_SHIFT_REG;
wire local_bb2_keep_going_acl_pipeline_1_feedback_pipelined;
wire local_bb2_keep_going_acl_pipeline_1_causedstall;

acl_pipeline local_bb2_keep_going_acl_pipeline_1_pipelined (
	.clock(clock),
	.resetn(resetn),
	.data_in(1'b1),
	.stall_out(local_bb2_keep_going_acl_pipeline_1_fu_stall_out),
	.valid_in(SFC_1_VALID_1_1_0),
	.valid_out(local_bb2_keep_going_acl_pipeline_1_fu_valid_out),
	.stall_in(~(local_bb2_c0_exit_c0_exi4_enable)),
	.data_out(local_bb2_keep_going_acl_pipeline_1_keep_going),
	.initeration_in(1'b0),
	.initeration_valid_in(1'b0),
	.initeration_stall_out(feedback_stall_out_0),
	.not_exitcond_in(feedback_data_in_1),
	.not_exitcond_valid_in(feedback_valid_in_1),
	.not_exitcond_stall_out(feedback_stall_out_1),
	.pipeline_valid_out(acl_pipelined_valid),
	.pipeline_stall_in(acl_pipelined_stall),
	.exiting_valid_out(acl_pipelined_exiting_valid)
);

defparam local_bb2_keep_going_acl_pipeline_1_pipelined.FIFO_DEPTH = 0;
defparam local_bb2_keep_going_acl_pipeline_1_pipelined.STYLE = "NON_SPECULATIVE";

assign local_bb2_keep_going_acl_pipeline_1_inputs_ready = 1'b1;
assign local_bb2_keep_going_acl_pipeline_1_output_regs_ready = local_bb2_c0_exit_c0_exi4_enable;
assign acl_pipelined_exiting_stall = acl_pipelined_stall;
assign local_bb2_c0_ene1_stall_in_1 = 1'b0;
assign SFC_1_VALID_1_1_0_stall_in_2 = 1'b0;
assign local_bb2_keep_going_acl_pipeline_1_causedstall = (SFC_1_VALID_1_1_0 && (1'b0 && !(~(local_bb2_c0_exit_c0_exi4_enable))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb2_keep_going_acl_pipeline_1_NO_SHIFT_REG <= 'x;
		local_bb2_keep_going_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb2_keep_going_acl_pipeline_1_output_regs_ready)
		begin
			local_bb2_keep_going_acl_pipeline_1_NO_SHIFT_REG <= local_bb2_keep_going_acl_pipeline_1_keep_going;
			local_bb2_keep_going_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb2_keep_going_acl_pipeline_1_stall_in))
			begin
				local_bb2_keep_going_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb2_i_0_i10_i4_push11_inc_i17_i_inputs_ready;
wire local_bb2_i_0_i10_i4_push11_inc_i17_i_output_regs_ready;
wire [63:0] local_bb2_i_0_i10_i4_push11_inc_i17_i_result;
wire local_bb2_i_0_i10_i4_push11_inc_i17_i_fu_valid_out;
wire local_bb2_i_0_i10_i4_push11_inc_i17_i_fu_stall_out;
 reg [63:0] local_bb2_i_0_i10_i4_push11_inc_i17_i_NO_SHIFT_REG;
wire local_bb2_i_0_i10_i4_push11_inc_i17_i_causedstall;

acl_push local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(local_bb2_var_),
	.predicate(1'b0),
	.data_in(local_bb2_inc_i17_i),
	.stall_out(local_bb2_i_0_i10_i4_push11_inc_i17_i_fu_stall_out),
	.valid_in(SFC_1_VALID_1_1_0),
	.valid_out(local_bb2_i_0_i10_i4_push11_inc_i17_i_fu_valid_out),
	.stall_in(~(local_bb2_c0_exit_c0_exi4_enable)),
	.data_out(local_bb2_i_0_i10_i4_push11_inc_i17_i_result),
	.feedback_out(feedback_data_out_11),
	.feedback_valid_out(feedback_valid_out_11),
	.feedback_stall_in(feedback_stall_in_11)
);

defparam local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback.STALLFREE = 1;
defparam local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback.ENABLED = 1;
defparam local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback.DATA_WIDTH = 64;
defparam local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback.FIFO_DEPTH = 1;
defparam local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback.MIN_FIFO_LATENCY = 1;
defparam local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback.STYLE = "REGULAR";
defparam local_bb2_i_0_i10_i4_push11_inc_i17_i_feedback.RAM_FIFO_DEPTH_INC = 1;

assign local_bb2_i_0_i10_i4_push11_inc_i17_i_inputs_ready = 1'b1;
assign local_bb2_i_0_i10_i4_push11_inc_i17_i_output_regs_ready = local_bb2_c0_exit_c0_exi4_enable;
assign local_bb2_inc_i17_i_stall_in_1 = 1'b0;
assign local_bb2_var__stall_in_0 = 1'b0;
assign SFC_1_VALID_1_1_0_stall_in_3 = 1'b0;
assign local_bb2_i_0_i10_i4_push11_inc_i17_i_causedstall = (SFC_1_VALID_1_1_0 && (1'b0 && !(~(local_bb2_c0_exit_c0_exi4_enable))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb2_i_0_i10_i4_push11_inc_i17_i_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb2_i_0_i10_i4_push11_inc_i17_i_output_regs_ready)
		begin
			local_bb2_i_0_i10_i4_push11_inc_i17_i_NO_SHIFT_REG <= local_bb2_i_0_i10_i4_push11_inc_i17_i_result;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb2_notexitcond__inputs_ready;
wire local_bb2_notexitcond__output_regs_ready;
wire local_bb2_notexitcond__result;
wire local_bb2_notexitcond__fu_valid_out;
wire local_bb2_notexitcond__fu_stall_out;
 reg local_bb2_notexitcond__NO_SHIFT_REG;
wire local_bb2_notexitcond__causedstall;

acl_push local_bb2_notexitcond__feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(1'b1),
	.predicate(1'b0),
	.data_in(local_bb2_var_),
	.stall_out(local_bb2_notexitcond__fu_stall_out),
	.valid_in(SFC_1_VALID_1_1_0),
	.valid_out(local_bb2_notexitcond__fu_valid_out),
	.stall_in(~(local_bb2_c0_exit_c0_exi4_enable)),
	.data_out(local_bb2_notexitcond__result),
	.feedback_out(feedback_data_out_1),
	.feedback_valid_out(feedback_valid_out_1),
	.feedback_stall_in(feedback_stall_in_1)
);

defparam local_bb2_notexitcond__feedback.STALLFREE = 1;
defparam local_bb2_notexitcond__feedback.ENABLED = 1;
defparam local_bb2_notexitcond__feedback.DATA_WIDTH = 1;
defparam local_bb2_notexitcond__feedback.FIFO_DEPTH = 0;
defparam local_bb2_notexitcond__feedback.MIN_FIFO_LATENCY = 0;
defparam local_bb2_notexitcond__feedback.STYLE = "REGULAR";
defparam local_bb2_notexitcond__feedback.RAM_FIFO_DEPTH_INC = 1;

assign local_bb2_notexitcond__inputs_ready = 1'b1;
assign local_bb2_notexitcond__output_regs_ready = local_bb2_c0_exit_c0_exi4_enable;
assign local_bb2_var__stall_in_1 = 1'b0;
assign SFC_1_VALID_1_1_0_stall_in_4 = 1'b0;
assign local_bb2_notexitcond__causedstall = (SFC_1_VALID_1_1_0 && (1'b0 && !(~(local_bb2_c0_exit_c0_exi4_enable))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb2_notexitcond__NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb2_notexitcond__output_regs_ready)
		begin
			local_bb2_notexitcond__NO_SHIFT_REG <= local_bb2_notexitcond__result;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb2_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb2_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb2_var__0_NO_SHIFT_REG;
 logic rnode_1to2_bb2_var__0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb2_var__0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_var__0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_var__0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_var__0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb2_var__0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb2_var__0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb2_var__0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb2_var__0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb2_var__0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb2_var_),
	.data_out(rnode_1to2_bb2_var__0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb2_var__0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb2_var__0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb2_var__0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb2_var__0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb2_var__0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb2_var__stall_in_2 = 1'b0;
assign rnode_1to2_bb2_var__0_NO_SHIFT_REG = rnode_1to2_bb2_var__0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb2_var__0_stall_in_reg_2_NO_SHIFT_REG = ~(local_bb2_c0_exit_c0_exi4_enable);
assign rnode_1to2_bb2_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb2_cmp_i12_i_not_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb2_cmp_i12_i_not_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb2_cmp_i12_i_not_0_NO_SHIFT_REG;
 logic rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_cmp_i12_i_not_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_cmp_i12_i_not_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb2_cmp_i12_i_not_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb2_cmp_i12_i_not_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb2_cmp_i12_i_not_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb2_cmp_i12_i_not_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb2_cmp_i12_i_not),
	.data_out(rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb2_cmp_i12_i_not_stall_in = 1'b0;
assign rnode_1to2_bb2_cmp_i12_i_not_0_NO_SHIFT_REG = rnode_1to2_bb2_cmp_i12_i_not_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb2_cmp_i12_i_not_0_stall_in_reg_2_NO_SHIFT_REG = ~(local_bb2_c0_exit_c0_exi4_enable);
assign rnode_1to2_bb2_cmp_i12_i_not_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb2_arrayidx_i14_i_stall_local;
wire [63:0] local_bb2_arrayidx_i14_i;

assign local_bb2_arrayidx_i14_i = ((input_pop1 & 64'hFFFFFFFFFFFFFC00) + rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb2_c0_exi1_stall_local;
wire [255:0] local_bb2_c0_exi1;

assign local_bb2_c0_exi1[63:0] = 64'bx;
assign local_bb2_c0_exi1[127:64] = rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_1_NO_SHIFT_REG;
assign local_bb2_c0_exi1[255:128] = 128'bx;

// This section implements an unregistered operation.
// 
wire local_bb2_notcmp_stall_local;
wire local_bb2_notcmp;

assign local_bb2_notcmp = (input_wii_var_ | rnode_1to2_bb2_cmp_i12_i_not_0_NO_SHIFT_REG);

// This section implements an unregistered operation.
// 
wire local_bb2_c0_exi2_stall_local;
wire [255:0] local_bb2_c0_exi2;

assign local_bb2_c0_exi2[127:0] = local_bb2_c0_exi1[127:0];
assign local_bb2_c0_exi2[191:128] = local_bb2_arrayidx_i14_i;
assign local_bb2_c0_exi2[255:192] = local_bb2_c0_exi1[255:192];

// This section implements an unregistered operation.
// 
wire local_bb2_c0_exi3_stall_local;
wire [255:0] local_bb2_c0_exi3;

assign local_bb2_c0_exi3[191:0] = local_bb2_c0_exi2[191:0];
assign local_bb2_c0_exi3[192] = rnode_1to2_bb2_var__0_NO_SHIFT_REG;
assign local_bb2_c0_exi3[255:193] = local_bb2_c0_exi2[255:193];

// This section implements an unregistered operation.
// 
wire local_bb2_c0_exi4_valid_out;
wire local_bb2_c0_exi4_stall_in;
wire local_bb2_c0_exi4_inputs_ready;
wire local_bb2_c0_exi4_stall_local;
wire [255:0] local_bb2_c0_exi4;

assign local_bb2_c0_exi4_inputs_ready = (rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG & rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG & rnode_1to2_bb2_var__0_valid_out_NO_SHIFT_REG & rnode_1to2_bb2_cmp_i12_i_not_0_valid_out_NO_SHIFT_REG);
assign local_bb2_c0_exi4[199:0] = local_bb2_c0_exi3[199:0];
assign local_bb2_c0_exi4[200] = local_bb2_notcmp;
assign local_bb2_c0_exi4[255:201] = local_bb2_c0_exi3[255:201];
assign local_bb2_c0_exi4_valid_out = 1'b1;
assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb2_i_0_i10_i4_pop11_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb2_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb2_cmp_i12_i_not_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb2_c0_exit_c0_exi4_valid_out;
wire local_bb2_c0_exit_c0_exi4_stall_in;
wire local_bb2_c0_exit_c0_exi4_inputs_ready;
wire local_bb2_c0_exit_c0_exi4_stall_local;
wire [255:0] local_bb2_c0_exit_c0_exi4;
wire local_bb2_c0_exit_c0_exi4_valid;
wire local_bb2_c0_exit_c0_exi4_fu_stall_out;

acl_enable_sink local_bb2_c0_exit_c0_exi4_instance (
	.clock(clock),
	.resetn(resetn),
	.data_in(local_bb2_c0_exi4),
	.data_out(local_bb2_c0_exit_c0_exi4),
	.input_accepted(local_bb2_c0_enter_c0_eni1_input_accepted),
	.valid_out(local_bb2_c0_exit_c0_exi4_valid),
	.stall_in(local_bb2_c0_exit_c0_exi4_stall_local),
	.enable(local_bb2_c0_exit_c0_exi4_enable),
	.valid_in(local_bb2_c0_exit_c0_exi4_valid_in),
	.stall_entry(local_bb2_c0_exit_c0_exi4_entry_stall),
	.inc_pipelined_thread(local_bb2_c0_enter_c0_eni1_inc_pipelined_thread),
	.dec_pipelined_thread(local_bb2_c0_enter_c0_eni1_dec_pipelined_thread)
);

defparam local_bb2_c0_exit_c0_exi4_instance.DATA_WIDTH = 256;
defparam local_bb2_c0_exit_c0_exi4_instance.PIPELINE_DEPTH = 1;
defparam local_bb2_c0_exit_c0_exi4_instance.SCHEDULEII = 1;
defparam local_bb2_c0_exit_c0_exi4_instance.IP_PIPELINE_LATENCY_PLUS1 = 1;

assign local_bb2_c0_exit_c0_exi4_inputs_ready = (local_bb2_c0_exi4_valid_out & local_bb2_keep_going_acl_pipeline_1_valid_out_NO_SHIFT_REG & SFC_1_VALID_1_2_0_valid_out_NO_SHIFT_REG);
assign local_bb2_c0_exit_c0_exi4_valid_in = SFC_1_VALID_1_2_0_NO_SHIFT_REG;
assign local_bb2_c0_exit_c0_exi4_fu_stall_out = ~(local_bb2_c0_exit_c0_exi4_enable);
assign local_bb2_c0_exit_c0_exi4_valid_out = local_bb2_c0_exit_c0_exi4_valid;
assign local_bb2_c0_exit_c0_exi4_stall_local = local_bb2_c0_exit_c0_exi4_stall_in;
assign local_bb2_c0_exi4_stall_in = 1'b0;
assign local_bb2_keep_going_acl_pipeline_1_stall_in = 1'b0;
assign SFC_1_VALID_1_2_0_stall_in = 1'b0;

// This section implements a staging register.
// 
wire rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_0;
wire rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_0;
wire rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_1;
wire rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_1;
wire rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_2;
wire rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_2;
wire rstag_2to2_bb2_c0_exit_c0_exi4_inputs_ready;
wire rstag_2to2_bb2_c0_exit_c0_exi4_stall_local;
 reg rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG;
wire rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid;
 reg [255:0] rstag_2to2_bb2_c0_exit_c0_exi4_staging_reg_NO_SHIFT_REG;
wire [255:0] rstag_2to2_bb2_c0_exit_c0_exi4;
 reg rstag_2to2_bb2_c0_exit_c0_exi4_consumed_0_NO_SHIFT_REG;
 reg rstag_2to2_bb2_c0_exit_c0_exi4_consumed_1_NO_SHIFT_REG;
 reg rstag_2to2_bb2_c0_exit_c0_exi4_consumed_2_NO_SHIFT_REG;

assign rstag_2to2_bb2_c0_exit_c0_exi4_inputs_ready = local_bb2_c0_exit_c0_exi4_valid_out;
assign rstag_2to2_bb2_c0_exit_c0_exi4 = (rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG ? rstag_2to2_bb2_c0_exit_c0_exi4_staging_reg_NO_SHIFT_REG : local_bb2_c0_exit_c0_exi4);
assign rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid = (rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG | rstag_2to2_bb2_c0_exit_c0_exi4_inputs_ready);
assign rstag_2to2_bb2_c0_exit_c0_exi4_stall_local = ((rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_0 & ~(rstag_2to2_bb2_c0_exit_c0_exi4_consumed_0_NO_SHIFT_REG)) | (rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_1 & ~(rstag_2to2_bb2_c0_exit_c0_exi4_consumed_1_NO_SHIFT_REG)) | (rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_2 & ~(rstag_2to2_bb2_c0_exit_c0_exi4_consumed_2_NO_SHIFT_REG)));
assign rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_0 = (rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid & ~(rstag_2to2_bb2_c0_exit_c0_exi4_consumed_0_NO_SHIFT_REG));
assign rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_1 = (rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid & ~(rstag_2to2_bb2_c0_exit_c0_exi4_consumed_1_NO_SHIFT_REG));
assign rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_2 = (rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid & ~(rstag_2to2_bb2_c0_exit_c0_exi4_consumed_2_NO_SHIFT_REG));
assign local_bb2_c0_exit_c0_exi4_stall_in = (|rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb2_c0_exit_c0_exi4_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_2to2_bb2_c0_exit_c0_exi4_stall_local)
		begin
			if (~(rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG))
			begin
				rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG <= rstag_2to2_bb2_c0_exit_c0_exi4_inputs_ready;
			end
		end
		else
		begin
			rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_2to2_bb2_c0_exit_c0_exi4_staging_valid_NO_SHIFT_REG))
		begin
			rstag_2to2_bb2_c0_exit_c0_exi4_staging_reg_NO_SHIFT_REG <= local_bb2_c0_exit_c0_exi4;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_2to2_bb2_c0_exit_c0_exi4_consumed_0_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb2_c0_exit_c0_exi4_consumed_1_NO_SHIFT_REG <= 1'b0;
		rstag_2to2_bb2_c0_exit_c0_exi4_consumed_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rstag_2to2_bb2_c0_exit_c0_exi4_consumed_0_NO_SHIFT_REG <= (rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid & (rstag_2to2_bb2_c0_exit_c0_exi4_consumed_0_NO_SHIFT_REG | ~(rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_0)) & rstag_2to2_bb2_c0_exit_c0_exi4_stall_local);
		rstag_2to2_bb2_c0_exit_c0_exi4_consumed_1_NO_SHIFT_REG <= (rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid & (rstag_2to2_bb2_c0_exit_c0_exi4_consumed_1_NO_SHIFT_REG | ~(rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_1)) & rstag_2to2_bb2_c0_exit_c0_exi4_stall_local);
		rstag_2to2_bb2_c0_exit_c0_exi4_consumed_2_NO_SHIFT_REG <= (rstag_2to2_bb2_c0_exit_c0_exi4_combined_valid & (rstag_2to2_bb2_c0_exit_c0_exi4_consumed_2_NO_SHIFT_REG | ~(rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_2)) & rstag_2to2_bb2_c0_exit_c0_exi4_stall_local);
	end
end


// This section implements an unregistered operation.
// 
wire local_bb2_c0_exe4_valid_out;
wire local_bb2_c0_exe4_stall_in;
wire local_bb2_c0_exe4_inputs_ready;
wire local_bb2_c0_exe4_stall_local;
wire local_bb2_c0_exe4;

assign local_bb2_c0_exe4_inputs_ready = rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_0;
assign local_bb2_c0_exe4 = rstag_2to2_bb2_c0_exit_c0_exi4[200];
assign local_bb2_c0_exe4_valid_out = local_bb2_c0_exe4_inputs_ready;
assign local_bb2_c0_exe4_stall_local = local_bb2_c0_exe4_stall_in;
assign rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_0 = (|local_bb2_c0_exe4_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb2_c0_exe2_valid_out;
wire local_bb2_c0_exe2_stall_in;
wire local_bb2_c0_exe2_inputs_ready;
wire local_bb2_c0_exe2_stall_local;
wire [63:0] local_bb2_c0_exe2;

assign local_bb2_c0_exe2_inputs_ready = rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_1;
assign local_bb2_c0_exe2[63:0] = rstag_2to2_bb2_c0_exit_c0_exi4[191:128];
assign local_bb2_c0_exe2_valid_out = local_bb2_c0_exe2_inputs_ready;
assign local_bb2_c0_exe2_stall_local = local_bb2_c0_exe2_stall_in;
assign rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_1 = (|local_bb2_c0_exe2_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb2_c0_exe1_valid_out;
wire local_bb2_c0_exe1_stall_in;
wire local_bb2_c0_exe1_inputs_ready;
wire local_bb2_c0_exe1_stall_local;
wire [63:0] local_bb2_c0_exe1;

assign local_bb2_c0_exe1_inputs_ready = rstag_2to2_bb2_c0_exit_c0_exi4_valid_out_2;
assign local_bb2_c0_exe1[63:0] = rstag_2to2_bb2_c0_exit_c0_exi4[127:64];
assign local_bb2_c0_exe1_valid_out = local_bb2_c0_exe1_inputs_ready;
assign local_bb2_c0_exe1_stall_local = local_bb2_c0_exe1_stall_in;
assign rstag_2to2_bb2_c0_exit_c0_exi4_stall_in_2 = (|local_bb2_c0_exe1_stall_local);

// Register node:
//  * latency = 6
//  * capacity = 6
 logic rnode_2to8_bb2_c0_exe4_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to8_bb2_c0_exe4_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to8_bb2_c0_exe4_0_NO_SHIFT_REG;
 logic rnode_2to8_bb2_c0_exe4_0_reg_8_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to8_bb2_c0_exe4_0_reg_8_NO_SHIFT_REG;
 logic rnode_2to8_bb2_c0_exe4_0_valid_out_reg_8_NO_SHIFT_REG;
 logic rnode_2to8_bb2_c0_exe4_0_stall_in_reg_8_NO_SHIFT_REG;
 logic rnode_2to8_bb2_c0_exe4_0_stall_out_reg_8_NO_SHIFT_REG;

acl_data_fifo rnode_2to8_bb2_c0_exe4_0_reg_8_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to8_bb2_c0_exe4_0_reg_8_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to8_bb2_c0_exe4_0_stall_in_reg_8_NO_SHIFT_REG),
	.valid_out(rnode_2to8_bb2_c0_exe4_0_valid_out_reg_8_NO_SHIFT_REG),
	.stall_out(rnode_2to8_bb2_c0_exe4_0_stall_out_reg_8_NO_SHIFT_REG),
	.data_in(local_bb2_c0_exe4),
	.data_out(rnode_2to8_bb2_c0_exe4_0_reg_8_NO_SHIFT_REG)
);

defparam rnode_2to8_bb2_c0_exe4_0_reg_8_fifo.DEPTH = 7;
defparam rnode_2to8_bb2_c0_exe4_0_reg_8_fifo.DATA_WIDTH = 1;
defparam rnode_2to8_bb2_c0_exe4_0_reg_8_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_2to8_bb2_c0_exe4_0_reg_8_fifo.IMPL = "ll_reg";

assign rnode_2to8_bb2_c0_exe4_0_reg_8_inputs_ready_NO_SHIFT_REG = local_bb2_c0_exe4_valid_out;
assign local_bb2_c0_exe4_stall_in = rnode_2to8_bb2_c0_exe4_0_stall_out_reg_8_NO_SHIFT_REG;
assign rnode_2to8_bb2_c0_exe4_0_NO_SHIFT_REG = rnode_2to8_bb2_c0_exe4_0_reg_8_NO_SHIFT_REG;
assign rnode_2to8_bb2_c0_exe4_0_stall_in_reg_8_NO_SHIFT_REG = rnode_2to8_bb2_c0_exe4_0_stall_in_NO_SHIFT_REG;
assign rnode_2to8_bb2_c0_exe4_0_valid_out_NO_SHIFT_REG = rnode_2to8_bb2_c0_exe4_0_valid_out_reg_8_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb2_c0_exe2_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb2_c0_exe2_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb2_c0_exe2_0_NO_SHIFT_REG;
 logic rnode_2to3_bb2_c0_exe2_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb2_c0_exe2_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb2_c0_exe2_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb2_c0_exe2_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb2_c0_exe2_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb2_c0_exe2_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb2_c0_exe2_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb2_c0_exe2_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb2_c0_exe2_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb2_c0_exe2_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb2_c0_exe2),
	.data_out(rnode_2to3_bb2_c0_exe2_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb2_c0_exe2_0_reg_3_fifo.DEPTH = 2;
defparam rnode_2to3_bb2_c0_exe2_0_reg_3_fifo.DATA_WIDTH = 64;
defparam rnode_2to3_bb2_c0_exe2_0_reg_3_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_2to3_bb2_c0_exe2_0_reg_3_fifo.IMPL = "ll_reg";

assign rnode_2to3_bb2_c0_exe2_0_reg_3_inputs_ready_NO_SHIFT_REG = local_bb2_c0_exe2_valid_out;
assign local_bb2_c0_exe2_stall_in = rnode_2to3_bb2_c0_exe2_0_stall_out_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb2_c0_exe2_0_NO_SHIFT_REG = rnode_2to3_bb2_c0_exe2_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb2_c0_exe2_0_stall_in_reg_3_NO_SHIFT_REG = rnode_2to3_bb2_c0_exe2_0_stall_in_NO_SHIFT_REG;
assign rnode_2to3_bb2_c0_exe2_0_valid_out_NO_SHIFT_REG = rnode_2to3_bb2_c0_exe2_0_valid_out_reg_3_NO_SHIFT_REG;

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_2to5_bb2_c0_exe1_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to5_bb2_c0_exe1_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_2to5_bb2_c0_exe1_0_NO_SHIFT_REG;
 logic rnode_2to5_bb2_c0_exe1_0_reg_5_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_2to5_bb2_c0_exe1_0_reg_5_NO_SHIFT_REG;
 logic rnode_2to5_bb2_c0_exe1_0_valid_out_reg_5_NO_SHIFT_REG;
 logic rnode_2to5_bb2_c0_exe1_0_stall_in_reg_5_NO_SHIFT_REG;
 logic rnode_2to5_bb2_c0_exe1_0_stall_out_reg_5_NO_SHIFT_REG;

acl_data_fifo rnode_2to5_bb2_c0_exe1_0_reg_5_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to5_bb2_c0_exe1_0_reg_5_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to5_bb2_c0_exe1_0_stall_in_reg_5_NO_SHIFT_REG),
	.valid_out(rnode_2to5_bb2_c0_exe1_0_valid_out_reg_5_NO_SHIFT_REG),
	.stall_out(rnode_2to5_bb2_c0_exe1_0_stall_out_reg_5_NO_SHIFT_REG),
	.data_in(local_bb2_c0_exe1),
	.data_out(rnode_2to5_bb2_c0_exe1_0_reg_5_NO_SHIFT_REG)
);

defparam rnode_2to5_bb2_c0_exe1_0_reg_5_fifo.DEPTH = 4;
defparam rnode_2to5_bb2_c0_exe1_0_reg_5_fifo.DATA_WIDTH = 64;
defparam rnode_2to5_bb2_c0_exe1_0_reg_5_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_2to5_bb2_c0_exe1_0_reg_5_fifo.IMPL = "ll_reg";

assign rnode_2to5_bb2_c0_exe1_0_reg_5_inputs_ready_NO_SHIFT_REG = local_bb2_c0_exe1_valid_out;
assign local_bb2_c0_exe1_stall_in = rnode_2to5_bb2_c0_exe1_0_stall_out_reg_5_NO_SHIFT_REG;
assign rnode_2to5_bb2_c0_exe1_0_NO_SHIFT_REG = rnode_2to5_bb2_c0_exe1_0_reg_5_NO_SHIFT_REG;
assign rnode_2to5_bb2_c0_exe1_0_stall_in_reg_5_NO_SHIFT_REG = rnode_2to5_bb2_c0_exe1_0_stall_in_NO_SHIFT_REG;
assign rnode_2to5_bb2_c0_exe1_0_valid_out_NO_SHIFT_REG = rnode_2to5_bb2_c0_exe1_0_valid_out_reg_5_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire local_bb2_ld__inputs_ready;
 reg local_bb2_ld__valid_out_NO_SHIFT_REG;
wire local_bb2_ld__stall_in;
wire local_bb2_ld__output_regs_ready;
wire local_bb2_ld__fu_stall_out;
wire local_bb2_ld__fu_valid_out;
wire [7:0] local_bb2_ld__lsu_dataout;
 reg [7:0] local_bb2_ld__NO_SHIFT_REG;
wire local_bb2_ld__causedstall;

lsu_top lsu_local_bb2_ld_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb2_ld__fu_stall_out),
	.i_valid(local_bb2_ld__inputs_ready),
	.i_address(rnode_2to3_bb2_c0_exe2_0_NO_SHIFT_REG),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(input_wii_var_),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb2_ld__output_regs_ready)),
	.o_valid(local_bb2_ld__fu_valid_out),
	.o_readdata(local_bb2_ld__lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb2_ld__active),
	.avm_address(avm_local_bb2_ld__address),
	.avm_read(avm_local_bb2_ld__read),
	.avm_enable(avm_local_bb2_ld__enable),
	.avm_readdata(avm_local_bb2_ld__readdata),
	.avm_write(avm_local_bb2_ld__write),
	.avm_writeack(avm_local_bb2_ld__writeack),
	.avm_burstcount(avm_local_bb2_ld__burstcount),
	.avm_writedata(avm_local_bb2_ld__writedata),
	.avm_byteenable(avm_local_bb2_ld__byteenable),
	.avm_waitrequest(avm_local_bb2_ld__waitrequest),
	.avm_readdatavalid(avm_local_bb2_ld__readdatavalid),
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

defparam lsu_local_bb2_ld_.AWIDTH = 32;
defparam lsu_local_bb2_ld_.WIDTH_BYTES = 1;
defparam lsu_local_bb2_ld_.MWIDTH_BYTES = 64;
defparam lsu_local_bb2_ld_.WRITEDATAWIDTH_BYTES = 64;
defparam lsu_local_bb2_ld_.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb2_ld_.READ = 1;
defparam lsu_local_bb2_ld_.ATOMIC = 0;
defparam lsu_local_bb2_ld_.WIDTH = 8;
defparam lsu_local_bb2_ld_.MWIDTH = 512;
defparam lsu_local_bb2_ld_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb2_ld_.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb2_ld_.KERNEL_SIDE_MEM_LATENCY = 3;
defparam lsu_local_bb2_ld_.MEMORY_SIDE_MEM_LATENCY = 99;
defparam lsu_local_bb2_ld_.USE_WRITE_ACK = 0;
defparam lsu_local_bb2_ld_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb2_ld_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb2_ld_.NUMBER_BANKS = 1;
defparam lsu_local_bb2_ld_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb2_ld_.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb2_ld_.USEINPUTFIFO = 0;
defparam lsu_local_bb2_ld_.USECACHING = 0;
defparam lsu_local_bb2_ld_.USEOUTPUTFIFO = 1;
defparam lsu_local_bb2_ld_.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb2_ld_.ADDRSPACE = 1;
defparam lsu_local_bb2_ld_.STYLE = "PREFETCHING";

assign local_bb2_ld__inputs_ready = (rnode_2to3_bb2_c0_exe2_0_valid_out_NO_SHIFT_REG & rnode_1to3_var__0_valid_out_0_NO_SHIFT_REG);
assign local_bb2_ld__output_regs_ready = (&(~(local_bb2_ld__valid_out_NO_SHIFT_REG) | ~(local_bb2_ld__stall_in)));
assign rnode_2to3_bb2_c0_exe2_0_stall_in_NO_SHIFT_REG = (local_bb2_ld__fu_stall_out | ~(local_bb2_ld__inputs_ready));
assign rnode_1to3_var__0_stall_in_0_NO_SHIFT_REG = (local_bb2_ld__fu_stall_out | ~(local_bb2_ld__inputs_ready));
assign local_bb2_ld__causedstall = (local_bb2_ld__inputs_ready && (local_bb2_ld__fu_stall_out && !(~(local_bb2_ld__output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb2_ld__NO_SHIFT_REG <= 'x;
		local_bb2_ld__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb2_ld__output_regs_ready)
		begin
			local_bb2_ld__NO_SHIFT_REG <= local_bb2_ld__lsu_dataout;
			local_bb2_ld__valid_out_NO_SHIFT_REG <= local_bb2_ld__fu_valid_out;
		end
		else
		begin
			if (~(local_bb2_ld__stall_in))
			begin
				local_bb2_ld__valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb2_arrayidx2_i15_i_inputs_ready;
 reg local_bb2_arrayidx2_i15_i_valid_out_NO_SHIFT_REG;
wire local_bb2_arrayidx2_i15_i_stall_in;
wire local_bb2_arrayidx2_i15_i_output_regs_ready;
 reg [31:0] local_bb2_arrayidx2_i15_i_NO_SHIFT_REG;
wire [31:0] local_bb2_arrayidx2_i15_i_op_wire;
wire local_bb2_arrayidx2_i15_i_causedstall;

assign local_bb2_arrayidx2_i15_i_inputs_ready = rnode_2to5_bb2_c0_exe1_0_valid_out_NO_SHIFT_REG;
assign local_bb2_arrayidx2_i15_i_output_regs_ready = (&(~(local_bb2_arrayidx2_i15_i_valid_out_NO_SHIFT_REG) | ~(local_bb2_arrayidx2_i15_i_stall_in)));
assign local_bb2_arrayidx2_i15_i_op_wire = (64'h0 + rnode_2to5_bb2_c0_exe1_0_NO_SHIFT_REG);
assign rnode_2to5_bb2_c0_exe1_0_stall_in_NO_SHIFT_REG = (~(local_bb2_arrayidx2_i15_i_output_regs_ready) | ~(local_bb2_arrayidx2_i15_i_inputs_ready));
assign local_bb2_arrayidx2_i15_i_causedstall = (local_bb2_arrayidx2_i15_i_inputs_ready && (~(local_bb2_arrayidx2_i15_i_output_regs_ready) && !(~(local_bb2_arrayidx2_i15_i_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb2_arrayidx2_i15_i_NO_SHIFT_REG <= 'x;
		local_bb2_arrayidx2_i15_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb2_arrayidx2_i15_i_output_regs_ready)
		begin
			local_bb2_arrayidx2_i15_i_NO_SHIFT_REG <= local_bb2_arrayidx2_i15_i_op_wire;
			local_bb2_arrayidx2_i15_i_valid_out_NO_SHIFT_REG <= local_bb2_arrayidx2_i15_i_inputs_ready;
		end
		else
		begin
			if (~(local_bb2_arrayidx2_i15_i_stall_in))
			begin
				local_bb2_arrayidx2_i15_i_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_6to6_bb2_ld__valid_out;
wire rstag_6to6_bb2_ld__stall_in;
wire rstag_6to6_bb2_ld__inputs_ready;
wire rstag_6to6_bb2_ld__stall_local;
 reg rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG;
wire rstag_6to6_bb2_ld__combined_valid;
 reg [7:0] rstag_6to6_bb2_ld__staging_reg_NO_SHIFT_REG;
wire [7:0] rstag_6to6_bb2_ld_;

assign rstag_6to6_bb2_ld__inputs_ready = local_bb2_ld__valid_out_NO_SHIFT_REG;
assign rstag_6to6_bb2_ld_ = (rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG ? rstag_6to6_bb2_ld__staging_reg_NO_SHIFT_REG : local_bb2_ld__NO_SHIFT_REG);
assign rstag_6to6_bb2_ld__combined_valid = (rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG | rstag_6to6_bb2_ld__inputs_ready);
assign rstag_6to6_bb2_ld__valid_out = rstag_6to6_bb2_ld__combined_valid;
assign rstag_6to6_bb2_ld__stall_local = rstag_6to6_bb2_ld__stall_in;
assign local_bb2_ld__stall_in = (|rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_6to6_bb2_ld__staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_6to6_bb2_ld__stall_local)
		begin
			if (~(rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG))
			begin
				rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG <= rstag_6to6_bb2_ld__inputs_ready;
			end
		end
		else
		begin
			rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_6to6_bb2_ld__staging_valid_NO_SHIFT_REG))
		begin
			rstag_6to6_bb2_ld__staging_reg_NO_SHIFT_REG <= local_bb2_ld__NO_SHIFT_REG;
		end
	end
end


// This section implements a staging register.
// 
wire rstag_6to6_bb2_arrayidx2_i15_i_valid_out;
wire rstag_6to6_bb2_arrayidx2_i15_i_stall_in;
wire rstag_6to6_bb2_arrayidx2_i15_i_inputs_ready;
wire rstag_6to6_bb2_arrayidx2_i15_i_stall_local;
 reg rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG;
wire rstag_6to6_bb2_arrayidx2_i15_i_combined_valid;
 reg [31:0] rstag_6to6_bb2_arrayidx2_i15_i_staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_6to6_bb2_arrayidx2_i15_i;

assign rstag_6to6_bb2_arrayidx2_i15_i_inputs_ready = local_bb2_arrayidx2_i15_i_valid_out_NO_SHIFT_REG;
assign rstag_6to6_bb2_arrayidx2_i15_i = (rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG ? rstag_6to6_bb2_arrayidx2_i15_i_staging_reg_NO_SHIFT_REG : local_bb2_arrayidx2_i15_i_NO_SHIFT_REG);
assign rstag_6to6_bb2_arrayidx2_i15_i_combined_valid = (rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG | rstag_6to6_bb2_arrayidx2_i15_i_inputs_ready);
assign rstag_6to6_bb2_arrayidx2_i15_i_valid_out = rstag_6to6_bb2_arrayidx2_i15_i_combined_valid;
assign rstag_6to6_bb2_arrayidx2_i15_i_stall_local = rstag_6to6_bb2_arrayidx2_i15_i_stall_in;
assign local_bb2_arrayidx2_i15_i_stall_in = (|rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_6to6_bb2_arrayidx2_i15_i_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_6to6_bb2_arrayidx2_i15_i_stall_local)
		begin
			if (~(rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG))
			begin
				rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG <= rstag_6to6_bb2_arrayidx2_i15_i_inputs_ready;
			end
		end
		else
		begin
			rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_6to6_bb2_arrayidx2_i15_i_staging_valid_NO_SHIFT_REG))
		begin
			rstag_6to6_bb2_arrayidx2_i15_i_staging_reg_NO_SHIFT_REG <= local_bb2_arrayidx2_i15_i_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb2_st__inputs_ready;
 reg local_bb2_st__valid_out_NO_SHIFT_REG;
wire local_bb2_st__stall_in;
wire local_bb2_st__output_regs_ready;
wire local_bb2_st__fu_stall_out;
wire local_bb2_st__fu_valid_out;
wire [7:0] local_bb2_st__lsu_wackout;
 reg local_bb2_st__NO_SHIFT_REG;
wire local_bb2_st__causedstall;

lsu_top lsu_local_bb2_st_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb2_st__fu_stall_out),
	.i_valid(local_bb2_st__inputs_ready),
	.i_address(rstag_6to6_bb2_arrayidx2_i15_i),
	.i_writedata(rstag_6to6_bb2_ld_),
	.i_cmpdata(),
	.i_predicate(input_wii_var_),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb2_st__output_regs_ready)),
	.o_valid(local_bb2_st__fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(local_bb2_st__input_fifo_depth),
	.o_writeack(local_bb2_st__lsu_wackout),
	.i_atomic_op(3'h0),
	.o_active(),
	.avm_address(avm_local_bb2_st__address),
	.avm_read(avm_local_bb2_st__read),
	.avm_enable(avm_local_bb2_st__enable),
	.avm_readdata(avm_local_bb2_st__readdata),
	.avm_write(avm_local_bb2_st__write),
	.avm_writeack(avm_local_bb2_st__writeack),
	.avm_burstcount(avm_local_bb2_st__burstcount),
	.avm_writedata(avm_local_bb2_st__writedata),
	.avm_byteenable(avm_local_bb2_st__byteenable),
	.avm_waitrequest(avm_local_bb2_st__waitrequest),
	.avm_readdatavalid(avm_local_bb2_st__readdatavalid),
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

defparam lsu_local_bb2_st_.AWIDTH = 32;
defparam lsu_local_bb2_st_.WIDTH_BYTES = 1;
defparam lsu_local_bb2_st_.MWIDTH_BYTES = 1;
defparam lsu_local_bb2_st_.WRITEDATAWIDTH_BYTES = 1;
defparam lsu_local_bb2_st_.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb2_st_.READ = 0;
defparam lsu_local_bb2_st_.ATOMIC = 0;
defparam lsu_local_bb2_st_.WIDTH = 8;
defparam lsu_local_bb2_st_.MWIDTH = 8;
defparam lsu_local_bb2_st_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb2_st_.BURSTCOUNT_WIDTH = 1;
defparam lsu_local_bb2_st_.KERNEL_SIDE_MEM_LATENCY = 2;
defparam lsu_local_bb2_st_.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb2_st_.USE_WRITE_ACK = 0;
defparam lsu_local_bb2_st_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb2_st_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb2_st_.NUMBER_BANKS = 1;
defparam lsu_local_bb2_st_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb2_st_.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb2_st_.USEINPUTFIFO = 0;
defparam lsu_local_bb2_st_.USECACHING = 0;
defparam lsu_local_bb2_st_.USEOUTPUTFIFO = 1;
defparam lsu_local_bb2_st_.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb2_st_.ADDRSPACE = 6;
defparam lsu_local_bb2_st_.STYLE = "PIPELINED";
defparam lsu_local_bb2_st_.USE_BYTE_EN = 0;

assign local_bb2_st__inputs_ready = (rnode_3to6_var__0_valid_out_NO_SHIFT_REG & rstag_6to6_bb2_ld__valid_out & rstag_6to6_bb2_arrayidx2_i15_i_valid_out);
assign local_bb2_st__output_regs_ready = (&(~(local_bb2_st__valid_out_NO_SHIFT_REG) | ~(local_bb2_st__stall_in)));
assign rnode_3to6_var__0_stall_in_NO_SHIFT_REG = (local_bb2_st__fu_stall_out | ~(local_bb2_st__inputs_ready));
assign rstag_6to6_bb2_ld__stall_in = (local_bb2_st__fu_stall_out | ~(local_bb2_st__inputs_ready));
assign rstag_6to6_bb2_arrayidx2_i15_i_stall_in = (local_bb2_st__fu_stall_out | ~(local_bb2_st__inputs_ready));
assign local_bb2_st__causedstall = (local_bb2_st__inputs_ready && (local_bb2_st__fu_stall_out && !(~(local_bb2_st__output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb2_st__NO_SHIFT_REG <= 'x;
		local_bb2_st__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb2_st__output_regs_ready)
		begin
			local_bb2_st__NO_SHIFT_REG <= local_bb2_st__lsu_wackout;
			local_bb2_st__valid_out_NO_SHIFT_REG <= local_bb2_st__fu_valid_out;
		end
		else
		begin
			if (~(local_bb2_st__stall_in))
			begin
				local_bb2_st__valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_8to8_bb2_st__valid_out;
wire rstag_8to8_bb2_st__stall_in;
wire rstag_8to8_bb2_st__inputs_ready;
wire rstag_8to8_bb2_st__stall_local;
 reg rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG;
wire rstag_8to8_bb2_st__combined_valid;
 reg rstag_8to8_bb2_st__staging_reg_NO_SHIFT_REG;
wire rstag_8to8_bb2_st_;

assign rstag_8to8_bb2_st__inputs_ready = local_bb2_st__valid_out_NO_SHIFT_REG;
assign rstag_8to8_bb2_st_ = (rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG ? rstag_8to8_bb2_st__staging_reg_NO_SHIFT_REG : local_bb2_st__NO_SHIFT_REG);
assign rstag_8to8_bb2_st__combined_valid = (rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG | rstag_8to8_bb2_st__inputs_ready);
assign rstag_8to8_bb2_st__valid_out = rstag_8to8_bb2_st__combined_valid;
assign rstag_8to8_bb2_st__stall_local = rstag_8to8_bb2_st__stall_in;
assign local_bb2_st__stall_in = (|rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_8to8_bb2_st__staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_8to8_bb2_st__stall_local)
		begin
			if (~(rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG))
			begin
				rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG <= rstag_8to8_bb2_st__inputs_ready;
			end
		end
		else
		begin
			rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_8to8_bb2_st__staging_valid_NO_SHIFT_REG))
		begin
			rstag_8to8_bb2_st__staging_reg_NO_SHIFT_REG <= local_bb2_st__NO_SHIFT_REG;
		end
	end
end


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_0_NO_SHIFT_REG;
 reg branch_compare_result_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;

assign branch_var__inputs_ready = (rnode_2to8_bb2_c0_exe4_0_valid_out_NO_SHIFT_REG & rstag_8to8_bb2_st__valid_out);
assign branch_var__output_regs_ready = (~(branch_node_valid_out_0_NO_SHIFT_REG) | (((branch_compare_result_NO_SHIFT_REG != 1'b1) & ~(stall_in_1)) | (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & ~(stall_in_0))));
assign rnode_2to8_bb2_c0_exe4_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rstag_8to8_bb2_st__stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out_0 = (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG);
assign valid_out_1 = ((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG);
assign combined_branch_stall_in_signal = ((((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_1) | ((~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_0));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		branch_compare_result_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_0_NO_SHIFT_REG <= branch_var__inputs_ready;
			branch_compare_result_NO_SHIFT_REG <= rnode_2to8_bb2_c0_exe4_0_NO_SHIFT_REG;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_3
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_wii_conv,
		input 		input_wii_cmp11,
		input [63:0] 		input_wii_conv_i19_i,
		input 		input_wii_cmp_i20_i1,
		input 		input_wii_var_,
		input 		input_wii_var__u6,
		input 		input_wii_var__u7,
		input 		valid_in_0,
		output 		stall_out_0,
		input 		input_forked153_0,
		input 		valid_in_1,
		output 		stall_out_1,
		input 		input_forked153_1,
		output 		valid_out_0,
		input 		stall_in_0,
		output 		valid_out_1,
		input 		stall_in_1,
		input [31:0] 		workgroup_size,
		input 		start,
		input 		feedback_valid_in_10,
		output 		feedback_stall_out_10,
		input [63:0] 		feedback_data_in_10,
		output 		feedback_stall_out_2,
		input 		feedback_valid_in_3,
		output 		feedback_stall_out_3,
		input 		feedback_data_in_3,
		output 		acl_pipelined_valid,
		input 		acl_pipelined_stall,
		output 		acl_pipelined_exiting_valid,
		output 		acl_pipelined_exiting_stall,
		output 		feedback_valid_out_3,
		input 		feedback_stall_in_3,
		output 		feedback_data_out_3,
		output 		feedback_valid_out_10,
		input 		feedback_stall_in_10,
		output [63:0] 		feedback_data_out_10,
		output 		avm_local_bb3_ld__enable,
		input [7:0] 		avm_local_bb3_ld__readdata,
		input 		avm_local_bb3_ld__readdatavalid,
		input 		avm_local_bb3_ld__waitrequest,
		output [31:0] 		avm_local_bb3_ld__address,
		output 		avm_local_bb3_ld__read,
		output 		avm_local_bb3_ld__write,
		input 		avm_local_bb3_ld__writeack,
		output [7:0] 		avm_local_bb3_ld__writedata,
		output 		avm_local_bb3_ld__byteenable,
		output 		avm_local_bb3_ld__burstcount,
		output [7:0] 		local_bb3_ld__input_fifo_depth,
		input 		clock2x,
		output 		avm_local_bb3_st__enable,
		input [7:0] 		avm_local_bb3_st__readdata,
		input 		avm_local_bb3_st__readdatavalid,
		input 		avm_local_bb3_st__waitrequest,
		output [31:0] 		avm_local_bb3_st__address,
		output 		avm_local_bb3_st__read,
		output 		avm_local_bb3_st__write,
		input 		avm_local_bb3_st__writeack,
		output [7:0] 		avm_local_bb3_st__writedata,
		output 		avm_local_bb3_st__byteenable,
		output 		avm_local_bb3_st__burstcount,
		output [7:0] 		local_bb3_st__input_fifo_depth
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((valid_in_0 & valid_in_1) & ~((stall_out_0 | stall_out_1)));
assign _exit = ((valid_out_0 & valid_out_1) & ~((stall_in_0 | stall_in_1)));
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
 reg merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
 reg input_forked153_0_staging_reg_NO_SHIFT_REG;
 reg local_lvm_forked153_NO_SHIFT_REG;
 reg merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;
 reg input_forked153_1_staging_reg_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = (|(merge_node_stall_in & merge_node_valid_out_NO_SHIFT_REG));
assign stall_out_0 = merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
assign stall_out_1 = merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_0_staging_reg_NO_SHIFT_REG | valid_in_0))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		if ((merge_node_valid_in_1_staging_reg_NO_SHIFT_REG | valid_in_1))
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b1;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
		end
		else
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b0;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_forked153_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		input_forked153_1_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_0_staging_reg_NO_SHIFT_REG))
			begin
				input_forked153_0_staging_reg_NO_SHIFT_REG <= input_forked153_0;
				merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= valid_in_0;
			end
		end
		else
		begin
			merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
		if (((merge_block_selector_NO_SHIFT_REG != 1'b1) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_1_staging_reg_NO_SHIFT_REG))
			begin
				input_forked153_1_staging_reg_NO_SHIFT_REG <= input_forked153_1;
				merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= valid_in_1;
			end
		end
		else
		begin
			merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
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
				if (merge_node_valid_in_0_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked153_NO_SHIFT_REG <= input_forked153_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked153_NO_SHIFT_REG <= input_forked153_0;
				end
			end

			1'b1:
			begin
				if (merge_node_valid_in_1_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked153_NO_SHIFT_REG <= input_forked153_1_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked153_NO_SHIFT_REG <= input_forked153_1;
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
wire local_bb3_c0_eni1155_valid_out;
wire local_bb3_c0_eni1155_stall_in;
wire local_bb3_c0_eni1155_inputs_ready;
wire local_bb3_c0_eni1155_stall_local;
wire [15:0] local_bb3_c0_eni1155;

assign local_bb3_c0_eni1155_inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign local_bb3_c0_eni1155[7:0] = 8'bx;
assign local_bb3_c0_eni1155[8] = local_lvm_forked153_NO_SHIFT_REG;
assign local_bb3_c0_eni1155[15:9] = 7'bx;
assign local_bb3_c0_eni1155_valid_out = local_bb3_c0_eni1155_inputs_ready;
assign local_bb3_c0_eni1155_stall_local = local_bb3_c0_eni1155_stall_in;
assign merge_node_stall_in = (|local_bb3_c0_eni1155_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb3_c0_enter156_c0_eni1155_valid_out_0;
wire local_bb3_c0_enter156_c0_eni1155_stall_in_0;
wire local_bb3_c0_enter156_c0_eni1155_valid_out_1;
wire local_bb3_c0_enter156_c0_eni1155_stall_in_1;
wire local_bb3_c0_enter156_c0_eni1155_inputs_ready;
wire local_bb3_c0_enter156_c0_eni1155_stall_local;
wire local_bb3_c0_enter156_c0_eni1155_input_accepted;
wire [15:0] local_bb3_c0_enter156_c0_eni1155;
wire local_bb3_c0_exit160_c0_exi2159_entry_stall;
wire local_bb3_c0_enter156_c0_eni1155_valid_bit;
wire local_bb3_c0_exit160_c0_exi2159_output_regs_ready;
wire local_bb3_c0_exit160_c0_exi2159_valid_in;
wire local_bb3_c0_exit160_c0_exi2159_phases;
wire local_bb3_c0_enter156_c0_eni1155_inc_pipelined_thread;
wire local_bb3_c0_enter156_c0_eni1155_dec_pipelined_thread;
wire local_bb3_c0_enter156_c0_eni1155_fu_stall_out;

assign local_bb3_c0_enter156_c0_eni1155_inputs_ready = local_bb3_c0_eni1155_valid_out;
assign local_bb3_c0_enter156_c0_eni1155 = local_bb3_c0_eni1155;
assign local_bb3_c0_enter156_c0_eni1155_input_accepted = (local_bb3_c0_enter156_c0_eni1155_inputs_ready && !(local_bb3_c0_exit160_c0_exi2159_entry_stall));
assign local_bb3_c0_enter156_c0_eni1155_valid_bit = local_bb3_c0_enter156_c0_eni1155_input_accepted;
assign local_bb3_c0_enter156_c0_eni1155_inc_pipelined_thread = 1'b1;
assign local_bb3_c0_enter156_c0_eni1155_dec_pipelined_thread = ~(1'b0);
assign local_bb3_c0_enter156_c0_eni1155_fu_stall_out = (~(local_bb3_c0_enter156_c0_eni1155_inputs_ready) | local_bb3_c0_exit160_c0_exi2159_entry_stall);
assign local_bb3_c0_enter156_c0_eni1155_stall_local = (local_bb3_c0_enter156_c0_eni1155_stall_in_0 | local_bb3_c0_enter156_c0_eni1155_stall_in_1);
assign local_bb3_c0_enter156_c0_eni1155_valid_out_0 = local_bb3_c0_enter156_c0_eni1155_inputs_ready;
assign local_bb3_c0_enter156_c0_eni1155_valid_out_1 = local_bb3_c0_enter156_c0_eni1155_inputs_ready;
assign local_bb3_c0_eni1155_stall_in = (|local_bb3_c0_enter156_c0_eni1155_fu_stall_out);

// This section implements an unregistered operation.
// 
wire local_bb3_c0_ene1157_stall_local;
wire local_bb3_c0_ene1157;

assign local_bb3_c0_ene1157 = local_bb3_c0_enter156_c0_eni1155[8];

// This section implements an unregistered operation.
// 
wire SFC_2_VALID_1_1_0_stall_local;
wire SFC_2_VALID_1_1_0;

assign SFC_2_VALID_1_1_0 = local_bb3_c0_enter156_c0_eni1155_valid_bit;

// This section implements an unregistered operation.
// 
wire local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_stall_local;
wire [63:0] local_bb3_i_0_i_i6_pop10_acl_pop_i64_0;
wire local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_fu_valid_out;
wire local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_fu_stall_out;

acl_pop local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(local_bb3_c0_ene1157),
	.predicate(1'b0),
	.data_in(64'h0),
	.stall_out(local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_fu_stall_out),
	.valid_in(SFC_2_VALID_1_1_0),
	.valid_out(local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_fu_valid_out),
	.stall_in(local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_stall_local),
	.data_out(local_bb3_i_0_i_i6_pop10_acl_pop_i64_0),
	.feedback_in(feedback_data_in_10),
	.feedback_valid_in(feedback_valid_in_10),
	.feedback_stall_out(feedback_stall_out_10)
);

defparam local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_feedback.COALESCE_DISTANCE = 1;
defparam local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_feedback.DATA_WIDTH = 64;
defparam local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_feedback.STYLE = "REGULAR";

assign local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_stall_local = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb3_inc_i_i_stall_local;
wire [63:0] local_bb3_inc_i_i;

assign local_bb3_inc_i_i = (local_bb3_i_0_i_i6_pop10_acl_pop_i64_0 + 64'h1);

// This section implements an unregistered operation.
// 
wire local_bb3_cmp_i_i_stall_local;
wire [64:0] cmprep_local_bb3_cmp_i_i;
wire local_bb3_cmp_i_i;

assign cmprep_local_bb3_cmp_i_i = (local_bb3_inc_i_i - input_wii_conv_i19_i);
assign local_bb3_cmp_i_i = cmprep_local_bb3_cmp_i_i[64];

// This section implements an unregistered operation.
// 
wire local_bb3_var__stall_local;
wire local_bb3_var_;

assign local_bb3_var_ = (local_bb3_cmp_i_i & input_wii_var__u6);

// This section implements an unregistered operation.
// 
wire local_bb3_c0_ene1157_valid_out_1;
wire local_bb3_c0_ene1157_stall_in_1;
wire local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_valid_out_1;
wire local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_stall_in_1;
wire SFC_2_VALID_1_1_0_valid_out_0;
wire SFC_2_VALID_1_1_0_stall_in_0;
wire SFC_2_VALID_1_1_0_valid_out_2;
wire SFC_2_VALID_1_1_0_stall_in_2;
wire SFC_2_VALID_1_1_0_valid_out_3;
wire SFC_2_VALID_1_1_0_stall_in_3;
wire local_bb3_inc_i_i_valid_out_1;
wire local_bb3_inc_i_i_stall_in_1;
wire local_bb3_var__valid_out_0;
wire local_bb3_var__stall_in_0;
wire local_bb3_var__valid_out_1;
wire local_bb3_var__stall_in_1;
wire local_bb3_cmp_i_i_not_valid_out;
wire local_bb3_cmp_i_i_not_stall_in;
wire local_bb3_cmp_i_i_not_inputs_ready;
wire local_bb3_cmp_i_i_not_stall_local;
wire local_bb3_cmp_i_i_not;

assign local_bb3_cmp_i_i_not_inputs_ready = (local_bb3_c0_enter156_c0_eni1155_valid_out_0 & local_bb3_c0_enter156_c0_eni1155_valid_out_1);
assign local_bb3_cmp_i_i_not = (local_bb3_cmp_i_i ^ 1'b1);
assign local_bb3_c0_ene1157_valid_out_1 = 1'b1;
assign local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_valid_out_1 = 1'b1;
assign SFC_2_VALID_1_1_0_valid_out_0 = 1'b1;
assign SFC_2_VALID_1_1_0_valid_out_2 = 1'b1;
assign SFC_2_VALID_1_1_0_valid_out_3 = 1'b1;
assign local_bb3_inc_i_i_valid_out_1 = 1'b1;
assign local_bb3_var__valid_out_0 = 1'b1;
assign local_bb3_var__valid_out_1 = 1'b1;
assign local_bb3_cmp_i_i_not_valid_out = 1'b1;
assign local_bb3_c0_enter156_c0_eni1155_stall_in_0 = 1'b0;
assign local_bb3_c0_enter156_c0_eni1155_stall_in_1 = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG;
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_1_NO_SHIFT_REG;
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb3_i_0_i_i6_pop10_acl_pop_i64_0),
	.data_out(rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb3_i_0_i_i6_pop10_acl_pop_i64_0_stall_in_1 = 1'b0;
assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG = rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_1_NO_SHIFT_REG = rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire SFC_2_VALID_1_2_0_inputs_ready;
 reg SFC_2_VALID_1_2_0_valid_out_0_NO_SHIFT_REG;
wire SFC_2_VALID_1_2_0_stall_in_0;
 reg SFC_2_VALID_1_2_0_valid_out_1_NO_SHIFT_REG;
wire SFC_2_VALID_1_2_0_stall_in_1;
wire SFC_2_VALID_1_2_0_output_regs_ready;
 reg SFC_2_VALID_1_2_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_1_2_0_causedstall;

assign SFC_2_VALID_1_2_0_inputs_ready = 1'b1;
assign SFC_2_VALID_1_2_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_1_1_0_stall_in_0 = 1'b0;
assign SFC_2_VALID_1_2_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_1_2_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_1_2_0_output_regs_ready)
		begin
			SFC_2_VALID_1_2_0_NO_SHIFT_REG <= SFC_2_VALID_1_1_0;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb3_keep_going138_acl_pipeline_1_inputs_ready;
 reg local_bb3_keep_going138_acl_pipeline_1_valid_out_NO_SHIFT_REG;
wire local_bb3_keep_going138_acl_pipeline_1_stall_in;
wire local_bb3_keep_going138_acl_pipeline_1_output_regs_ready;
wire local_bb3_keep_going138_acl_pipeline_1_keep_going;
wire local_bb3_keep_going138_acl_pipeline_1_fu_valid_out;
wire local_bb3_keep_going138_acl_pipeline_1_fu_stall_out;
 reg local_bb3_keep_going138_acl_pipeline_1_NO_SHIFT_REG;
wire local_bb3_keep_going138_acl_pipeline_1_feedback_pipelined;
wire local_bb3_keep_going138_acl_pipeline_1_causedstall;

acl_pipeline local_bb3_keep_going138_acl_pipeline_1_pipelined (
	.clock(clock),
	.resetn(resetn),
	.data_in(1'b1),
	.stall_out(local_bb3_keep_going138_acl_pipeline_1_fu_stall_out),
	.valid_in(SFC_2_VALID_1_1_0),
	.valid_out(local_bb3_keep_going138_acl_pipeline_1_fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb3_keep_going138_acl_pipeline_1_keep_going),
	.initeration_in(1'b0),
	.initeration_valid_in(1'b0),
	.initeration_stall_out(feedback_stall_out_2),
	.not_exitcond_in(feedback_data_in_3),
	.not_exitcond_valid_in(feedback_valid_in_3),
	.not_exitcond_stall_out(feedback_stall_out_3),
	.pipeline_valid_out(acl_pipelined_valid),
	.pipeline_stall_in(acl_pipelined_stall),
	.exiting_valid_out(acl_pipelined_exiting_valid)
);

defparam local_bb3_keep_going138_acl_pipeline_1_pipelined.FIFO_DEPTH = 0;
defparam local_bb3_keep_going138_acl_pipeline_1_pipelined.STYLE = "NON_SPECULATIVE";

assign local_bb3_keep_going138_acl_pipeline_1_inputs_ready = 1'b1;
assign local_bb3_keep_going138_acl_pipeline_1_output_regs_ready = 1'b1;
assign acl_pipelined_exiting_stall = acl_pipelined_stall;
assign local_bb3_c0_ene1157_stall_in_1 = 1'b0;
assign SFC_2_VALID_1_1_0_stall_in_2 = 1'b0;
assign local_bb3_keep_going138_acl_pipeline_1_causedstall = (SFC_2_VALID_1_1_0 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_keep_going138_acl_pipeline_1_NO_SHIFT_REG <= 'x;
		local_bb3_keep_going138_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb3_keep_going138_acl_pipeline_1_output_regs_ready)
		begin
			local_bb3_keep_going138_acl_pipeline_1_NO_SHIFT_REG <= local_bb3_keep_going138_acl_pipeline_1_keep_going;
			local_bb3_keep_going138_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb3_keep_going138_acl_pipeline_1_stall_in))
			begin
				local_bb3_keep_going138_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb3_inc_i_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb3_inc_i_i_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb3_inc_i_i_0_NO_SHIFT_REG;
 logic rnode_1to2_bb3_inc_i_i_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb3_inc_i_i_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_inc_i_i_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_inc_i_i_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_inc_i_i_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb3_inc_i_i_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb3_inc_i_i_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb3_inc_i_i_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb3_inc_i_i_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb3_inc_i_i_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb3_inc_i_i),
	.data_out(rnode_1to2_bb3_inc_i_i_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb3_inc_i_i_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb3_inc_i_i_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb3_inc_i_i_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb3_inc_i_i_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb3_inc_i_i_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb3_inc_i_i_stall_in_1 = 1'b0;
assign rnode_1to2_bb3_inc_i_i_0_NO_SHIFT_REG = rnode_1to2_bb3_inc_i_i_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb3_inc_i_i_0_stall_in_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb3_inc_i_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire local_bb3_notexitcond139__inputs_ready;
wire local_bb3_notexitcond139__output_regs_ready;
wire local_bb3_notexitcond139__result;
wire local_bb3_notexitcond139__fu_valid_out;
wire local_bb3_notexitcond139__fu_stall_out;
 reg local_bb3_notexitcond139__NO_SHIFT_REG;
wire local_bb3_notexitcond139__causedstall;

acl_push local_bb3_notexitcond139__feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(1'b1),
	.predicate(1'b0),
	.data_in(local_bb3_var_),
	.stall_out(local_bb3_notexitcond139__fu_stall_out),
	.valid_in(SFC_2_VALID_1_1_0),
	.valid_out(local_bb3_notexitcond139__fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb3_notexitcond139__result),
	.feedback_out(feedback_data_out_3),
	.feedback_valid_out(feedback_valid_out_3),
	.feedback_stall_in(feedback_stall_in_3)
);

defparam local_bb3_notexitcond139__feedback.STALLFREE = 1;
defparam local_bb3_notexitcond139__feedback.ENABLED = 0;
defparam local_bb3_notexitcond139__feedback.DATA_WIDTH = 1;
defparam local_bb3_notexitcond139__feedback.FIFO_DEPTH = 0;
defparam local_bb3_notexitcond139__feedback.MIN_FIFO_LATENCY = 0;
defparam local_bb3_notexitcond139__feedback.STYLE = "REGULAR";
defparam local_bb3_notexitcond139__feedback.RAM_FIFO_DEPTH_INC = 1;

assign local_bb3_notexitcond139__inputs_ready = 1'b1;
assign local_bb3_notexitcond139__output_regs_ready = 1'b1;
assign local_bb3_var__stall_in_0 = 1'b0;
assign SFC_2_VALID_1_1_0_stall_in_3 = 1'b0;
assign local_bb3_notexitcond139__causedstall = (SFC_2_VALID_1_1_0 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_notexitcond139__NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb3_notexitcond139__output_regs_ready)
		begin
			local_bb3_notexitcond139__NO_SHIFT_REG <= local_bb3_notexitcond139__result;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb3_var__0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_stall_in_0_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_stall_in_1_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__1_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_var__0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb3_var__0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb3_var__0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb3_var__0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb3_var__0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb3_var__0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb3_var_),
	.data_out(rnode_1to2_bb3_var__0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb3_var__0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb3_var__0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb3_var__0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb3_var__0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb3_var__0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb3_var__stall_in_1 = 1'b0;
assign rnode_1to2_bb3_var__0_stall_in_0_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb3_var__0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb3_var__0_NO_SHIFT_REG = rnode_1to2_bb3_var__0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb3_var__0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb3_var__1_NO_SHIFT_REG = rnode_1to2_bb3_var__0_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb3_cmp_i_i_not_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb3_cmp_i_i_not_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb3_cmp_i_i_not_0_NO_SHIFT_REG;
 logic rnode_1to2_bb3_cmp_i_i_not_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb3_cmp_i_i_not_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_cmp_i_i_not_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_cmp_i_i_not_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb3_cmp_i_i_not_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb3_cmp_i_i_not_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb3_cmp_i_i_not_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb3_cmp_i_i_not_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb3_cmp_i_i_not_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb3_cmp_i_i_not_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb3_cmp_i_i_not),
	.data_out(rnode_1to2_bb3_cmp_i_i_not_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb3_cmp_i_i_not_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb3_cmp_i_i_not_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb3_cmp_i_i_not_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb3_cmp_i_i_not_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb3_cmp_i_i_not_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb3_cmp_i_i_not_stall_in = 1'b0;
assign rnode_1to2_bb3_cmp_i_i_not_0_NO_SHIFT_REG = rnode_1to2_bb3_cmp_i_i_not_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb3_cmp_i_i_not_0_stall_in_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb3_cmp_i_i_not_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire local_bb3_arrayidx_i_i_inputs_ready;
 reg local_bb3_arrayidx_i_i_valid_out_NO_SHIFT_REG;
wire local_bb3_arrayidx_i_i_stall_in;
wire local_bb3_arrayidx_i_i_output_regs_ready;
 reg [31:0] local_bb3_arrayidx_i_i_NO_SHIFT_REG;
wire [31:0] local_bb3_arrayidx_i_i_op_wire;
wire local_bb3_arrayidx_i_i_causedstall;

assign local_bb3_arrayidx_i_i_inputs_ready = 1'b1;
assign local_bb3_arrayidx_i_i_output_regs_ready = 1'b1;
assign local_bb3_arrayidx_i_i_op_wire = (64'h0 + rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG);
assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign local_bb3_arrayidx_i_i_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_arrayidx_i_i_NO_SHIFT_REG <= 'x;
		local_bb3_arrayidx_i_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb3_arrayidx_i_i_output_regs_ready)
		begin
			local_bb3_arrayidx_i_i_NO_SHIFT_REG <= local_bb3_arrayidx_i_i_op_wire;
			local_bb3_arrayidx_i_i_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb3_arrayidx_i_i_stall_in))
			begin
				local_bb3_arrayidx_i_i_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG;
 logic rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_1_NO_SHIFT_REG),
	.data_out(rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_fifo.DATA_WIDTH = 64;
defparam rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG = rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_2_VALID_2_3_0_inputs_ready;
 reg SFC_2_VALID_2_3_0_valid_out_0_NO_SHIFT_REG;
wire SFC_2_VALID_2_3_0_stall_in_0;
 reg SFC_2_VALID_2_3_0_valid_out_1_NO_SHIFT_REG;
wire SFC_2_VALID_2_3_0_stall_in_1;
wire SFC_2_VALID_2_3_0_output_regs_ready;
 reg SFC_2_VALID_2_3_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_2_3_0_causedstall;

assign SFC_2_VALID_2_3_0_inputs_ready = 1'b1;
assign SFC_2_VALID_2_3_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_1_2_0_stall_in_0 = 1'b0;
assign SFC_2_VALID_2_3_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_2_3_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_2_3_0_output_regs_ready)
		begin
			SFC_2_VALID_2_3_0_NO_SHIFT_REG <= SFC_2_VALID_1_2_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb3_keep_going138_acl_pipeline_1_NO_SHIFT_REG),
	.data_out(rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_fifo.DATA_WIDTH = 1;
defparam rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb3_keep_going138_acl_pipeline_1_stall_in = 1'b0;
assign rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG = rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire local_bb3_i_0_i_i6_push10_inc_i_i_inputs_ready;
wire local_bb3_i_0_i_i6_push10_inc_i_i_output_regs_ready;
wire [63:0] local_bb3_i_0_i_i6_push10_inc_i_i_result;
wire local_bb3_i_0_i_i6_push10_inc_i_i_fu_valid_out;
wire local_bb3_i_0_i_i6_push10_inc_i_i_fu_stall_out;
 reg [63:0] local_bb3_i_0_i_i6_push10_inc_i_i_NO_SHIFT_REG;
wire local_bb3_i_0_i_i6_push10_inc_i_i_causedstall;

acl_push local_bb3_i_0_i_i6_push10_inc_i_i_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(rnode_1to2_bb3_var__0_NO_SHIFT_REG),
	.predicate(1'b0),
	.data_in(rnode_1to2_bb3_inc_i_i_0_NO_SHIFT_REG),
	.stall_out(local_bb3_i_0_i_i6_push10_inc_i_i_fu_stall_out),
	.valid_in(SFC_2_VALID_1_2_0_NO_SHIFT_REG),
	.valid_out(local_bb3_i_0_i_i6_push10_inc_i_i_fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb3_i_0_i_i6_push10_inc_i_i_result),
	.feedback_out(feedback_data_out_10),
	.feedback_valid_out(feedback_valid_out_10),
	.feedback_stall_in(feedback_stall_in_10)
);

defparam local_bb3_i_0_i_i6_push10_inc_i_i_feedback.STALLFREE = 1;
defparam local_bb3_i_0_i_i6_push10_inc_i_i_feedback.ENABLED = 0;
defparam local_bb3_i_0_i_i6_push10_inc_i_i_feedback.DATA_WIDTH = 64;
defparam local_bb3_i_0_i_i6_push10_inc_i_i_feedback.FIFO_DEPTH = 1;
defparam local_bb3_i_0_i_i6_push10_inc_i_i_feedback.MIN_FIFO_LATENCY = 0;
defparam local_bb3_i_0_i_i6_push10_inc_i_i_feedback.STYLE = "REGULAR";
defparam local_bb3_i_0_i_i6_push10_inc_i_i_feedback.RAM_FIFO_DEPTH_INC = 0;

assign local_bb3_i_0_i_i6_push10_inc_i_i_inputs_ready = 1'b1;
assign local_bb3_i_0_i_i6_push10_inc_i_i_output_regs_ready = 1'b1;
assign SFC_2_VALID_1_2_0_stall_in_1 = 1'b0;
assign rnode_1to2_bb3_inc_i_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb3_var__0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign local_bb3_i_0_i_i6_push10_inc_i_i_causedstall = (SFC_2_VALID_1_2_0_NO_SHIFT_REG && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_i_0_i_i6_push10_inc_i_i_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb3_i_0_i_i6_push10_inc_i_i_output_regs_ready)
		begin
			local_bb3_i_0_i_i6_push10_inc_i_i_NO_SHIFT_REG <= local_bb3_i_0_i_i6_push10_inc_i_i_result;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb3_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb3_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_2to3_bb3_var__0_NO_SHIFT_REG;
 logic rnode_2to3_bb3_var__0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to3_bb3_var__0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_var__0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_var__0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb3_var__0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb3_var__0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb3_var__0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb3_var__0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb3_var__0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb3_var__0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(rnode_1to2_bb3_var__1_NO_SHIFT_REG),
	.data_out(rnode_2to3_bb3_var__0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb3_var__0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb3_var__0_reg_3_fifo.DATA_WIDTH = 1;
defparam rnode_2to3_bb3_var__0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb3_var__0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb3_var__0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb3_var__0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb3_var__0_NO_SHIFT_REG = rnode_2to3_bb3_var__0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb3_var__0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb3_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 7
//  * capacity = 7
 logic rnode_2to9_bb3_cmp_i_i_not_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to9_bb3_cmp_i_i_not_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to9_bb3_cmp_i_i_not_0_NO_SHIFT_REG;
 logic rnode_2to9_bb3_cmp_i_i_not_0_reg_9_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to9_bb3_cmp_i_i_not_0_reg_9_NO_SHIFT_REG;
 logic rnode_2to9_bb3_cmp_i_i_not_0_valid_out_reg_9_NO_SHIFT_REG;
 logic rnode_2to9_bb3_cmp_i_i_not_0_stall_in_reg_9_NO_SHIFT_REG;
 logic rnode_2to9_bb3_cmp_i_i_not_0_stall_out_reg_9_NO_SHIFT_REG;

acl_data_fifo rnode_2to9_bb3_cmp_i_i_not_0_reg_9_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to9_bb3_cmp_i_i_not_0_reg_9_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to9_bb3_cmp_i_i_not_0_stall_in_reg_9_NO_SHIFT_REG),
	.valid_out(rnode_2to9_bb3_cmp_i_i_not_0_valid_out_reg_9_NO_SHIFT_REG),
	.stall_out(rnode_2to9_bb3_cmp_i_i_not_0_stall_out_reg_9_NO_SHIFT_REG),
	.data_in(rnode_1to2_bb3_cmp_i_i_not_0_NO_SHIFT_REG),
	.data_out(rnode_2to9_bb3_cmp_i_i_not_0_reg_9_NO_SHIFT_REG)
);

defparam rnode_2to9_bb3_cmp_i_i_not_0_reg_9_fifo.DEPTH = 7;
defparam rnode_2to9_bb3_cmp_i_i_not_0_reg_9_fifo.DATA_WIDTH = 1;
defparam rnode_2to9_bb3_cmp_i_i_not_0_reg_9_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to9_bb3_cmp_i_i_not_0_reg_9_fifo.IMPL = "shift_reg";

assign rnode_2to9_bb3_cmp_i_i_not_0_reg_9_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb3_cmp_i_i_not_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_2to9_bb3_cmp_i_i_not_0_NO_SHIFT_REG = rnode_2to9_bb3_cmp_i_i_not_0_reg_9_NO_SHIFT_REG;
assign rnode_2to9_bb3_cmp_i_i_not_0_stall_in_reg_9_NO_SHIFT_REG = 1'b0;
assign rnode_2to9_bb3_cmp_i_i_not_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_NO_SHIFT_REG;
 logic rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG;
 logic rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_NO_SHIFT_REG;
 logic rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_reg_5_NO_SHIFT_REG;
 logic rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_5_NO_SHIFT_REG;
 logic rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_5_NO_SHIFT_REG;

acl_data_fifo rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_5_NO_SHIFT_REG),
	.valid_out(rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_reg_5_NO_SHIFT_REG),
	.stall_out(rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_5_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG),
	.data_out(rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_NO_SHIFT_REG)
);

defparam rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_fifo.DEPTH = 2;
defparam rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_fifo.DATA_WIDTH = 64;
defparam rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_fifo.IMPL = "shift_reg";

assign rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG = rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_5_NO_SHIFT_REG;
assign rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_5_NO_SHIFT_REG = 1'b0;
assign rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_2_VALID_3_4_0_inputs_ready;
 reg SFC_2_VALID_3_4_0_valid_out_NO_SHIFT_REG;
wire SFC_2_VALID_3_4_0_stall_in;
wire SFC_2_VALID_3_4_0_output_regs_ready;
 reg SFC_2_VALID_3_4_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_3_4_0_causedstall;

assign SFC_2_VALID_3_4_0_inputs_ready = 1'b1;
assign SFC_2_VALID_3_4_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_2_3_0_stall_in_0 = 1'b0;
assign SFC_2_VALID_3_4_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_3_4_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_3_4_0_output_regs_ready)
		begin
			SFC_2_VALID_3_4_0_NO_SHIFT_REG <= SFC_2_VALID_2_3_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb3_ld__inputs_ready;
 reg local_bb3_ld__valid_out_NO_SHIFT_REG;
wire local_bb3_ld__stall_in;
wire local_bb3_ld__output_regs_ready;
wire local_bb3_ld__fu_stall_out;
wire local_bb3_ld__fu_valid_out;
wire [7:0] local_bb3_ld__lsu_dataout;
 reg [7:0] local_bb3_ld__NO_SHIFT_REG;
wire local_bb3_ld__causedstall;

lsu_top lsu_local_bb3_ld_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb3_ld__fu_stall_out),
	.i_valid(SFC_2_VALID_2_3_0_NO_SHIFT_REG),
	.i_address(local_bb3_arrayidx_i_i_NO_SHIFT_REG),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(input_wii_var_),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(1'b0),
	.o_valid(local_bb3_ld__fu_valid_out),
	.o_readdata(local_bb3_ld__lsu_dataout),
	.o_input_fifo_depth(local_bb3_ld__input_fifo_depth),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(),
	.avm_address(avm_local_bb3_ld__address),
	.avm_read(avm_local_bb3_ld__read),
	.avm_enable(avm_local_bb3_ld__enable),
	.avm_readdata(avm_local_bb3_ld__readdata),
	.avm_write(avm_local_bb3_ld__write),
	.avm_writeack(avm_local_bb3_ld__writeack),
	.avm_burstcount(avm_local_bb3_ld__burstcount),
	.avm_writedata(avm_local_bb3_ld__writedata),
	.avm_byteenable(avm_local_bb3_ld__byteenable),
	.avm_waitrequest(avm_local_bb3_ld__waitrequest),
	.avm_readdatavalid(avm_local_bb3_ld__readdatavalid),
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

defparam lsu_local_bb3_ld_.AWIDTH = 32;
defparam lsu_local_bb3_ld_.WIDTH_BYTES = 1;
defparam lsu_local_bb3_ld_.MWIDTH_BYTES = 1;
defparam lsu_local_bb3_ld_.WRITEDATAWIDTH_BYTES = 1;
defparam lsu_local_bb3_ld_.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb3_ld_.READ = 1;
defparam lsu_local_bb3_ld_.ATOMIC = 0;
defparam lsu_local_bb3_ld_.WIDTH = 8;
defparam lsu_local_bb3_ld_.MWIDTH = 8;
defparam lsu_local_bb3_ld_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb3_ld_.BURSTCOUNT_WIDTH = 1;
defparam lsu_local_bb3_ld_.KERNEL_SIDE_MEM_LATENCY = 4;
defparam lsu_local_bb3_ld_.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb3_ld_.USE_WRITE_ACK = 0;
defparam lsu_local_bb3_ld_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb3_ld_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb3_ld_.NUMBER_BANKS = 1;
defparam lsu_local_bb3_ld_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb3_ld_.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb3_ld_.USEINPUTFIFO = 0;
defparam lsu_local_bb3_ld_.USECACHING = 0;
defparam lsu_local_bb3_ld_.USEOUTPUTFIFO = 0;
defparam lsu_local_bb3_ld_.FORCE_NOP_SUPPORT = 1;
defparam lsu_local_bb3_ld_.ADDRSPACE = 6;
defparam lsu_local_bb3_ld_.STYLE = "PIPELINED";

assign local_bb3_ld__inputs_ready = 1'b1;
assign local_bb3_ld__output_regs_ready = 1'b1;
assign local_bb3_arrayidx_i_i_stall_in = 1'b0;
assign SFC_2_VALID_2_3_0_stall_in_1 = 1'b0;
assign local_bb3_ld__causedstall = (SFC_2_VALID_2_3_0_NO_SHIFT_REG && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_ld__NO_SHIFT_REG <= 'x;
		local_bb3_ld__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb3_ld__output_regs_ready)
		begin
			local_bb3_ld__NO_SHIFT_REG <= local_bb3_ld__lsu_dataout;
			local_bb3_ld__valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb3_ld__stall_in))
			begin
				local_bb3_ld__valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// Register node:
//  * latency = 6
//  * capacity = 6
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_inputs_ready_NO_SHIFT_REG;
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_NO_SHIFT_REG;
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_valid_out_reg_9_NO_SHIFT_REG;
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_9_NO_SHIFT_REG;
 logic rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_stall_out_reg_9_NO_SHIFT_REG;

acl_data_fifo rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_9_NO_SHIFT_REG),
	.valid_out(rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_valid_out_reg_9_NO_SHIFT_REG),
	.stall_out(rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_stall_out_reg_9_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG),
	.data_out(rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_NO_SHIFT_REG)
);

defparam rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_fifo.DEPTH = 6;
defparam rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_fifo.DATA_WIDTH = 1;
defparam rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_fifo.IMPL = "shift_reg";

assign rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb3_keep_going138_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG = rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_reg_9_NO_SHIFT_REG;
assign rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_9_NO_SHIFT_REG = 1'b0;
assign rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 6
//  * capacity = 6
 logic rnode_3to9_bb3_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_3to9_bb3_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_3to9_bb3_var__0_NO_SHIFT_REG;
 logic rnode_3to9_bb3_var__0_reg_9_inputs_ready_NO_SHIFT_REG;
 logic rnode_3to9_bb3_var__0_reg_9_NO_SHIFT_REG;
 logic rnode_3to9_bb3_var__0_valid_out_reg_9_NO_SHIFT_REG;
 logic rnode_3to9_bb3_var__0_stall_in_reg_9_NO_SHIFT_REG;
 logic rnode_3to9_bb3_var__0_stall_out_reg_9_NO_SHIFT_REG;

acl_data_fifo rnode_3to9_bb3_var__0_reg_9_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to9_bb3_var__0_reg_9_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to9_bb3_var__0_stall_in_reg_9_NO_SHIFT_REG),
	.valid_out(rnode_3to9_bb3_var__0_valid_out_reg_9_NO_SHIFT_REG),
	.stall_out(rnode_3to9_bb3_var__0_stall_out_reg_9_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb3_var__0_NO_SHIFT_REG),
	.data_out(rnode_3to9_bb3_var__0_reg_9_NO_SHIFT_REG)
);

defparam rnode_3to9_bb3_var__0_reg_9_fifo.DEPTH = 6;
defparam rnode_3to9_bb3_var__0_reg_9_fifo.DATA_WIDTH = 1;
defparam rnode_3to9_bb3_var__0_reg_9_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to9_bb3_var__0_reg_9_fifo.IMPL = "shift_reg";

assign rnode_3to9_bb3_var__0_reg_9_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb3_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to9_bb3_var__0_NO_SHIFT_REG = rnode_3to9_bb3_var__0_reg_9_NO_SHIFT_REG;
assign rnode_3to9_bb3_var__0_stall_in_reg_9_NO_SHIFT_REG = 1'b0;
assign rnode_3to9_bb3_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_9to10_bb3_cmp_i_i_not_0_valid_out_NO_SHIFT_REG;
 logic rnode_9to10_bb3_cmp_i_i_not_0_stall_in_NO_SHIFT_REG;
 logic rnode_9to10_bb3_cmp_i_i_not_0_NO_SHIFT_REG;
 logic rnode_9to10_bb3_cmp_i_i_not_0_reg_10_inputs_ready_NO_SHIFT_REG;
 logic rnode_9to10_bb3_cmp_i_i_not_0_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_cmp_i_i_not_0_valid_out_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_cmp_i_i_not_0_stall_in_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_cmp_i_i_not_0_stall_out_reg_10_NO_SHIFT_REG;

acl_data_fifo rnode_9to10_bb3_cmp_i_i_not_0_reg_10_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_9to10_bb3_cmp_i_i_not_0_reg_10_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_9to10_bb3_cmp_i_i_not_0_stall_in_reg_10_NO_SHIFT_REG),
	.valid_out(rnode_9to10_bb3_cmp_i_i_not_0_valid_out_reg_10_NO_SHIFT_REG),
	.stall_out(rnode_9to10_bb3_cmp_i_i_not_0_stall_out_reg_10_NO_SHIFT_REG),
	.data_in(rnode_2to9_bb3_cmp_i_i_not_0_NO_SHIFT_REG),
	.data_out(rnode_9to10_bb3_cmp_i_i_not_0_reg_10_NO_SHIFT_REG)
);

defparam rnode_9to10_bb3_cmp_i_i_not_0_reg_10_fifo.DEPTH = 1;
defparam rnode_9to10_bb3_cmp_i_i_not_0_reg_10_fifo.DATA_WIDTH = 1;
defparam rnode_9to10_bb3_cmp_i_i_not_0_reg_10_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_9to10_bb3_cmp_i_i_not_0_reg_10_fifo.IMPL = "shift_reg";

assign rnode_9to10_bb3_cmp_i_i_not_0_reg_10_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to9_bb3_cmp_i_i_not_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_9to10_bb3_cmp_i_i_not_0_NO_SHIFT_REG = rnode_9to10_bb3_cmp_i_i_not_0_reg_10_NO_SHIFT_REG;
assign rnode_9to10_bb3_cmp_i_i_not_0_stall_in_reg_10_NO_SHIFT_REG = 1'b0;
assign rnode_9to10_bb3_cmp_i_i_not_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_NO_SHIFT_REG;
 logic rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG;
 logic rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_NO_SHIFT_REG;
 logic rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_reg_6_NO_SHIFT_REG;
 logic rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_6_NO_SHIFT_REG;
 logic rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_6_NO_SHIFT_REG;

acl_data_fifo rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_6_NO_SHIFT_REG),
	.valid_out(rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_reg_6_NO_SHIFT_REG),
	.stall_out(rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_out_reg_6_NO_SHIFT_REG),
	.data_in(rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG),
	.data_out(rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_NO_SHIFT_REG)
);

defparam rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_fifo.DEPTH = 1;
defparam rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_fifo.DATA_WIDTH = 64;
defparam rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_fifo.IMPL = "shift_reg";

assign rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to5_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG = rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_reg_6_NO_SHIFT_REG;
assign rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_reg_6_NO_SHIFT_REG = 1'b0;
assign rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_2_VALID_4_5_0_inputs_ready;
 reg SFC_2_VALID_4_5_0_valid_out_NO_SHIFT_REG;
wire SFC_2_VALID_4_5_0_stall_in;
wire SFC_2_VALID_4_5_0_output_regs_ready;
 reg SFC_2_VALID_4_5_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_4_5_0_causedstall;

assign SFC_2_VALID_4_5_0_inputs_ready = 1'b1;
assign SFC_2_VALID_4_5_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_3_4_0_stall_in = 1'b0;
assign SFC_2_VALID_4_5_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_4_5_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_4_5_0_output_regs_ready)
		begin
			SFC_2_VALID_4_5_0_NO_SHIFT_REG <= SFC_2_VALID_3_4_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_inputs_ready_NO_SHIFT_REG;
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_valid_out_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_stall_out_reg_10_NO_SHIFT_REG;

acl_data_fifo rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_10_NO_SHIFT_REG),
	.valid_out(rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_valid_out_reg_10_NO_SHIFT_REG),
	.stall_out(rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_stall_out_reg_10_NO_SHIFT_REG),
	.data_in(rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG),
	.data_out(rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_NO_SHIFT_REG)
);

defparam rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_fifo.DEPTH = 1;
defparam rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_fifo.DATA_WIDTH = 1;
defparam rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_fifo.IMPL = "shift_reg";

assign rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to9_bb3_keep_going138_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_NO_SHIFT_REG = rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_reg_10_NO_SHIFT_REG;
assign rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_stall_in_reg_10_NO_SHIFT_REG = 1'b0;
assign rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_9to10_bb3_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_9to10_bb3_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_9to10_bb3_var__0_NO_SHIFT_REG;
 logic rnode_9to10_bb3_var__0_reg_10_inputs_ready_NO_SHIFT_REG;
 logic rnode_9to10_bb3_var__0_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_var__0_valid_out_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_var__0_stall_in_reg_10_NO_SHIFT_REG;
 logic rnode_9to10_bb3_var__0_stall_out_reg_10_NO_SHIFT_REG;

acl_data_fifo rnode_9to10_bb3_var__0_reg_10_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_9to10_bb3_var__0_reg_10_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_9to10_bb3_var__0_stall_in_reg_10_NO_SHIFT_REG),
	.valid_out(rnode_9to10_bb3_var__0_valid_out_reg_10_NO_SHIFT_REG),
	.stall_out(rnode_9to10_bb3_var__0_stall_out_reg_10_NO_SHIFT_REG),
	.data_in(rnode_3to9_bb3_var__0_NO_SHIFT_REG),
	.data_out(rnode_9to10_bb3_var__0_reg_10_NO_SHIFT_REG)
);

defparam rnode_9to10_bb3_var__0_reg_10_fifo.DEPTH = 1;
defparam rnode_9to10_bb3_var__0_reg_10_fifo.DATA_WIDTH = 1;
defparam rnode_9to10_bb3_var__0_reg_10_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_9to10_bb3_var__0_reg_10_fifo.IMPL = "shift_reg";

assign rnode_9to10_bb3_var__0_reg_10_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to9_bb3_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_9to10_bb3_var__0_NO_SHIFT_REG = rnode_9to10_bb3_var__0_reg_10_NO_SHIFT_REG;
assign rnode_9to10_bb3_var__0_stall_in_reg_10_NO_SHIFT_REG = 1'b0;
assign rnode_9to10_bb3_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb3_notcmp136_stall_local;
wire local_bb3_notcmp136;

assign local_bb3_notcmp136 = (input_wii_var_ | rnode_9to10_bb3_cmp_i_i_not_0_NO_SHIFT_REG);

// This section implements a registered operation.
// 
wire local_bb3_arrayidx2_i_i_inputs_ready;
 reg local_bb3_arrayidx2_i_i_valid_out_NO_SHIFT_REG;
wire local_bb3_arrayidx2_i_i_stall_in;
wire local_bb3_arrayidx2_i_i_output_regs_ready;
 reg [31:0] local_bb3_arrayidx2_i_i_NO_SHIFT_REG;
wire [31:0] local_bb3_arrayidx2_i_i_op_wire;
wire local_bb3_arrayidx2_i_i_causedstall;

assign local_bb3_arrayidx2_i_i_inputs_ready = 1'b1;
assign local_bb3_arrayidx2_i_i_output_regs_ready = 1'b1;
assign local_bb3_arrayidx2_i_i_op_wire = (64'h0 + rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_NO_SHIFT_REG);
assign rnode_5to6_bb3_i_0_i_i6_pop10_acl_pop_i64_0_0_stall_in_NO_SHIFT_REG = 1'b0;
assign local_bb3_arrayidx2_i_i_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_arrayidx2_i_i_NO_SHIFT_REG <= 'x;
		local_bb3_arrayidx2_i_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb3_arrayidx2_i_i_output_regs_ready)
		begin
			local_bb3_arrayidx2_i_i_NO_SHIFT_REG <= local_bb3_arrayidx2_i_i_op_wire;
			local_bb3_arrayidx2_i_i_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb3_arrayidx2_i_i_stall_in))
			begin
				local_bb3_arrayidx2_i_i_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire SFC_2_VALID_5_6_0_inputs_ready;
 reg SFC_2_VALID_5_6_0_valid_out_NO_SHIFT_REG;
wire SFC_2_VALID_5_6_0_stall_in;
wire SFC_2_VALID_5_6_0_output_regs_ready;
 reg SFC_2_VALID_5_6_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_5_6_0_causedstall;

assign SFC_2_VALID_5_6_0_inputs_ready = 1'b1;
assign SFC_2_VALID_5_6_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_4_5_0_stall_in = 1'b0;
assign SFC_2_VALID_5_6_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_5_6_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_5_6_0_output_regs_ready)
		begin
			SFC_2_VALID_5_6_0_NO_SHIFT_REG <= SFC_2_VALID_4_5_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb3_c0_exi1158_stall_local;
wire [23:0] local_bb3_c0_exi1158;

assign local_bb3_c0_exi1158[7:0] = 8'bx;
assign local_bb3_c0_exi1158[8] = rnode_9to10_bb3_var__0_NO_SHIFT_REG;
assign local_bb3_c0_exi1158[23:9] = 15'bx;

// This section implements a registered operation.
// 
wire SFC_2_VALID_6_7_0_inputs_ready;
 reg SFC_2_VALID_6_7_0_valid_out_0_NO_SHIFT_REG;
wire SFC_2_VALID_6_7_0_stall_in_0;
 reg SFC_2_VALID_6_7_0_valid_out_1_NO_SHIFT_REG;
wire SFC_2_VALID_6_7_0_stall_in_1;
wire SFC_2_VALID_6_7_0_output_regs_ready;
 reg SFC_2_VALID_6_7_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_6_7_0_causedstall;

assign SFC_2_VALID_6_7_0_inputs_ready = 1'b1;
assign SFC_2_VALID_6_7_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_5_6_0_stall_in = 1'b0;
assign SFC_2_VALID_6_7_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_6_7_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_6_7_0_output_regs_ready)
		begin
			SFC_2_VALID_6_7_0_NO_SHIFT_REG <= SFC_2_VALID_5_6_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb3_c0_exi2159_valid_out;
wire local_bb3_c0_exi2159_stall_in;
wire local_bb3_c0_exi2159_inputs_ready;
wire local_bb3_c0_exi2159_stall_local;
wire [23:0] local_bb3_c0_exi2159;

assign local_bb3_c0_exi2159_inputs_ready = (rnode_9to10_bb3_cmp_i_i_not_0_valid_out_NO_SHIFT_REG & rnode_9to10_bb3_var__0_valid_out_NO_SHIFT_REG);
assign local_bb3_c0_exi2159[15:0] = local_bb3_c0_exi1158[15:0];
assign local_bb3_c0_exi2159[16] = local_bb3_notcmp136;
assign local_bb3_c0_exi2159[23:17] = local_bb3_c0_exi1158[23:17];
assign local_bb3_c0_exi2159_valid_out = 1'b1;
assign rnode_9to10_bb3_cmp_i_i_not_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_9to10_bb3_var__0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire SFC_2_VALID_7_8_0_inputs_ready;
 reg SFC_2_VALID_7_8_0_valid_out_NO_SHIFT_REG;
wire SFC_2_VALID_7_8_0_stall_in;
wire SFC_2_VALID_7_8_0_output_regs_ready;
 reg SFC_2_VALID_7_8_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_7_8_0_causedstall;

assign SFC_2_VALID_7_8_0_inputs_ready = 1'b1;
assign SFC_2_VALID_7_8_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_6_7_0_stall_in_0 = 1'b0;
assign SFC_2_VALID_7_8_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_7_8_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_7_8_0_output_regs_ready)
		begin
			SFC_2_VALID_7_8_0_NO_SHIFT_REG <= SFC_2_VALID_6_7_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb3_st__inputs_ready;
 reg local_bb3_st__valid_out_NO_SHIFT_REG;
wire local_bb3_st__stall_in;
wire local_bb3_st__output_regs_ready;
wire local_bb3_st__fu_stall_out;
wire local_bb3_st__fu_valid_out;
wire [7:0] local_bb3_st__lsu_wackout;
 reg local_bb3_st__NO_SHIFT_REG;
wire local_bb3_st__causedstall;

lsu_top lsu_local_bb3_st_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb3_st__fu_stall_out),
	.i_valid(SFC_2_VALID_6_7_0_NO_SHIFT_REG),
	.i_address(local_bb3_arrayidx2_i_i_NO_SHIFT_REG),
	.i_writedata(local_bb3_ld__NO_SHIFT_REG),
	.i_cmpdata(),
	.i_predicate(input_wii_var_),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(1'b0),
	.o_valid(local_bb3_st__fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(local_bb3_st__input_fifo_depth),
	.o_writeack(local_bb3_st__lsu_wackout),
	.i_atomic_op(3'h0),
	.o_active(),
	.avm_address(avm_local_bb3_st__address),
	.avm_read(avm_local_bb3_st__read),
	.avm_enable(avm_local_bb3_st__enable),
	.avm_readdata(avm_local_bb3_st__readdata),
	.avm_write(avm_local_bb3_st__write),
	.avm_writeack(avm_local_bb3_st__writeack),
	.avm_burstcount(avm_local_bb3_st__burstcount),
	.avm_writedata(avm_local_bb3_st__writedata),
	.avm_byteenable(avm_local_bb3_st__byteenable),
	.avm_waitrequest(avm_local_bb3_st__waitrequest),
	.avm_readdatavalid(avm_local_bb3_st__readdatavalid),
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

defparam lsu_local_bb3_st_.AWIDTH = 32;
defparam lsu_local_bb3_st_.WIDTH_BYTES = 1;
defparam lsu_local_bb3_st_.MWIDTH_BYTES = 1;
defparam lsu_local_bb3_st_.WRITEDATAWIDTH_BYTES = 1;
defparam lsu_local_bb3_st_.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb3_st_.READ = 0;
defparam lsu_local_bb3_st_.ATOMIC = 0;
defparam lsu_local_bb3_st_.WIDTH = 8;
defparam lsu_local_bb3_st_.MWIDTH = 8;
defparam lsu_local_bb3_st_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb3_st_.BURSTCOUNT_WIDTH = 1;
defparam lsu_local_bb3_st_.KERNEL_SIDE_MEM_LATENCY = 3;
defparam lsu_local_bb3_st_.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb3_st_.USE_WRITE_ACK = 0;
defparam lsu_local_bb3_st_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb3_st_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb3_st_.NUMBER_BANKS = 1;
defparam lsu_local_bb3_st_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb3_st_.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb3_st_.USEINPUTFIFO = 0;
defparam lsu_local_bb3_st_.USECACHING = 0;
defparam lsu_local_bb3_st_.USEOUTPUTFIFO = 0;
defparam lsu_local_bb3_st_.FORCE_NOP_SUPPORT = 1;
defparam lsu_local_bb3_st_.ADDRSPACE = 7;
defparam lsu_local_bb3_st_.STYLE = "PIPELINED";
defparam lsu_local_bb3_st_.USE_BYTE_EN = 0;

assign local_bb3_st__inputs_ready = 1'b1;
assign local_bb3_st__output_regs_ready = 1'b1;
assign local_bb3_ld__stall_in = 1'b0;
assign local_bb3_arrayidx2_i_i_stall_in = 1'b0;
assign SFC_2_VALID_6_7_0_stall_in_1 = 1'b0;
assign local_bb3_st__causedstall = (SFC_2_VALID_6_7_0_NO_SHIFT_REG && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_st__NO_SHIFT_REG <= 'x;
		local_bb3_st__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb3_st__output_regs_ready)
		begin
			local_bb3_st__NO_SHIFT_REG <= local_bb3_st__lsu_wackout;
			local_bb3_st__valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb3_st__stall_in))
			begin
				local_bb3_st__valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire SFC_2_VALID_8_9_0_inputs_ready;
 reg SFC_2_VALID_8_9_0_valid_out_NO_SHIFT_REG;
wire SFC_2_VALID_8_9_0_stall_in;
wire SFC_2_VALID_8_9_0_output_regs_ready;
 reg SFC_2_VALID_8_9_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_8_9_0_causedstall;

assign SFC_2_VALID_8_9_0_inputs_ready = 1'b1;
assign SFC_2_VALID_8_9_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_7_8_0_stall_in = 1'b0;
assign SFC_2_VALID_8_9_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_8_9_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_8_9_0_output_regs_ready)
		begin
			SFC_2_VALID_8_9_0_NO_SHIFT_REG <= SFC_2_VALID_7_8_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire SFC_2_VALID_9_10_0_inputs_ready;
 reg SFC_2_VALID_9_10_0_valid_out_NO_SHIFT_REG;
wire SFC_2_VALID_9_10_0_stall_in;
wire SFC_2_VALID_9_10_0_output_regs_ready;
 reg SFC_2_VALID_9_10_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_2_VALID_9_10_0_causedstall;

assign SFC_2_VALID_9_10_0_inputs_ready = 1'b1;
assign SFC_2_VALID_9_10_0_output_regs_ready = 1'b1;
assign SFC_2_VALID_8_9_0_stall_in = 1'b0;
assign SFC_2_VALID_9_10_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_2_VALID_9_10_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_2_VALID_9_10_0_output_regs_ready)
		begin
			SFC_2_VALID_9_10_0_NO_SHIFT_REG <= SFC_2_VALID_8_9_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb3_c0_exit160_c0_exi2159_inputs_ready;
 reg local_bb3_c0_exit160_c0_exi2159_valid_out_NO_SHIFT_REG;
wire local_bb3_c0_exit160_c0_exi2159_stall_in;
 reg [23:0] local_bb3_c0_exit160_c0_exi2159_NO_SHIFT_REG;
wire [23:0] local_bb3_c0_exit160_c0_exi2159_in;
wire local_bb3_c0_exit160_c0_exi2159_valid;
wire local_bb3_c0_exit160_c0_exi2159_causedstall;

acl_stall_free_sink local_bb3_c0_exit160_c0_exi2159_instance (
	.clock(clock),
	.resetn(resetn),
	.data_in(local_bb3_c0_exi2159),
	.data_out(local_bb3_c0_exit160_c0_exi2159_in),
	.input_accepted(local_bb3_c0_enter156_c0_eni1155_input_accepted),
	.valid_out(local_bb3_c0_exit160_c0_exi2159_valid),
	.stall_in(~(local_bb3_c0_exit160_c0_exi2159_output_regs_ready)),
	.stall_entry(local_bb3_c0_exit160_c0_exi2159_entry_stall),
	.valid_in(local_bb3_c0_exit160_c0_exi2159_valid_in),
	.IIphases(local_bb3_c0_exit160_c0_exi2159_phases),
	.inc_pipelined_thread(local_bb3_c0_enter156_c0_eni1155_inc_pipelined_thread),
	.dec_pipelined_thread(local_bb3_c0_enter156_c0_eni1155_dec_pipelined_thread)
);

defparam local_bb3_c0_exit160_c0_exi2159_instance.DATA_WIDTH = 24;
defparam local_bb3_c0_exit160_c0_exi2159_instance.PIPELINE_DEPTH = 14;
defparam local_bb3_c0_exit160_c0_exi2159_instance.SHARINGII = 1;
defparam local_bb3_c0_exit160_c0_exi2159_instance.SCHEDULEII = 1;
defparam local_bb3_c0_exit160_c0_exi2159_instance.ALWAYS_THROTTLE = 0;

assign local_bb3_c0_exit160_c0_exi2159_inputs_ready = 1'b1;
assign local_bb3_c0_exit160_c0_exi2159_output_regs_ready = (&(~(local_bb3_c0_exit160_c0_exi2159_valid_out_NO_SHIFT_REG) | ~(local_bb3_c0_exit160_c0_exi2159_stall_in)));
assign local_bb3_c0_exit160_c0_exi2159_valid_in = SFC_2_VALID_9_10_0_NO_SHIFT_REG;
assign local_bb3_c0_exi2159_stall_in = 1'b0;
assign local_bb3_st__stall_in = 1'b0;
assign SFC_2_VALID_9_10_0_stall_in = 1'b0;
assign rnode_9to10_bb3_keep_going138_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign local_bb3_c0_exit160_c0_exi2159_causedstall = (1'b1 && (1'b0 && !(~(local_bb3_c0_exit160_c0_exi2159_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb3_c0_exit160_c0_exi2159_NO_SHIFT_REG <= 'x;
		local_bb3_c0_exit160_c0_exi2159_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb3_c0_exit160_c0_exi2159_output_regs_ready)
		begin
			local_bb3_c0_exit160_c0_exi2159_NO_SHIFT_REG <= local_bb3_c0_exit160_c0_exi2159_in;
			local_bb3_c0_exit160_c0_exi2159_valid_out_NO_SHIFT_REG <= local_bb3_c0_exit160_c0_exi2159_valid;
		end
		else
		begin
			if (~(local_bb3_c0_exit160_c0_exi2159_stall_in))
			begin
				local_bb3_c0_exit160_c0_exi2159_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb3_c0_exe2162_valid_out;
wire local_bb3_c0_exe2162_stall_in;
wire local_bb3_c0_exe2162_inputs_ready;
wire local_bb3_c0_exe2162_stall_local;
wire local_bb3_c0_exe2162;

assign local_bb3_c0_exe2162_inputs_ready = local_bb3_c0_exit160_c0_exi2159_valid_out_NO_SHIFT_REG;
assign local_bb3_c0_exe2162 = local_bb3_c0_exit160_c0_exi2159_NO_SHIFT_REG[16];
assign local_bb3_c0_exe2162_valid_out = local_bb3_c0_exe2162_inputs_ready;
assign local_bb3_c0_exe2162_stall_local = local_bb3_c0_exe2162_stall_in;
assign local_bb3_c0_exit160_c0_exi2159_stall_in = (|local_bb3_c0_exe2162_stall_local);

// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_0_NO_SHIFT_REG;
 reg branch_compare_result_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;

assign branch_var__inputs_ready = local_bb3_c0_exe2162_valid_out;
assign branch_var__output_regs_ready = (~(branch_node_valid_out_0_NO_SHIFT_REG) | (((branch_compare_result_NO_SHIFT_REG != 1'b1) & ~(stall_in_1)) | (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & ~(stall_in_0))));
assign local_bb3_c0_exe2162_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out_0 = (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG);
assign valid_out_1 = ((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG);
assign combined_branch_stall_in_signal = ((((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_1) | ((~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_0));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		branch_compare_result_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_0_NO_SHIFT_REG <= branch_var__inputs_ready;
			branch_compare_result_NO_SHIFT_REG <= local_bb3_c0_exe2162;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_4
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_pop2,
		input [63:0] 		input_wii_conv,
		input 		input_wii_cmp11,
		input [63:0] 		input_wii_conv_i19_i,
		input 		input_wii_cmp_i20_i1,
		input 		input_wii_var_,
		input 		input_wii_var__u8,
		input 		input_wii_var__u9,
		input 		valid_in_0,
		output 		stall_out_0,
		input 		input_forked152_0,
		input 		valid_in_1,
		output 		stall_out_1,
		input 		input_forked152_1,
		output 		valid_out_0,
		input 		stall_in_0,
		output 		valid_out_1,
		input 		stall_in_1,
		input [31:0] 		workgroup_size,
		input 		start,
		input 		feedback_valid_in_9,
		output 		feedback_stall_out_9,
		input [63:0] 		feedback_data_in_9,
		output 		feedback_stall_out_4,
		input 		feedback_valid_in_5,
		output 		feedback_stall_out_5,
		input 		feedback_data_in_5,
		output 		acl_pipelined_valid,
		input 		acl_pipelined_stall,
		output 		acl_pipelined_exiting_valid,
		output 		acl_pipelined_exiting_stall,
		output 		feedback_valid_out_5,
		input 		feedback_stall_in_5,
		output 		feedback_data_out_5,
		input [63:0] 		ffwd_2_0,
		output 		feedback_valid_out_9,
		input 		feedback_stall_in_9,
		output [63:0] 		feedback_data_out_9,
		output 		avm_local_bb4_ld__enable,
		input [7:0] 		avm_local_bb4_ld__readdata,
		input 		avm_local_bb4_ld__readdatavalid,
		input 		avm_local_bb4_ld__waitrequest,
		output [31:0] 		avm_local_bb4_ld__address,
		output 		avm_local_bb4_ld__read,
		output 		avm_local_bb4_ld__write,
		input 		avm_local_bb4_ld__writeack,
		output [7:0] 		avm_local_bb4_ld__writedata,
		output 		avm_local_bb4_ld__byteenable,
		output 		avm_local_bb4_ld__burstcount,
		output [7:0] 		local_bb4_ld__input_fifo_depth,
		input 		clock2x,
		output 		avm_local_bb4_st_c0_exe1171_enable,
		input [511:0] 		avm_local_bb4_st_c0_exe1171_readdata,
		input 		avm_local_bb4_st_c0_exe1171_readdatavalid,
		input 		avm_local_bb4_st_c0_exe1171_waitrequest,
		output [31:0] 		avm_local_bb4_st_c0_exe1171_address,
		output 		avm_local_bb4_st_c0_exe1171_read,
		output 		avm_local_bb4_st_c0_exe1171_write,
		input 		avm_local_bb4_st_c0_exe1171_writeack,
		output [511:0] 		avm_local_bb4_st_c0_exe1171_writedata,
		output [63:0] 		avm_local_bb4_st_c0_exe1171_byteenable,
		output [4:0] 		avm_local_bb4_st_c0_exe1171_burstcount,
		output 		local_bb4_st_c0_exe1171_active
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((valid_in_0 & valid_in_1) & ~((stall_out_0 | stall_out_1)));
assign _exit = ((valid_out_0 & valid_out_1) & ~((stall_in_0 | stall_in_1)));
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
wire merge_node_stall_in_0;
 reg merge_node_valid_out_0_NO_SHIFT_REG;
wire merge_node_stall_in_1;
 reg merge_node_valid_out_1_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
 reg input_forked152_0_staging_reg_NO_SHIFT_REG;
 reg local_lvm_forked152_NO_SHIFT_REG;
 reg merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;
 reg input_forked152_1_staging_reg_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = ((merge_node_stall_in_0 & merge_node_valid_out_0_NO_SHIFT_REG) | (merge_node_stall_in_1 & merge_node_valid_out_1_NO_SHIFT_REG));
assign stall_out_0 = merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
assign stall_out_1 = merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_0_staging_reg_NO_SHIFT_REG | valid_in_0))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		if ((merge_node_valid_in_1_staging_reg_NO_SHIFT_REG | valid_in_1))
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b1;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
		end
		else
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b0;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_forked152_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		input_forked152_1_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_0_staging_reg_NO_SHIFT_REG))
			begin
				input_forked152_0_staging_reg_NO_SHIFT_REG <= input_forked152_0;
				merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= valid_in_0;
			end
		end
		else
		begin
			merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
		if (((merge_block_selector_NO_SHIFT_REG != 1'b1) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_1_staging_reg_NO_SHIFT_REG))
			begin
				input_forked152_1_staging_reg_NO_SHIFT_REG <= input_forked152_1;
				merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= valid_in_1;
			end
		end
		else
		begin
			merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
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
				if (merge_node_valid_in_0_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked152_NO_SHIFT_REG <= input_forked152_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked152_NO_SHIFT_REG <= input_forked152_0;
				end
			end

			1'b1:
			begin
				if (merge_node_valid_in_1_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked152_NO_SHIFT_REG <= input_forked152_1_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked152_NO_SHIFT_REG <= input_forked152_1;
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
		merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_0_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_1_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in_0))
			begin
				merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_1))
			begin
				merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
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
wire local_bb4_c0_eni1163_valid_out;
wire local_bb4_c0_eni1163_stall_in;
wire local_bb4_c0_eni1163_inputs_ready;
wire local_bb4_c0_eni1163_stall_local;
wire [15:0] local_bb4_c0_eni1163;

assign local_bb4_c0_eni1163_inputs_ready = merge_node_valid_out_0_NO_SHIFT_REG;
assign local_bb4_c0_eni1163[7:0] = 8'bx;
assign local_bb4_c0_eni1163[8] = local_lvm_forked152_NO_SHIFT_REG;
assign local_bb4_c0_eni1163[15:9] = 7'bx;
assign local_bb4_c0_eni1163_valid_out = local_bb4_c0_eni1163_inputs_ready;
assign local_bb4_c0_eni1163_stall_local = local_bb4_c0_eni1163_stall_in;
assign merge_node_stall_in_0 = (|local_bb4_c0_eni1163_stall_local);

// Register node:
//  * latency = 10
//  * capacity = 10
 logic rnode_1to11_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_1to11_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_1to11_var__0_reg_11_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to11_var__0_valid_out_reg_11_NO_SHIFT_REG;
 logic rnode_1to11_var__0_stall_in_reg_11_NO_SHIFT_REG;
 logic rnode_1to11_var__0_stall_out_reg_11_NO_SHIFT_REG;

acl_data_fifo rnode_1to11_var__0_reg_11_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to11_var__0_reg_11_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to11_var__0_stall_in_reg_11_NO_SHIFT_REG),
	.valid_out(rnode_1to11_var__0_valid_out_reg_11_NO_SHIFT_REG),
	.stall_out(rnode_1to11_var__0_stall_out_reg_11_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_1to11_var__0_reg_11_fifo.DEPTH = 11;
defparam rnode_1to11_var__0_reg_11_fifo.DATA_WIDTH = 0;
defparam rnode_1to11_var__0_reg_11_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to11_var__0_reg_11_fifo.IMPL = "ram";

assign rnode_1to11_var__0_reg_11_inputs_ready_NO_SHIFT_REG = merge_node_valid_out_1_NO_SHIFT_REG;
assign merge_node_stall_in_1 = rnode_1to11_var__0_stall_out_reg_11_NO_SHIFT_REG;
assign rnode_1to11_var__0_stall_in_reg_11_NO_SHIFT_REG = rnode_1to11_var__0_stall_in_NO_SHIFT_REG;
assign rnode_1to11_var__0_valid_out_NO_SHIFT_REG = rnode_1to11_var__0_valid_out_reg_11_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb4_c0_enter164_c0_eni1163_valid_out_0;
wire local_bb4_c0_enter164_c0_eni1163_stall_in_0;
wire local_bb4_c0_enter164_c0_eni1163_valid_out_1;
wire local_bb4_c0_enter164_c0_eni1163_stall_in_1;
wire local_bb4_c0_enter164_c0_eni1163_inputs_ready;
wire local_bb4_c0_enter164_c0_eni1163_stall_local;
wire local_bb4_c0_enter164_c0_eni1163_input_accepted;
wire [15:0] local_bb4_c0_enter164_c0_eni1163;
wire local_bb4_c0_exit170_c0_exi4169_entry_stall;
wire local_bb4_c0_enter164_c0_eni1163_valid_bit;
wire local_bb4_c0_exit170_c0_exi4169_output_regs_ready;
wire local_bb4_c0_exit170_c0_exi4169_valid_in;
wire local_bb4_c0_exit170_c0_exi4169_phases;
wire local_bb4_c0_enter164_c0_eni1163_inc_pipelined_thread;
wire local_bb4_c0_enter164_c0_eni1163_dec_pipelined_thread;
wire local_bb4_c0_enter164_c0_eni1163_fu_stall_out;

assign local_bb4_c0_enter164_c0_eni1163_inputs_ready = local_bb4_c0_eni1163_valid_out;
assign local_bb4_c0_enter164_c0_eni1163 = local_bb4_c0_eni1163;
assign local_bb4_c0_enter164_c0_eni1163_input_accepted = (local_bb4_c0_enter164_c0_eni1163_inputs_ready && !(local_bb4_c0_exit170_c0_exi4169_entry_stall));
assign local_bb4_c0_enter164_c0_eni1163_valid_bit = local_bb4_c0_enter164_c0_eni1163_input_accepted;
assign local_bb4_c0_enter164_c0_eni1163_inc_pipelined_thread = 1'b1;
assign local_bb4_c0_enter164_c0_eni1163_dec_pipelined_thread = ~(1'b0);
assign local_bb4_c0_enter164_c0_eni1163_fu_stall_out = (~(local_bb4_c0_enter164_c0_eni1163_inputs_ready) | local_bb4_c0_exit170_c0_exi4169_entry_stall);
assign local_bb4_c0_enter164_c0_eni1163_stall_local = (local_bb4_c0_enter164_c0_eni1163_stall_in_0 | local_bb4_c0_enter164_c0_eni1163_stall_in_1);
assign local_bb4_c0_enter164_c0_eni1163_valid_out_0 = local_bb4_c0_enter164_c0_eni1163_inputs_ready;
assign local_bb4_c0_enter164_c0_eni1163_valid_out_1 = local_bb4_c0_enter164_c0_eni1163_inputs_ready;
assign local_bb4_c0_eni1163_stall_in = (|local_bb4_c0_enter164_c0_eni1163_fu_stall_out);

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_11to12_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_11to12_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_11to12_var__0_reg_12_inputs_ready_NO_SHIFT_REG;
 logic rnode_11to12_var__0_valid_out_reg_12_NO_SHIFT_REG;
 logic rnode_11to12_var__0_stall_in_reg_12_NO_SHIFT_REG;
 logic rnode_11to12_var__0_stall_out_reg_12_NO_SHIFT_REG;

acl_data_fifo rnode_11to12_var__0_reg_12_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_11to12_var__0_reg_12_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_11to12_var__0_stall_in_reg_12_NO_SHIFT_REG),
	.valid_out(rnode_11to12_var__0_valid_out_reg_12_NO_SHIFT_REG),
	.stall_out(rnode_11to12_var__0_stall_out_reg_12_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_11to12_var__0_reg_12_fifo.DEPTH = 2;
defparam rnode_11to12_var__0_reg_12_fifo.DATA_WIDTH = 0;
defparam rnode_11to12_var__0_reg_12_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_11to12_var__0_reg_12_fifo.IMPL = "ll_reg";

assign rnode_11to12_var__0_reg_12_inputs_ready_NO_SHIFT_REG = rnode_1to11_var__0_valid_out_NO_SHIFT_REG;
assign rnode_1to11_var__0_stall_in_NO_SHIFT_REG = rnode_11to12_var__0_stall_out_reg_12_NO_SHIFT_REG;
assign rnode_11to12_var__0_stall_in_reg_12_NO_SHIFT_REG = rnode_11to12_var__0_stall_in_NO_SHIFT_REG;
assign rnode_11to12_var__0_valid_out_NO_SHIFT_REG = rnode_11to12_var__0_valid_out_reg_12_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb4_c0_ene1165_stall_local;
wire local_bb4_c0_ene1165;

assign local_bb4_c0_ene1165 = local_bb4_c0_enter164_c0_eni1163[8];

// This section implements an unregistered operation.
// 
wire SFC_3_VALID_1_1_0_stall_local;
wire SFC_3_VALID_1_1_0;

assign SFC_3_VALID_1_1_0 = local_bb4_c0_enter164_c0_eni1163_valid_bit;

// This section implements an unregistered operation.
// 
wire local_bb4_k_18_pop9_acl_pop_i64_0_stall_local;
wire [63:0] local_bb4_k_18_pop9_acl_pop_i64_0;
wire local_bb4_k_18_pop9_acl_pop_i64_0_fu_valid_out;
wire local_bb4_k_18_pop9_acl_pop_i64_0_fu_stall_out;

acl_pop local_bb4_k_18_pop9_acl_pop_i64_0_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(local_bb4_c0_ene1165),
	.predicate(1'b0),
	.data_in(64'h0),
	.stall_out(local_bb4_k_18_pop9_acl_pop_i64_0_fu_stall_out),
	.valid_in(SFC_3_VALID_1_1_0),
	.valid_out(local_bb4_k_18_pop9_acl_pop_i64_0_fu_valid_out),
	.stall_in(local_bb4_k_18_pop9_acl_pop_i64_0_stall_local),
	.data_out(local_bb4_k_18_pop9_acl_pop_i64_0),
	.feedback_in(feedback_data_in_9),
	.feedback_valid_in(feedback_valid_in_9),
	.feedback_stall_out(feedback_stall_out_9)
);

defparam local_bb4_k_18_pop9_acl_pop_i64_0_feedback.COALESCE_DISTANCE = 1;
defparam local_bb4_k_18_pop9_acl_pop_i64_0_feedback.DATA_WIDTH = 64;
defparam local_bb4_k_18_pop9_acl_pop_i64_0_feedback.STYLE = "REGULAR";

assign local_bb4_k_18_pop9_acl_pop_i64_0_stall_local = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb4_inc_stall_local;
wire [63:0] local_bb4_inc;

assign local_bb4_inc = (local_bb4_k_18_pop9_acl_pop_i64_0 + 64'h1);

// This section implements an unregistered operation.
// 
wire local_bb4_cmp4_stall_local;
wire [64:0] cmprep_local_bb4_cmp4;
wire local_bb4_cmp4;

assign cmprep_local_bb4_cmp4 = (local_bb4_inc - input_wii_conv_i19_i);
assign local_bb4_cmp4 = cmprep_local_bb4_cmp4[64];

// This section implements an unregistered operation.
// 
wire local_bb4_var__stall_local;
wire local_bb4_var_;

assign local_bb4_var_ = (local_bb4_cmp4 & input_wii_var__u8);

// This section implements an unregistered operation.
// 
wire local_bb4_c0_ene1165_valid_out_1;
wire local_bb4_c0_ene1165_stall_in_1;
wire local_bb4_c0_ene1165_valid_out_2;
wire local_bb4_c0_ene1165_stall_in_2;
wire local_bb4_k_18_pop9_acl_pop_i64_0_valid_out_1;
wire local_bb4_k_18_pop9_acl_pop_i64_0_stall_in_1;
wire SFC_3_VALID_1_1_0_valid_out_0;
wire SFC_3_VALID_1_1_0_stall_in_0;
wire SFC_3_VALID_1_1_0_valid_out_2;
wire SFC_3_VALID_1_1_0_stall_in_2;
wire SFC_3_VALID_1_1_0_valid_out_3;
wire SFC_3_VALID_1_1_0_stall_in_3;
wire local_bb4_inc_valid_out_1;
wire local_bb4_inc_stall_in_1;
wire local_bb4_var__valid_out_0;
wire local_bb4_var__stall_in_0;
wire local_bb4_var__valid_out_1;
wire local_bb4_var__stall_in_1;
wire local_bb4_cmp4_not_valid_out;
wire local_bb4_cmp4_not_stall_in;
wire local_bb4_cmp4_not_inputs_ready;
wire local_bb4_cmp4_not_stall_local;
wire local_bb4_cmp4_not;

assign local_bb4_cmp4_not_inputs_ready = (local_bb4_c0_enter164_c0_eni1163_valid_out_0 & local_bb4_c0_enter164_c0_eni1163_valid_out_1);
assign local_bb4_cmp4_not = (local_bb4_cmp4 ^ 1'b1);
assign local_bb4_c0_ene1165_valid_out_1 = 1'b1;
assign local_bb4_c0_ene1165_valid_out_2 = 1'b1;
assign local_bb4_k_18_pop9_acl_pop_i64_0_valid_out_1 = 1'b1;
assign SFC_3_VALID_1_1_0_valid_out_0 = 1'b1;
assign SFC_3_VALID_1_1_0_valid_out_2 = 1'b1;
assign SFC_3_VALID_1_1_0_valid_out_3 = 1'b1;
assign local_bb4_inc_valid_out_1 = 1'b1;
assign local_bb4_var__valid_out_0 = 1'b1;
assign local_bb4_var__valid_out_1 = 1'b1;
assign local_bb4_cmp4_not_valid_out = 1'b1;
assign local_bb4_c0_enter164_c0_eni1163_stall_in_0 = 1'b0;
assign local_bb4_c0_enter164_c0_eni1163_stall_in_1 = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb4_c0_ene1165_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb4_c0_ene1165_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb4_c0_ene1165_0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_c0_ene1165_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb4_c0_ene1165_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_c0_ene1165_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_c0_ene1165_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_c0_ene1165_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb4_c0_ene1165_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb4_c0_ene1165_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb4_c0_ene1165_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb4_c0_ene1165_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb4_c0_ene1165_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb4_c0_ene1165),
	.data_out(rnode_1to2_bb4_c0_ene1165_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb4_c0_ene1165_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb4_c0_ene1165_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb4_c0_ene1165_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb4_c0_ene1165_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb4_c0_ene1165_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_c0_ene1165_stall_in_2 = 1'b0;
assign rnode_1to2_bb4_c0_ene1165_0_NO_SHIFT_REG = rnode_1to2_bb4_c0_ene1165_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb4_c0_ene1165_0_stall_in_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb4_c0_ene1165_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_1_NO_SHIFT_REG;
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb4_k_18_pop9_acl_pop_i64_0),
	.data_out(rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_k_18_pop9_acl_pop_i64_0_stall_in_1 = 1'b0;
assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_NO_SHIFT_REG = rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_1_NO_SHIFT_REG = rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire SFC_3_VALID_1_2_0_inputs_ready;
 reg SFC_3_VALID_1_2_0_valid_out_0_NO_SHIFT_REG;
wire SFC_3_VALID_1_2_0_stall_in_0;
 reg SFC_3_VALID_1_2_0_valid_out_1_NO_SHIFT_REG;
wire SFC_3_VALID_1_2_0_stall_in_1;
wire SFC_3_VALID_1_2_0_output_regs_ready;
 reg SFC_3_VALID_1_2_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_3_VALID_1_2_0_causedstall;

assign SFC_3_VALID_1_2_0_inputs_ready = 1'b1;
assign SFC_3_VALID_1_2_0_output_regs_ready = 1'b1;
assign SFC_3_VALID_1_1_0_stall_in_0 = 1'b0;
assign SFC_3_VALID_1_2_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_3_VALID_1_2_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_3_VALID_1_2_0_output_regs_ready)
		begin
			SFC_3_VALID_1_2_0_NO_SHIFT_REG <= SFC_3_VALID_1_1_0;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb4_keep_going143_acl_pipeline_1_inputs_ready;
 reg local_bb4_keep_going143_acl_pipeline_1_valid_out_NO_SHIFT_REG;
wire local_bb4_keep_going143_acl_pipeline_1_stall_in;
wire local_bb4_keep_going143_acl_pipeline_1_output_regs_ready;
wire local_bb4_keep_going143_acl_pipeline_1_keep_going;
wire local_bb4_keep_going143_acl_pipeline_1_fu_valid_out;
wire local_bb4_keep_going143_acl_pipeline_1_fu_stall_out;
 reg local_bb4_keep_going143_acl_pipeline_1_NO_SHIFT_REG;
wire local_bb4_keep_going143_acl_pipeline_1_feedback_pipelined;
wire local_bb4_keep_going143_acl_pipeline_1_causedstall;

acl_pipeline local_bb4_keep_going143_acl_pipeline_1_pipelined (
	.clock(clock),
	.resetn(resetn),
	.data_in(1'b1),
	.stall_out(local_bb4_keep_going143_acl_pipeline_1_fu_stall_out),
	.valid_in(SFC_3_VALID_1_1_0),
	.valid_out(local_bb4_keep_going143_acl_pipeline_1_fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb4_keep_going143_acl_pipeline_1_keep_going),
	.initeration_in(1'b0),
	.initeration_valid_in(1'b0),
	.initeration_stall_out(feedback_stall_out_4),
	.not_exitcond_in(feedback_data_in_5),
	.not_exitcond_valid_in(feedback_valid_in_5),
	.not_exitcond_stall_out(feedback_stall_out_5),
	.pipeline_valid_out(acl_pipelined_valid),
	.pipeline_stall_in(acl_pipelined_stall),
	.exiting_valid_out(acl_pipelined_exiting_valid)
);

defparam local_bb4_keep_going143_acl_pipeline_1_pipelined.FIFO_DEPTH = 0;
defparam local_bb4_keep_going143_acl_pipeline_1_pipelined.STYLE = "NON_SPECULATIVE";

assign local_bb4_keep_going143_acl_pipeline_1_inputs_ready = 1'b1;
assign local_bb4_keep_going143_acl_pipeline_1_output_regs_ready = 1'b1;
assign acl_pipelined_exiting_stall = acl_pipelined_stall;
assign local_bb4_c0_ene1165_stall_in_1 = 1'b0;
assign SFC_3_VALID_1_1_0_stall_in_2 = 1'b0;
assign local_bb4_keep_going143_acl_pipeline_1_causedstall = (SFC_3_VALID_1_1_0 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb4_keep_going143_acl_pipeline_1_NO_SHIFT_REG <= 'x;
		local_bb4_keep_going143_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb4_keep_going143_acl_pipeline_1_output_regs_ready)
		begin
			local_bb4_keep_going143_acl_pipeline_1_NO_SHIFT_REG <= local_bb4_keep_going143_acl_pipeline_1_keep_going;
			local_bb4_keep_going143_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb4_keep_going143_acl_pipeline_1_stall_in))
			begin
				local_bb4_keep_going143_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb4_inc_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb4_inc_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb4_inc_0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_inc_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb4_inc_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_inc_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_inc_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_inc_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb4_inc_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb4_inc_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb4_inc_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb4_inc_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb4_inc_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb4_inc),
	.data_out(rnode_1to2_bb4_inc_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb4_inc_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb4_inc_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb4_inc_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb4_inc_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb4_inc_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_inc_stall_in_1 = 1'b0;
assign rnode_1to2_bb4_inc_0_NO_SHIFT_REG = rnode_1to2_bb4_inc_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb4_inc_0_stall_in_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb4_inc_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire local_bb4_notexitcond144__inputs_ready;
wire local_bb4_notexitcond144__output_regs_ready;
wire local_bb4_notexitcond144__result;
wire local_bb4_notexitcond144__fu_valid_out;
wire local_bb4_notexitcond144__fu_stall_out;
 reg local_bb4_notexitcond144__NO_SHIFT_REG;
wire local_bb4_notexitcond144__causedstall;

acl_push local_bb4_notexitcond144__feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(1'b1),
	.predicate(1'b0),
	.data_in(local_bb4_var_),
	.stall_out(local_bb4_notexitcond144__fu_stall_out),
	.valid_in(SFC_3_VALID_1_1_0),
	.valid_out(local_bb4_notexitcond144__fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb4_notexitcond144__result),
	.feedback_out(feedback_data_out_5),
	.feedback_valid_out(feedback_valid_out_5),
	.feedback_stall_in(feedback_stall_in_5)
);

defparam local_bb4_notexitcond144__feedback.STALLFREE = 1;
defparam local_bb4_notexitcond144__feedback.ENABLED = 0;
defparam local_bb4_notexitcond144__feedback.DATA_WIDTH = 1;
defparam local_bb4_notexitcond144__feedback.FIFO_DEPTH = 0;
defparam local_bb4_notexitcond144__feedback.MIN_FIFO_LATENCY = 0;
defparam local_bb4_notexitcond144__feedback.STYLE = "REGULAR";
defparam local_bb4_notexitcond144__feedback.RAM_FIFO_DEPTH_INC = 1;

assign local_bb4_notexitcond144__inputs_ready = 1'b1;
assign local_bb4_notexitcond144__output_regs_ready = 1'b1;
assign local_bb4_var__stall_in_0 = 1'b0;
assign SFC_3_VALID_1_1_0_stall_in_3 = 1'b0;
assign local_bb4_notexitcond144__causedstall = (SFC_3_VALID_1_1_0 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb4_notexitcond144__NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb4_notexitcond144__output_regs_ready)
		begin
			local_bb4_notexitcond144__NO_SHIFT_REG <= local_bb4_notexitcond144__result;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb4_var__0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_stall_in_0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_stall_in_1_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__1_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_var__0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb4_var__0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb4_var__0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb4_var__0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb4_var__0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb4_var__0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb4_var_),
	.data_out(rnode_1to2_bb4_var__0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb4_var__0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb4_var__0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb4_var__0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb4_var__0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb4_var__0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_var__stall_in_1 = 1'b0;
assign rnode_1to2_bb4_var__0_stall_in_0_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb4_var__0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb4_var__0_NO_SHIFT_REG = rnode_1to2_bb4_var__0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb4_var__0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb4_var__1_NO_SHIFT_REG = rnode_1to2_bb4_var__0_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb4_cmp4_not_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb4_cmp4_not_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb4_cmp4_not_0_NO_SHIFT_REG;
 logic rnode_1to2_bb4_cmp4_not_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb4_cmp4_not_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_cmp4_not_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_cmp4_not_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb4_cmp4_not_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb4_cmp4_not_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb4_cmp4_not_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb4_cmp4_not_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb4_cmp4_not_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb4_cmp4_not_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb4_cmp4_not),
	.data_out(rnode_1to2_bb4_cmp4_not_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb4_cmp4_not_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb4_cmp4_not_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb4_cmp4_not_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb4_cmp4_not_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb4_cmp4_not_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_cmp4_not_stall_in = 1'b0;
assign rnode_1to2_bb4_cmp4_not_0_NO_SHIFT_REG = rnode_1to2_bb4_cmp4_not_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb4_cmp4_not_0_stall_in_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb4_cmp4_not_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb4__add126131_acl_ffwd_dest_i64_2_stall_local;
wire [63:0] local_bb4__add126131_acl_ffwd_dest_i64_2;

assign local_bb4__add126131_acl_ffwd_dest_i64_2 = ffwd_2_0;

// This section implements a registered operation.
// 
wire local_bb4_arrayidx_inputs_ready;
 reg local_bb4_arrayidx_valid_out_NO_SHIFT_REG;
wire local_bb4_arrayidx_stall_in;
wire local_bb4_arrayidx_output_regs_ready;
 reg [31:0] local_bb4_arrayidx_NO_SHIFT_REG;
wire [31:0] local_bb4_arrayidx_op_wire;
wire local_bb4_arrayidx_causedstall;

assign local_bb4_arrayidx_inputs_ready = 1'b1;
assign local_bb4_arrayidx_output_regs_ready = 1'b1;
assign local_bb4_arrayidx_op_wire = (64'h0 + rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_NO_SHIFT_REG);
assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign local_bb4_arrayidx_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb4_arrayidx_NO_SHIFT_REG <= 'x;
		local_bb4_arrayidx_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb4_arrayidx_output_regs_ready)
		begin
			local_bb4_arrayidx_NO_SHIFT_REG <= local_bb4_arrayidx_op_wire;
			local_bb4_arrayidx_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb4_arrayidx_stall_in))
			begin
				local_bb4_arrayidx_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire SFC_3_VALID_2_3_0_inputs_ready;
 reg SFC_3_VALID_2_3_0_valid_out_0_NO_SHIFT_REG;
wire SFC_3_VALID_2_3_0_stall_in_0;
 reg SFC_3_VALID_2_3_0_valid_out_1_NO_SHIFT_REG;
wire SFC_3_VALID_2_3_0_stall_in_1;
wire SFC_3_VALID_2_3_0_output_regs_ready;
 reg SFC_3_VALID_2_3_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_3_VALID_2_3_0_causedstall;

assign SFC_3_VALID_2_3_0_inputs_ready = 1'b1;
assign SFC_3_VALID_2_3_0_output_regs_ready = 1'b1;
assign SFC_3_VALID_1_2_0_stall_in_0 = 1'b0;
assign SFC_3_VALID_2_3_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_3_VALID_2_3_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_3_VALID_2_3_0_output_regs_ready)
		begin
			SFC_3_VALID_2_3_0_NO_SHIFT_REG <= SFC_3_VALID_1_2_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb4_keep_going143_acl_pipeline_1_NO_SHIFT_REG),
	.data_out(rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_fifo.DATA_WIDTH = 1;
defparam rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_keep_going143_acl_pipeline_1_stall_in = 1'b0;
assign rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG = rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire local_bb4_k_18_push9_inc_inputs_ready;
wire local_bb4_k_18_push9_inc_output_regs_ready;
wire [63:0] local_bb4_k_18_push9_inc_result;
wire local_bb4_k_18_push9_inc_fu_valid_out;
wire local_bb4_k_18_push9_inc_fu_stall_out;
 reg [63:0] local_bb4_k_18_push9_inc_NO_SHIFT_REG;
wire local_bb4_k_18_push9_inc_causedstall;

acl_push local_bb4_k_18_push9_inc_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(rnode_1to2_bb4_var__0_NO_SHIFT_REG),
	.predicate(1'b0),
	.data_in(rnode_1to2_bb4_inc_0_NO_SHIFT_REG),
	.stall_out(local_bb4_k_18_push9_inc_fu_stall_out),
	.valid_in(SFC_3_VALID_1_2_0_NO_SHIFT_REG),
	.valid_out(local_bb4_k_18_push9_inc_fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb4_k_18_push9_inc_result),
	.feedback_out(feedback_data_out_9),
	.feedback_valid_out(feedback_valid_out_9),
	.feedback_stall_in(feedback_stall_in_9)
);

defparam local_bb4_k_18_push9_inc_feedback.STALLFREE = 1;
defparam local_bb4_k_18_push9_inc_feedback.ENABLED = 0;
defparam local_bb4_k_18_push9_inc_feedback.DATA_WIDTH = 64;
defparam local_bb4_k_18_push9_inc_feedback.FIFO_DEPTH = 1;
defparam local_bb4_k_18_push9_inc_feedback.MIN_FIFO_LATENCY = 0;
defparam local_bb4_k_18_push9_inc_feedback.STYLE = "REGULAR";
defparam local_bb4_k_18_push9_inc_feedback.RAM_FIFO_DEPTH_INC = 0;

assign local_bb4_k_18_push9_inc_inputs_ready = 1'b1;
assign local_bb4_k_18_push9_inc_output_regs_ready = 1'b1;
assign SFC_3_VALID_1_2_0_stall_in_1 = 1'b0;
assign rnode_1to2_bb4_inc_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb4_var__0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign local_bb4_k_18_push9_inc_causedstall = (SFC_3_VALID_1_2_0_NO_SHIFT_REG && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb4_k_18_push9_inc_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb4_k_18_push9_inc_output_regs_ready)
		begin
			local_bb4_k_18_push9_inc_NO_SHIFT_REG <= local_bb4_k_18_push9_inc_result;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb4_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb4_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_2to3_bb4_var__0_NO_SHIFT_REG;
 logic rnode_2to3_bb4_var__0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to3_bb4_var__0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_var__0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_var__0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_var__0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb4_var__0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb4_var__0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb4_var__0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb4_var__0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb4_var__0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(rnode_1to2_bb4_var__1_NO_SHIFT_REG),
	.data_out(rnode_2to3_bb4_var__0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb4_var__0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb4_var__0_reg_3_fifo.DATA_WIDTH = 1;
defparam rnode_2to3_bb4_var__0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb4_var__0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb4_var__0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb4_var__0_stall_in_1_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb4_var__0_NO_SHIFT_REG = rnode_2to3_bb4_var__0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb4_var__0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb4_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 4
//  * capacity = 4
 logic rnode_2to6_bb4_cmp4_not_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to6_bb4_cmp4_not_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to6_bb4_cmp4_not_0_NO_SHIFT_REG;
 logic rnode_2to6_bb4_cmp4_not_0_reg_6_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to6_bb4_cmp4_not_0_reg_6_NO_SHIFT_REG;
 logic rnode_2to6_bb4_cmp4_not_0_valid_out_reg_6_NO_SHIFT_REG;
 logic rnode_2to6_bb4_cmp4_not_0_stall_in_reg_6_NO_SHIFT_REG;
 logic rnode_2to6_bb4_cmp4_not_0_stall_out_reg_6_NO_SHIFT_REG;

acl_data_fifo rnode_2to6_bb4_cmp4_not_0_reg_6_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to6_bb4_cmp4_not_0_reg_6_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to6_bb4_cmp4_not_0_stall_in_reg_6_NO_SHIFT_REG),
	.valid_out(rnode_2to6_bb4_cmp4_not_0_valid_out_reg_6_NO_SHIFT_REG),
	.stall_out(rnode_2to6_bb4_cmp4_not_0_stall_out_reg_6_NO_SHIFT_REG),
	.data_in(rnode_1to2_bb4_cmp4_not_0_NO_SHIFT_REG),
	.data_out(rnode_2to6_bb4_cmp4_not_0_reg_6_NO_SHIFT_REG)
);

defparam rnode_2to6_bb4_cmp4_not_0_reg_6_fifo.DEPTH = 4;
defparam rnode_2to6_bb4_cmp4_not_0_reg_6_fifo.DATA_WIDTH = 1;
defparam rnode_2to6_bb4_cmp4_not_0_reg_6_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to6_bb4_cmp4_not_0_reg_6_fifo.IMPL = "shift_reg";

assign rnode_2to6_bb4_cmp4_not_0_reg_6_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb4_cmp4_not_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_2to6_bb4_cmp4_not_0_NO_SHIFT_REG = rnode_2to6_bb4_cmp4_not_0_reg_6_NO_SHIFT_REG;
assign rnode_2to6_bb4_cmp4_not_0_stall_in_reg_6_NO_SHIFT_REG = 1'b0;
assign rnode_2to6_bb4_cmp4_not_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb4_add_ptr_sum_valid_out;
wire local_bb4_add_ptr_sum_stall_in;
wire local_bb4_add_ptr_sum_inputs_ready;
wire local_bb4_add_ptr_sum_stall_local;
wire [63:0] local_bb4_add_ptr_sum;

assign local_bb4_add_ptr_sum_inputs_ready = (rnode_1to2_bb4_c0_ene1165_0_valid_out_NO_SHIFT_REG & rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG);
assign local_bb4_add_ptr_sum = (rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_1_NO_SHIFT_REG + local_bb4__add126131_acl_ffwd_dest_i64_2);
assign local_bb4_add_ptr_sum_valid_out = 1'b1;
assign rnode_1to2_bb4_c0_ene1165_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb4_k_18_pop9_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire SFC_3_VALID_3_4_0_inputs_ready;
 reg SFC_3_VALID_3_4_0_valid_out_NO_SHIFT_REG;
wire SFC_3_VALID_3_4_0_stall_in;
wire SFC_3_VALID_3_4_0_output_regs_ready;
 reg SFC_3_VALID_3_4_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_3_VALID_3_4_0_causedstall;

assign SFC_3_VALID_3_4_0_inputs_ready = 1'b1;
assign SFC_3_VALID_3_4_0_output_regs_ready = 1'b1;
assign SFC_3_VALID_2_3_0_stall_in_0 = 1'b0;
assign SFC_3_VALID_3_4_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_3_VALID_3_4_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_3_VALID_3_4_0_output_regs_ready)
		begin
			SFC_3_VALID_3_4_0_NO_SHIFT_REG <= SFC_3_VALID_2_3_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb4_ld__inputs_ready;
 reg local_bb4_ld__valid_out_NO_SHIFT_REG;
wire local_bb4_ld__stall_in;
wire local_bb4_ld__output_regs_ready;
wire local_bb4_ld__fu_stall_out;
wire local_bb4_ld__fu_valid_out;
wire [7:0] local_bb4_ld__lsu_dataout;
 reg [7:0] local_bb4_ld__NO_SHIFT_REG;
wire local_bb4_ld__causedstall;

lsu_top lsu_local_bb4_ld_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb4_ld__fu_stall_out),
	.i_valid(SFC_3_VALID_2_3_0_NO_SHIFT_REG),
	.i_address(local_bb4_arrayidx_NO_SHIFT_REG),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(input_wii_var_),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(1'b0),
	.o_valid(local_bb4_ld__fu_valid_out),
	.o_readdata(local_bb4_ld__lsu_dataout),
	.o_input_fifo_depth(local_bb4_ld__input_fifo_depth),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(),
	.avm_address(avm_local_bb4_ld__address),
	.avm_read(avm_local_bb4_ld__read),
	.avm_enable(avm_local_bb4_ld__enable),
	.avm_readdata(avm_local_bb4_ld__readdata),
	.avm_write(avm_local_bb4_ld__write),
	.avm_writeack(avm_local_bb4_ld__writeack),
	.avm_burstcount(avm_local_bb4_ld__burstcount),
	.avm_writedata(avm_local_bb4_ld__writedata),
	.avm_byteenable(avm_local_bb4_ld__byteenable),
	.avm_waitrequest(avm_local_bb4_ld__waitrequest),
	.avm_readdatavalid(avm_local_bb4_ld__readdatavalid),
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

defparam lsu_local_bb4_ld_.AWIDTH = 32;
defparam lsu_local_bb4_ld_.WIDTH_BYTES = 1;
defparam lsu_local_bb4_ld_.MWIDTH_BYTES = 1;
defparam lsu_local_bb4_ld_.WRITEDATAWIDTH_BYTES = 1;
defparam lsu_local_bb4_ld_.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb4_ld_.READ = 1;
defparam lsu_local_bb4_ld_.ATOMIC = 0;
defparam lsu_local_bb4_ld_.WIDTH = 8;
defparam lsu_local_bb4_ld_.MWIDTH = 8;
defparam lsu_local_bb4_ld_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb4_ld_.BURSTCOUNT_WIDTH = 1;
defparam lsu_local_bb4_ld_.KERNEL_SIDE_MEM_LATENCY = 4;
defparam lsu_local_bb4_ld_.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb4_ld_.USE_WRITE_ACK = 0;
defparam lsu_local_bb4_ld_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb4_ld_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb4_ld_.NUMBER_BANKS = 1;
defparam lsu_local_bb4_ld_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb4_ld_.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb4_ld_.USEINPUTFIFO = 0;
defparam lsu_local_bb4_ld_.USECACHING = 0;
defparam lsu_local_bb4_ld_.USEOUTPUTFIFO = 0;
defparam lsu_local_bb4_ld_.FORCE_NOP_SUPPORT = 1;
defparam lsu_local_bb4_ld_.ADDRSPACE = 7;
defparam lsu_local_bb4_ld_.STYLE = "PIPELINED";

assign local_bb4_ld__inputs_ready = 1'b1;
assign local_bb4_ld__output_regs_ready = 1'b1;
assign local_bb4_arrayidx_stall_in = 1'b0;
assign SFC_3_VALID_2_3_0_stall_in_1 = 1'b0;
assign local_bb4_ld__causedstall = (SFC_3_VALID_2_3_0_NO_SHIFT_REG && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb4_ld__NO_SHIFT_REG <= 'x;
		local_bb4_ld__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb4_ld__output_regs_ready)
		begin
			local_bb4_ld__NO_SHIFT_REG <= local_bb4_ld__lsu_dataout;
			local_bb4_ld__valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb4_ld__stall_in))
			begin
				local_bb4_ld__valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_inputs_ready_NO_SHIFT_REG;
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_valid_out_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_stall_out_reg_6_NO_SHIFT_REG;

acl_data_fifo rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_6_NO_SHIFT_REG),
	.valid_out(rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_valid_out_reg_6_NO_SHIFT_REG),
	.stall_out(rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_stall_out_reg_6_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG),
	.data_out(rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_NO_SHIFT_REG)
);

defparam rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_fifo.DEPTH = 3;
defparam rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_fifo.DATA_WIDTH = 1;
defparam rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_fifo.IMPL = "shift_reg";

assign rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb4_keep_going143_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG = rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_reg_6_NO_SHIFT_REG;
assign rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_6_NO_SHIFT_REG = 1'b0;
assign rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 3
//  * capacity = 3
 logic rnode_3to6_bb4_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_3to6_bb4_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_3to6_bb4_var__0_NO_SHIFT_REG;
 logic rnode_3to6_bb4_var__0_reg_6_inputs_ready_NO_SHIFT_REG;
 logic rnode_3to6_bb4_var__0_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_bb4_var__0_valid_out_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_bb4_var__0_stall_in_reg_6_NO_SHIFT_REG;
 logic rnode_3to6_bb4_var__0_stall_out_reg_6_NO_SHIFT_REG;

acl_data_fifo rnode_3to6_bb4_var__0_reg_6_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to6_bb4_var__0_reg_6_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to6_bb4_var__0_stall_in_reg_6_NO_SHIFT_REG),
	.valid_out(rnode_3to6_bb4_var__0_valid_out_reg_6_NO_SHIFT_REG),
	.stall_out(rnode_3to6_bb4_var__0_stall_out_reg_6_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb4_var__0_NO_SHIFT_REG),
	.data_out(rnode_3to6_bb4_var__0_reg_6_NO_SHIFT_REG)
);

defparam rnode_3to6_bb4_var__0_reg_6_fifo.DEPTH = 3;
defparam rnode_3to6_bb4_var__0_reg_6_fifo.DATA_WIDTH = 1;
defparam rnode_3to6_bb4_var__0_reg_6_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to6_bb4_var__0_reg_6_fifo.IMPL = "shift_reg";

assign rnode_3to6_bb4_var__0_reg_6_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb4_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to6_bb4_var__0_NO_SHIFT_REG = rnode_3to6_bb4_var__0_reg_6_NO_SHIFT_REG;
assign rnode_3to6_bb4_var__0_stall_in_reg_6_NO_SHIFT_REG = 1'b0;
assign rnode_3to6_bb4_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_6to7_bb4_cmp4_not_0_valid_out_NO_SHIFT_REG;
 logic rnode_6to7_bb4_cmp4_not_0_stall_in_NO_SHIFT_REG;
 logic rnode_6to7_bb4_cmp4_not_0_NO_SHIFT_REG;
 logic rnode_6to7_bb4_cmp4_not_0_reg_7_inputs_ready_NO_SHIFT_REG;
 logic rnode_6to7_bb4_cmp4_not_0_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_cmp4_not_0_valid_out_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_cmp4_not_0_stall_in_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_cmp4_not_0_stall_out_reg_7_NO_SHIFT_REG;

acl_data_fifo rnode_6to7_bb4_cmp4_not_0_reg_7_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_6to7_bb4_cmp4_not_0_reg_7_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_6to7_bb4_cmp4_not_0_stall_in_reg_7_NO_SHIFT_REG),
	.valid_out(rnode_6to7_bb4_cmp4_not_0_valid_out_reg_7_NO_SHIFT_REG),
	.stall_out(rnode_6to7_bb4_cmp4_not_0_stall_out_reg_7_NO_SHIFT_REG),
	.data_in(rnode_2to6_bb4_cmp4_not_0_NO_SHIFT_REG),
	.data_out(rnode_6to7_bb4_cmp4_not_0_reg_7_NO_SHIFT_REG)
);

defparam rnode_6to7_bb4_cmp4_not_0_reg_7_fifo.DEPTH = 1;
defparam rnode_6to7_bb4_cmp4_not_0_reg_7_fifo.DATA_WIDTH = 1;
defparam rnode_6to7_bb4_cmp4_not_0_reg_7_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_6to7_bb4_cmp4_not_0_reg_7_fifo.IMPL = "shift_reg";

assign rnode_6to7_bb4_cmp4_not_0_reg_7_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to6_bb4_cmp4_not_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_cmp4_not_0_NO_SHIFT_REG = rnode_6to7_bb4_cmp4_not_0_reg_7_NO_SHIFT_REG;
assign rnode_6to7_bb4_cmp4_not_0_stall_in_reg_7_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_cmp4_not_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb4_add_ptr_sum_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb4_add_ptr_sum_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb4_add_ptr_sum_0_NO_SHIFT_REG;
 logic rnode_2to3_bb4_add_ptr_sum_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb4_add_ptr_sum_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_add_ptr_sum_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_add_ptr_sum_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb4_add_ptr_sum_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb4_add_ptr_sum_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb4_add_ptr_sum_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb4_add_ptr_sum_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb4_add_ptr_sum_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb4_add_ptr_sum_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb4_add_ptr_sum),
	.data_out(rnode_2to3_bb4_add_ptr_sum_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb4_add_ptr_sum_0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb4_add_ptr_sum_0_reg_3_fifo.DATA_WIDTH = 64;
defparam rnode_2to3_bb4_add_ptr_sum_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb4_add_ptr_sum_0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb4_add_ptr_sum_0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_add_ptr_sum_stall_in = 1'b0;
assign rnode_2to3_bb4_add_ptr_sum_0_NO_SHIFT_REG = rnode_2to3_bb4_add_ptr_sum_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb4_add_ptr_sum_0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb4_add_ptr_sum_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_3_VALID_4_5_0_inputs_ready;
 reg SFC_3_VALID_4_5_0_valid_out_NO_SHIFT_REG;
wire SFC_3_VALID_4_5_0_stall_in;
wire SFC_3_VALID_4_5_0_output_regs_ready;
 reg SFC_3_VALID_4_5_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_3_VALID_4_5_0_causedstall;

assign SFC_3_VALID_4_5_0_inputs_ready = 1'b1;
assign SFC_3_VALID_4_5_0_output_regs_ready = 1'b1;
assign SFC_3_VALID_3_4_0_stall_in = 1'b0;
assign SFC_3_VALID_4_5_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_3_VALID_4_5_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_3_VALID_4_5_0_output_regs_ready)
		begin
			SFC_3_VALID_4_5_0_NO_SHIFT_REG <= SFC_3_VALID_3_4_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb4_c0_exi1166_stall_local;
wire [191:0] local_bb4_c0_exi1166;

assign local_bb4_c0_exi1166[7:0] = 8'bx;
assign local_bb4_c0_exi1166[15:8] = local_bb4_ld__NO_SHIFT_REG;
assign local_bb4_c0_exi1166[191:16] = 176'bx;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_inputs_ready_NO_SHIFT_REG;
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_valid_out_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_stall_out_reg_7_NO_SHIFT_REG;

acl_data_fifo rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_7_NO_SHIFT_REG),
	.valid_out(rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_valid_out_reg_7_NO_SHIFT_REG),
	.stall_out(rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_stall_out_reg_7_NO_SHIFT_REG),
	.data_in(rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG),
	.data_out(rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_NO_SHIFT_REG)
);

defparam rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_fifo.DEPTH = 1;
defparam rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_fifo.DATA_WIDTH = 1;
defparam rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_fifo.IMPL = "shift_reg";

assign rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to6_bb4_keep_going143_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_NO_SHIFT_REG = rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_reg_7_NO_SHIFT_REG;
assign rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_stall_in_reg_7_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_6to7_bb4_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_6to7_bb4_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_6to7_bb4_var__0_NO_SHIFT_REG;
 logic rnode_6to7_bb4_var__0_reg_7_inputs_ready_NO_SHIFT_REG;
 logic rnode_6to7_bb4_var__0_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_var__0_valid_out_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_var__0_stall_in_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_var__0_stall_out_reg_7_NO_SHIFT_REG;

acl_data_fifo rnode_6to7_bb4_var__0_reg_7_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_6to7_bb4_var__0_reg_7_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_6to7_bb4_var__0_stall_in_reg_7_NO_SHIFT_REG),
	.valid_out(rnode_6to7_bb4_var__0_valid_out_reg_7_NO_SHIFT_REG),
	.stall_out(rnode_6to7_bb4_var__0_stall_out_reg_7_NO_SHIFT_REG),
	.data_in(rnode_3to6_bb4_var__0_NO_SHIFT_REG),
	.data_out(rnode_6to7_bb4_var__0_reg_7_NO_SHIFT_REG)
);

defparam rnode_6to7_bb4_var__0_reg_7_fifo.DEPTH = 1;
defparam rnode_6to7_bb4_var__0_reg_7_fifo.DATA_WIDTH = 1;
defparam rnode_6to7_bb4_var__0_reg_7_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_6to7_bb4_var__0_reg_7_fifo.IMPL = "shift_reg";

assign rnode_6to7_bb4_var__0_reg_7_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to6_bb4_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_var__0_NO_SHIFT_REG = rnode_6to7_bb4_var__0_reg_7_NO_SHIFT_REG;
assign rnode_6to7_bb4_var__0_stall_in_reg_7_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb4_notcmp141_stall_local;
wire local_bb4_notcmp141;

assign local_bb4_notcmp141 = (input_wii_var_ | rnode_6to7_bb4_cmp4_not_0_NO_SHIFT_REG);

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_3to5_bb4_add_ptr_sum_0_valid_out_NO_SHIFT_REG;
 logic rnode_3to5_bb4_add_ptr_sum_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_3to5_bb4_add_ptr_sum_0_NO_SHIFT_REG;
 logic rnode_3to5_bb4_add_ptr_sum_0_reg_5_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_3to5_bb4_add_ptr_sum_0_reg_5_NO_SHIFT_REG;
 logic rnode_3to5_bb4_add_ptr_sum_0_valid_out_reg_5_NO_SHIFT_REG;
 logic rnode_3to5_bb4_add_ptr_sum_0_stall_in_reg_5_NO_SHIFT_REG;
 logic rnode_3to5_bb4_add_ptr_sum_0_stall_out_reg_5_NO_SHIFT_REG;

acl_data_fifo rnode_3to5_bb4_add_ptr_sum_0_reg_5_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to5_bb4_add_ptr_sum_0_reg_5_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to5_bb4_add_ptr_sum_0_stall_in_reg_5_NO_SHIFT_REG),
	.valid_out(rnode_3to5_bb4_add_ptr_sum_0_valid_out_reg_5_NO_SHIFT_REG),
	.stall_out(rnode_3to5_bb4_add_ptr_sum_0_stall_out_reg_5_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb4_add_ptr_sum_0_NO_SHIFT_REG),
	.data_out(rnode_3to5_bb4_add_ptr_sum_0_reg_5_NO_SHIFT_REG)
);

defparam rnode_3to5_bb4_add_ptr_sum_0_reg_5_fifo.DEPTH = 2;
defparam rnode_3to5_bb4_add_ptr_sum_0_reg_5_fifo.DATA_WIDTH = 64;
defparam rnode_3to5_bb4_add_ptr_sum_0_reg_5_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to5_bb4_add_ptr_sum_0_reg_5_fifo.IMPL = "shift_reg";

assign rnode_3to5_bb4_add_ptr_sum_0_reg_5_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb4_add_ptr_sum_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to5_bb4_add_ptr_sum_0_NO_SHIFT_REG = rnode_3to5_bb4_add_ptr_sum_0_reg_5_NO_SHIFT_REG;
assign rnode_3to5_bb4_add_ptr_sum_0_stall_in_reg_5_NO_SHIFT_REG = 1'b0;
assign rnode_3to5_bb4_add_ptr_sum_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_3_VALID_5_6_0_inputs_ready;
 reg SFC_3_VALID_5_6_0_valid_out_NO_SHIFT_REG;
wire SFC_3_VALID_5_6_0_stall_in;
wire SFC_3_VALID_5_6_0_output_regs_ready;
 reg SFC_3_VALID_5_6_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_3_VALID_5_6_0_causedstall;

assign SFC_3_VALID_5_6_0_inputs_ready = 1'b1;
assign SFC_3_VALID_5_6_0_output_regs_ready = 1'b1;
assign SFC_3_VALID_4_5_0_stall_in = 1'b0;
assign SFC_3_VALID_5_6_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_3_VALID_5_6_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_3_VALID_5_6_0_output_regs_ready)
		begin
			SFC_3_VALID_5_6_0_NO_SHIFT_REG <= SFC_3_VALID_4_5_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_5to6_bb4_add_ptr_sum_0_valid_out_NO_SHIFT_REG;
 logic rnode_5to6_bb4_add_ptr_sum_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_5to6_bb4_add_ptr_sum_0_NO_SHIFT_REG;
 logic rnode_5to6_bb4_add_ptr_sum_0_reg_6_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_5to6_bb4_add_ptr_sum_0_reg_6_NO_SHIFT_REG;
 logic rnode_5to6_bb4_add_ptr_sum_0_valid_out_reg_6_NO_SHIFT_REG;
 logic rnode_5to6_bb4_add_ptr_sum_0_stall_in_reg_6_NO_SHIFT_REG;
 logic rnode_5to6_bb4_add_ptr_sum_0_stall_out_reg_6_NO_SHIFT_REG;

acl_data_fifo rnode_5to6_bb4_add_ptr_sum_0_reg_6_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_5to6_bb4_add_ptr_sum_0_reg_6_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_5to6_bb4_add_ptr_sum_0_stall_in_reg_6_NO_SHIFT_REG),
	.valid_out(rnode_5to6_bb4_add_ptr_sum_0_valid_out_reg_6_NO_SHIFT_REG),
	.stall_out(rnode_5to6_bb4_add_ptr_sum_0_stall_out_reg_6_NO_SHIFT_REG),
	.data_in(rnode_3to5_bb4_add_ptr_sum_0_NO_SHIFT_REG),
	.data_out(rnode_5to6_bb4_add_ptr_sum_0_reg_6_NO_SHIFT_REG)
);

defparam rnode_5to6_bb4_add_ptr_sum_0_reg_6_fifo.DEPTH = 1;
defparam rnode_5to6_bb4_add_ptr_sum_0_reg_6_fifo.DATA_WIDTH = 64;
defparam rnode_5to6_bb4_add_ptr_sum_0_reg_6_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_5to6_bb4_add_ptr_sum_0_reg_6_fifo.IMPL = "shift_reg";

assign rnode_5to6_bb4_add_ptr_sum_0_reg_6_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to5_bb4_add_ptr_sum_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_5to6_bb4_add_ptr_sum_0_NO_SHIFT_REG = rnode_5to6_bb4_add_ptr_sum_0_reg_6_NO_SHIFT_REG;
assign rnode_5to6_bb4_add_ptr_sum_0_stall_in_reg_6_NO_SHIFT_REG = 1'b0;
assign rnode_5to6_bb4_add_ptr_sum_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_3_VALID_6_7_0_inputs_ready;
 reg SFC_3_VALID_6_7_0_valid_out_NO_SHIFT_REG;
wire SFC_3_VALID_6_7_0_stall_in;
wire SFC_3_VALID_6_7_0_output_regs_ready;
 reg SFC_3_VALID_6_7_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_3_VALID_6_7_0_causedstall;

assign SFC_3_VALID_6_7_0_inputs_ready = 1'b1;
assign SFC_3_VALID_6_7_0_output_regs_ready = 1'b1;
assign SFC_3_VALID_5_6_0_stall_in = 1'b0;
assign SFC_3_VALID_6_7_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_3_VALID_6_7_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_3_VALID_6_7_0_output_regs_ready)
		begin
			SFC_3_VALID_6_7_0_NO_SHIFT_REG <= SFC_3_VALID_5_6_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb4_add_ptr8_valid_out;
wire local_bb4_add_ptr8_stall_in;
wire local_bb4_add_ptr8_inputs_ready;
wire local_bb4_add_ptr8_stall_local;
wire [63:0] local_bb4_add_ptr8;

assign local_bb4_add_ptr8_inputs_ready = rnode_5to6_bb4_add_ptr_sum_0_valid_out_NO_SHIFT_REG;
assign local_bb4_add_ptr8 = ((input_pop2 & 64'hFFFFFFFFFFFFFC00) + rnode_5to6_bb4_add_ptr_sum_0_NO_SHIFT_REG);
assign local_bb4_add_ptr8_valid_out = 1'b1;
assign rnode_5to6_bb4_add_ptr_sum_0_stall_in_NO_SHIFT_REG = 1'b0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_6to7_bb4_add_ptr8_0_valid_out_NO_SHIFT_REG;
 logic rnode_6to7_bb4_add_ptr8_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_6to7_bb4_add_ptr8_0_NO_SHIFT_REG;
 logic rnode_6to7_bb4_add_ptr8_0_reg_7_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_6to7_bb4_add_ptr8_0_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_add_ptr8_0_valid_out_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_add_ptr8_0_stall_in_reg_7_NO_SHIFT_REG;
 logic rnode_6to7_bb4_add_ptr8_0_stall_out_reg_7_NO_SHIFT_REG;

acl_data_fifo rnode_6to7_bb4_add_ptr8_0_reg_7_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_6to7_bb4_add_ptr8_0_reg_7_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_6to7_bb4_add_ptr8_0_stall_in_reg_7_NO_SHIFT_REG),
	.valid_out(rnode_6to7_bb4_add_ptr8_0_valid_out_reg_7_NO_SHIFT_REG),
	.stall_out(rnode_6to7_bb4_add_ptr8_0_stall_out_reg_7_NO_SHIFT_REG),
	.data_in(local_bb4_add_ptr8),
	.data_out(rnode_6to7_bb4_add_ptr8_0_reg_7_NO_SHIFT_REG)
);

defparam rnode_6to7_bb4_add_ptr8_0_reg_7_fifo.DEPTH = 1;
defparam rnode_6to7_bb4_add_ptr8_0_reg_7_fifo.DATA_WIDTH = 64;
defparam rnode_6to7_bb4_add_ptr8_0_reg_7_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_6to7_bb4_add_ptr8_0_reg_7_fifo.IMPL = "shift_reg";

assign rnode_6to7_bb4_add_ptr8_0_reg_7_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb4_add_ptr8_stall_in = 1'b0;
assign rnode_6to7_bb4_add_ptr8_0_NO_SHIFT_REG = rnode_6to7_bb4_add_ptr8_0_reg_7_NO_SHIFT_REG;
assign rnode_6to7_bb4_add_ptr8_0_stall_in_reg_7_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_add_ptr8_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb4_c0_exi2167_stall_local;
wire [191:0] local_bb4_c0_exi2167;

assign local_bb4_c0_exi2167[63:0] = local_bb4_c0_exi1166[63:0];
assign local_bb4_c0_exi2167[127:64] = rnode_6to7_bb4_add_ptr8_0_NO_SHIFT_REG;
assign local_bb4_c0_exi2167[191:128] = local_bb4_c0_exi1166[191:128];

// This section implements an unregistered operation.
// 
wire local_bb4_c0_exi3168_stall_local;
wire [191:0] local_bb4_c0_exi3168;

assign local_bb4_c0_exi3168[127:0] = local_bb4_c0_exi2167[127:0];
assign local_bb4_c0_exi3168[128] = rnode_6to7_bb4_var__0_NO_SHIFT_REG;
assign local_bb4_c0_exi3168[191:129] = local_bb4_c0_exi2167[191:129];

// This section implements an unregistered operation.
// 
wire local_bb4_c0_exi4169_valid_out;
wire local_bb4_c0_exi4169_stall_in;
wire local_bb4_c0_exi4169_inputs_ready;
wire local_bb4_c0_exi4169_stall_local;
wire [191:0] local_bb4_c0_exi4169;

assign local_bb4_c0_exi4169_inputs_ready = (local_bb4_ld__valid_out_NO_SHIFT_REG & rnode_6to7_bb4_add_ptr8_0_valid_out_NO_SHIFT_REG & rnode_6to7_bb4_var__0_valid_out_NO_SHIFT_REG & rnode_6to7_bb4_cmp4_not_0_valid_out_NO_SHIFT_REG);
assign local_bb4_c0_exi4169[135:0] = local_bb4_c0_exi3168[135:0];
assign local_bb4_c0_exi4169[136] = local_bb4_notcmp141;
assign local_bb4_c0_exi4169[191:137] = local_bb4_c0_exi3168[191:137];
assign local_bb4_c0_exi4169_valid_out = 1'b1;
assign local_bb4_ld__stall_in = 1'b0;
assign rnode_6to7_bb4_add_ptr8_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_6to7_bb4_cmp4_not_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire local_bb4_c0_exit170_c0_exi4169_inputs_ready;
 reg local_bb4_c0_exit170_c0_exi4169_valid_out_0_NO_SHIFT_REG;
wire local_bb4_c0_exit170_c0_exi4169_stall_in_0;
 reg local_bb4_c0_exit170_c0_exi4169_valid_out_1_NO_SHIFT_REG;
wire local_bb4_c0_exit170_c0_exi4169_stall_in_1;
 reg local_bb4_c0_exit170_c0_exi4169_valid_out_2_NO_SHIFT_REG;
wire local_bb4_c0_exit170_c0_exi4169_stall_in_2;
 reg [191:0] local_bb4_c0_exit170_c0_exi4169_NO_SHIFT_REG;
wire [191:0] local_bb4_c0_exit170_c0_exi4169_in;
wire local_bb4_c0_exit170_c0_exi4169_valid;
wire local_bb4_c0_exit170_c0_exi4169_causedstall;

acl_stall_free_sink local_bb4_c0_exit170_c0_exi4169_instance (
	.clock(clock),
	.resetn(resetn),
	.data_in(local_bb4_c0_exi4169),
	.data_out(local_bb4_c0_exit170_c0_exi4169_in),
	.input_accepted(local_bb4_c0_enter164_c0_eni1163_input_accepted),
	.valid_out(local_bb4_c0_exit170_c0_exi4169_valid),
	.stall_in(~(local_bb4_c0_exit170_c0_exi4169_output_regs_ready)),
	.stall_entry(local_bb4_c0_exit170_c0_exi4169_entry_stall),
	.valid_in(local_bb4_c0_exit170_c0_exi4169_valid_in),
	.IIphases(local_bb4_c0_exit170_c0_exi4169_phases),
	.inc_pipelined_thread(local_bb4_c0_enter164_c0_eni1163_inc_pipelined_thread),
	.dec_pipelined_thread(local_bb4_c0_enter164_c0_eni1163_dec_pipelined_thread)
);

defparam local_bb4_c0_exit170_c0_exi4169_instance.DATA_WIDTH = 192;
defparam local_bb4_c0_exit170_c0_exi4169_instance.PIPELINE_DEPTH = 11;
defparam local_bb4_c0_exit170_c0_exi4169_instance.SHARINGII = 1;
defparam local_bb4_c0_exit170_c0_exi4169_instance.SCHEDULEII = 1;
defparam local_bb4_c0_exit170_c0_exi4169_instance.ALWAYS_THROTTLE = 0;

assign local_bb4_c0_exit170_c0_exi4169_inputs_ready = 1'b1;
assign local_bb4_c0_exit170_c0_exi4169_output_regs_ready = ((~(local_bb4_c0_exit170_c0_exi4169_valid_out_0_NO_SHIFT_REG) | ~(local_bb4_c0_exit170_c0_exi4169_stall_in_0)) & (~(local_bb4_c0_exit170_c0_exi4169_valid_out_1_NO_SHIFT_REG) | ~(local_bb4_c0_exit170_c0_exi4169_stall_in_1)) & (~(local_bb4_c0_exit170_c0_exi4169_valid_out_2_NO_SHIFT_REG) | ~(local_bb4_c0_exit170_c0_exi4169_stall_in_2)));
assign local_bb4_c0_exit170_c0_exi4169_valid_in = SFC_3_VALID_6_7_0_NO_SHIFT_REG;
assign local_bb4_c0_exi4169_stall_in = 1'b0;
assign SFC_3_VALID_6_7_0_stall_in = 1'b0;
assign rnode_6to7_bb4_keep_going143_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign local_bb4_c0_exit170_c0_exi4169_causedstall = (1'b1 && (1'b0 && !(~(local_bb4_c0_exit170_c0_exi4169_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb4_c0_exit170_c0_exi4169_NO_SHIFT_REG <= 'x;
		local_bb4_c0_exit170_c0_exi4169_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb4_c0_exit170_c0_exi4169_valid_out_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb4_c0_exit170_c0_exi4169_output_regs_ready)
		begin
			local_bb4_c0_exit170_c0_exi4169_NO_SHIFT_REG <= local_bb4_c0_exit170_c0_exi4169_in;
			local_bb4_c0_exit170_c0_exi4169_valid_out_0_NO_SHIFT_REG <= local_bb4_c0_exit170_c0_exi4169_valid;
			local_bb4_c0_exit170_c0_exi4169_valid_out_2_NO_SHIFT_REG <= local_bb4_c0_exit170_c0_exi4169_valid;
		end
		else
		begin
			if (~(local_bb4_c0_exit170_c0_exi4169_stall_in_0))
			begin
				local_bb4_c0_exit170_c0_exi4169_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb4_c0_exit170_c0_exi4169_stall_in_2))
			begin
				local_bb4_c0_exit170_c0_exi4169_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	local_bb4_c0_exit170_c0_exi4169_valid_out_1_NO_SHIFT_REG = local_bb4_c0_exit170_c0_exi4169_valid_out_0_NO_SHIFT_REG;
end


// This section implements an unregistered operation.
// 
wire local_bb4_c0_exe1171_stall_local;
wire [7:0] local_bb4_c0_exe1171;

assign local_bb4_c0_exe1171[7:0] = local_bb4_c0_exit170_c0_exi4169_NO_SHIFT_REG[15:8];

// This section implements an unregistered operation.
// 
wire local_bb4_c0_exe1171_valid_out;
wire local_bb4_c0_exe1171_stall_in;
wire local_bb4_c0_exe2172_valid_out;
wire local_bb4_c0_exe2172_stall_in;
wire local_bb4_c0_exe2172_inputs_ready;
wire local_bb4_c0_exe2172_stall_local;
wire [63:0] local_bb4_c0_exe2172;

assign local_bb4_c0_exe2172_inputs_ready = (local_bb4_c0_exit170_c0_exi4169_valid_out_0_NO_SHIFT_REG & local_bb4_c0_exit170_c0_exi4169_valid_out_1_NO_SHIFT_REG);
assign local_bb4_c0_exe2172[63:0] = local_bb4_c0_exit170_c0_exi4169_NO_SHIFT_REG[127:64];
assign local_bb4_c0_exe2172_stall_local = (local_bb4_c0_exe1171_stall_in | local_bb4_c0_exe2172_stall_in);
assign local_bb4_c0_exe1171_valid_out = local_bb4_c0_exe2172_inputs_ready;
assign local_bb4_c0_exe2172_valid_out = local_bb4_c0_exe2172_inputs_ready;
assign local_bb4_c0_exit170_c0_exi4169_stall_in_0 = (local_bb4_c0_exe2172_stall_local | ~(local_bb4_c0_exe2172_inputs_ready));
assign local_bb4_c0_exit170_c0_exi4169_stall_in_1 = (local_bb4_c0_exe2172_stall_local | ~(local_bb4_c0_exe2172_inputs_ready));

// This section implements an unregistered operation.
// 
wire local_bb4_c0_exe4174_valid_out;
wire local_bb4_c0_exe4174_stall_in;
wire local_bb4_c0_exe4174_inputs_ready;
wire local_bb4_c0_exe4174_stall_local;
wire local_bb4_c0_exe4174;

assign local_bb4_c0_exe4174_inputs_ready = local_bb4_c0_exit170_c0_exi4169_valid_out_2_NO_SHIFT_REG;
assign local_bb4_c0_exe4174 = local_bb4_c0_exit170_c0_exi4169_NO_SHIFT_REG[136];
assign local_bb4_c0_exe4174_valid_out = local_bb4_c0_exe4174_inputs_ready;
assign local_bb4_c0_exe4174_stall_local = local_bb4_c0_exe4174_stall_in;
assign local_bb4_c0_exit170_c0_exi4169_stall_in_2 = (|local_bb4_c0_exe4174_stall_local);

// This section implements a registered operation.
// 
wire local_bb4_st_c0_exe1171_inputs_ready;
 reg local_bb4_st_c0_exe1171_valid_out_NO_SHIFT_REG;
wire local_bb4_st_c0_exe1171_stall_in;
wire local_bb4_st_c0_exe1171_output_regs_ready;
wire local_bb4_st_c0_exe1171_fu_stall_out;
wire local_bb4_st_c0_exe1171_fu_valid_out;
wire local_bb4_st_c0_exe1171_causedstall;

lsu_top lsu_local_bb4_st_c0_exe1171 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb4_st_c0_exe1171_fu_stall_out),
	.i_valid(local_bb4_st_c0_exe1171_inputs_ready),
	.i_address(local_bb4_c0_exe2172),
	.i_writedata(local_bb4_c0_exe1171),
	.i_cmpdata(),
	.i_predicate(input_wii_var_),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb4_st_c0_exe1171_output_regs_ready)),
	.o_valid(local_bb4_st_c0_exe1171_fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb4_st_c0_exe1171_active),
	.avm_address(avm_local_bb4_st_c0_exe1171_address),
	.avm_read(avm_local_bb4_st_c0_exe1171_read),
	.avm_enable(avm_local_bb4_st_c0_exe1171_enable),
	.avm_readdata(avm_local_bb4_st_c0_exe1171_readdata),
	.avm_write(avm_local_bb4_st_c0_exe1171_write),
	.avm_writeack(avm_local_bb4_st_c0_exe1171_writeack),
	.avm_burstcount(avm_local_bb4_st_c0_exe1171_burstcount),
	.avm_writedata(avm_local_bb4_st_c0_exe1171_writedata),
	.avm_byteenable(avm_local_bb4_st_c0_exe1171_byteenable),
	.avm_waitrequest(avm_local_bb4_st_c0_exe1171_waitrequest),
	.avm_readdatavalid(avm_local_bb4_st_c0_exe1171_readdatavalid),
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

defparam lsu_local_bb4_st_c0_exe1171.AWIDTH = 32;
defparam lsu_local_bb4_st_c0_exe1171.WIDTH_BYTES = 1;
defparam lsu_local_bb4_st_c0_exe1171.MWIDTH_BYTES = 64;
defparam lsu_local_bb4_st_c0_exe1171.WRITEDATAWIDTH_BYTES = 64;
defparam lsu_local_bb4_st_c0_exe1171.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb4_st_c0_exe1171.READ = 0;
defparam lsu_local_bb4_st_c0_exe1171.ATOMIC = 0;
defparam lsu_local_bb4_st_c0_exe1171.WIDTH = 8;
defparam lsu_local_bb4_st_c0_exe1171.MWIDTH = 512;
defparam lsu_local_bb4_st_c0_exe1171.ATOMIC_WIDTH = 3;
defparam lsu_local_bb4_st_c0_exe1171.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb4_st_c0_exe1171.KERNEL_SIDE_MEM_LATENCY = 4;
defparam lsu_local_bb4_st_c0_exe1171.MEMORY_SIDE_MEM_LATENCY = 10;
defparam lsu_local_bb4_st_c0_exe1171.USE_WRITE_ACK = 0;
defparam lsu_local_bb4_st_c0_exe1171.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb4_st_c0_exe1171.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb4_st_c0_exe1171.NUMBER_BANKS = 1;
defparam lsu_local_bb4_st_c0_exe1171.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb4_st_c0_exe1171.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb4_st_c0_exe1171.USEINPUTFIFO = 0;
defparam lsu_local_bb4_st_c0_exe1171.USECACHING = 0;
defparam lsu_local_bb4_st_c0_exe1171.USEOUTPUTFIFO = 1;
defparam lsu_local_bb4_st_c0_exe1171.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb4_st_c0_exe1171.ADDRSPACE = 1;
defparam lsu_local_bb4_st_c0_exe1171.STYLE = "BURST-COALESCED";
defparam lsu_local_bb4_st_c0_exe1171.USE_BYTE_EN = 0;

assign local_bb4_st_c0_exe1171_inputs_ready = (local_bb4_c0_exe1171_valid_out & local_bb4_c0_exe2172_valid_out & rnode_11to12_var__0_valid_out_NO_SHIFT_REG);
assign local_bb4_st_c0_exe1171_output_regs_ready = (&(~(local_bb4_st_c0_exe1171_valid_out_NO_SHIFT_REG) | ~(local_bb4_st_c0_exe1171_stall_in)));
assign local_bb4_c0_exe1171_stall_in = (local_bb4_st_c0_exe1171_fu_stall_out | ~(local_bb4_st_c0_exe1171_inputs_ready));
assign local_bb4_c0_exe2172_stall_in = (local_bb4_st_c0_exe1171_fu_stall_out | ~(local_bb4_st_c0_exe1171_inputs_ready));
assign rnode_11to12_var__0_stall_in_NO_SHIFT_REG = (local_bb4_st_c0_exe1171_fu_stall_out | ~(local_bb4_st_c0_exe1171_inputs_ready));
assign local_bb4_st_c0_exe1171_causedstall = (local_bb4_st_c0_exe1171_inputs_ready && (local_bb4_st_c0_exe1171_fu_stall_out && !(~(local_bb4_st_c0_exe1171_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb4_st_c0_exe1171_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb4_st_c0_exe1171_output_regs_ready)
		begin
			local_bb4_st_c0_exe1171_valid_out_NO_SHIFT_REG <= local_bb4_st_c0_exe1171_fu_valid_out;
		end
		else
		begin
			if (~(local_bb4_st_c0_exe1171_stall_in))
			begin
				local_bb4_st_c0_exe1171_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// Register node:
//  * latency = 4
//  * capacity = 4
 logic rnode_12to16_bb4_c0_exe4174_0_valid_out_NO_SHIFT_REG;
 logic rnode_12to16_bb4_c0_exe4174_0_stall_in_NO_SHIFT_REG;
 logic rnode_12to16_bb4_c0_exe4174_0_NO_SHIFT_REG;
 logic rnode_12to16_bb4_c0_exe4174_0_reg_16_inputs_ready_NO_SHIFT_REG;
 logic rnode_12to16_bb4_c0_exe4174_0_reg_16_NO_SHIFT_REG;
 logic rnode_12to16_bb4_c0_exe4174_0_valid_out_reg_16_NO_SHIFT_REG;
 logic rnode_12to16_bb4_c0_exe4174_0_stall_in_reg_16_NO_SHIFT_REG;
 logic rnode_12to16_bb4_c0_exe4174_0_stall_out_reg_16_NO_SHIFT_REG;

acl_data_fifo rnode_12to16_bb4_c0_exe4174_0_reg_16_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_12to16_bb4_c0_exe4174_0_reg_16_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_12to16_bb4_c0_exe4174_0_stall_in_reg_16_NO_SHIFT_REG),
	.valid_out(rnode_12to16_bb4_c0_exe4174_0_valid_out_reg_16_NO_SHIFT_REG),
	.stall_out(rnode_12to16_bb4_c0_exe4174_0_stall_out_reg_16_NO_SHIFT_REG),
	.data_in(local_bb4_c0_exe4174),
	.data_out(rnode_12to16_bb4_c0_exe4174_0_reg_16_NO_SHIFT_REG)
);

defparam rnode_12to16_bb4_c0_exe4174_0_reg_16_fifo.DEPTH = 5;
defparam rnode_12to16_bb4_c0_exe4174_0_reg_16_fifo.DATA_WIDTH = 1;
defparam rnode_12to16_bb4_c0_exe4174_0_reg_16_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_12to16_bb4_c0_exe4174_0_reg_16_fifo.IMPL = "ll_reg";

assign rnode_12to16_bb4_c0_exe4174_0_reg_16_inputs_ready_NO_SHIFT_REG = local_bb4_c0_exe4174_valid_out;
assign local_bb4_c0_exe4174_stall_in = rnode_12to16_bb4_c0_exe4174_0_stall_out_reg_16_NO_SHIFT_REG;
assign rnode_12to16_bb4_c0_exe4174_0_NO_SHIFT_REG = rnode_12to16_bb4_c0_exe4174_0_reg_16_NO_SHIFT_REG;
assign rnode_12to16_bb4_c0_exe4174_0_stall_in_reg_16_NO_SHIFT_REG = rnode_12to16_bb4_c0_exe4174_0_stall_in_NO_SHIFT_REG;
assign rnode_12to16_bb4_c0_exe4174_0_valid_out_NO_SHIFT_REG = rnode_12to16_bb4_c0_exe4174_0_valid_out_reg_16_NO_SHIFT_REG;

// This section implements a staging register.
// 
wire rstag_16to16_bb4_st_c0_exe1171_valid_out;
wire rstag_16to16_bb4_st_c0_exe1171_stall_in;
wire rstag_16to16_bb4_st_c0_exe1171_inputs_ready;
wire rstag_16to16_bb4_st_c0_exe1171_stall_local;
 reg rstag_16to16_bb4_st_c0_exe1171_staging_valid_NO_SHIFT_REG;
wire rstag_16to16_bb4_st_c0_exe1171_combined_valid;

assign rstag_16to16_bb4_st_c0_exe1171_inputs_ready = local_bb4_st_c0_exe1171_valid_out_NO_SHIFT_REG;
assign rstag_16to16_bb4_st_c0_exe1171_combined_valid = (rstag_16to16_bb4_st_c0_exe1171_staging_valid_NO_SHIFT_REG | rstag_16to16_bb4_st_c0_exe1171_inputs_ready);
assign rstag_16to16_bb4_st_c0_exe1171_valid_out = rstag_16to16_bb4_st_c0_exe1171_combined_valid;
assign rstag_16to16_bb4_st_c0_exe1171_stall_local = rstag_16to16_bb4_st_c0_exe1171_stall_in;
assign local_bb4_st_c0_exe1171_stall_in = (|rstag_16to16_bb4_st_c0_exe1171_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_16to16_bb4_st_c0_exe1171_staging_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (rstag_16to16_bb4_st_c0_exe1171_stall_local)
		begin
			if (~(rstag_16to16_bb4_st_c0_exe1171_staging_valid_NO_SHIFT_REG))
			begin
				rstag_16to16_bb4_st_c0_exe1171_staging_valid_NO_SHIFT_REG <= rstag_16to16_bb4_st_c0_exe1171_inputs_ready;
			end
		end
		else
		begin
			rstag_16to16_bb4_st_c0_exe1171_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
	end
end


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_0_NO_SHIFT_REG;
 reg branch_compare_result_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;

assign branch_var__inputs_ready = (rnode_12to16_bb4_c0_exe4174_0_valid_out_NO_SHIFT_REG & rstag_16to16_bb4_st_c0_exe1171_valid_out);
assign branch_var__output_regs_ready = (~(branch_node_valid_out_0_NO_SHIFT_REG) | (((branch_compare_result_NO_SHIFT_REG != 1'b1) & ~(stall_in_1)) | (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & ~(stall_in_0))));
assign rnode_12to16_bb4_c0_exe4174_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rstag_16to16_bb4_st_c0_exe1171_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out_0 = (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG);
assign valid_out_1 = ((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG);
assign combined_branch_stall_in_signal = ((((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_1) | ((~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_0));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		branch_compare_result_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_0_NO_SHIFT_REG <= branch_var__inputs_ready;
			branch_compare_result_NO_SHIFT_REG <= rnode_12to16_bb4_c0_exe4174_0_NO_SHIFT_REG;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_5
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_wii_conv,
		input 		input_wii_cmp11,
		input [63:0] 		input_wii_conv_i19_i,
		input 		input_wii_cmp_i20_i1,
		input 		input_wii_var_,
		input 		input_wii_var__u10,
		input 		input_wii_var__u11,
		input 		valid_in,
		output 		stall_out,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		input 		start,
		input [31:0] 		ffwd_1_0,
		output 		ffwd_4_0,
		output [31:0] 		ffwd_3_0,
		output 		ffwd_5_0
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
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
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
wire local_bb5_min_fit_fun_addr_012130_acl_ffwd_dest_i32_1_stall_local;
wire [31:0] local_bb5_min_fit_fun_addr_012130_acl_ffwd_dest_i32_1;

assign local_bb5_min_fit_fun_addr_012130_acl_ffwd_dest_i32_1 = ffwd_1_0;

// This section implements an unregistered operation.
// 
wire local_bb5_cmp10_not_stall_local;
wire local_bb5_cmp10_not;

assign local_bb5_cmp10_not = ($signed(local_bb5_min_fit_fun_addr_012130_acl_ffwd_dest_i32_1) < $signed(32'h1));

// This section implements an unregistered operation.
// 
wire local_bb5_brmerge_stall_local;
wire local_bb5_brmerge;

assign local_bb5_brmerge = (local_bb5_cmp10_not | input_wii_cmp_i20_i1);

// This section implements an unregistered operation.
// 
wire local_bb5_min_fit_fun_addr_012129_acl_ffwd_dest_i32_1_stall_local;
wire [31:0] local_bb5_min_fit_fun_addr_012129_acl_ffwd_dest_i32_1;

assign local_bb5_min_fit_fun_addr_012129_acl_ffwd_dest_i32_1 = ffwd_1_0;

// This section implements an unregistered operation.
// 
wire local_bb5_var__stall_local;
wire local_bb5_var_;

assign local_bb5_var_ = (input_wii_cmp11 | local_bb5_brmerge);

// This section implements an unregistered operation.
// 
wire local_bb5_min_fit_fun_addr_012_mux_stall_local;
wire [31:0] local_bb5_min_fit_fun_addr_012_mux;

assign local_bb5_min_fit_fun_addr_012_mux = (local_bb5_cmp10_not ? local_bb5_min_fit_fun_addr_012129_acl_ffwd_dest_i32_1 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb5_var__u12_stall_local;
wire local_bb5_var__u12;

assign local_bb5_var__u12 = (local_bb5_var_ ^ 1'b1);

// This section implements an unregistered operation.
// 
wire local_bb5___stall_local;
wire local_bb5__;
 reg ffwd_4_0_reg_NO_SHIFT_REG;
wire local_bb5___inputs_ready;

assign ffwd_4_0 = ffwd_4_0_reg_NO_SHIFT_REG;

always @(posedge clock)
begin
	if ((1'b1 & local_bb5___inputs_ready))
	begin
		ffwd_4_0_reg_NO_SHIFT_REG <= local_bb5_var_;
	end
end


// This section implements an unregistered operation.
// 
wire local_bb5__min_fit_fun_addr_012_mux_stall_local;
wire local_bb5__min_fit_fun_addr_012_mux;
 reg [31:0] ffwd_3_0_reg_NO_SHIFT_REG;
wire local_bb5__min_fit_fun_addr_012_mux_inputs_ready;

assign ffwd_3_0 = ffwd_3_0_reg_NO_SHIFT_REG;

always @(posedge clock)
begin
	if ((1'b1 & local_bb5__min_fit_fun_addr_012_mux_inputs_ready))
	begin
		ffwd_3_0_reg_NO_SHIFT_REG <= local_bb5_min_fit_fun_addr_012_mux;
	end
end


// This section implements an unregistered operation.
// 
wire local_bb5__min_fit_fun_addr_012_mux_valid_out;
wire local_bb5__min_fit_fun_addr_012_mux_stall_in;
wire local_bb5___valid_out;
wire local_bb5___stall_in;
wire local_bb5___u13_valid_out;
wire local_bb5___u13_stall_in;
wire local_bb5___u13_inputs_ready;
wire local_bb5___u13_stall_local;
wire local_bb5___u13;
 reg ffwd_5_0_reg_NO_SHIFT_REG;
 reg local_bb5__min_fit_fun_addr_012_mux_consumed_0_NO_SHIFT_REG;
 reg local_bb5___consumed_0_NO_SHIFT_REG;
 reg local_bb5___u13_consumed_0_NO_SHIFT_REG;

assign local_bb5___u13_inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign local_bb5___inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign local_bb5__min_fit_fun_addr_012_mux_inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign ffwd_5_0 = ffwd_5_0_reg_NO_SHIFT_REG;
assign local_bb5___u13_stall_local = ((local_bb5__min_fit_fun_addr_012_mux_stall_in & ~(local_bb5__min_fit_fun_addr_012_mux_consumed_0_NO_SHIFT_REG)) | (local_bb5___stall_in & ~(local_bb5___consumed_0_NO_SHIFT_REG)) | (local_bb5___u13_stall_in & ~(local_bb5___u13_consumed_0_NO_SHIFT_REG)));
assign local_bb5__min_fit_fun_addr_012_mux_valid_out = (local_bb5___u13_inputs_ready & ~(local_bb5__min_fit_fun_addr_012_mux_consumed_0_NO_SHIFT_REG));
assign local_bb5___valid_out = (local_bb5___u13_inputs_ready & ~(local_bb5___consumed_0_NO_SHIFT_REG));
assign local_bb5___u13_valid_out = (local_bb5___u13_inputs_ready & ~(local_bb5___u13_consumed_0_NO_SHIFT_REG));
assign merge_node_stall_in = (|local_bb5___u13_stall_local);

always @(posedge clock)
begin
	if ((1'b1 & local_bb5___u13_inputs_ready))
	begin
		ffwd_5_0_reg_NO_SHIFT_REG <= local_bb5_var__u12;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb5__min_fit_fun_addr_012_mux_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb5___consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb5___u13_consumed_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		local_bb5__min_fit_fun_addr_012_mux_consumed_0_NO_SHIFT_REG <= (local_bb5___u13_inputs_ready & (local_bb5__min_fit_fun_addr_012_mux_consumed_0_NO_SHIFT_REG | ~(local_bb5__min_fit_fun_addr_012_mux_stall_in)) & local_bb5___u13_stall_local);
		local_bb5___consumed_0_NO_SHIFT_REG <= (local_bb5___u13_inputs_ready & (local_bb5___consumed_0_NO_SHIFT_REG | ~(local_bb5___stall_in)) & local_bb5___u13_stall_local);
		local_bb5___u13_consumed_0_NO_SHIFT_REG <= (local_bb5___u13_inputs_ready & (local_bb5___u13_consumed_0_NO_SHIFT_REG | ~(local_bb5___u13_stall_in)) & local_bb5___u13_stall_local);
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_NO_SHIFT_REG;
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb5__min_fit_fun_addr_012_mux),
	.data_out(rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb5__min_fit_fun_addr_012_mux_valid_out;
assign local_bb5__min_fit_fun_addr_012_mux_stall_in = rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_NO_SHIFT_REG = rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_valid_out_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb5___0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb5___0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb5___0_NO_SHIFT_REG;
 logic rnode_1to2_bb5___0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb5___0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5___0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5___0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5___0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb5___0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb5___0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb5___0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb5___0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb5___0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb5__),
	.data_out(rnode_1to2_bb5___0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb5___0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb5___0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb5___0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb5___0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb5___0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb5___valid_out;
assign local_bb5___stall_in = rnode_1to2_bb5___0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb5___0_NO_SHIFT_REG = rnode_1to2_bb5___0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb5___0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb5___0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb5___0_valid_out_NO_SHIFT_REG = rnode_1to2_bb5___0_valid_out_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb5___u13_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb5___u13_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb5___u13_0_NO_SHIFT_REG;
 logic rnode_1to2_bb5___u13_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb5___u13_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5___u13_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5___u13_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb5___u13_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb5___u13_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb5___u13_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb5___u13_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb5___u13_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb5___u13_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb5___u13),
	.data_out(rnode_1to2_bb5___u13_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb5___u13_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb5___u13_0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb5___u13_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb5___u13_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb5___u13_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb5___u13_valid_out;
assign local_bb5___u13_stall_in = rnode_1to2_bb5___u13_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb5___u13_0_NO_SHIFT_REG = rnode_1to2_bb5___u13_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb5___u13_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb5___u13_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb5___u13_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb5___u13_0_valid_out_reg_2_NO_SHIFT_REG;

// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;

assign branch_var__inputs_ready = (rnode_1to2_bb5___u13_0_valid_out_NO_SHIFT_REG & rnode_1to2_bb5___0_valid_out_NO_SHIFT_REG & rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_valid_out_NO_SHIFT_REG);
assign branch_var__output_regs_ready = (~(stall_in) | ~(branch_node_valid_out_NO_SHIFT_REG));
assign rnode_1to2_bb5___u13_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rnode_1to2_bb5___0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rnode_1to2_bb5__min_fit_fun_addr_012_mux_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign combined_branch_stall_in_signal = stall_in;
assign valid_out = branch_node_valid_out_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_NO_SHIFT_REG <= branch_var__inputs_ready;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_6
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_best_member,
		input [63:0] 		input_wii_conv,
		input 		input_wii_cmp11,
		input [63:0] 		input_wii_conv_i19_i,
		input 		input_wii_cmp_i20_i1,
		input 		input_wii_var_,
		input 		input_wii_var__u14,
		input 		input_wii_var__u15,
		input 		valid_in_0,
		output 		stall_out_0,
		input 		input_forked151_0,
		input 		valid_in_1,
		output 		stall_out_1,
		input 		input_forked151_1,
		output 		valid_out_0,
		input 		stall_in_0,
		output 		valid_out_1,
		input 		stall_in_1,
		input [31:0] 		workgroup_size,
		input 		start,
		input 		ffwd_5_0,
		input 		feedback_valid_in_8,
		output 		feedback_stall_out_8,
		input [63:0] 		feedback_data_in_8,
		output 		feedback_stall_out_6,
		input 		feedback_valid_in_7,
		output 		feedback_stall_out_7,
		input 		feedback_data_in_7,
		output 		acl_pipelined_valid,
		input 		acl_pipelined_stall,
		output 		acl_pipelined_exiting_valid,
		output 		acl_pipelined_exiting_stall,
		output 		feedback_valid_out_8,
		input 		feedback_stall_in_8,
		output [63:0] 		feedback_data_out_8,
		output 		feedback_valid_out_7,
		input 		feedback_stall_in_7,
		output 		feedback_data_out_7,
		input 		ffwd_4_0,
		output 		avm_local_bb6_ld__enable,
		input [7:0] 		avm_local_bb6_ld__readdata,
		input 		avm_local_bb6_ld__readdatavalid,
		input 		avm_local_bb6_ld__waitrequest,
		output [31:0] 		avm_local_bb6_ld__address,
		output 		avm_local_bb6_ld__read,
		output 		avm_local_bb6_ld__write,
		input 		avm_local_bb6_ld__writeack,
		output [7:0] 		avm_local_bb6_ld__writedata,
		output 		avm_local_bb6_ld__byteenable,
		output 		avm_local_bb6_ld__burstcount,
		output [7:0] 		local_bb6_ld__input_fifo_depth,
		input 		clock2x,
		output 		avm_local_bb6_st_c0_exe1182_enable,
		input [511:0] 		avm_local_bb6_st_c0_exe1182_readdata,
		input 		avm_local_bb6_st_c0_exe1182_readdatavalid,
		input 		avm_local_bb6_st_c0_exe1182_waitrequest,
		output [31:0] 		avm_local_bb6_st_c0_exe1182_address,
		output 		avm_local_bb6_st_c0_exe1182_read,
		output 		avm_local_bb6_st_c0_exe1182_write,
		input 		avm_local_bb6_st_c0_exe1182_writeack,
		output [511:0] 		avm_local_bb6_st_c0_exe1182_writedata,
		output [63:0] 		avm_local_bb6_st_c0_exe1182_byteenable,
		output [4:0] 		avm_local_bb6_st_c0_exe1182_burstcount,
		output 		local_bb6_st_c0_exe1182_active
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((valid_in_0 & valid_in_1) & ~((stall_out_0 | stall_out_1)));
assign _exit = ((valid_out_0 & valid_out_1) & ~((stall_in_0 | stall_in_1)));
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
 reg merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
 reg input_forked151_0_staging_reg_NO_SHIFT_REG;
 reg local_lvm_forked151_NO_SHIFT_REG;
 reg merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;
 reg input_forked151_1_staging_reg_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = (|(merge_node_stall_in & merge_node_valid_out_NO_SHIFT_REG));
assign stall_out_0 = merge_node_valid_in_0_staging_reg_NO_SHIFT_REG;
assign stall_out_1 = merge_node_valid_in_1_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_0_staging_reg_NO_SHIFT_REG | valid_in_0))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		if ((merge_node_valid_in_1_staging_reg_NO_SHIFT_REG | valid_in_1))
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b1;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
		end
		else
		begin
			merge_block_selector_NO_SHIFT_REG = 1'b0;
			is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_forked151_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		input_forked151_1_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_0_staging_reg_NO_SHIFT_REG))
			begin
				input_forked151_0_staging_reg_NO_SHIFT_REG <= input_forked151_0;
				merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= valid_in_0;
			end
		end
		else
		begin
			merge_node_valid_in_0_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
		if (((merge_block_selector_NO_SHIFT_REG != 1'b1) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_1_staging_reg_NO_SHIFT_REG))
			begin
				input_forked151_1_staging_reg_NO_SHIFT_REG <= input_forked151_1;
				merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= valid_in_1;
			end
		end
		else
		begin
			merge_node_valid_in_1_staging_reg_NO_SHIFT_REG <= 1'b0;
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
				if (merge_node_valid_in_0_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked151_NO_SHIFT_REG <= input_forked151_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked151_NO_SHIFT_REG <= input_forked151_0;
				end
			end

			1'b1:
			begin
				if (merge_node_valid_in_1_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_forked151_NO_SHIFT_REG <= input_forked151_1_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_forked151_NO_SHIFT_REG <= input_forked151_1;
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
wire local_bb6_c0_eni1175_valid_out;
wire local_bb6_c0_eni1175_stall_in;
wire local_bb6_c0_eni1175_inputs_ready;
wire local_bb6_c0_eni1175_stall_local;
wire [15:0] local_bb6_c0_eni1175;

assign local_bb6_c0_eni1175_inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign local_bb6_c0_eni1175[7:0] = 8'bx;
assign local_bb6_c0_eni1175[8] = local_lvm_forked151_NO_SHIFT_REG;
assign local_bb6_c0_eni1175[15:9] = 7'bx;
assign local_bb6_c0_eni1175_valid_out = local_bb6_c0_eni1175_inputs_ready;
assign local_bb6_c0_eni1175_stall_local = local_bb6_c0_eni1175_stall_in;
assign merge_node_stall_in = (|local_bb6_c0_eni1175_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb6_c0_enter176_c0_eni1175_valid_out_0;
wire local_bb6_c0_enter176_c0_eni1175_stall_in_0;
wire local_bb6_c0_enter176_c0_eni1175_valid_out_1;
wire local_bb6_c0_enter176_c0_eni1175_stall_in_1;
wire local_bb6_c0_enter176_c0_eni1175_inputs_ready;
wire local_bb6_c0_enter176_c0_eni1175_stall_local;
wire local_bb6_c0_enter176_c0_eni1175_input_accepted;
wire [15:0] local_bb6_c0_enter176_c0_eni1175;
wire local_bb6_c0_exit181_c0_exi3180_entry_stall;
wire local_bb6_c0_enter176_c0_eni1175_valid_bit;
wire local_bb6_c0_exit181_c0_exi3180_output_regs_ready;
wire local_bb6_c0_exit181_c0_exi3180_valid_in;
wire local_bb6_c0_exit181_c0_exi3180_phases;
wire local_bb6_c0_enter176_c0_eni1175_inc_pipelined_thread;
wire local_bb6_c0_enter176_c0_eni1175_dec_pipelined_thread;
wire local_bb6_c0_enter176_c0_eni1175_fu_stall_out;

assign local_bb6_c0_enter176_c0_eni1175_inputs_ready = local_bb6_c0_eni1175_valid_out;
assign local_bb6_c0_enter176_c0_eni1175 = local_bb6_c0_eni1175;
assign local_bb6_c0_enter176_c0_eni1175_input_accepted = (local_bb6_c0_enter176_c0_eni1175_inputs_ready && !(local_bb6_c0_exit181_c0_exi3180_entry_stall));
assign local_bb6_c0_enter176_c0_eni1175_valid_bit = local_bb6_c0_enter176_c0_eni1175_input_accepted;
assign local_bb6_c0_enter176_c0_eni1175_inc_pipelined_thread = 1'b1;
assign local_bb6_c0_enter176_c0_eni1175_dec_pipelined_thread = ~(1'b0);
assign local_bb6_c0_enter176_c0_eni1175_fu_stall_out = (~(local_bb6_c0_enter176_c0_eni1175_inputs_ready) | local_bb6_c0_exit181_c0_exi3180_entry_stall);
assign local_bb6_c0_enter176_c0_eni1175_stall_local = (local_bb6_c0_enter176_c0_eni1175_stall_in_0 | local_bb6_c0_enter176_c0_eni1175_stall_in_1);
assign local_bb6_c0_enter176_c0_eni1175_valid_out_0 = local_bb6_c0_enter176_c0_eni1175_inputs_ready;
assign local_bb6_c0_enter176_c0_eni1175_valid_out_1 = local_bb6_c0_enter176_c0_eni1175_inputs_ready;
assign local_bb6_c0_eni1175_stall_in = (|local_bb6_c0_enter176_c0_eni1175_fu_stall_out);

// This section implements an unregistered operation.
// 
wire local_bb6_c0_ene1177_stall_local;
wire local_bb6_c0_ene1177;

assign local_bb6_c0_ene1177 = local_bb6_c0_enter176_c0_eni1175[8];

// This section implements an unregistered operation.
// 
wire SFC_4_VALID_1_1_0_stall_local;
wire SFC_4_VALID_1_1_0;

assign SFC_4_VALID_1_1_0 = local_bb6_c0_enter176_c0_eni1175_valid_bit;

// This section implements an unregistered operation.
// 
wire local_bb6__acl_ffwd_dest_i1_5_stall_local;
wire local_bb6__acl_ffwd_dest_i1_5;

assign local_bb6__acl_ffwd_dest_i1_5 = ffwd_5_0;

// This section implements an unregistered operation.
// 
wire local_bb6_i_0_i10_pop8_acl_pop_i64_0_stall_local;
wire [63:0] local_bb6_i_0_i10_pop8_acl_pop_i64_0;
wire local_bb6_i_0_i10_pop8_acl_pop_i64_0_fu_valid_out;
wire local_bb6_i_0_i10_pop8_acl_pop_i64_0_fu_stall_out;

acl_pop local_bb6_i_0_i10_pop8_acl_pop_i64_0_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(local_bb6_c0_ene1177),
	.predicate(1'b0),
	.data_in(64'h0),
	.stall_out(local_bb6_i_0_i10_pop8_acl_pop_i64_0_fu_stall_out),
	.valid_in(SFC_4_VALID_1_1_0),
	.valid_out(local_bb6_i_0_i10_pop8_acl_pop_i64_0_fu_valid_out),
	.stall_in(local_bb6_i_0_i10_pop8_acl_pop_i64_0_stall_local),
	.data_out(local_bb6_i_0_i10_pop8_acl_pop_i64_0),
	.feedback_in(feedback_data_in_8),
	.feedback_valid_in(feedback_valid_in_8),
	.feedback_stall_out(feedback_stall_out_8)
);

defparam local_bb6_i_0_i10_pop8_acl_pop_i64_0_feedback.COALESCE_DISTANCE = 1;
defparam local_bb6_i_0_i10_pop8_acl_pop_i64_0_feedback.DATA_WIDTH = 64;
defparam local_bb6_i_0_i10_pop8_acl_pop_i64_0_feedback.STYLE = "REGULAR";

assign local_bb6_i_0_i10_pop8_acl_pop_i64_0_stall_local = 1'b0;

// This section implements an unregistered operation.
// 
wire local_bb6_inc_i_stall_local;
wire [63:0] local_bb6_inc_i;

assign local_bb6_inc_i = (local_bb6_i_0_i10_pop8_acl_pop_i64_0 + 64'h1);

// This section implements an unregistered operation.
// 
wire local_bb6_cmp_i_stall_local;
wire [64:0] cmprep_local_bb6_cmp_i;
wire local_bb6_cmp_i;

assign cmprep_local_bb6_cmp_i = (local_bb6_inc_i - input_wii_conv_i19_i);
assign local_bb6_cmp_i = cmprep_local_bb6_cmp_i[64];

// This section implements an unregistered operation.
// 
wire local_bb6_c0_ene1177_valid_out_1;
wire local_bb6_c0_ene1177_stall_in_1;
wire local_bb6_c0_ene1177_valid_out_3;
wire local_bb6_c0_ene1177_stall_in_3;
wire local_bb6_i_0_i10_pop8_acl_pop_i64_0_valid_out_1;
wire local_bb6_i_0_i10_pop8_acl_pop_i64_0_stall_in_1;
wire SFC_4_VALID_1_1_0_valid_out_0;
wire SFC_4_VALID_1_1_0_stall_in_0;
wire SFC_4_VALID_1_1_0_valid_out_2;
wire SFC_4_VALID_1_1_0_stall_in_2;
wire SFC_4_VALID_1_1_0_valid_out_3;
wire SFC_4_VALID_1_1_0_stall_in_3;
wire SFC_4_VALID_1_1_0_valid_out_4;
wire SFC_4_VALID_1_1_0_stall_in_4;
wire local_bb6_inc_i_valid_out_1;
wire local_bb6_inc_i_stall_in_1;
wire local_bb6_var__valid_out_0;
wire local_bb6_var__stall_in_0;
wire local_bb6_var__valid_out_1;
wire local_bb6_var__stall_in_1;
wire local_bb6_var__valid_out_2;
wire local_bb6_var__stall_in_2;
wire local_bb6_var__inputs_ready;
wire local_bb6_var__stall_local;
wire local_bb6_var_;

assign local_bb6_var__inputs_ready = (local_bb6_c0_enter176_c0_eni1175_valid_out_0 & local_bb6_c0_enter176_c0_eni1175_valid_out_1);
assign local_bb6_var_ = (local_bb6_cmp_i & local_bb6__acl_ffwd_dest_i1_5);
assign local_bb6_c0_ene1177_valid_out_1 = 1'b1;
assign local_bb6_c0_ene1177_valid_out_3 = 1'b1;
assign local_bb6_i_0_i10_pop8_acl_pop_i64_0_valid_out_1 = 1'b1;
assign SFC_4_VALID_1_1_0_valid_out_0 = 1'b1;
assign SFC_4_VALID_1_1_0_valid_out_2 = 1'b1;
assign SFC_4_VALID_1_1_0_valid_out_3 = 1'b1;
assign SFC_4_VALID_1_1_0_valid_out_4 = 1'b1;
assign local_bb6_inc_i_valid_out_1 = 1'b1;
assign local_bb6_var__valid_out_0 = 1'b1;
assign local_bb6_var__valid_out_1 = 1'b1;
assign local_bb6_var__valid_out_2 = 1'b1;
assign local_bb6_c0_enter176_c0_eni1175_stall_in_0 = 1'b0;
assign local_bb6_c0_enter176_c0_eni1175_stall_in_1 = 1'b0;

// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_1to3_bb6_c0_ene1177_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to3_bb6_c0_ene1177_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to3_bb6_c0_ene1177_0_NO_SHIFT_REG;
 logic rnode_1to3_bb6_c0_ene1177_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to3_bb6_c0_ene1177_0_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_bb6_c0_ene1177_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_bb6_c0_ene1177_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_bb6_c0_ene1177_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_1to3_bb6_c0_ene1177_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to3_bb6_c0_ene1177_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to3_bb6_c0_ene1177_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_1to3_bb6_c0_ene1177_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_1to3_bb6_c0_ene1177_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb6_c0_ene1177),
	.data_out(rnode_1to3_bb6_c0_ene1177_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_1to3_bb6_c0_ene1177_0_reg_3_fifo.DEPTH = 2;
defparam rnode_1to3_bb6_c0_ene1177_0_reg_3_fifo.DATA_WIDTH = 1;
defparam rnode_1to3_bb6_c0_ene1177_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to3_bb6_c0_ene1177_0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_1to3_bb6_c0_ene1177_0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb6_c0_ene1177_stall_in_3 = 1'b0;
assign rnode_1to3_bb6_c0_ene1177_0_NO_SHIFT_REG = rnode_1to3_bb6_c0_ene1177_0_reg_3_NO_SHIFT_REG;
assign rnode_1to3_bb6_c0_ene1177_0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_1to3_bb6_c0_ene1177_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_NO_SHIFT_REG;
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_1_NO_SHIFT_REG;
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb6_i_0_i10_pop8_acl_pop_i64_0),
	.data_out(rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb6_i_0_i10_pop8_acl_pop_i64_0_stall_in_1 = 1'b0;
assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_in_0_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_valid_out_0_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_NO_SHIFT_REG = rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_1_NO_SHIFT_REG = rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_reg_2_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire SFC_4_VALID_1_2_0_inputs_ready;
 reg SFC_4_VALID_1_2_0_valid_out_NO_SHIFT_REG;
wire SFC_4_VALID_1_2_0_stall_in;
wire SFC_4_VALID_1_2_0_output_regs_ready;
 reg SFC_4_VALID_1_2_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_4_VALID_1_2_0_causedstall;

assign SFC_4_VALID_1_2_0_inputs_ready = 1'b1;
assign SFC_4_VALID_1_2_0_output_regs_ready = 1'b1;
assign SFC_4_VALID_1_1_0_stall_in_0 = 1'b0;
assign SFC_4_VALID_1_2_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_4_VALID_1_2_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_4_VALID_1_2_0_output_regs_ready)
		begin
			SFC_4_VALID_1_2_0_NO_SHIFT_REG <= SFC_4_VALID_1_1_0;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb6_keep_going148_acl_pipeline_1_inputs_ready;
 reg local_bb6_keep_going148_acl_pipeline_1_valid_out_NO_SHIFT_REG;
wire local_bb6_keep_going148_acl_pipeline_1_stall_in;
wire local_bb6_keep_going148_acl_pipeline_1_output_regs_ready;
wire local_bb6_keep_going148_acl_pipeline_1_keep_going;
wire local_bb6_keep_going148_acl_pipeline_1_fu_valid_out;
wire local_bb6_keep_going148_acl_pipeline_1_fu_stall_out;
 reg local_bb6_keep_going148_acl_pipeline_1_NO_SHIFT_REG;
wire local_bb6_keep_going148_acl_pipeline_1_feedback_pipelined;
wire local_bb6_keep_going148_acl_pipeline_1_causedstall;

acl_pipeline local_bb6_keep_going148_acl_pipeline_1_pipelined (
	.clock(clock),
	.resetn(resetn),
	.data_in(1'b1),
	.stall_out(local_bb6_keep_going148_acl_pipeline_1_fu_stall_out),
	.valid_in(SFC_4_VALID_1_1_0),
	.valid_out(local_bb6_keep_going148_acl_pipeline_1_fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb6_keep_going148_acl_pipeline_1_keep_going),
	.initeration_in(1'b0),
	.initeration_valid_in(1'b0),
	.initeration_stall_out(feedback_stall_out_6),
	.not_exitcond_in(feedback_data_in_7),
	.not_exitcond_valid_in(feedback_valid_in_7),
	.not_exitcond_stall_out(feedback_stall_out_7),
	.pipeline_valid_out(acl_pipelined_valid),
	.pipeline_stall_in(acl_pipelined_stall),
	.exiting_valid_out(acl_pipelined_exiting_valid)
);

defparam local_bb6_keep_going148_acl_pipeline_1_pipelined.FIFO_DEPTH = 0;
defparam local_bb6_keep_going148_acl_pipeline_1_pipelined.STYLE = "NON_SPECULATIVE";

assign local_bb6_keep_going148_acl_pipeline_1_inputs_ready = 1'b1;
assign local_bb6_keep_going148_acl_pipeline_1_output_regs_ready = 1'b1;
assign acl_pipelined_exiting_stall = acl_pipelined_stall;
assign local_bb6_c0_ene1177_stall_in_1 = 1'b0;
assign SFC_4_VALID_1_1_0_stall_in_2 = 1'b0;
assign local_bb6_keep_going148_acl_pipeline_1_causedstall = (SFC_4_VALID_1_1_0 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb6_keep_going148_acl_pipeline_1_NO_SHIFT_REG <= 'x;
		local_bb6_keep_going148_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb6_keep_going148_acl_pipeline_1_output_regs_ready)
		begin
			local_bb6_keep_going148_acl_pipeline_1_NO_SHIFT_REG <= local_bb6_keep_going148_acl_pipeline_1_keep_going;
			local_bb6_keep_going148_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb6_keep_going148_acl_pipeline_1_stall_in))
			begin
				local_bb6_keep_going148_acl_pipeline_1_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb6_i_0_i10_push8_inc_i_inputs_ready;
wire local_bb6_i_0_i10_push8_inc_i_output_regs_ready;
wire [63:0] local_bb6_i_0_i10_push8_inc_i_result;
wire local_bb6_i_0_i10_push8_inc_i_fu_valid_out;
wire local_bb6_i_0_i10_push8_inc_i_fu_stall_out;
 reg [63:0] local_bb6_i_0_i10_push8_inc_i_NO_SHIFT_REG;
wire local_bb6_i_0_i10_push8_inc_i_causedstall;

acl_push local_bb6_i_0_i10_push8_inc_i_feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(local_bb6_var_),
	.predicate(1'b0),
	.data_in(local_bb6_inc_i),
	.stall_out(local_bb6_i_0_i10_push8_inc_i_fu_stall_out),
	.valid_in(SFC_4_VALID_1_1_0),
	.valid_out(local_bb6_i_0_i10_push8_inc_i_fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb6_i_0_i10_push8_inc_i_result),
	.feedback_out(feedback_data_out_8),
	.feedback_valid_out(feedback_valid_out_8),
	.feedback_stall_in(feedback_stall_in_8)
);

defparam local_bb6_i_0_i10_push8_inc_i_feedback.STALLFREE = 1;
defparam local_bb6_i_0_i10_push8_inc_i_feedback.ENABLED = 0;
defparam local_bb6_i_0_i10_push8_inc_i_feedback.DATA_WIDTH = 64;
defparam local_bb6_i_0_i10_push8_inc_i_feedback.FIFO_DEPTH = 1;
defparam local_bb6_i_0_i10_push8_inc_i_feedback.MIN_FIFO_LATENCY = 1;
defparam local_bb6_i_0_i10_push8_inc_i_feedback.STYLE = "REGULAR";
defparam local_bb6_i_0_i10_push8_inc_i_feedback.RAM_FIFO_DEPTH_INC = 1;

assign local_bb6_i_0_i10_push8_inc_i_inputs_ready = 1'b1;
assign local_bb6_i_0_i10_push8_inc_i_output_regs_ready = 1'b1;
assign local_bb6_inc_i_stall_in_1 = 1'b0;
assign local_bb6_var__stall_in_0 = 1'b0;
assign SFC_4_VALID_1_1_0_stall_in_3 = 1'b0;
assign local_bb6_i_0_i10_push8_inc_i_causedstall = (SFC_4_VALID_1_1_0 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb6_i_0_i10_push8_inc_i_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb6_i_0_i10_push8_inc_i_output_regs_ready)
		begin
			local_bb6_i_0_i10_push8_inc_i_NO_SHIFT_REG <= local_bb6_i_0_i10_push8_inc_i_result;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb6_notexitcond149__inputs_ready;
wire local_bb6_notexitcond149__output_regs_ready;
wire local_bb6_notexitcond149__result;
wire local_bb6_notexitcond149__fu_valid_out;
wire local_bb6_notexitcond149__fu_stall_out;
 reg local_bb6_notexitcond149__NO_SHIFT_REG;
wire local_bb6_notexitcond149__causedstall;

acl_push local_bb6_notexitcond149__feedback (
	.clock(clock),
	.resetn(resetn),
	.dir(1'b1),
	.predicate(1'b0),
	.data_in(local_bb6_var_),
	.stall_out(local_bb6_notexitcond149__fu_stall_out),
	.valid_in(SFC_4_VALID_1_1_0),
	.valid_out(local_bb6_notexitcond149__fu_valid_out),
	.stall_in(1'b0),
	.data_out(local_bb6_notexitcond149__result),
	.feedback_out(feedback_data_out_7),
	.feedback_valid_out(feedback_valid_out_7),
	.feedback_stall_in(feedback_stall_in_7)
);

defparam local_bb6_notexitcond149__feedback.STALLFREE = 1;
defparam local_bb6_notexitcond149__feedback.ENABLED = 0;
defparam local_bb6_notexitcond149__feedback.DATA_WIDTH = 1;
defparam local_bb6_notexitcond149__feedback.FIFO_DEPTH = 0;
defparam local_bb6_notexitcond149__feedback.MIN_FIFO_LATENCY = 0;
defparam local_bb6_notexitcond149__feedback.STYLE = "REGULAR";
defparam local_bb6_notexitcond149__feedback.RAM_FIFO_DEPTH_INC = 1;

assign local_bb6_notexitcond149__inputs_ready = 1'b1;
assign local_bb6_notexitcond149__output_regs_ready = 1'b1;
assign local_bb6_var__stall_in_1 = 1'b0;
assign SFC_4_VALID_1_1_0_stall_in_4 = 1'b0;
assign local_bb6_notexitcond149__causedstall = (SFC_4_VALID_1_1_0 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb6_notexitcond149__NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (local_bb6_notexitcond149__output_regs_ready)
		begin
			local_bb6_notexitcond149__NO_SHIFT_REG <= local_bb6_notexitcond149__result;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb6_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb6_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb6_var__0_NO_SHIFT_REG;
 logic rnode_1to2_bb6_var__0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb6_var__0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb6_var__0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb6_var__0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb6_var__0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb6_var__0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb6_var__0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb6_var__0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb6_var__0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb6_var__0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb6_var_),
	.data_out(rnode_1to2_bb6_var__0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb6_var__0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb6_var__0_reg_2_fifo.DATA_WIDTH = 1;
defparam rnode_1to2_bb6_var__0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb6_var__0_reg_2_fifo.IMPL = "shift_reg";

assign rnode_1to2_bb6_var__0_reg_2_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb6_var__stall_in_2 = 1'b0;
assign rnode_1to2_bb6_var__0_NO_SHIFT_REG = rnode_1to2_bb6_var__0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb6_var__0_stall_in_reg_2_NO_SHIFT_REG = 1'b0;
assign rnode_1to2_bb6_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements an unregistered operation.
// 
wire local_bb6__acl_ffwd_dest_i1_4_valid_out;
wire local_bb6__acl_ffwd_dest_i1_4_stall_in;
wire local_bb6__acl_ffwd_dest_i1_4_inputs_ready;
wire local_bb6__acl_ffwd_dest_i1_4_stall_local;
wire local_bb6__acl_ffwd_dest_i1_4;

assign local_bb6__acl_ffwd_dest_i1_4_inputs_ready = rnode_1to3_bb6_c0_ene1177_0_valid_out_NO_SHIFT_REG;
assign local_bb6__acl_ffwd_dest_i1_4 = ffwd_4_0;
assign local_bb6__acl_ffwd_dest_i1_4_valid_out = 1'b1;
assign rnode_1to3_bb6_c0_ene1177_0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire local_bb6_arrayidx_i_inputs_ready;
 reg local_bb6_arrayidx_i_valid_out_NO_SHIFT_REG;
wire local_bb6_arrayidx_i_stall_in;
wire local_bb6_arrayidx_i_output_regs_ready;
 reg [31:0] local_bb6_arrayidx_i_NO_SHIFT_REG;
wire [31:0] local_bb6_arrayidx_i_op_wire;
wire local_bb6_arrayidx_i_causedstall;

assign local_bb6_arrayidx_i_inputs_ready = 1'b1;
assign local_bb6_arrayidx_i_output_regs_ready = 1'b1;
assign local_bb6_arrayidx_i_op_wire = (64'h0 + rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_NO_SHIFT_REG);
assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_in_0_NO_SHIFT_REG = 1'b0;
assign local_bb6_arrayidx_i_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb6_arrayidx_i_NO_SHIFT_REG <= 'x;
		local_bb6_arrayidx_i_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb6_arrayidx_i_output_regs_ready)
		begin
			local_bb6_arrayidx_i_NO_SHIFT_REG <= local_bb6_arrayidx_i_op_wire;
			local_bb6_arrayidx_i_valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb6_arrayidx_i_stall_in))
			begin
				local_bb6_arrayidx_i_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb6_arrayidx2_i_valid_out;
wire local_bb6_arrayidx2_i_stall_in;
wire local_bb6_arrayidx2_i_inputs_ready;
wire local_bb6_arrayidx2_i_stall_local;
wire [63:0] local_bb6_arrayidx2_i;

assign local_bb6_arrayidx2_i_inputs_ready = rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_valid_out_1_NO_SHIFT_REG;
assign local_bb6_arrayidx2_i = ((input_best_member & 64'hFFFFFFFFFFFFFC00) + rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_1_NO_SHIFT_REG);
assign local_bb6_arrayidx2_i_valid_out = 1'b1;
assign rnode_1to2_bb6_i_0_i10_pop8_acl_pop_i64_0_0_stall_in_1_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire SFC_4_VALID_2_3_0_inputs_ready;
 reg SFC_4_VALID_2_3_0_valid_out_0_NO_SHIFT_REG;
wire SFC_4_VALID_2_3_0_stall_in_0;
 reg SFC_4_VALID_2_3_0_valid_out_1_NO_SHIFT_REG;
wire SFC_4_VALID_2_3_0_stall_in_1;
wire SFC_4_VALID_2_3_0_output_regs_ready;
 reg SFC_4_VALID_2_3_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_4_VALID_2_3_0_causedstall;

assign SFC_4_VALID_2_3_0_inputs_ready = 1'b1;
assign SFC_4_VALID_2_3_0_output_regs_ready = 1'b1;
assign SFC_4_VALID_1_2_0_stall_in = 1'b0;
assign SFC_4_VALID_2_3_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_4_VALID_2_3_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_4_VALID_2_3_0_output_regs_ready)
		begin
			SFC_4_VALID_2_3_0_NO_SHIFT_REG <= SFC_4_VALID_1_2_0_NO_SHIFT_REG;
		end
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb6_keep_going148_acl_pipeline_1_NO_SHIFT_REG),
	.data_out(rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_fifo.DATA_WIDTH = 1;
defparam rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb6_keep_going148_acl_pipeline_1_stall_in = 1'b0;
assign rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG = rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 5
//  * capacity = 5
 logic rnode_2to7_bb6_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_2to7_bb6_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_2to7_bb6_var__0_NO_SHIFT_REG;
 logic rnode_2to7_bb6_var__0_reg_7_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to7_bb6_var__0_reg_7_NO_SHIFT_REG;
 logic rnode_2to7_bb6_var__0_valid_out_reg_7_NO_SHIFT_REG;
 logic rnode_2to7_bb6_var__0_stall_in_reg_7_NO_SHIFT_REG;
 logic rnode_2to7_bb6_var__0_stall_out_reg_7_NO_SHIFT_REG;

acl_data_fifo rnode_2to7_bb6_var__0_reg_7_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to7_bb6_var__0_reg_7_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to7_bb6_var__0_stall_in_reg_7_NO_SHIFT_REG),
	.valid_out(rnode_2to7_bb6_var__0_valid_out_reg_7_NO_SHIFT_REG),
	.stall_out(rnode_2to7_bb6_var__0_stall_out_reg_7_NO_SHIFT_REG),
	.data_in(rnode_1to2_bb6_var__0_NO_SHIFT_REG),
	.data_out(rnode_2to7_bb6_var__0_reg_7_NO_SHIFT_REG)
);

defparam rnode_2to7_bb6_var__0_reg_7_fifo.DEPTH = 5;
defparam rnode_2to7_bb6_var__0_reg_7_fifo.DATA_WIDTH = 1;
defparam rnode_2to7_bb6_var__0_reg_7_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to7_bb6_var__0_reg_7_fifo.IMPL = "shift_reg";

assign rnode_2to7_bb6_var__0_reg_7_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_1to2_bb6_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_2to7_bb6_var__0_NO_SHIFT_REG = rnode_2to7_bb6_var__0_reg_7_NO_SHIFT_REG;
assign rnode_2to7_bb6_var__0_stall_in_reg_7_NO_SHIFT_REG = 1'b0;
assign rnode_2to7_bb6_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb6_arrayidx2_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb6_arrayidx2_i_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb6_arrayidx2_i_0_NO_SHIFT_REG;
 logic rnode_2to3_bb6_arrayidx2_i_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_2to3_bb6_arrayidx2_i_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb6_arrayidx2_i_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb6_arrayidx2_i_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb6_arrayidx2_i_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_2to3_bb6_arrayidx2_i_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb6_arrayidx2_i_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb6_arrayidx2_i_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb6_arrayidx2_i_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb6_arrayidx2_i_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb6_arrayidx2_i),
	.data_out(rnode_2to3_bb6_arrayidx2_i_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb6_arrayidx2_i_0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb6_arrayidx2_i_0_reg_3_fifo.DATA_WIDTH = 64;
defparam rnode_2to3_bb6_arrayidx2_i_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb6_arrayidx2_i_0_reg_3_fifo.IMPL = "shift_reg";

assign rnode_2to3_bb6_arrayidx2_i_0_reg_3_inputs_ready_NO_SHIFT_REG = 1'b1;
assign local_bb6_arrayidx2_i_stall_in = 1'b0;
assign rnode_2to3_bb6_arrayidx2_i_0_NO_SHIFT_REG = rnode_2to3_bb6_arrayidx2_i_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb6_arrayidx2_i_0_stall_in_reg_3_NO_SHIFT_REG = 1'b0;
assign rnode_2to3_bb6_arrayidx2_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_4_VALID_3_4_0_inputs_ready;
 reg SFC_4_VALID_3_4_0_valid_out_NO_SHIFT_REG;
wire SFC_4_VALID_3_4_0_stall_in;
wire SFC_4_VALID_3_4_0_output_regs_ready;
 reg SFC_4_VALID_3_4_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_4_VALID_3_4_0_causedstall;

assign SFC_4_VALID_3_4_0_inputs_ready = 1'b1;
assign SFC_4_VALID_3_4_0_output_regs_ready = 1'b1;
assign SFC_4_VALID_2_3_0_stall_in_0 = 1'b0;
assign SFC_4_VALID_3_4_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_4_VALID_3_4_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_4_VALID_3_4_0_output_regs_ready)
		begin
			SFC_4_VALID_3_4_0_NO_SHIFT_REG <= SFC_4_VALID_2_3_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb6_ld__inputs_ready;
 reg local_bb6_ld__valid_out_NO_SHIFT_REG;
wire local_bb6_ld__stall_in;
wire local_bb6_ld__output_regs_ready;
wire local_bb6_ld__fu_stall_out;
wire local_bb6_ld__fu_valid_out;
wire [7:0] local_bb6_ld__lsu_dataout;
 reg [7:0] local_bb6_ld__NO_SHIFT_REG;
wire local_bb6_ld__causedstall;

lsu_top lsu_local_bb6_ld_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb6_ld__fu_stall_out),
	.i_valid(SFC_4_VALID_2_3_0_NO_SHIFT_REG),
	.i_address(local_bb6_arrayidx_i_NO_SHIFT_REG),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(local_bb6__acl_ffwd_dest_i1_4),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(1'b0),
	.o_valid(local_bb6_ld__fu_valid_out),
	.o_readdata(local_bb6_ld__lsu_dataout),
	.o_input_fifo_depth(local_bb6_ld__input_fifo_depth),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(),
	.avm_address(avm_local_bb6_ld__address),
	.avm_read(avm_local_bb6_ld__read),
	.avm_enable(avm_local_bb6_ld__enable),
	.avm_readdata(avm_local_bb6_ld__readdata),
	.avm_write(avm_local_bb6_ld__write),
	.avm_writeack(avm_local_bb6_ld__writeack),
	.avm_burstcount(avm_local_bb6_ld__burstcount),
	.avm_writedata(avm_local_bb6_ld__writedata),
	.avm_byteenable(avm_local_bb6_ld__byteenable),
	.avm_waitrequest(avm_local_bb6_ld__waitrequest),
	.avm_readdatavalid(avm_local_bb6_ld__readdatavalid),
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

defparam lsu_local_bb6_ld_.AWIDTH = 32;
defparam lsu_local_bb6_ld_.WIDTH_BYTES = 1;
defparam lsu_local_bb6_ld_.MWIDTH_BYTES = 1;
defparam lsu_local_bb6_ld_.WRITEDATAWIDTH_BYTES = 1;
defparam lsu_local_bb6_ld_.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb6_ld_.READ = 1;
defparam lsu_local_bb6_ld_.ATOMIC = 0;
defparam lsu_local_bb6_ld_.WIDTH = 8;
defparam lsu_local_bb6_ld_.MWIDTH = 8;
defparam lsu_local_bb6_ld_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb6_ld_.BURSTCOUNT_WIDTH = 1;
defparam lsu_local_bb6_ld_.KERNEL_SIDE_MEM_LATENCY = 5;
defparam lsu_local_bb6_ld_.MEMORY_SIDE_MEM_LATENCY = 0;
defparam lsu_local_bb6_ld_.USE_WRITE_ACK = 0;
defparam lsu_local_bb6_ld_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb6_ld_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb6_ld_.NUMBER_BANKS = 1;
defparam lsu_local_bb6_ld_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb6_ld_.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb6_ld_.USEINPUTFIFO = 0;
defparam lsu_local_bb6_ld_.USECACHING = 0;
defparam lsu_local_bb6_ld_.USEOUTPUTFIFO = 0;
defparam lsu_local_bb6_ld_.FORCE_NOP_SUPPORT = 1;
defparam lsu_local_bb6_ld_.ADDRSPACE = 7;
defparam lsu_local_bb6_ld_.STYLE = "PIPELINED";

assign local_bb6_ld__inputs_ready = 1'b1;
assign local_bb6_ld__output_regs_ready = 1'b1;
assign local_bb6_arrayidx_i_stall_in = 1'b0;
assign local_bb6__acl_ffwd_dest_i1_4_stall_in = 1'b0;
assign SFC_4_VALID_2_3_0_stall_in_1 = 1'b0;
assign local_bb6_ld__causedstall = (SFC_4_VALID_2_3_0_NO_SHIFT_REG && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb6_ld__NO_SHIFT_REG <= 'x;
		local_bb6_ld__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb6_ld__output_regs_ready)
		begin
			local_bb6_ld__NO_SHIFT_REG <= local_bb6_ld__lsu_dataout;
			local_bb6_ld__valid_out_NO_SHIFT_REG <= 1'b1;
		end
		else
		begin
			if (~(local_bb6_ld__stall_in))
			begin
				local_bb6_ld__valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// Register node:
//  * latency = 4
//  * capacity = 4
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_inputs_ready_NO_SHIFT_REG;
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_NO_SHIFT_REG;
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_valid_out_reg_7_NO_SHIFT_REG;
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_7_NO_SHIFT_REG;
 logic rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_stall_out_reg_7_NO_SHIFT_REG;

acl_data_fifo rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_7_NO_SHIFT_REG),
	.valid_out(rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_valid_out_reg_7_NO_SHIFT_REG),
	.stall_out(rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_stall_out_reg_7_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG),
	.data_out(rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_NO_SHIFT_REG)
);

defparam rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_fifo.DEPTH = 4;
defparam rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_fifo.DATA_WIDTH = 1;
defparam rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_fifo.IMPL = "shift_reg";

assign rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb6_keep_going148_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG = rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_reg_7_NO_SHIFT_REG;
assign rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_7_NO_SHIFT_REG = 1'b0;
assign rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_7to8_bb6_var__0_valid_out_NO_SHIFT_REG;
 logic rnode_7to8_bb6_var__0_stall_in_NO_SHIFT_REG;
 logic rnode_7to8_bb6_var__0_NO_SHIFT_REG;
 logic rnode_7to8_bb6_var__0_reg_8_inputs_ready_NO_SHIFT_REG;
 logic rnode_7to8_bb6_var__0_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_var__0_valid_out_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_var__0_stall_in_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_var__0_stall_out_reg_8_NO_SHIFT_REG;

acl_data_fifo rnode_7to8_bb6_var__0_reg_8_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_7to8_bb6_var__0_reg_8_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_7to8_bb6_var__0_stall_in_reg_8_NO_SHIFT_REG),
	.valid_out(rnode_7to8_bb6_var__0_valid_out_reg_8_NO_SHIFT_REG),
	.stall_out(rnode_7to8_bb6_var__0_stall_out_reg_8_NO_SHIFT_REG),
	.data_in(rnode_2to7_bb6_var__0_NO_SHIFT_REG),
	.data_out(rnode_7to8_bb6_var__0_reg_8_NO_SHIFT_REG)
);

defparam rnode_7to8_bb6_var__0_reg_8_fifo.DEPTH = 1;
defparam rnode_7to8_bb6_var__0_reg_8_fifo.DATA_WIDTH = 1;
defparam rnode_7to8_bb6_var__0_reg_8_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_7to8_bb6_var__0_reg_8_fifo.IMPL = "shift_reg";

assign rnode_7to8_bb6_var__0_reg_8_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to7_bb6_var__0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_7to8_bb6_var__0_NO_SHIFT_REG = rnode_7to8_bb6_var__0_reg_8_NO_SHIFT_REG;
assign rnode_7to8_bb6_var__0_stall_in_reg_8_NO_SHIFT_REG = 1'b0;
assign rnode_7to8_bb6_var__0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 4
//  * capacity = 4
 logic rnode_3to7_bb6_arrayidx2_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_3to7_bb6_arrayidx2_i_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_3to7_bb6_arrayidx2_i_0_NO_SHIFT_REG;
 logic rnode_3to7_bb6_arrayidx2_i_0_reg_7_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_3to7_bb6_arrayidx2_i_0_reg_7_NO_SHIFT_REG;
 logic rnode_3to7_bb6_arrayidx2_i_0_valid_out_reg_7_NO_SHIFT_REG;
 logic rnode_3to7_bb6_arrayidx2_i_0_stall_in_reg_7_NO_SHIFT_REG;
 logic rnode_3to7_bb6_arrayidx2_i_0_stall_out_reg_7_NO_SHIFT_REG;

acl_data_fifo rnode_3to7_bb6_arrayidx2_i_0_reg_7_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_3to7_bb6_arrayidx2_i_0_reg_7_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_3to7_bb6_arrayidx2_i_0_stall_in_reg_7_NO_SHIFT_REG),
	.valid_out(rnode_3to7_bb6_arrayidx2_i_0_valid_out_reg_7_NO_SHIFT_REG),
	.stall_out(rnode_3to7_bb6_arrayidx2_i_0_stall_out_reg_7_NO_SHIFT_REG),
	.data_in(rnode_2to3_bb6_arrayidx2_i_0_NO_SHIFT_REG),
	.data_out(rnode_3to7_bb6_arrayidx2_i_0_reg_7_NO_SHIFT_REG)
);

defparam rnode_3to7_bb6_arrayidx2_i_0_reg_7_fifo.DEPTH = 4;
defparam rnode_3to7_bb6_arrayidx2_i_0_reg_7_fifo.DATA_WIDTH = 64;
defparam rnode_3to7_bb6_arrayidx2_i_0_reg_7_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_3to7_bb6_arrayidx2_i_0_reg_7_fifo.IMPL = "shift_reg";

assign rnode_3to7_bb6_arrayidx2_i_0_reg_7_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_2to3_bb6_arrayidx2_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_3to7_bb6_arrayidx2_i_0_NO_SHIFT_REG = rnode_3to7_bb6_arrayidx2_i_0_reg_7_NO_SHIFT_REG;
assign rnode_3to7_bb6_arrayidx2_i_0_stall_in_reg_7_NO_SHIFT_REG = 1'b0;
assign rnode_3to7_bb6_arrayidx2_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_4_VALID_4_5_0_inputs_ready;
 reg SFC_4_VALID_4_5_0_valid_out_NO_SHIFT_REG;
wire SFC_4_VALID_4_5_0_stall_in;
wire SFC_4_VALID_4_5_0_output_regs_ready;
 reg SFC_4_VALID_4_5_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_4_VALID_4_5_0_causedstall;

assign SFC_4_VALID_4_5_0_inputs_ready = 1'b1;
assign SFC_4_VALID_4_5_0_output_regs_ready = 1'b1;
assign SFC_4_VALID_3_4_0_stall_in = 1'b0;
assign SFC_4_VALID_4_5_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_4_VALID_4_5_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_4_VALID_4_5_0_output_regs_ready)
		begin
			SFC_4_VALID_4_5_0_NO_SHIFT_REG <= SFC_4_VALID_3_4_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb6_c0_exi1178_stall_local;
wire [191:0] local_bb6_c0_exi1178;

assign local_bb6_c0_exi1178[7:0] = 8'bx;
assign local_bb6_c0_exi1178[15:8] = local_bb6_ld__NO_SHIFT_REG;
assign local_bb6_c0_exi1178[191:16] = 176'bx;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_valid_out_NO_SHIFT_REG;
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_stall_in_NO_SHIFT_REG;
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG;
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_inputs_ready_NO_SHIFT_REG;
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_valid_out_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_stall_out_reg_8_NO_SHIFT_REG;

acl_data_fifo rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_8_NO_SHIFT_REG),
	.valid_out(rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_valid_out_reg_8_NO_SHIFT_REG),
	.stall_out(rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_stall_out_reg_8_NO_SHIFT_REG),
	.data_in(rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG),
	.data_out(rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_NO_SHIFT_REG)
);

defparam rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_fifo.DEPTH = 1;
defparam rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_fifo.DATA_WIDTH = 1;
defparam rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_fifo.IMPL = "shift_reg";

assign rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to7_bb6_keep_going148_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_NO_SHIFT_REG = rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_reg_8_NO_SHIFT_REG;
assign rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_stall_in_reg_8_NO_SHIFT_REG = 1'b0;
assign rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_valid_out_NO_SHIFT_REG = 1'b1;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_7to8_bb6_arrayidx2_i_0_valid_out_NO_SHIFT_REG;
 logic rnode_7to8_bb6_arrayidx2_i_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_7to8_bb6_arrayidx2_i_0_NO_SHIFT_REG;
 logic rnode_7to8_bb6_arrayidx2_i_0_reg_8_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_7to8_bb6_arrayidx2_i_0_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_arrayidx2_i_0_valid_out_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_arrayidx2_i_0_stall_in_reg_8_NO_SHIFT_REG;
 logic rnode_7to8_bb6_arrayidx2_i_0_stall_out_reg_8_NO_SHIFT_REG;

acl_data_fifo rnode_7to8_bb6_arrayidx2_i_0_reg_8_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_7to8_bb6_arrayidx2_i_0_reg_8_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_7to8_bb6_arrayidx2_i_0_stall_in_reg_8_NO_SHIFT_REG),
	.valid_out(rnode_7to8_bb6_arrayidx2_i_0_valid_out_reg_8_NO_SHIFT_REG),
	.stall_out(rnode_7to8_bb6_arrayidx2_i_0_stall_out_reg_8_NO_SHIFT_REG),
	.data_in(rnode_3to7_bb6_arrayidx2_i_0_NO_SHIFT_REG),
	.data_out(rnode_7to8_bb6_arrayidx2_i_0_reg_8_NO_SHIFT_REG)
);

defparam rnode_7to8_bb6_arrayidx2_i_0_reg_8_fifo.DEPTH = 1;
defparam rnode_7to8_bb6_arrayidx2_i_0_reg_8_fifo.DATA_WIDTH = 64;
defparam rnode_7to8_bb6_arrayidx2_i_0_reg_8_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_7to8_bb6_arrayidx2_i_0_reg_8_fifo.IMPL = "shift_reg";

assign rnode_7to8_bb6_arrayidx2_i_0_reg_8_inputs_ready_NO_SHIFT_REG = 1'b1;
assign rnode_3to7_bb6_arrayidx2_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_7to8_bb6_arrayidx2_i_0_NO_SHIFT_REG = rnode_7to8_bb6_arrayidx2_i_0_reg_8_NO_SHIFT_REG;
assign rnode_7to8_bb6_arrayidx2_i_0_stall_in_reg_8_NO_SHIFT_REG = 1'b0;
assign rnode_7to8_bb6_arrayidx2_i_0_valid_out_NO_SHIFT_REG = 1'b1;

// This section implements a registered operation.
// 
wire SFC_4_VALID_5_6_0_inputs_ready;
 reg SFC_4_VALID_5_6_0_valid_out_NO_SHIFT_REG;
wire SFC_4_VALID_5_6_0_stall_in;
wire SFC_4_VALID_5_6_0_output_regs_ready;
 reg SFC_4_VALID_5_6_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_4_VALID_5_6_0_causedstall;

assign SFC_4_VALID_5_6_0_inputs_ready = 1'b1;
assign SFC_4_VALID_5_6_0_output_regs_ready = 1'b1;
assign SFC_4_VALID_4_5_0_stall_in = 1'b0;
assign SFC_4_VALID_5_6_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_4_VALID_5_6_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_4_VALID_5_6_0_output_regs_ready)
		begin
			SFC_4_VALID_5_6_0_NO_SHIFT_REG <= SFC_4_VALID_4_5_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb6_c0_exi2179_stall_local;
wire [191:0] local_bb6_c0_exi2179;

assign local_bb6_c0_exi2179[63:0] = local_bb6_c0_exi1178[63:0];
assign local_bb6_c0_exi2179[127:64] = rnode_7to8_bb6_arrayidx2_i_0_NO_SHIFT_REG;
assign local_bb6_c0_exi2179[191:128] = local_bb6_c0_exi1178[191:128];

// This section implements a registered operation.
// 
wire SFC_4_VALID_6_7_0_inputs_ready;
 reg SFC_4_VALID_6_7_0_valid_out_NO_SHIFT_REG;
wire SFC_4_VALID_6_7_0_stall_in;
wire SFC_4_VALID_6_7_0_output_regs_ready;
 reg SFC_4_VALID_6_7_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_4_VALID_6_7_0_causedstall;

assign SFC_4_VALID_6_7_0_inputs_ready = 1'b1;
assign SFC_4_VALID_6_7_0_output_regs_ready = 1'b1;
assign SFC_4_VALID_5_6_0_stall_in = 1'b0;
assign SFC_4_VALID_6_7_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_4_VALID_6_7_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_4_VALID_6_7_0_output_regs_ready)
		begin
			SFC_4_VALID_6_7_0_NO_SHIFT_REG <= SFC_4_VALID_5_6_0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb6_c0_exi3180_valid_out;
wire local_bb6_c0_exi3180_stall_in;
wire local_bb6_c0_exi3180_inputs_ready;
wire local_bb6_c0_exi3180_stall_local;
wire [191:0] local_bb6_c0_exi3180;

assign local_bb6_c0_exi3180_inputs_ready = (local_bb6_ld__valid_out_NO_SHIFT_REG & rnode_7to8_bb6_arrayidx2_i_0_valid_out_NO_SHIFT_REG & rnode_7to8_bb6_var__0_valid_out_NO_SHIFT_REG);
assign local_bb6_c0_exi3180[127:0] = local_bb6_c0_exi2179[127:0];
assign local_bb6_c0_exi3180[128] = rnode_7to8_bb6_var__0_NO_SHIFT_REG;
assign local_bb6_c0_exi3180[191:129] = local_bb6_c0_exi2179[191:129];
assign local_bb6_c0_exi3180_valid_out = 1'b1;
assign local_bb6_ld__stall_in = 1'b0;
assign rnode_7to8_bb6_arrayidx2_i_0_stall_in_NO_SHIFT_REG = 1'b0;
assign rnode_7to8_bb6_var__0_stall_in_NO_SHIFT_REG = 1'b0;

// This section implements a registered operation.
// 
wire SFC_4_VALID_7_8_0_inputs_ready;
 reg SFC_4_VALID_7_8_0_valid_out_NO_SHIFT_REG;
wire SFC_4_VALID_7_8_0_stall_in;
wire SFC_4_VALID_7_8_0_output_regs_ready;
 reg SFC_4_VALID_7_8_0_NO_SHIFT_REG /* synthesis  preserve  */;
wire SFC_4_VALID_7_8_0_causedstall;

assign SFC_4_VALID_7_8_0_inputs_ready = 1'b1;
assign SFC_4_VALID_7_8_0_output_regs_ready = 1'b1;
assign SFC_4_VALID_6_7_0_stall_in = 1'b0;
assign SFC_4_VALID_7_8_0_causedstall = (1'b1 && (1'b0 && !(1'b0)));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		SFC_4_VALID_7_8_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (SFC_4_VALID_7_8_0_output_regs_ready)
		begin
			SFC_4_VALID_7_8_0_NO_SHIFT_REG <= SFC_4_VALID_6_7_0_NO_SHIFT_REG;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb6_c0_exit181_c0_exi3180_inputs_ready;
 reg local_bb6_c0_exit181_c0_exi3180_valid_out_0_NO_SHIFT_REG;
wire local_bb6_c0_exit181_c0_exi3180_stall_in_0;
 reg local_bb6_c0_exit181_c0_exi3180_valid_out_1_NO_SHIFT_REG;
wire local_bb6_c0_exit181_c0_exi3180_stall_in_1;
 reg local_bb6_c0_exit181_c0_exi3180_valid_out_2_NO_SHIFT_REG;
wire local_bb6_c0_exit181_c0_exi3180_stall_in_2;
 reg [191:0] local_bb6_c0_exit181_c0_exi3180_NO_SHIFT_REG;
wire [191:0] local_bb6_c0_exit181_c0_exi3180_in;
wire local_bb6_c0_exit181_c0_exi3180_valid;
wire local_bb6_c0_exit181_c0_exi3180_causedstall;

acl_stall_free_sink local_bb6_c0_exit181_c0_exi3180_instance (
	.clock(clock),
	.resetn(resetn),
	.data_in(local_bb6_c0_exi3180),
	.data_out(local_bb6_c0_exit181_c0_exi3180_in),
	.input_accepted(local_bb6_c0_enter176_c0_eni1175_input_accepted),
	.valid_out(local_bb6_c0_exit181_c0_exi3180_valid),
	.stall_in(~(local_bb6_c0_exit181_c0_exi3180_output_regs_ready)),
	.stall_entry(local_bb6_c0_exit181_c0_exi3180_entry_stall),
	.valid_in(local_bb6_c0_exit181_c0_exi3180_valid_in),
	.IIphases(local_bb6_c0_exit181_c0_exi3180_phases),
	.inc_pipelined_thread(local_bb6_c0_enter176_c0_eni1175_inc_pipelined_thread),
	.dec_pipelined_thread(local_bb6_c0_enter176_c0_eni1175_dec_pipelined_thread)
);

defparam local_bb6_c0_exit181_c0_exi3180_instance.DATA_WIDTH = 192;
defparam local_bb6_c0_exit181_c0_exi3180_instance.PIPELINE_DEPTH = 12;
defparam local_bb6_c0_exit181_c0_exi3180_instance.SHARINGII = 1;
defparam local_bb6_c0_exit181_c0_exi3180_instance.SCHEDULEII = 1;
defparam local_bb6_c0_exit181_c0_exi3180_instance.ALWAYS_THROTTLE = 0;

assign local_bb6_c0_exit181_c0_exi3180_inputs_ready = 1'b1;
assign local_bb6_c0_exit181_c0_exi3180_output_regs_ready = ((~(local_bb6_c0_exit181_c0_exi3180_valid_out_0_NO_SHIFT_REG) | ~(local_bb6_c0_exit181_c0_exi3180_stall_in_0)) & (~(local_bb6_c0_exit181_c0_exi3180_valid_out_1_NO_SHIFT_REG) | ~(local_bb6_c0_exit181_c0_exi3180_stall_in_1)) & (~(local_bb6_c0_exit181_c0_exi3180_valid_out_2_NO_SHIFT_REG) | ~(local_bb6_c0_exit181_c0_exi3180_stall_in_2)));
assign local_bb6_c0_exit181_c0_exi3180_valid_in = SFC_4_VALID_7_8_0_NO_SHIFT_REG;
assign local_bb6_c0_exi3180_stall_in = 1'b0;
assign SFC_4_VALID_7_8_0_stall_in = 1'b0;
assign rnode_7to8_bb6_keep_going148_acl_pipeline_1_0_stall_in_NO_SHIFT_REG = 1'b0;
assign local_bb6_c0_exit181_c0_exi3180_causedstall = (1'b1 && (1'b0 && !(~(local_bb6_c0_exit181_c0_exi3180_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb6_c0_exit181_c0_exi3180_NO_SHIFT_REG <= 'x;
		local_bb6_c0_exit181_c0_exi3180_valid_out_0_NO_SHIFT_REG <= 1'b0;
		local_bb6_c0_exit181_c0_exi3180_valid_out_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb6_c0_exit181_c0_exi3180_output_regs_ready)
		begin
			local_bb6_c0_exit181_c0_exi3180_NO_SHIFT_REG <= local_bb6_c0_exit181_c0_exi3180_in;
			local_bb6_c0_exit181_c0_exi3180_valid_out_0_NO_SHIFT_REG <= local_bb6_c0_exit181_c0_exi3180_valid;
			local_bb6_c0_exit181_c0_exi3180_valid_out_2_NO_SHIFT_REG <= local_bb6_c0_exit181_c0_exi3180_valid;
		end
		else
		begin
			if (~(local_bb6_c0_exit181_c0_exi3180_stall_in_0))
			begin
				local_bb6_c0_exit181_c0_exi3180_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(local_bb6_c0_exit181_c0_exi3180_stall_in_2))
			begin
				local_bb6_c0_exit181_c0_exi3180_valid_out_2_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(*)
begin
	local_bb6_c0_exit181_c0_exi3180_valid_out_1_NO_SHIFT_REG = local_bb6_c0_exit181_c0_exi3180_valid_out_0_NO_SHIFT_REG;
end


// This section implements an unregistered operation.
// 
wire local_bb6_c0_exe1182_stall_local;
wire [7:0] local_bb6_c0_exe1182;

assign local_bb6_c0_exe1182[7:0] = local_bb6_c0_exit181_c0_exi3180_NO_SHIFT_REG[15:8];

// This section implements an unregistered operation.
// 
wire local_bb6_c0_exe2183_stall_local;
wire [63:0] local_bb6_c0_exe2183;

assign local_bb6_c0_exe2183[63:0] = local_bb6_c0_exit181_c0_exi3180_NO_SHIFT_REG[127:64];

// This section implements an unregistered operation.
// 
wire local_bb6_c0_exe3184_valid_out;
wire local_bb6_c0_exe3184_stall_in;
wire local_bb6_c0_exe3184_inputs_ready;
wire local_bb6_c0_exe3184_stall_local;
wire local_bb6_c0_exe3184;

assign local_bb6_c0_exe3184_inputs_ready = local_bb6_c0_exit181_c0_exi3180_valid_out_2_NO_SHIFT_REG;
assign local_bb6_c0_exe3184 = local_bb6_c0_exit181_c0_exi3180_NO_SHIFT_REG[128];
assign local_bb6_c0_exe3184_valid_out = local_bb6_c0_exe3184_inputs_ready;
assign local_bb6_c0_exe3184_stall_local = local_bb6_c0_exe3184_stall_in;
assign local_bb6_c0_exit181_c0_exi3180_stall_in_2 = (|local_bb6_c0_exe3184_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb6_c0_exe1182_valid_out_0;
wire local_bb6_c0_exe1182_stall_in_0;
wire local_bb6__acl_ffwd_dest_i1_4_u16_valid_out;
wire local_bb6__acl_ffwd_dest_i1_4_u16_stall_in;
wire local_bb6_c0_exe2183_valid_out;
wire local_bb6_c0_exe2183_stall_in;
wire local_bb6__acl_ffwd_dest_i1_4_u16_inputs_ready;
wire local_bb6__acl_ffwd_dest_i1_4_u16_stall_local;
wire local_bb6__acl_ffwd_dest_i1_4_u16;

assign local_bb6__acl_ffwd_dest_i1_4_u16_inputs_ready = (local_bb6_c0_exit181_c0_exi3180_valid_out_0_NO_SHIFT_REG & local_bb6_c0_exit181_c0_exi3180_valid_out_1_NO_SHIFT_REG);
assign local_bb6__acl_ffwd_dest_i1_4_u16 = ffwd_4_0;
assign local_bb6__acl_ffwd_dest_i1_4_u16_stall_local = (local_bb6_c0_exe1182_stall_in_0 | local_bb6__acl_ffwd_dest_i1_4_u16_stall_in | local_bb6_c0_exe2183_stall_in);
assign local_bb6_c0_exe1182_valid_out_0 = local_bb6__acl_ffwd_dest_i1_4_u16_inputs_ready;
assign local_bb6__acl_ffwd_dest_i1_4_u16_valid_out = local_bb6__acl_ffwd_dest_i1_4_u16_inputs_ready;
assign local_bb6_c0_exe2183_valid_out = local_bb6__acl_ffwd_dest_i1_4_u16_inputs_ready;
assign local_bb6_c0_exit181_c0_exi3180_stall_in_0 = (local_bb6__acl_ffwd_dest_i1_4_u16_stall_local | ~(local_bb6__acl_ffwd_dest_i1_4_u16_inputs_ready));
assign local_bb6_c0_exit181_c0_exi3180_stall_in_1 = (local_bb6__acl_ffwd_dest_i1_4_u16_stall_local | ~(local_bb6__acl_ffwd_dest_i1_4_u16_inputs_ready));

// Register node:
//  * latency = 4
//  * capacity = 4
 logic rnode_13to17_bb6_c0_exe3184_0_valid_out_NO_SHIFT_REG;
 logic rnode_13to17_bb6_c0_exe3184_0_stall_in_NO_SHIFT_REG;
 logic rnode_13to17_bb6_c0_exe3184_0_NO_SHIFT_REG;
 logic rnode_13to17_bb6_c0_exe3184_0_reg_17_inputs_ready_NO_SHIFT_REG;
 logic rnode_13to17_bb6_c0_exe3184_0_reg_17_NO_SHIFT_REG;
 logic rnode_13to17_bb6_c0_exe3184_0_valid_out_reg_17_NO_SHIFT_REG;
 logic rnode_13to17_bb6_c0_exe3184_0_stall_in_reg_17_NO_SHIFT_REG;
 logic rnode_13to17_bb6_c0_exe3184_0_stall_out_reg_17_NO_SHIFT_REG;

acl_data_fifo rnode_13to17_bb6_c0_exe3184_0_reg_17_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_13to17_bb6_c0_exe3184_0_reg_17_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_13to17_bb6_c0_exe3184_0_stall_in_reg_17_NO_SHIFT_REG),
	.valid_out(rnode_13to17_bb6_c0_exe3184_0_valid_out_reg_17_NO_SHIFT_REG),
	.stall_out(rnode_13to17_bb6_c0_exe3184_0_stall_out_reg_17_NO_SHIFT_REG),
	.data_in(local_bb6_c0_exe3184),
	.data_out(rnode_13to17_bb6_c0_exe3184_0_reg_17_NO_SHIFT_REG)
);

defparam rnode_13to17_bb6_c0_exe3184_0_reg_17_fifo.DEPTH = 5;
defparam rnode_13to17_bb6_c0_exe3184_0_reg_17_fifo.DATA_WIDTH = 1;
defparam rnode_13to17_bb6_c0_exe3184_0_reg_17_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_13to17_bb6_c0_exe3184_0_reg_17_fifo.IMPL = "ll_reg";

assign rnode_13to17_bb6_c0_exe3184_0_reg_17_inputs_ready_NO_SHIFT_REG = local_bb6_c0_exe3184_valid_out;
assign local_bb6_c0_exe3184_stall_in = rnode_13to17_bb6_c0_exe3184_0_stall_out_reg_17_NO_SHIFT_REG;
assign rnode_13to17_bb6_c0_exe3184_0_NO_SHIFT_REG = rnode_13to17_bb6_c0_exe3184_0_reg_17_NO_SHIFT_REG;
assign rnode_13to17_bb6_c0_exe3184_0_stall_in_reg_17_NO_SHIFT_REG = rnode_13to17_bb6_c0_exe3184_0_stall_in_NO_SHIFT_REG;
assign rnode_13to17_bb6_c0_exe3184_0_valid_out_NO_SHIFT_REG = rnode_13to17_bb6_c0_exe3184_0_valid_out_reg_17_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire local_bb6_st_c0_exe1182_inputs_ready;
 reg local_bb6_st_c0_exe1182_valid_out_NO_SHIFT_REG;
wire local_bb6_st_c0_exe1182_stall_in;
wire local_bb6_st_c0_exe1182_output_regs_ready;
wire local_bb6_st_c0_exe1182_fu_stall_out;
wire local_bb6_st_c0_exe1182_fu_valid_out;
wire local_bb6_st_c0_exe1182_causedstall;

lsu_top lsu_local_bb6_st_c0_exe1182 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr(),
	.stream_size(),
	.stream_reset(),
	.o_stall(local_bb6_st_c0_exe1182_fu_stall_out),
	.i_valid(local_bb6_st_c0_exe1182_inputs_ready),
	.i_address(local_bb6_c0_exe2183),
	.i_writedata(local_bb6_c0_exe1182),
	.i_cmpdata(),
	.i_predicate(local_bb6__acl_ffwd_dest_i1_4_u16),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb6_st_c0_exe1182_output_regs_ready)),
	.o_valid(local_bb6_st_c0_exe1182_fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb6_st_c0_exe1182_active),
	.avm_address(avm_local_bb6_st_c0_exe1182_address),
	.avm_read(avm_local_bb6_st_c0_exe1182_read),
	.avm_enable(avm_local_bb6_st_c0_exe1182_enable),
	.avm_readdata(avm_local_bb6_st_c0_exe1182_readdata),
	.avm_write(avm_local_bb6_st_c0_exe1182_write),
	.avm_writeack(avm_local_bb6_st_c0_exe1182_writeack),
	.avm_burstcount(avm_local_bb6_st_c0_exe1182_burstcount),
	.avm_writedata(avm_local_bb6_st_c0_exe1182_writedata),
	.avm_byteenable(avm_local_bb6_st_c0_exe1182_byteenable),
	.avm_waitrequest(avm_local_bb6_st_c0_exe1182_waitrequest),
	.avm_readdatavalid(avm_local_bb6_st_c0_exe1182_readdatavalid),
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

defparam lsu_local_bb6_st_c0_exe1182.AWIDTH = 32;
defparam lsu_local_bb6_st_c0_exe1182.WIDTH_BYTES = 1;
defparam lsu_local_bb6_st_c0_exe1182.MWIDTH_BYTES = 64;
defparam lsu_local_bb6_st_c0_exe1182.WRITEDATAWIDTH_BYTES = 64;
defparam lsu_local_bb6_st_c0_exe1182.ALIGNMENT_BYTES = 1;
defparam lsu_local_bb6_st_c0_exe1182.READ = 0;
defparam lsu_local_bb6_st_c0_exe1182.ATOMIC = 0;
defparam lsu_local_bb6_st_c0_exe1182.WIDTH = 8;
defparam lsu_local_bb6_st_c0_exe1182.MWIDTH = 512;
defparam lsu_local_bb6_st_c0_exe1182.ATOMIC_WIDTH = 3;
defparam lsu_local_bb6_st_c0_exe1182.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb6_st_c0_exe1182.KERNEL_SIDE_MEM_LATENCY = 4;
defparam lsu_local_bb6_st_c0_exe1182.MEMORY_SIDE_MEM_LATENCY = 10;
defparam lsu_local_bb6_st_c0_exe1182.USE_WRITE_ACK = 0;
defparam lsu_local_bb6_st_c0_exe1182.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb6_st_c0_exe1182.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb6_st_c0_exe1182.NUMBER_BANKS = 1;
defparam lsu_local_bb6_st_c0_exe1182.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb6_st_c0_exe1182.INTENDED_DEVICE_FAMILY = "Stratix V";
defparam lsu_local_bb6_st_c0_exe1182.USEINPUTFIFO = 0;
defparam lsu_local_bb6_st_c0_exe1182.USECACHING = 0;
defparam lsu_local_bb6_st_c0_exe1182.USEOUTPUTFIFO = 1;
defparam lsu_local_bb6_st_c0_exe1182.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb6_st_c0_exe1182.ADDRSPACE = 1;
defparam lsu_local_bb6_st_c0_exe1182.STYLE = "BURST-COALESCED";
defparam lsu_local_bb6_st_c0_exe1182.USE_BYTE_EN = 0;

assign local_bb6_st_c0_exe1182_inputs_ready = (local_bb6_c0_exe1182_valid_out_0 & local_bb6_c0_exe2183_valid_out & local_bb6__acl_ffwd_dest_i1_4_u16_valid_out);
assign local_bb6_st_c0_exe1182_output_regs_ready = (&(~(local_bb6_st_c0_exe1182_valid_out_NO_SHIFT_REG) | ~(local_bb6_st_c0_exe1182_stall_in)));
assign local_bb6_c0_exe1182_stall_in_0 = (local_bb6_st_c0_exe1182_fu_stall_out | ~(local_bb6_st_c0_exe1182_inputs_ready));
assign local_bb6_c0_exe2183_stall_in = (local_bb6_st_c0_exe1182_fu_stall_out | ~(local_bb6_st_c0_exe1182_inputs_ready));
assign local_bb6__acl_ffwd_dest_i1_4_u16_stall_in = (local_bb6_st_c0_exe1182_fu_stall_out | ~(local_bb6_st_c0_exe1182_inputs_ready));
assign local_bb6_st_c0_exe1182_causedstall = (local_bb6_st_c0_exe1182_inputs_ready && (local_bb6_st_c0_exe1182_fu_stall_out && !(~(local_bb6_st_c0_exe1182_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb6_st_c0_exe1182_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb6_st_c0_exe1182_output_regs_ready)
		begin
			local_bb6_st_c0_exe1182_valid_out_NO_SHIFT_REG <= local_bb6_st_c0_exe1182_fu_valid_out;
		end
		else
		begin
			if (~(local_bb6_st_c0_exe1182_stall_in))
			begin
				local_bb6_st_c0_exe1182_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_17to17_bb6_st_c0_exe1182_valid_out;
wire rstag_17to17_bb6_st_c0_exe1182_stall_in;
wire rstag_17to17_bb6_st_c0_exe1182_inputs_ready;
wire rstag_17to17_bb6_st_c0_exe1182_stall_local;
 reg rstag_17to17_bb6_st_c0_exe1182_staging_valid_NO_SHIFT_REG;
wire rstag_17to17_bb6_st_c0_exe1182_combined_valid;

assign rstag_17to17_bb6_st_c0_exe1182_inputs_ready = local_bb6_st_c0_exe1182_valid_out_NO_SHIFT_REG;
assign rstag_17to17_bb6_st_c0_exe1182_combined_valid = (rstag_17to17_bb6_st_c0_exe1182_staging_valid_NO_SHIFT_REG | rstag_17to17_bb6_st_c0_exe1182_inputs_ready);
assign rstag_17to17_bb6_st_c0_exe1182_valid_out = rstag_17to17_bb6_st_c0_exe1182_combined_valid;
assign rstag_17to17_bb6_st_c0_exe1182_stall_local = rstag_17to17_bb6_st_c0_exe1182_stall_in;
assign local_bb6_st_c0_exe1182_stall_in = (|rstag_17to17_bb6_st_c0_exe1182_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_17to17_bb6_st_c0_exe1182_staging_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (rstag_17to17_bb6_st_c0_exe1182_stall_local)
		begin
			if (~(rstag_17to17_bb6_st_c0_exe1182_staging_valid_NO_SHIFT_REG))
			begin
				rstag_17to17_bb6_st_c0_exe1182_staging_valid_NO_SHIFT_REG <= rstag_17to17_bb6_st_c0_exe1182_inputs_ready;
			end
		end
		else
		begin
			rstag_17to17_bb6_st_c0_exe1182_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
	end
end


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_0_NO_SHIFT_REG;
 reg branch_compare_result_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;

assign branch_var__inputs_ready = (rnode_13to17_bb6_c0_exe3184_0_valid_out_NO_SHIFT_REG & rstag_17to17_bb6_st_c0_exe1182_valid_out);
assign branch_var__output_regs_ready = (~(branch_node_valid_out_0_NO_SHIFT_REG) | (((branch_compare_result_NO_SHIFT_REG != 1'b1) & ~(stall_in_1)) | (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & ~(stall_in_0))));
assign rnode_13to17_bb6_c0_exe3184_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rstag_17to17_bb6_st_c0_exe1182_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out_0 = (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG);
assign valid_out_1 = ((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG);
assign combined_branch_stall_in_signal = ((((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_1) | ((~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_0));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		branch_compare_result_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_0_NO_SHIFT_REG <= branch_var__inputs_ready;
			branch_compare_result_NO_SHIFT_REG <= rnode_13to17_bb6_c0_exe3184_0_NO_SHIFT_REG;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_7
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_wii_conv,
		input 		input_wii_cmp11,
		input [63:0] 		input_wii_conv_i19_i,
		input 		input_wii_cmp_i20_i1,
		input 		input_wii_var_,
		input 		input_wii_var__u17,
		input 		input_wii_var__u18,
		input 		valid_in,
		output 		stall_out,
		output 		valid_out_0,
		input 		stall_in_0,
		output 		valid_out_1,
		input 		stall_in_1,
		input [31:0] 		workgroup_size,
		input 		start,
		input [63:0] 		ffwd_0_0,
		input [31:0] 		ffwd_3_0,
		input 		ffwd_4_0,
		output [63:0] 		ffwd_7_0,
		output [31:0] 		ffwd_6_0
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((&valid_in) & ~((|stall_out)));
assign _exit = ((valid_out_0 & valid_out_1) & ~((stall_in_0 | stall_in_1)));
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
wire merge_node_stall_in_0;
 reg merge_node_valid_out_0_NO_SHIFT_REG;
wire merge_node_stall_in_1;
 reg merge_node_valid_out_1_NO_SHIFT_REG;
wire merge_node_stall_in_2;
 reg merge_node_valid_out_2_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_staging_reg_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = ((merge_node_stall_in_0 & merge_node_valid_out_0_NO_SHIFT_REG) | (merge_node_stall_in_1 & merge_node_valid_out_1_NO_SHIFT_REG) | (merge_node_stall_in_2 & merge_node_valid_out_2_NO_SHIFT_REG));
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
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
		merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_0_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_1_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
			merge_node_valid_out_2_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in_0))
			begin
				merge_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_1))
			begin
				merge_node_valid_out_1_NO_SHIFT_REG <= 1'b0;
			end
			if (~(merge_node_stall_in_2))
			begin
				merge_node_valid_out_2_NO_SHIFT_REG <= 1'b0;
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
wire local_bb7_j_013128_acl_ffwd_dest_i64_0_stall_local;
wire [63:0] local_bb7_j_013128_acl_ffwd_dest_i64_0;

assign local_bb7_j_013128_acl_ffwd_dest_i64_0 = ffwd_0_0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_fifo.DATA_WIDTH = 0;
defparam rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_reg_2_inputs_ready_NO_SHIFT_REG = merge_node_valid_out_1_NO_SHIFT_REG;
assign merge_node_stall_in_1 = rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_valid_out_reg_2_NO_SHIFT_REG;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_in_NO_SHIFT_REG;
 logic rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_valid_out_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_in_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_out_reg_2_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_in_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_valid_out_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(),
	.data_out()
);

defparam rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_fifo.DATA_WIDTH = 0;
defparam rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_reg_2_inputs_ready_NO_SHIFT_REG = merge_node_valid_out_2_NO_SHIFT_REG;
assign merge_node_stall_in_2 = rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_in_reg_2_NO_SHIFT_REG = rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_in_NO_SHIFT_REG;
assign rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_valid_out_NO_SHIFT_REG = rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_valid_out_reg_2_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb7_inc14_valid_out;
wire local_bb7_inc14_stall_in;
wire local_bb7_inc14_inputs_ready;
wire local_bb7_inc14_stall_local;
wire [63:0] local_bb7_inc14;

assign local_bb7_inc14_inputs_ready = merge_node_valid_out_0_NO_SHIFT_REG;
assign local_bb7_inc14 = (local_bb7_j_013128_acl_ffwd_dest_i64_0 + 64'h1);
assign local_bb7_inc14_valid_out = local_bb7_inc14_inputs_ready;
assign local_bb7_inc14_stall_local = local_bb7_inc14_stall_in;
assign merge_node_stall_in_0 = (|local_bb7_inc14_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_stall_local;
wire [31:0] local_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3;

assign local_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3 = ffwd_3_0;

// This section implements an unregistered operation.
// 
wire local_bb7__acl_ffwd_dest_i1_4_stall_local;
wire local_bb7__acl_ffwd_dest_i1_4;

assign local_bb7__acl_ffwd_dest_i1_4 = ffwd_4_0;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_1to2_bb7_inc14_0_valid_out_0_NO_SHIFT_REG;
 logic rnode_1to2_bb7_inc14_0_stall_in_0_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb7_inc14_0_NO_SHIFT_REG;
 logic rnode_1to2_bb7_inc14_0_valid_out_1_NO_SHIFT_REG;
 logic rnode_1to2_bb7_inc14_0_stall_in_1_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb7_inc14_1_NO_SHIFT_REG;
 logic rnode_1to2_bb7_inc14_0_reg_2_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to2_bb7_inc14_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb7_inc14_0_valid_out_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb7_inc14_0_stall_in_0_reg_2_NO_SHIFT_REG;
 logic rnode_1to2_bb7_inc14_0_stall_out_reg_2_NO_SHIFT_REG;
 reg rnode_1to2_bb7_inc14_0_consumed_0_NO_SHIFT_REG;
 reg rnode_1to2_bb7_inc14_0_consumed_1_NO_SHIFT_REG;

acl_data_fifo rnode_1to2_bb7_inc14_0_reg_2_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to2_bb7_inc14_0_reg_2_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to2_bb7_inc14_0_stall_in_0_reg_2_NO_SHIFT_REG),
	.valid_out(rnode_1to2_bb7_inc14_0_valid_out_0_reg_2_NO_SHIFT_REG),
	.stall_out(rnode_1to2_bb7_inc14_0_stall_out_reg_2_NO_SHIFT_REG),
	.data_in(local_bb7_inc14),
	.data_out(rnode_1to2_bb7_inc14_0_reg_2_NO_SHIFT_REG)
);

defparam rnode_1to2_bb7_inc14_0_reg_2_fifo.DEPTH = 1;
defparam rnode_1to2_bb7_inc14_0_reg_2_fifo.DATA_WIDTH = 64;
defparam rnode_1to2_bb7_inc14_0_reg_2_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_1to2_bb7_inc14_0_reg_2_fifo.IMPL = "ll_reg";

assign rnode_1to2_bb7_inc14_0_reg_2_inputs_ready_NO_SHIFT_REG = local_bb7_inc14_valid_out;
assign local_bb7_inc14_stall_in = rnode_1to2_bb7_inc14_0_stall_out_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb7_inc14_0_stall_in_0_reg_2_NO_SHIFT_REG = ((rnode_1to2_bb7_inc14_0_stall_in_0_NO_SHIFT_REG & ~(rnode_1to2_bb7_inc14_0_consumed_0_NO_SHIFT_REG)) | (rnode_1to2_bb7_inc14_0_stall_in_1_NO_SHIFT_REG & ~(rnode_1to2_bb7_inc14_0_consumed_1_NO_SHIFT_REG)));
assign rnode_1to2_bb7_inc14_0_valid_out_0_NO_SHIFT_REG = (rnode_1to2_bb7_inc14_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb7_inc14_0_consumed_0_NO_SHIFT_REG));
assign rnode_1to2_bb7_inc14_0_valid_out_1_NO_SHIFT_REG = (rnode_1to2_bb7_inc14_0_valid_out_0_reg_2_NO_SHIFT_REG & ~(rnode_1to2_bb7_inc14_0_consumed_1_NO_SHIFT_REG));
assign rnode_1to2_bb7_inc14_0_NO_SHIFT_REG = rnode_1to2_bb7_inc14_0_reg_2_NO_SHIFT_REG;
assign rnode_1to2_bb7_inc14_1_NO_SHIFT_REG = rnode_1to2_bb7_inc14_0_reg_2_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rnode_1to2_bb7_inc14_0_consumed_0_NO_SHIFT_REG <= 1'b0;
		rnode_1to2_bb7_inc14_0_consumed_1_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		rnode_1to2_bb7_inc14_0_consumed_0_NO_SHIFT_REG <= (rnode_1to2_bb7_inc14_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb7_inc14_0_consumed_0_NO_SHIFT_REG | ~(rnode_1to2_bb7_inc14_0_stall_in_0_NO_SHIFT_REG)) & rnode_1to2_bb7_inc14_0_stall_in_0_reg_2_NO_SHIFT_REG);
		rnode_1to2_bb7_inc14_0_consumed_1_NO_SHIFT_REG <= (rnode_1to2_bb7_inc14_0_valid_out_0_reg_2_NO_SHIFT_REG & (rnode_1to2_bb7_inc14_0_consumed_1_NO_SHIFT_REG | ~(rnode_1to2_bb7_inc14_0_stall_in_1_NO_SHIFT_REG)) & rnode_1to2_bb7_inc14_0_stall_in_0_reg_2_NO_SHIFT_REG);
	end
end


// This section implements an unregistered operation.
// 
wire local_bb7_do_directly_for_inc13_loopexit_select_stall_local;
wire [31:0] local_bb7_do_directly_for_inc13_loopexit_select;

assign local_bb7_do_directly_for_inc13_loopexit_select = (local_bb7__acl_ffwd_dest_i1_4 ? local_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3 : 32'h0);

// This section implements an unregistered operation.
// 
wire local_bb7_cmp_valid_out;
wire local_bb7_cmp_stall_in;
wire local_bb7_cmp_inputs_ready;
wire local_bb7_cmp_stall_local;
wire local_bb7_cmp;

assign local_bb7_cmp_inputs_ready = rnode_1to2_bb7_inc14_0_valid_out_0_NO_SHIFT_REG;
assign local_bb7_cmp = (rnode_1to2_bb7_inc14_0_NO_SHIFT_REG < input_wii_conv);
assign local_bb7_cmp_valid_out = local_bb7_cmp_inputs_ready;
assign local_bb7_cmp_stall_local = local_bb7_cmp_stall_in;
assign rnode_1to2_bb7_inc14_0_stall_in_0_NO_SHIFT_REG = (|local_bb7_cmp_stall_local);

// This section implements an unregistered operation.
// 
wire local_bb7__inc14_valid_out;
wire local_bb7__inc14_stall_in;
wire local_bb7__inc14_inputs_ready;
wire local_bb7__inc14_stall_local;
wire local_bb7__inc14;
 reg [63:0] ffwd_7_0_reg_NO_SHIFT_REG;

assign local_bb7__inc14_inputs_ready = rnode_1to2_bb7_inc14_0_valid_out_1_NO_SHIFT_REG;
assign ffwd_7_0 = ffwd_7_0_reg_NO_SHIFT_REG;
assign local_bb7__inc14_valid_out = local_bb7__inc14_inputs_ready;
assign local_bb7__inc14_stall_local = local_bb7__inc14_stall_in;
assign rnode_1to2_bb7_inc14_0_stall_in_1_NO_SHIFT_REG = (|local_bb7__inc14_stall_local);

always @(posedge clock)
begin
	if ((1'b1 & local_bb7__inc14_inputs_ready))
	begin
		ffwd_7_0_reg_NO_SHIFT_REG <= rnode_1to2_bb7_inc14_1_NO_SHIFT_REG;
	end
end


// This section implements an unregistered operation.
// 
wire local_bb7__do_directly_for_inc13_loopexit_select_valid_out;
wire local_bb7__do_directly_for_inc13_loopexit_select_stall_in;
wire local_bb7__do_directly_for_inc13_loopexit_select_inputs_ready;
wire local_bb7__do_directly_for_inc13_loopexit_select_stall_local;
wire local_bb7__do_directly_for_inc13_loopexit_select;
 reg [31:0] ffwd_6_0_reg_NO_SHIFT_REG;

assign local_bb7__do_directly_for_inc13_loopexit_select_inputs_ready = (rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_valid_out_NO_SHIFT_REG & rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_valid_out_NO_SHIFT_REG);
assign ffwd_6_0 = ffwd_6_0_reg_NO_SHIFT_REG;
assign local_bb7__do_directly_for_inc13_loopexit_select_valid_out = local_bb7__do_directly_for_inc13_loopexit_select_inputs_ready;
assign local_bb7__do_directly_for_inc13_loopexit_select_stall_local = local_bb7__do_directly_for_inc13_loopexit_select_stall_in;
assign rnode_1to2_bb7_min_fit_fun_addr_012_mux132_acl_ffwd_dest_i32_3_0_stall_in_NO_SHIFT_REG = (local_bb7__do_directly_for_inc13_loopexit_select_stall_local | ~(local_bb7__do_directly_for_inc13_loopexit_select_inputs_ready));
assign rnode_1to2_bb7__acl_ffwd_dest_i1_4_0_stall_in_NO_SHIFT_REG = (local_bb7__do_directly_for_inc13_loopexit_select_stall_local | ~(local_bb7__do_directly_for_inc13_loopexit_select_inputs_ready));

always @(posedge clock)
begin
	if ((1'b1 & local_bb7__do_directly_for_inc13_loopexit_select_inputs_ready))
	begin
		ffwd_6_0_reg_NO_SHIFT_REG <= local_bb7_do_directly_for_inc13_loopexit_select;
	end
end


// Register node:
//  * latency = 1
//  * capacity = 1
 logic rnode_2to3_bb7_cmp_0_valid_out_NO_SHIFT_REG;
 logic rnode_2to3_bb7_cmp_0_stall_in_NO_SHIFT_REG;
 logic rnode_2to3_bb7_cmp_0_NO_SHIFT_REG;
 logic rnode_2to3_bb7_cmp_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic rnode_2to3_bb7_cmp_0_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb7_cmp_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb7_cmp_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_2to3_bb7_cmp_0_stall_out_reg_3_NO_SHIFT_REG;
wire [1:0] rci_rcnode_2to3_rc0_bb7__inc14_0_reg_2;

acl_data_fifo rnode_2to3_bb7_cmp_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_2to3_bb7_cmp_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_2to3_bb7_cmp_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_2to3_bb7_cmp_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_2to3_bb7_cmp_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in(local_bb7_cmp),
	.data_out(rnode_2to3_bb7_cmp_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_2to3_bb7_cmp_0_reg_3_fifo.DEPTH = 1;
defparam rnode_2to3_bb7_cmp_0_reg_3_fifo.DATA_WIDTH = 1;
defparam rnode_2to3_bb7_cmp_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rnode_2to3_bb7_cmp_0_reg_3_fifo.IMPL = "ll_reg";

assign rnode_2to3_bb7_cmp_0_reg_3_inputs_ready_NO_SHIFT_REG = local_bb7_cmp_valid_out;
assign local_bb7_cmp_stall_in = rnode_2to3_bb7_cmp_0_stall_out_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb7_cmp_0_NO_SHIFT_REG = rnode_2to3_bb7_cmp_0_reg_3_NO_SHIFT_REG;
assign rnode_2to3_bb7_cmp_0_stall_in_reg_3_NO_SHIFT_REG = rnode_2to3_bb7_cmp_0_stall_in_NO_SHIFT_REG;
assign rnode_2to3_bb7_cmp_0_valid_out_NO_SHIFT_REG = rnode_2to3_bb7_cmp_0_valid_out_reg_3_NO_SHIFT_REG;
assign rci_rcnode_2to3_rc0_bb7__inc14_0_reg_2[0] = local_bb7__inc14;
assign rci_rcnode_2to3_rc0_bb7__inc14_0_reg_2[1] = local_bb7__do_directly_for_inc13_loopexit_select;

// Register node:
//  * latency = 1
//  * capacity = 1
 logic rcnode_2to3_rc0_bb7__inc14_0_valid_out_NO_SHIFT_REG;
 logic rcnode_2to3_rc0_bb7__inc14_0_stall_in_NO_SHIFT_REG;
 logic [1:0] rcnode_2to3_rc0_bb7__inc14_0_NO_SHIFT_REG;
 logic rcnode_2to3_rc0_bb7__inc14_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic [1:0] rcnode_2to3_rc0_bb7__inc14_0_reg_3_NO_SHIFT_REG;
 logic rcnode_2to3_rc0_bb7__inc14_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rcnode_2to3_rc0_bb7__inc14_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rcnode_2to3_rc0_bb7__inc14_0_stall_out_0_reg_3_IP_NO_SHIFT_REG;
 logic rcnode_2to3_rc0_bb7__inc14_0_stall_out_0_reg_3_NO_SHIFT_REG;

acl_data_fifo rcnode_2to3_rc0_bb7__inc14_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rcnode_2to3_rc0_bb7__inc14_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rcnode_2to3_rc0_bb7__inc14_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rcnode_2to3_rc0_bb7__inc14_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rcnode_2to3_rc0_bb7__inc14_0_stall_out_0_reg_3_IP_NO_SHIFT_REG),
	.data_in(rci_rcnode_2to3_rc0_bb7__inc14_0_reg_2),
	.data_out(rcnode_2to3_rc0_bb7__inc14_0_reg_3_NO_SHIFT_REG)
);

defparam rcnode_2to3_rc0_bb7__inc14_0_reg_3_fifo.DEPTH = 1;
defparam rcnode_2to3_rc0_bb7__inc14_0_reg_3_fifo.DATA_WIDTH = 2;
defparam rcnode_2to3_rc0_bb7__inc14_0_reg_3_fifo.ALLOW_FULL_WRITE = 1;
defparam rcnode_2to3_rc0_bb7__inc14_0_reg_3_fifo.IMPL = "ll_reg";

assign rcnode_2to3_rc0_bb7__inc14_0_reg_3_inputs_ready_NO_SHIFT_REG = (local_bb7__inc14_valid_out & local_bb7__do_directly_for_inc13_loopexit_select_valid_out);
assign rcnode_2to3_rc0_bb7__inc14_0_stall_out_0_reg_3_NO_SHIFT_REG = (~(rcnode_2to3_rc0_bb7__inc14_0_reg_3_inputs_ready_NO_SHIFT_REG) | rcnode_2to3_rc0_bb7__inc14_0_stall_out_0_reg_3_IP_NO_SHIFT_REG);
assign local_bb7__inc14_stall_in = rcnode_2to3_rc0_bb7__inc14_0_stall_out_0_reg_3_NO_SHIFT_REG;
assign local_bb7__do_directly_for_inc13_loopexit_select_stall_in = rcnode_2to3_rc0_bb7__inc14_0_stall_out_0_reg_3_NO_SHIFT_REG;
assign rcnode_2to3_rc0_bb7__inc14_0_NO_SHIFT_REG = rcnode_2to3_rc0_bb7__inc14_0_reg_3_NO_SHIFT_REG;
assign rcnode_2to3_rc0_bb7__inc14_0_stall_in_reg_3_NO_SHIFT_REG = rcnode_2to3_rc0_bb7__inc14_0_stall_in_NO_SHIFT_REG;
assign rcnode_2to3_rc0_bb7__inc14_0_valid_out_NO_SHIFT_REG = rcnode_2to3_rc0_bb7__inc14_0_valid_out_reg_3_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb7_var__valid_out;
wire local_bb7_var__stall_in;
wire local_bb7_var__inputs_ready;
wire local_bb7_var__stall_local;
wire local_bb7_var_;

assign local_bb7_var__inputs_ready = rnode_2to3_bb7_cmp_0_valid_out_NO_SHIFT_REG;
assign local_bb7_var_ = (rnode_2to3_bb7_cmp_0_NO_SHIFT_REG & input_wii_var__u18);
assign local_bb7_var__valid_out = local_bb7_var__inputs_ready;
assign local_bb7_var__stall_local = local_bb7_var__stall_in;
assign rnode_2to3_bb7_cmp_0_stall_in_NO_SHIFT_REG = (|local_bb7_var__stall_local);

// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
 reg branch_node_valid_out_0_NO_SHIFT_REG;
 reg branch_compare_result_NO_SHIFT_REG;
wire branch_var__output_regs_ready;
wire combined_branch_stall_in_signal;

assign branch_var__inputs_ready = (local_bb7_var__valid_out & rcnode_2to3_rc0_bb7__inc14_0_valid_out_NO_SHIFT_REG);
assign branch_var__output_regs_ready = (~(branch_node_valid_out_0_NO_SHIFT_REG) | (((branch_compare_result_NO_SHIFT_REG != 1'b1) & ~(stall_in_1)) | (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & ~(stall_in_0))));
assign local_bb7_var__stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign rcnode_2to3_rc0_bb7__inc14_0_stall_in_NO_SHIFT_REG = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out_0 = (~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG);
assign valid_out_1 = ((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG);
assign combined_branch_stall_in_signal = ((((branch_compare_result_NO_SHIFT_REG != 1'b1) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_1) | ((~((branch_compare_result_NO_SHIFT_REG != 1'b1)) & branch_node_valid_out_0_NO_SHIFT_REG) & stall_in_0));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
		branch_compare_result_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (branch_var__output_regs_ready)
		begin
			branch_node_valid_out_0_NO_SHIFT_REG <= branch_var__inputs_ready;
			branch_compare_result_NO_SHIFT_REG <= local_bb7_var_;
		end
		else
		begin
			if (~(combined_branch_stall_in_signal))
			begin
				branch_node_valid_out_0_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_basic_block_8
	(
		input 		clock,
		input 		resetn,
		input 		valid_in,
		output 		stall_out,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		input 		start
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
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
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


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
wire branch_var__output_regs_ready;

assign branch_var__inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign branch_var__output_regs_ready = ~(stall_in);
assign merge_node_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out = branch_var__inputs_ready;

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_function
	(
		input 		clock,
		input 		resetn,
		output 		stall_out,
		input 		valid_in,
		output 		valid_out,
		input 		stall_in,
		output 		avm_local_bb2_ld__enable,
		input [511:0] 		avm_local_bb2_ld__readdata,
		input 		avm_local_bb2_ld__readdatavalid,
		input 		avm_local_bb2_ld__waitrequest,
		output [31:0] 		avm_local_bb2_ld__address,
		output 		avm_local_bb2_ld__read,
		output 		avm_local_bb2_ld__write,
		input 		avm_local_bb2_ld__writeack,
		output [511:0] 		avm_local_bb2_ld__writedata,
		output [63:0] 		avm_local_bb2_ld__byteenable,
		output [4:0] 		avm_local_bb2_ld__burstcount,
		output 		avm_local_bb2_st__enable,
		input [7:0] 		avm_local_bb2_st__readdata,
		input 		avm_local_bb2_st__readdatavalid,
		input 		avm_local_bb2_st__waitrequest,
		output [31:0] 		avm_local_bb2_st__address,
		output 		avm_local_bb2_st__read,
		output 		avm_local_bb2_st__write,
		input 		avm_local_bb2_st__writeack,
		output [7:0] 		avm_local_bb2_st__writedata,
		output 		avm_local_bb2_st__byteenable,
		output 		avm_local_bb2_st__burstcount,
		output 		avm_local_bb3_ld__enable,
		input [7:0] 		avm_local_bb3_ld__readdata,
		input 		avm_local_bb3_ld__readdatavalid,
		input 		avm_local_bb3_ld__waitrequest,
		output [31:0] 		avm_local_bb3_ld__address,
		output 		avm_local_bb3_ld__read,
		output 		avm_local_bb3_ld__write,
		input 		avm_local_bb3_ld__writeack,
		output [7:0] 		avm_local_bb3_ld__writedata,
		output 		avm_local_bb3_ld__byteenable,
		output 		avm_local_bb3_ld__burstcount,
		output 		avm_local_bb3_st__enable,
		input [7:0] 		avm_local_bb3_st__readdata,
		input 		avm_local_bb3_st__readdatavalid,
		input 		avm_local_bb3_st__waitrequest,
		output [31:0] 		avm_local_bb3_st__address,
		output 		avm_local_bb3_st__read,
		output 		avm_local_bb3_st__write,
		input 		avm_local_bb3_st__writeack,
		output [7:0] 		avm_local_bb3_st__writedata,
		output 		avm_local_bb3_st__byteenable,
		output 		avm_local_bb3_st__burstcount,
		output 		avm_local_bb4_ld__enable,
		input [7:0] 		avm_local_bb4_ld__readdata,
		input 		avm_local_bb4_ld__readdatavalid,
		input 		avm_local_bb4_ld__waitrequest,
		output [31:0] 		avm_local_bb4_ld__address,
		output 		avm_local_bb4_ld__read,
		output 		avm_local_bb4_ld__write,
		input 		avm_local_bb4_ld__writeack,
		output [7:0] 		avm_local_bb4_ld__writedata,
		output 		avm_local_bb4_ld__byteenable,
		output 		avm_local_bb4_ld__burstcount,
		output 		avm_local_bb4_st_c0_exe1171_enable,
		input [511:0] 		avm_local_bb4_st_c0_exe1171_readdata,
		input 		avm_local_bb4_st_c0_exe1171_readdatavalid,
		input 		avm_local_bb4_st_c0_exe1171_waitrequest,
		output [31:0] 		avm_local_bb4_st_c0_exe1171_address,
		output 		avm_local_bb4_st_c0_exe1171_read,
		output 		avm_local_bb4_st_c0_exe1171_write,
		input 		avm_local_bb4_st_c0_exe1171_writeack,
		output [511:0] 		avm_local_bb4_st_c0_exe1171_writedata,
		output [63:0] 		avm_local_bb4_st_c0_exe1171_byteenable,
		output [4:0] 		avm_local_bb4_st_c0_exe1171_burstcount,
		output 		avm_local_bb6_ld__enable,
		input [7:0] 		avm_local_bb6_ld__readdata,
		input 		avm_local_bb6_ld__readdatavalid,
		input 		avm_local_bb6_ld__waitrequest,
		output [31:0] 		avm_local_bb6_ld__address,
		output 		avm_local_bb6_ld__read,
		output 		avm_local_bb6_ld__write,
		input 		avm_local_bb6_ld__writeack,
		output [7:0] 		avm_local_bb6_ld__writedata,
		output 		avm_local_bb6_ld__byteenable,
		output 		avm_local_bb6_ld__burstcount,
		output 		avm_local_bb6_st_c0_exe1182_enable,
		input [511:0] 		avm_local_bb6_st_c0_exe1182_readdata,
		input 		avm_local_bb6_st_c0_exe1182_readdatavalid,
		input 		avm_local_bb6_st_c0_exe1182_waitrequest,
		output [31:0] 		avm_local_bb6_st_c0_exe1182_address,
		output 		avm_local_bb6_st_c0_exe1182_read,
		output 		avm_local_bb6_st_c0_exe1182_write,
		input 		avm_local_bb6_st_c0_exe1182_writeack,
		output [511:0] 		avm_local_bb6_st_c0_exe1182_writedata,
		output [63:0] 		avm_local_bb6_st_c0_exe1182_byteenable,
		output [4:0] 		avm_local_bb6_st_c0_exe1182_burstcount,
		input 		start,
		input [31:0] 		input_pop_size,
		input [31:0] 		input_chrom_size,
		input [31:0] 		input_min_fit_fun,
		input 		clock2x,
		input [63:0] 		input_pop1,
		input [63:0] 		input_pop2,
		input [63:0] 		input_best_member,
		output reg 		has_a_write_pending,
		output reg 		has_a_lsu_active
	);


wire [31:0] workgroup_size;
wire [31:0] cur_cycle;
wire bb_0_stall_out;
wire bb_0_valid_out;
wire [63:0] bb_0_lvb_bb0_conv;
wire bb_0_lvb_bb0_cmp11;
wire [63:0] bb_0_lvb_bb0_conv_i19_i;
wire bb_0_lvb_bb0_cmp_i20_i1;
wire bb_0_lvb_bb0_var_;
wire bb_0_lvb_bb0_var__u0;
wire bb_0_lvb_bb0_var__u1;
wire bb_1_stall_out_0;
wire bb_1_stall_out_1;
wire bb_1_valid_out;
wire [63:0] ffwd_7_0;
wire [31:0] ffwd_6_0;
wire [63:0] ffwd_0_0;
wire [31:0] ffwd_1_0;
wire [63:0] ffwd_2_0;
wire bb_2_stall_out_0;
wire bb_2_stall_out_1;
wire bb_2_valid_out_0;
wire bb_2_valid_out_1;
wire bb_2_feedback_stall_out_11;
wire bb_2_feedback_stall_out_0;
wire bb_2_feedback_stall_out_1;
wire bb_2_acl_pipelined_valid;
wire bb_2_acl_pipelined_exiting_valid;
wire bb_2_acl_pipelined_exiting_stall;
wire bb_2_feedback_valid_out_11;
wire [63:0] bb_2_feedback_data_out_11;
wire bb_2_feedback_valid_out_1;
wire bb_2_feedback_data_out_1;
wire bb_2_local_bb2_ld__active;
wire [7:0] bb_2_local_bb2_st__input_fifo_depth;
wire bb_3_stall_out_0;
wire bb_3_stall_out_1;
wire bb_3_valid_out_0;
wire bb_3_valid_out_1;
wire bb_3_feedback_stall_out_10;
wire bb_3_feedback_stall_out_2;
wire bb_3_feedback_stall_out_3;
wire bb_3_acl_pipelined_valid;
wire bb_3_acl_pipelined_exiting_valid;
wire bb_3_acl_pipelined_exiting_stall;
wire bb_3_feedback_valid_out_3;
wire bb_3_feedback_data_out_3;
wire bb_3_feedback_valid_out_10;
wire [63:0] bb_3_feedback_data_out_10;
wire [7:0] bb_3_local_bb3_ld__input_fifo_depth;
wire [7:0] bb_3_local_bb3_st__input_fifo_depth;
wire bb_4_stall_out_0;
wire bb_4_stall_out_1;
wire bb_4_valid_out_0;
wire bb_4_valid_out_1;
wire bb_4_feedback_stall_out_9;
wire bb_4_feedback_stall_out_4;
wire bb_4_feedback_stall_out_5;
wire bb_4_acl_pipelined_valid;
wire bb_4_acl_pipelined_exiting_valid;
wire bb_4_acl_pipelined_exiting_stall;
wire bb_4_feedback_valid_out_5;
wire bb_4_feedback_data_out_5;
wire bb_4_feedback_valid_out_9;
wire [63:0] bb_4_feedback_data_out_9;
wire [7:0] bb_4_local_bb4_ld__input_fifo_depth;
wire bb_4_local_bb4_st_c0_exe1171_active;
wire bb_5_stall_out;
wire bb_5_valid_out;
wire ffwd_4_0;
wire [31:0] ffwd_3_0;
wire ffwd_5_0;
wire bb_6_stall_out_0;
wire bb_6_stall_out_1;
wire bb_6_valid_out_0;
wire bb_6_valid_out_1;
wire bb_6_feedback_stall_out_8;
wire bb_6_feedback_stall_out_6;
wire bb_6_feedback_stall_out_7;
wire bb_6_acl_pipelined_valid;
wire bb_6_acl_pipelined_exiting_valid;
wire bb_6_acl_pipelined_exiting_stall;
wire bb_6_feedback_valid_out_8;
wire [63:0] bb_6_feedback_data_out_8;
wire bb_6_feedback_valid_out_7;
wire bb_6_feedback_data_out_7;
wire [7:0] bb_6_local_bb6_ld__input_fifo_depth;
wire bb_6_local_bb6_st_c0_exe1182_active;
wire bb_7_stall_out;
wire bb_7_valid_out_0;
wire bb_7_valid_out_1;
wire bb_8_stall_out;
wire bb_8_valid_out;
wire feedback_stall_11;
wire feedback_valid_11;
wire [63:0] feedback_data_11;
wire feedback_stall_1;
wire feedback_valid_1;
wire feedback_data_1;
wire feedback_stall_10;
wire feedback_valid_10;
wire [63:0] feedback_data_10;
wire feedback_stall_3;
wire feedback_valid_3;
wire feedback_data_3;
wire feedback_stall_9;
wire feedback_valid_9;
wire [63:0] feedback_data_9;
wire feedback_stall_5;
wire feedback_valid_5;
wire feedback_data_5;
wire feedback_stall_8;
wire feedback_valid_8;
wire [63:0] feedback_data_8;
wire feedback_stall_7;
wire feedback_valid_7;
wire feedback_data_7;
wire loop_limiter_1_stall_out;
wire loop_limiter_1_valid_out;
wire loop_limiter_2_stall_out;
wire loop_limiter_2_valid_out;
wire loop_limiter_3_stall_out;
wire loop_limiter_3_valid_out;
wire loop_limiter_4_stall_out;
wire loop_limiter_4_valid_out;
wire [1:0] writes_pending;
wire [2:0] lsus_active;

genetic_algorithm_basic_block_0 genetic_algorithm_basic_block_0 (
	.clock(clock),
	.resetn(resetn),
	.start(start),
	.input_pop_size(input_pop_size),
	.input_chrom_size(input_chrom_size),
	.valid_in(valid_in),
	.stall_out(bb_0_stall_out),
	.valid_out(bb_0_valid_out),
	.stall_in(bb_1_stall_out_1),
	.lvb_bb0_conv(bb_0_lvb_bb0_conv),
	.lvb_bb0_cmp11(bb_0_lvb_bb0_cmp11),
	.lvb_bb0_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.lvb_bb0_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.lvb_bb0_var_(bb_0_lvb_bb0_var_),
	.lvb_bb0_var__u0(bb_0_lvb_bb0_var__u0),
	.lvb_bb0_var__u1(bb_0_lvb_bb0_var__u1),
	.workgroup_size(workgroup_size)
);


genetic_algorithm_basic_block_1 genetic_algorithm_basic_block_1 (
	.clock(clock),
	.resetn(resetn),
	.input_min_fit_fun(input_min_fit_fun),
	.input_wii_conv(bb_0_lvb_bb0_conv),
	.input_wii_cmp11(bb_0_lvb_bb0_cmp11),
	.input_wii_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.input_wii_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.input_wii_var_(bb_0_lvb_bb0_var_),
	.input_wii_var__u2(bb_0_lvb_bb0_var__u0),
	.input_wii_var__u3(bb_0_lvb_bb0_var__u1),
	.valid_in_0(bb_7_valid_out_0),
	.stall_out_0(bb_1_stall_out_0),
	.input_forked_0(1'b0),
	.valid_in_1(bb_0_valid_out),
	.stall_out_1(bb_1_stall_out_1),
	.input_forked_1(1'b1),
	.valid_out(bb_1_valid_out),
	.stall_in(loop_limiter_4_stall_out),
	.workgroup_size(workgroup_size),
	.start(start),
	.ffwd_7_0(ffwd_7_0),
	.ffwd_6_0(ffwd_6_0),
	.ffwd_0_0(ffwd_0_0),
	.ffwd_1_0(ffwd_1_0),
	.ffwd_2_0(ffwd_2_0)
);


genetic_algorithm_basic_block_2 genetic_algorithm_basic_block_2 (
	.clock(clock),
	.resetn(resetn),
	.input_pop1(input_pop1),
	.input_wii_conv(bb_0_lvb_bb0_conv),
	.input_wii_cmp11(bb_0_lvb_bb0_cmp11),
	.input_wii_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.input_wii_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.input_wii_var_(bb_0_lvb_bb0_var_),
	.input_wii_var__u4(bb_0_lvb_bb0_var__u0),
	.input_wii_var__u5(bb_0_lvb_bb0_var__u1),
	.valid_in_0(bb_2_acl_pipelined_valid),
	.stall_out_0(bb_2_stall_out_0),
	.input_forked154_0(1'b0),
	.valid_in_1(loop_limiter_4_valid_out),
	.stall_out_1(bb_2_stall_out_1),
	.input_forked154_1(1'b1),
	.valid_out_0(bb_2_valid_out_0),
	.stall_in_0(loop_limiter_3_stall_out),
	.valid_out_1(bb_2_valid_out_1),
	.stall_in_1(1'b0),
	.workgroup_size(workgroup_size),
	.start(start),
	.feedback_valid_in_11(feedback_valid_11),
	.feedback_stall_out_11(feedback_stall_11),
	.feedback_data_in_11(feedback_data_11),
	.feedback_stall_out_0(bb_2_feedback_stall_out_0),
	.feedback_valid_in_1(feedback_valid_1),
	.feedback_stall_out_1(feedback_stall_1),
	.feedback_data_in_1(feedback_data_1),
	.acl_pipelined_valid(bb_2_acl_pipelined_valid),
	.acl_pipelined_stall(bb_2_stall_out_0),
	.acl_pipelined_exiting_valid(bb_2_acl_pipelined_exiting_valid),
	.acl_pipelined_exiting_stall(bb_2_acl_pipelined_exiting_stall),
	.feedback_valid_out_11(feedback_valid_11),
	.feedback_stall_in_11(feedback_stall_11),
	.feedback_data_out_11(feedback_data_11),
	.feedback_valid_out_1(feedback_valid_1),
	.feedback_stall_in_1(feedback_stall_1),
	.feedback_data_out_1(feedback_data_1),
	.avm_local_bb2_ld__enable(avm_local_bb2_ld__enable),
	.avm_local_bb2_ld__readdata(avm_local_bb2_ld__readdata),
	.avm_local_bb2_ld__readdatavalid(avm_local_bb2_ld__readdatavalid),
	.avm_local_bb2_ld__waitrequest(avm_local_bb2_ld__waitrequest),
	.avm_local_bb2_ld__address(avm_local_bb2_ld__address),
	.avm_local_bb2_ld__read(avm_local_bb2_ld__read),
	.avm_local_bb2_ld__write(avm_local_bb2_ld__write),
	.avm_local_bb2_ld__writeack(avm_local_bb2_ld__writeack),
	.avm_local_bb2_ld__writedata(avm_local_bb2_ld__writedata),
	.avm_local_bb2_ld__byteenable(avm_local_bb2_ld__byteenable),
	.avm_local_bb2_ld__burstcount(avm_local_bb2_ld__burstcount),
	.local_bb2_ld__active(bb_2_local_bb2_ld__active),
	.clock2x(clock2x),
	.avm_local_bb2_st__enable(avm_local_bb2_st__enable),
	.avm_local_bb2_st__readdata(avm_local_bb2_st__readdata),
	.avm_local_bb2_st__readdatavalid(avm_local_bb2_st__readdatavalid),
	.avm_local_bb2_st__waitrequest(avm_local_bb2_st__waitrequest),
	.avm_local_bb2_st__address(avm_local_bb2_st__address),
	.avm_local_bb2_st__read(avm_local_bb2_st__read),
	.avm_local_bb2_st__write(avm_local_bb2_st__write),
	.avm_local_bb2_st__writeack(avm_local_bb2_st__writeack),
	.avm_local_bb2_st__writedata(avm_local_bb2_st__writedata),
	.avm_local_bb2_st__byteenable(avm_local_bb2_st__byteenable),
	.avm_local_bb2_st__burstcount(avm_local_bb2_st__burstcount),
	.local_bb2_st__input_fifo_depth(bb_2_local_bb2_st__input_fifo_depth)
);


genetic_algorithm_basic_block_3 genetic_algorithm_basic_block_3 (
	.clock(clock),
	.resetn(resetn),
	.input_wii_conv(bb_0_lvb_bb0_conv),
	.input_wii_cmp11(bb_0_lvb_bb0_cmp11),
	.input_wii_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.input_wii_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.input_wii_var_(bb_0_lvb_bb0_var_),
	.input_wii_var__u6(bb_0_lvb_bb0_var__u0),
	.input_wii_var__u7(bb_0_lvb_bb0_var__u1),
	.valid_in_0(bb_3_acl_pipelined_valid),
	.stall_out_0(bb_3_stall_out_0),
	.input_forked153_0(1'b0),
	.valid_in_1(loop_limiter_3_valid_out),
	.stall_out_1(bb_3_stall_out_1),
	.input_forked153_1(1'b1),
	.valid_out_0(bb_3_valid_out_0),
	.stall_in_0(loop_limiter_2_stall_out),
	.valid_out_1(bb_3_valid_out_1),
	.stall_in_1(1'b0),
	.workgroup_size(workgroup_size),
	.start(start),
	.feedback_valid_in_10(feedback_valid_10),
	.feedback_stall_out_10(feedback_stall_10),
	.feedback_data_in_10(feedback_data_10),
	.feedback_stall_out_2(bb_3_feedback_stall_out_2),
	.feedback_valid_in_3(feedback_valid_3),
	.feedback_stall_out_3(feedback_stall_3),
	.feedback_data_in_3(feedback_data_3),
	.acl_pipelined_valid(bb_3_acl_pipelined_valid),
	.acl_pipelined_stall(bb_3_stall_out_0),
	.acl_pipelined_exiting_valid(bb_3_acl_pipelined_exiting_valid),
	.acl_pipelined_exiting_stall(bb_3_acl_pipelined_exiting_stall),
	.feedback_valid_out_3(feedback_valid_3),
	.feedback_stall_in_3(feedback_stall_3),
	.feedback_data_out_3(feedback_data_3),
	.feedback_valid_out_10(feedback_valid_10),
	.feedback_stall_in_10(feedback_stall_10),
	.feedback_data_out_10(feedback_data_10),
	.avm_local_bb3_ld__enable(avm_local_bb3_ld__enable),
	.avm_local_bb3_ld__readdata(avm_local_bb3_ld__readdata),
	.avm_local_bb3_ld__readdatavalid(avm_local_bb3_ld__readdatavalid),
	.avm_local_bb3_ld__waitrequest(avm_local_bb3_ld__waitrequest),
	.avm_local_bb3_ld__address(avm_local_bb3_ld__address),
	.avm_local_bb3_ld__read(avm_local_bb3_ld__read),
	.avm_local_bb3_ld__write(avm_local_bb3_ld__write),
	.avm_local_bb3_ld__writeack(avm_local_bb3_ld__writeack),
	.avm_local_bb3_ld__writedata(avm_local_bb3_ld__writedata),
	.avm_local_bb3_ld__byteenable(avm_local_bb3_ld__byteenable),
	.avm_local_bb3_ld__burstcount(avm_local_bb3_ld__burstcount),
	.local_bb3_ld__input_fifo_depth(bb_3_local_bb3_ld__input_fifo_depth),
	.clock2x(clock2x),
	.avm_local_bb3_st__enable(avm_local_bb3_st__enable),
	.avm_local_bb3_st__readdata(avm_local_bb3_st__readdata),
	.avm_local_bb3_st__readdatavalid(avm_local_bb3_st__readdatavalid),
	.avm_local_bb3_st__waitrequest(avm_local_bb3_st__waitrequest),
	.avm_local_bb3_st__address(avm_local_bb3_st__address),
	.avm_local_bb3_st__read(avm_local_bb3_st__read),
	.avm_local_bb3_st__write(avm_local_bb3_st__write),
	.avm_local_bb3_st__writeack(avm_local_bb3_st__writeack),
	.avm_local_bb3_st__writedata(avm_local_bb3_st__writedata),
	.avm_local_bb3_st__byteenable(avm_local_bb3_st__byteenable),
	.avm_local_bb3_st__burstcount(avm_local_bb3_st__burstcount),
	.local_bb3_st__input_fifo_depth(bb_3_local_bb3_st__input_fifo_depth)
);


genetic_algorithm_basic_block_4 genetic_algorithm_basic_block_4 (
	.clock(clock),
	.resetn(resetn),
	.input_pop2(input_pop2),
	.input_wii_conv(bb_0_lvb_bb0_conv),
	.input_wii_cmp11(bb_0_lvb_bb0_cmp11),
	.input_wii_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.input_wii_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.input_wii_var_(bb_0_lvb_bb0_var_),
	.input_wii_var__u8(bb_0_lvb_bb0_var__u0),
	.input_wii_var__u9(bb_0_lvb_bb0_var__u1),
	.valid_in_0(bb_4_acl_pipelined_valid),
	.stall_out_0(bb_4_stall_out_0),
	.input_forked152_0(1'b0),
	.valid_in_1(loop_limiter_2_valid_out),
	.stall_out_1(bb_4_stall_out_1),
	.input_forked152_1(1'b1),
	.valid_out_0(bb_4_valid_out_0),
	.stall_in_0(bb_5_stall_out),
	.valid_out_1(bb_4_valid_out_1),
	.stall_in_1(1'b0),
	.workgroup_size(workgroup_size),
	.start(start),
	.feedback_valid_in_9(feedback_valid_9),
	.feedback_stall_out_9(feedback_stall_9),
	.feedback_data_in_9(feedback_data_9),
	.feedback_stall_out_4(bb_4_feedback_stall_out_4),
	.feedback_valid_in_5(feedback_valid_5),
	.feedback_stall_out_5(feedback_stall_5),
	.feedback_data_in_5(feedback_data_5),
	.acl_pipelined_valid(bb_4_acl_pipelined_valid),
	.acl_pipelined_stall(bb_4_stall_out_0),
	.acl_pipelined_exiting_valid(bb_4_acl_pipelined_exiting_valid),
	.acl_pipelined_exiting_stall(bb_4_acl_pipelined_exiting_stall),
	.feedback_valid_out_5(feedback_valid_5),
	.feedback_stall_in_5(feedback_stall_5),
	.feedback_data_out_5(feedback_data_5),
	.ffwd_2_0(ffwd_2_0),
	.feedback_valid_out_9(feedback_valid_9),
	.feedback_stall_in_9(feedback_stall_9),
	.feedback_data_out_9(feedback_data_9),
	.avm_local_bb4_ld__enable(avm_local_bb4_ld__enable),
	.avm_local_bb4_ld__readdata(avm_local_bb4_ld__readdata),
	.avm_local_bb4_ld__readdatavalid(avm_local_bb4_ld__readdatavalid),
	.avm_local_bb4_ld__waitrequest(avm_local_bb4_ld__waitrequest),
	.avm_local_bb4_ld__address(avm_local_bb4_ld__address),
	.avm_local_bb4_ld__read(avm_local_bb4_ld__read),
	.avm_local_bb4_ld__write(avm_local_bb4_ld__write),
	.avm_local_bb4_ld__writeack(avm_local_bb4_ld__writeack),
	.avm_local_bb4_ld__writedata(avm_local_bb4_ld__writedata),
	.avm_local_bb4_ld__byteenable(avm_local_bb4_ld__byteenable),
	.avm_local_bb4_ld__burstcount(avm_local_bb4_ld__burstcount),
	.local_bb4_ld__input_fifo_depth(bb_4_local_bb4_ld__input_fifo_depth),
	.clock2x(clock2x),
	.avm_local_bb4_st_c0_exe1171_enable(avm_local_bb4_st_c0_exe1171_enable),
	.avm_local_bb4_st_c0_exe1171_readdata(avm_local_bb4_st_c0_exe1171_readdata),
	.avm_local_bb4_st_c0_exe1171_readdatavalid(avm_local_bb4_st_c0_exe1171_readdatavalid),
	.avm_local_bb4_st_c0_exe1171_waitrequest(avm_local_bb4_st_c0_exe1171_waitrequest),
	.avm_local_bb4_st_c0_exe1171_address(avm_local_bb4_st_c0_exe1171_address),
	.avm_local_bb4_st_c0_exe1171_read(avm_local_bb4_st_c0_exe1171_read),
	.avm_local_bb4_st_c0_exe1171_write(avm_local_bb4_st_c0_exe1171_write),
	.avm_local_bb4_st_c0_exe1171_writeack(avm_local_bb4_st_c0_exe1171_writeack),
	.avm_local_bb4_st_c0_exe1171_writedata(avm_local_bb4_st_c0_exe1171_writedata),
	.avm_local_bb4_st_c0_exe1171_byteenable(avm_local_bb4_st_c0_exe1171_byteenable),
	.avm_local_bb4_st_c0_exe1171_burstcount(avm_local_bb4_st_c0_exe1171_burstcount),
	.local_bb4_st_c0_exe1171_active(bb_4_local_bb4_st_c0_exe1171_active)
);


genetic_algorithm_basic_block_5 genetic_algorithm_basic_block_5 (
	.clock(clock),
	.resetn(resetn),
	.input_wii_conv(bb_0_lvb_bb0_conv),
	.input_wii_cmp11(bb_0_lvb_bb0_cmp11),
	.input_wii_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.input_wii_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.input_wii_var_(bb_0_lvb_bb0_var_),
	.input_wii_var__u10(bb_0_lvb_bb0_var__u0),
	.input_wii_var__u11(bb_0_lvb_bb0_var__u1),
	.valid_in(bb_4_valid_out_0),
	.stall_out(bb_5_stall_out),
	.valid_out(bb_5_valid_out),
	.stall_in(loop_limiter_1_stall_out),
	.workgroup_size(workgroup_size),
	.start(start),
	.ffwd_1_0(ffwd_1_0),
	.ffwd_4_0(ffwd_4_0),
	.ffwd_3_0(ffwd_3_0),
	.ffwd_5_0(ffwd_5_0)
);


genetic_algorithm_basic_block_6 genetic_algorithm_basic_block_6 (
	.clock(clock),
	.resetn(resetn),
	.input_best_member(input_best_member),
	.input_wii_conv(bb_0_lvb_bb0_conv),
	.input_wii_cmp11(bb_0_lvb_bb0_cmp11),
	.input_wii_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.input_wii_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.input_wii_var_(bb_0_lvb_bb0_var_),
	.input_wii_var__u14(bb_0_lvb_bb0_var__u0),
	.input_wii_var__u15(bb_0_lvb_bb0_var__u1),
	.valid_in_0(bb_6_acl_pipelined_valid),
	.stall_out_0(bb_6_stall_out_0),
	.input_forked151_0(1'b0),
	.valid_in_1(loop_limiter_1_valid_out),
	.stall_out_1(bb_6_stall_out_1),
	.input_forked151_1(1'b1),
	.valid_out_0(bb_6_valid_out_0),
	.stall_in_0(1'b0),
	.valid_out_1(bb_6_valid_out_1),
	.stall_in_1(bb_7_stall_out),
	.workgroup_size(workgroup_size),
	.start(start),
	.ffwd_5_0(ffwd_5_0),
	.feedback_valid_in_8(feedback_valid_8),
	.feedback_stall_out_8(feedback_stall_8),
	.feedback_data_in_8(feedback_data_8),
	.feedback_stall_out_6(bb_6_feedback_stall_out_6),
	.feedback_valid_in_7(feedback_valid_7),
	.feedback_stall_out_7(feedback_stall_7),
	.feedback_data_in_7(feedback_data_7),
	.acl_pipelined_valid(bb_6_acl_pipelined_valid),
	.acl_pipelined_stall(bb_6_stall_out_0),
	.acl_pipelined_exiting_valid(bb_6_acl_pipelined_exiting_valid),
	.acl_pipelined_exiting_stall(bb_6_acl_pipelined_exiting_stall),
	.feedback_valid_out_8(feedback_valid_8),
	.feedback_stall_in_8(feedback_stall_8),
	.feedback_data_out_8(feedback_data_8),
	.feedback_valid_out_7(feedback_valid_7),
	.feedback_stall_in_7(feedback_stall_7),
	.feedback_data_out_7(feedback_data_7),
	.ffwd_4_0(ffwd_4_0),
	.avm_local_bb6_ld__enable(avm_local_bb6_ld__enable),
	.avm_local_bb6_ld__readdata(avm_local_bb6_ld__readdata),
	.avm_local_bb6_ld__readdatavalid(avm_local_bb6_ld__readdatavalid),
	.avm_local_bb6_ld__waitrequest(avm_local_bb6_ld__waitrequest),
	.avm_local_bb6_ld__address(avm_local_bb6_ld__address),
	.avm_local_bb6_ld__read(avm_local_bb6_ld__read),
	.avm_local_bb6_ld__write(avm_local_bb6_ld__write),
	.avm_local_bb6_ld__writeack(avm_local_bb6_ld__writeack),
	.avm_local_bb6_ld__writedata(avm_local_bb6_ld__writedata),
	.avm_local_bb6_ld__byteenable(avm_local_bb6_ld__byteenable),
	.avm_local_bb6_ld__burstcount(avm_local_bb6_ld__burstcount),
	.local_bb6_ld__input_fifo_depth(bb_6_local_bb6_ld__input_fifo_depth),
	.clock2x(clock2x),
	.avm_local_bb6_st_c0_exe1182_enable(avm_local_bb6_st_c0_exe1182_enable),
	.avm_local_bb6_st_c0_exe1182_readdata(avm_local_bb6_st_c0_exe1182_readdata),
	.avm_local_bb6_st_c0_exe1182_readdatavalid(avm_local_bb6_st_c0_exe1182_readdatavalid),
	.avm_local_bb6_st_c0_exe1182_waitrequest(avm_local_bb6_st_c0_exe1182_waitrequest),
	.avm_local_bb6_st_c0_exe1182_address(avm_local_bb6_st_c0_exe1182_address),
	.avm_local_bb6_st_c0_exe1182_read(avm_local_bb6_st_c0_exe1182_read),
	.avm_local_bb6_st_c0_exe1182_write(avm_local_bb6_st_c0_exe1182_write),
	.avm_local_bb6_st_c0_exe1182_writeack(avm_local_bb6_st_c0_exe1182_writeack),
	.avm_local_bb6_st_c0_exe1182_writedata(avm_local_bb6_st_c0_exe1182_writedata),
	.avm_local_bb6_st_c0_exe1182_byteenable(avm_local_bb6_st_c0_exe1182_byteenable),
	.avm_local_bb6_st_c0_exe1182_burstcount(avm_local_bb6_st_c0_exe1182_burstcount),
	.local_bb6_st_c0_exe1182_active(bb_6_local_bb6_st_c0_exe1182_active)
);


genetic_algorithm_basic_block_7 genetic_algorithm_basic_block_7 (
	.clock(clock),
	.resetn(resetn),
	.input_wii_conv(bb_0_lvb_bb0_conv),
	.input_wii_cmp11(bb_0_lvb_bb0_cmp11),
	.input_wii_conv_i19_i(bb_0_lvb_bb0_conv_i19_i),
	.input_wii_cmp_i20_i1(bb_0_lvb_bb0_cmp_i20_i1),
	.input_wii_var_(bb_0_lvb_bb0_var_),
	.input_wii_var__u17(bb_0_lvb_bb0_var__u0),
	.input_wii_var__u18(bb_0_lvb_bb0_var__u1),
	.valid_in(bb_6_valid_out_1),
	.stall_out(bb_7_stall_out),
	.valid_out_0(bb_7_valid_out_0),
	.stall_in_0(bb_1_stall_out_0),
	.valid_out_1(bb_7_valid_out_1),
	.stall_in_1(bb_8_stall_out),
	.workgroup_size(workgroup_size),
	.start(start),
	.ffwd_0_0(ffwd_0_0),
	.ffwd_3_0(ffwd_3_0),
	.ffwd_4_0(ffwd_4_0),
	.ffwd_7_0(ffwd_7_0),
	.ffwd_6_0(ffwd_6_0)
);


genetic_algorithm_basic_block_8 genetic_algorithm_basic_block_8 (
	.clock(clock),
	.resetn(resetn),
	.valid_in(bb_7_valid_out_1),
	.stall_out(bb_8_stall_out),
	.valid_out(bb_8_valid_out),
	.stall_in(stall_in),
	.workgroup_size(workgroup_size),
	.start(start)
);


acl_loop_limiter loop_limiter_1 (
	.clock(clock),
	.resetn(resetn),
	.i_valid(bb_5_valid_out),
	.i_stall(bb_6_stall_out_1),
	.i_valid_exit(bb_6_acl_pipelined_exiting_valid),
	.i_stall_exit(bb_6_acl_pipelined_exiting_stall),
	.o_valid(loop_limiter_1_valid_out),
	.o_stall(loop_limiter_1_stall_out)
);

defparam loop_limiter_1.ENTRY_WIDTH = 1;
defparam loop_limiter_1.EXIT_WIDTH = 1;
defparam loop_limiter_1.THRESHOLD = 1;

acl_loop_limiter loop_limiter_2 (
	.clock(clock),
	.resetn(resetn),
	.i_valid(bb_3_valid_out_0),
	.i_stall(bb_4_stall_out_1),
	.i_valid_exit(bb_4_acl_pipelined_exiting_valid),
	.i_stall_exit(bb_4_acl_pipelined_exiting_stall),
	.o_valid(loop_limiter_2_valid_out),
	.o_stall(loop_limiter_2_stall_out)
);

defparam loop_limiter_2.ENTRY_WIDTH = 1;
defparam loop_limiter_2.EXIT_WIDTH = 1;
defparam loop_limiter_2.THRESHOLD = 1;

acl_loop_limiter loop_limiter_3 (
	.clock(clock),
	.resetn(resetn),
	.i_valid(bb_2_valid_out_0),
	.i_stall(bb_3_stall_out_1),
	.i_valid_exit(bb_3_acl_pipelined_exiting_valid),
	.i_stall_exit(bb_3_acl_pipelined_exiting_stall),
	.o_valid(loop_limiter_3_valid_out),
	.o_stall(loop_limiter_3_stall_out)
);

defparam loop_limiter_3.ENTRY_WIDTH = 1;
defparam loop_limiter_3.EXIT_WIDTH = 1;
defparam loop_limiter_3.THRESHOLD = 1;

acl_loop_limiter loop_limiter_4 (
	.clock(clock),
	.resetn(resetn),
	.i_valid(bb_1_valid_out),
	.i_stall(bb_2_stall_out_1),
	.i_valid_exit(bb_2_acl_pipelined_exiting_valid),
	.i_stall_exit(bb_2_acl_pipelined_exiting_stall),
	.o_valid(loop_limiter_4_valid_out),
	.o_stall(loop_limiter_4_stall_out)
);

defparam loop_limiter_4.ENTRY_WIDTH = 1;
defparam loop_limiter_4.EXIT_WIDTH = 1;
defparam loop_limiter_4.THRESHOLD = 1;

genetic_algorithm_sys_cycle_time system_cycle_time_module (
	.clock(clock),
	.resetn(resetn),
	.cur_cycle(cur_cycle)
);


assign workgroup_size = 32'h1;
assign valid_out = bb_8_valid_out;
assign stall_out = bb_0_stall_out;
assign writes_pending[0] = bb_4_local_bb4_st_c0_exe1171_active;
assign writes_pending[1] = bb_6_local_bb6_st_c0_exe1182_active;
assign lsus_active[0] = bb_2_local_bb2_ld__active;
assign lsus_active[1] = bb_4_local_bb4_st_c0_exe1171_active;
assign lsus_active[2] = bb_6_local_bb6_st_c0_exe1182_active;

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
module genetic_algorithm_function_cra_slave
	(
		input 		clock,
		input 		resetn,
		output reg [383:0] 		kernel_arguments,
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
		input [4:0] 		avs_cra_address,
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
 reg [4:0] cra_addr_st1_NO_SHIFT_REG;
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
		kernel_arguments <= 384'h0;
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
				5'h0:
				begin
					status_NO_SHIFT_REG[31:16] <= 16'h3;
					status_NO_SHIFT_REG[15:0] <= ((status_NO_SHIFT_REG[15:0] & ~(bitenable[15:0])) | (avs_cra_writedata[15:0] & bitenable[15:0]));
				end

				5'h1:
				begin
					profile_ctrl_NO_SHIFT_REG <= ((profile_ctrl_NO_SHIFT_REG & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h3:
				begin
					profile_start_cycle_NO_SHIFT_REG[31:0] <= ((profile_start_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_start_cycle_NO_SHIFT_REG[63:32] <= ((profile_start_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h4:
				begin
					profile_stop_cycle_NO_SHIFT_REG[31:0] <= ((profile_stop_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_stop_cycle_NO_SHIFT_REG[63:32] <= ((profile_stop_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h5:
				begin
					work_dim <= ((work_dim & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					workgroup_size <= ((workgroup_size & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h6:
				begin
					global_size_0 <= ((global_size_0 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_size_1 <= ((global_size_1 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h7:
				begin
					global_size_2 <= ((global_size_2 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_0 <= ((num_groups_0 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h8:
				begin
					num_groups_1 <= ((num_groups_1 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_2 <= ((num_groups_2 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h9:
				begin
					local_size_0 <= ((local_size_0 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					local_size_1 <= ((local_size_1 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'hA:
				begin
					local_size_2 <= ((local_size_2 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_0 <= ((global_offset_0 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'hB:
				begin
					global_offset_1 <= ((global_offset_1 & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_2 <= ((global_offset_2 & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'hC:
				begin
					kernel_arguments[31:0] <= ((kernel_arguments[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[63:32] <= ((kernel_arguments[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'hD:
				begin
					kernel_arguments[95:64] <= ((kernel_arguments[95:64] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[127:96] <= ((kernel_arguments[127:96] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'hE:
				begin
					kernel_arguments[159:128] <= ((kernel_arguments[159:128] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[191:160] <= ((kernel_arguments[191:160] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'hF:
				begin
					kernel_arguments[223:192] <= ((kernel_arguments[223:192] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[255:224] <= ((kernel_arguments[255:224] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h10:
				begin
					kernel_arguments[287:256] <= ((kernel_arguments[287:256] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[319:288] <= ((kernel_arguments[319:288] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				5'h11:
				begin
					kernel_arguments[351:320] <= ((kernel_arguments[351:320] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments[383:352] <= ((kernel_arguments[383:352] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
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
		cra_addr_st1_NO_SHIFT_REG <= 5'h0;
		cra_readdata_st1_NO_SHIFT_REG <= 64'h0;
	end
	else
	begin
		cra_read_st1_NO_SHIFT_REG <= avs_cra_read;
		cra_addr_st1_NO_SHIFT_REG <= avs_cra_address;
		case (avs_cra_address)
			5'h0:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= status_NO_SHIFT_REG;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= 32'h0;
			end

			5'h1:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= 'x;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= 32'h0;
			end

			5'h2:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			5'h3:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= 64'h0;
			end

			5'h4:
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
			5'h2:
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
module genetic_algorithm_function_wrapper
	(
		input 		clock,
		input 		resetn,
		input 		clock2x,
		input 		local_router_hang,
		output 		has_a_write_pending,
		output 		has_a_lsu_active,
		input [383:0] 		kernel_arguments,
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
		output 		avm_local_bb2_ld__inst0_enable,
		input [511:0] 		avm_local_bb2_ld__inst0_readdata,
		input 		avm_local_bb2_ld__inst0_readdatavalid,
		input 		avm_local_bb2_ld__inst0_waitrequest,
		output [31:0] 		avm_local_bb2_ld__inst0_address,
		output 		avm_local_bb2_ld__inst0_read,
		output 		avm_local_bb2_ld__inst0_write,
		input 		avm_local_bb2_ld__inst0_writeack,
		output [511:0] 		avm_local_bb2_ld__inst0_writedata,
		output [63:0] 		avm_local_bb2_ld__inst0_byteenable,
		output [4:0] 		avm_local_bb2_ld__inst0_burstcount,
		output 		avm_local_bb2_st__inst0_enable,
		input [7:0] 		avm_local_bb2_st__inst0_readdata,
		input 		avm_local_bb2_st__inst0_readdatavalid,
		input 		avm_local_bb2_st__inst0_waitrequest,
		output [31:0] 		avm_local_bb2_st__inst0_address,
		output 		avm_local_bb2_st__inst0_read,
		output 		avm_local_bb2_st__inst0_write,
		input 		avm_local_bb2_st__inst0_writeack,
		output [7:0] 		avm_local_bb2_st__inst0_writedata,
		output 		avm_local_bb2_st__inst0_byteenable,
		output 		avm_local_bb2_st__inst0_burstcount,
		output 		avm_local_bb3_ld__inst0_enable,
		input [7:0] 		avm_local_bb3_ld__inst0_readdata,
		input 		avm_local_bb3_ld__inst0_readdatavalid,
		input 		avm_local_bb3_ld__inst0_waitrequest,
		output [31:0] 		avm_local_bb3_ld__inst0_address,
		output 		avm_local_bb3_ld__inst0_read,
		output 		avm_local_bb3_ld__inst0_write,
		input 		avm_local_bb3_ld__inst0_writeack,
		output [7:0] 		avm_local_bb3_ld__inst0_writedata,
		output 		avm_local_bb3_ld__inst0_byteenable,
		output 		avm_local_bb3_ld__inst0_burstcount,
		output 		avm_local_bb3_st__inst0_enable,
		input [7:0] 		avm_local_bb3_st__inst0_readdata,
		input 		avm_local_bb3_st__inst0_readdatavalid,
		input 		avm_local_bb3_st__inst0_waitrequest,
		output [31:0] 		avm_local_bb3_st__inst0_address,
		output 		avm_local_bb3_st__inst0_read,
		output 		avm_local_bb3_st__inst0_write,
		input 		avm_local_bb3_st__inst0_writeack,
		output [7:0] 		avm_local_bb3_st__inst0_writedata,
		output 		avm_local_bb3_st__inst0_byteenable,
		output 		avm_local_bb3_st__inst0_burstcount,
		output 		avm_local_bb4_ld__inst0_enable,
		input [7:0] 		avm_local_bb4_ld__inst0_readdata,
		input 		avm_local_bb4_ld__inst0_readdatavalid,
		input 		avm_local_bb4_ld__inst0_waitrequest,
		output [31:0] 		avm_local_bb4_ld__inst0_address,
		output 		avm_local_bb4_ld__inst0_read,
		output 		avm_local_bb4_ld__inst0_write,
		input 		avm_local_bb4_ld__inst0_writeack,
		output [7:0] 		avm_local_bb4_ld__inst0_writedata,
		output 		avm_local_bb4_ld__inst0_byteenable,
		output 		avm_local_bb4_ld__inst0_burstcount,
		output 		avm_local_bb4_st_c0_exe1171_inst0_enable,
		input [511:0] 		avm_local_bb4_st_c0_exe1171_inst0_readdata,
		input 		avm_local_bb4_st_c0_exe1171_inst0_readdatavalid,
		input 		avm_local_bb4_st_c0_exe1171_inst0_waitrequest,
		output [31:0] 		avm_local_bb4_st_c0_exe1171_inst0_address,
		output 		avm_local_bb4_st_c0_exe1171_inst0_read,
		output 		avm_local_bb4_st_c0_exe1171_inst0_write,
		input 		avm_local_bb4_st_c0_exe1171_inst0_writeack,
		output [511:0] 		avm_local_bb4_st_c0_exe1171_inst0_writedata,
		output [63:0] 		avm_local_bb4_st_c0_exe1171_inst0_byteenable,
		output [4:0] 		avm_local_bb4_st_c0_exe1171_inst0_burstcount,
		output 		avm_local_bb6_ld__inst0_enable,
		input [7:0] 		avm_local_bb6_ld__inst0_readdata,
		input 		avm_local_bb6_ld__inst0_readdatavalid,
		input 		avm_local_bb6_ld__inst0_waitrequest,
		output [31:0] 		avm_local_bb6_ld__inst0_address,
		output 		avm_local_bb6_ld__inst0_read,
		output 		avm_local_bb6_ld__inst0_write,
		input 		avm_local_bb6_ld__inst0_writeack,
		output [7:0] 		avm_local_bb6_ld__inst0_writedata,
		output 		avm_local_bb6_ld__inst0_byteenable,
		output 		avm_local_bb6_ld__inst0_burstcount,
		output 		avm_local_bb6_st_c0_exe1182_inst0_enable,
		input [511:0] 		avm_local_bb6_st_c0_exe1182_inst0_readdata,
		input 		avm_local_bb6_st_c0_exe1182_inst0_readdatavalid,
		input 		avm_local_bb6_st_c0_exe1182_inst0_waitrequest,
		output [31:0] 		avm_local_bb6_st_c0_exe1182_inst0_address,
		output 		avm_local_bb6_st_c0_exe1182_inst0_read,
		output 		avm_local_bb6_st_c0_exe1182_inst0_write,
		input 		avm_local_bb6_st_c0_exe1182_inst0_writeack,
		output [511:0] 		avm_local_bb6_st_c0_exe1182_inst0_writedata,
		output [63:0] 		avm_local_bb6_st_c0_exe1182_inst0_byteenable,
		output [4:0] 		avm_local_bb6_st_c0_exe1182_inst0_burstcount
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
genetic_algorithm_function genetic_algorithm_function_inst0 (
	.clock(clock),
	.resetn(resetn),
	.stall_out(stall_out),
	.valid_in(valid_in),
	.valid_out(valid_out),
	.stall_in(stall_in),
	.avm_local_bb2_ld__enable(avm_local_bb2_ld__inst0_enable),
	.avm_local_bb2_ld__readdata(avm_local_bb2_ld__inst0_readdata),
	.avm_local_bb2_ld__readdatavalid(avm_local_bb2_ld__inst0_readdatavalid),
	.avm_local_bb2_ld__waitrequest(avm_local_bb2_ld__inst0_waitrequest),
	.avm_local_bb2_ld__address(avm_local_bb2_ld__inst0_address),
	.avm_local_bb2_ld__read(avm_local_bb2_ld__inst0_read),
	.avm_local_bb2_ld__write(avm_local_bb2_ld__inst0_write),
	.avm_local_bb2_ld__writeack(avm_local_bb2_ld__inst0_writeack),
	.avm_local_bb2_ld__writedata(avm_local_bb2_ld__inst0_writedata),
	.avm_local_bb2_ld__byteenable(avm_local_bb2_ld__inst0_byteenable),
	.avm_local_bb2_ld__burstcount(avm_local_bb2_ld__inst0_burstcount),
	.avm_local_bb2_st__enable(avm_local_bb2_st__inst0_enable),
	.avm_local_bb2_st__readdata(avm_local_bb2_st__inst0_readdata),
	.avm_local_bb2_st__readdatavalid(avm_local_bb2_st__inst0_readdatavalid),
	.avm_local_bb2_st__waitrequest(avm_local_bb2_st__inst0_waitrequest),
	.avm_local_bb2_st__address(avm_local_bb2_st__inst0_address),
	.avm_local_bb2_st__read(avm_local_bb2_st__inst0_read),
	.avm_local_bb2_st__write(avm_local_bb2_st__inst0_write),
	.avm_local_bb2_st__writeack(avm_local_bb2_st__inst0_writeack),
	.avm_local_bb2_st__writedata(avm_local_bb2_st__inst0_writedata),
	.avm_local_bb2_st__byteenable(avm_local_bb2_st__inst0_byteenable),
	.avm_local_bb2_st__burstcount(avm_local_bb2_st__inst0_burstcount),
	.avm_local_bb3_ld__enable(avm_local_bb3_ld__inst0_enable),
	.avm_local_bb3_ld__readdata(avm_local_bb3_ld__inst0_readdata),
	.avm_local_bb3_ld__readdatavalid(avm_local_bb3_ld__inst0_readdatavalid),
	.avm_local_bb3_ld__waitrequest(avm_local_bb3_ld__inst0_waitrequest),
	.avm_local_bb3_ld__address(avm_local_bb3_ld__inst0_address),
	.avm_local_bb3_ld__read(avm_local_bb3_ld__inst0_read),
	.avm_local_bb3_ld__write(avm_local_bb3_ld__inst0_write),
	.avm_local_bb3_ld__writeack(avm_local_bb3_ld__inst0_writeack),
	.avm_local_bb3_ld__writedata(avm_local_bb3_ld__inst0_writedata),
	.avm_local_bb3_ld__byteenable(avm_local_bb3_ld__inst0_byteenable),
	.avm_local_bb3_ld__burstcount(avm_local_bb3_ld__inst0_burstcount),
	.avm_local_bb3_st__enable(avm_local_bb3_st__inst0_enable),
	.avm_local_bb3_st__readdata(avm_local_bb3_st__inst0_readdata),
	.avm_local_bb3_st__readdatavalid(avm_local_bb3_st__inst0_readdatavalid),
	.avm_local_bb3_st__waitrequest(avm_local_bb3_st__inst0_waitrequest),
	.avm_local_bb3_st__address(avm_local_bb3_st__inst0_address),
	.avm_local_bb3_st__read(avm_local_bb3_st__inst0_read),
	.avm_local_bb3_st__write(avm_local_bb3_st__inst0_write),
	.avm_local_bb3_st__writeack(avm_local_bb3_st__inst0_writeack),
	.avm_local_bb3_st__writedata(avm_local_bb3_st__inst0_writedata),
	.avm_local_bb3_st__byteenable(avm_local_bb3_st__inst0_byteenable),
	.avm_local_bb3_st__burstcount(avm_local_bb3_st__inst0_burstcount),
	.avm_local_bb4_ld__enable(avm_local_bb4_ld__inst0_enable),
	.avm_local_bb4_ld__readdata(avm_local_bb4_ld__inst0_readdata),
	.avm_local_bb4_ld__readdatavalid(avm_local_bb4_ld__inst0_readdatavalid),
	.avm_local_bb4_ld__waitrequest(avm_local_bb4_ld__inst0_waitrequest),
	.avm_local_bb4_ld__address(avm_local_bb4_ld__inst0_address),
	.avm_local_bb4_ld__read(avm_local_bb4_ld__inst0_read),
	.avm_local_bb4_ld__write(avm_local_bb4_ld__inst0_write),
	.avm_local_bb4_ld__writeack(avm_local_bb4_ld__inst0_writeack),
	.avm_local_bb4_ld__writedata(avm_local_bb4_ld__inst0_writedata),
	.avm_local_bb4_ld__byteenable(avm_local_bb4_ld__inst0_byteenable),
	.avm_local_bb4_ld__burstcount(avm_local_bb4_ld__inst0_burstcount),
	.avm_local_bb4_st_c0_exe1171_enable(avm_local_bb4_st_c0_exe1171_inst0_enable),
	.avm_local_bb4_st_c0_exe1171_readdata(avm_local_bb4_st_c0_exe1171_inst0_readdata),
	.avm_local_bb4_st_c0_exe1171_readdatavalid(avm_local_bb4_st_c0_exe1171_inst0_readdatavalid),
	.avm_local_bb4_st_c0_exe1171_waitrequest(avm_local_bb4_st_c0_exe1171_inst0_waitrequest),
	.avm_local_bb4_st_c0_exe1171_address(avm_local_bb4_st_c0_exe1171_inst0_address),
	.avm_local_bb4_st_c0_exe1171_read(avm_local_bb4_st_c0_exe1171_inst0_read),
	.avm_local_bb4_st_c0_exe1171_write(avm_local_bb4_st_c0_exe1171_inst0_write),
	.avm_local_bb4_st_c0_exe1171_writeack(avm_local_bb4_st_c0_exe1171_inst0_writeack),
	.avm_local_bb4_st_c0_exe1171_writedata(avm_local_bb4_st_c0_exe1171_inst0_writedata),
	.avm_local_bb4_st_c0_exe1171_byteenable(avm_local_bb4_st_c0_exe1171_inst0_byteenable),
	.avm_local_bb4_st_c0_exe1171_burstcount(avm_local_bb4_st_c0_exe1171_inst0_burstcount),
	.avm_local_bb6_ld__enable(avm_local_bb6_ld__inst0_enable),
	.avm_local_bb6_ld__readdata(avm_local_bb6_ld__inst0_readdata),
	.avm_local_bb6_ld__readdatavalid(avm_local_bb6_ld__inst0_readdatavalid),
	.avm_local_bb6_ld__waitrequest(avm_local_bb6_ld__inst0_waitrequest),
	.avm_local_bb6_ld__address(avm_local_bb6_ld__inst0_address),
	.avm_local_bb6_ld__read(avm_local_bb6_ld__inst0_read),
	.avm_local_bb6_ld__write(avm_local_bb6_ld__inst0_write),
	.avm_local_bb6_ld__writeack(avm_local_bb6_ld__inst0_writeack),
	.avm_local_bb6_ld__writedata(avm_local_bb6_ld__inst0_writedata),
	.avm_local_bb6_ld__byteenable(avm_local_bb6_ld__inst0_byteenable),
	.avm_local_bb6_ld__burstcount(avm_local_bb6_ld__inst0_burstcount),
	.avm_local_bb6_st_c0_exe1182_enable(avm_local_bb6_st_c0_exe1182_inst0_enable),
	.avm_local_bb6_st_c0_exe1182_readdata(avm_local_bb6_st_c0_exe1182_inst0_readdata),
	.avm_local_bb6_st_c0_exe1182_readdatavalid(avm_local_bb6_st_c0_exe1182_inst0_readdatavalid),
	.avm_local_bb6_st_c0_exe1182_waitrequest(avm_local_bb6_st_c0_exe1182_inst0_waitrequest),
	.avm_local_bb6_st_c0_exe1182_address(avm_local_bb6_st_c0_exe1182_inst0_address),
	.avm_local_bb6_st_c0_exe1182_read(avm_local_bb6_st_c0_exe1182_inst0_read),
	.avm_local_bb6_st_c0_exe1182_write(avm_local_bb6_st_c0_exe1182_inst0_write),
	.avm_local_bb6_st_c0_exe1182_writeack(avm_local_bb6_st_c0_exe1182_inst0_writeack),
	.avm_local_bb6_st_c0_exe1182_writedata(avm_local_bb6_st_c0_exe1182_inst0_writedata),
	.avm_local_bb6_st_c0_exe1182_byteenable(avm_local_bb6_st_c0_exe1182_inst0_byteenable),
	.avm_local_bb6_st_c0_exe1182_burstcount(avm_local_bb6_st_c0_exe1182_inst0_burstcount),
	.start(start),
	.input_pop_size(kernel_arguments[31:0]),
	.input_chrom_size(kernel_arguments[63:32]),
	.input_min_fit_fun(kernel_arguments[191:160]),
	.clock2x(clock2x),
	.input_pop1(kernel_arguments[255:192]),
	.input_pop2(kernel_arguments[319:256]),
	.input_best_member(kernel_arguments[383:320]),
	.has_a_write_pending(has_a_write_pending),
	.has_a_lsu_active(has_a_lsu_active)
);



endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module genetic_algorithm_sys_cycle_time
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

