module hashtable(clk,
	addr0,addr0_valid,addr1,addr1_valid,
	dout0,dout0_valid,dout1,dout1_valid
);
parameter NBITS = 15;
parameter DWIDTH = 16;
parameter MEM_SIZE = 32768;
parameter INIT_FILE = "./hashtable1.mif";
parameter BM_AWIDTH = (NBITS-3);

input clk;
input [NBITS-1:0] addr0;
input addr0_valid;
input [NBITS-1:0] addr1;
input addr1_valid;
output reg [DWIDTH-1:0] dout0;
output reg dout0_valid;
output reg [DWIDTH-1:0] dout1;
output reg dout1_valid;

reg [NBITS-1:0] addr0_r1;
reg [NBITS-1:0] addr1_r1;
reg [NBITS-1:0] addr0_r2;
reg [NBITS-1:0] addr1_r2;

wire [BM_AWIDTH-1:0] bm_addr0;
wire [BM_AWIDTH-1:0] bm_addr1;
wire [2:0] bm_bit0;
wire [2:0] bm_bit1;
reg  [2:0] bm_bit0_reg1;
reg  [2:0] bm_bit1_reg1;
reg  [2:0] bm_bit0_reg2;
reg  [2:0] bm_bit1_reg2;

reg out0_valid_reg1;
reg out1_valid_reg1;
reg q0_valid;
reg q1_valid;
wire [7:0] q0;
wire [7:0] q1;

assign bm_addr0 = addr0[NBITS-1:3];
assign bm_addr1 = addr1[NBITS-1:3];
assign bm_bit0  = addr0[2:0];
assign bm_bit1  = addr1[2:0];

always @ (posedge clk) begin
    out0_valid_reg1 <= addr0_valid;
    out1_valid_reg1 <= addr1_valid;
    q0_valid <= out0_valid_reg1;
    q1_valid <= out1_valid_reg1;
    bm_bit0_reg1 <= bm_bit0;
    bm_bit0_reg2 <= bm_bit0_reg1;
    bm_bit1_reg1 <= bm_bit1;
    bm_bit1_reg2 <= bm_bit1_reg1;

    //propogate addresses
    addr0_r1 <= addr0;
    addr1_r1 <= addr1;
    addr0_r2 <= addr0_r1;
    addr1_r2 <= addr1_r1;

    dout0 <= addr0_r2;
    dout1 <= addr1_r2;
    //dout0_valid <= q0_valid & (q0[DWIDTH-1]==0);
    //dout1_valid <= q1_valid & (q1[DWIDTH-1]==0);

    //use bitmap to indicate whether it is a match or not
    dout0_valid <= q0_valid & ((q0 >> bm_bit0_reg2) & 1);
    dout1_valid <= q1_valid & ((q1 >> bm_bit1_reg2) & 1);
end

rom_2port #(
	.DWIDTH(8),
	.AWIDTH(BM_AWIDTH),
	.MEM_SIZE(MEM_SIZE),
	.INIT_FILE(INIT_FILE)
)
rom_2port_inst (
	.q_a       (q0),    
	.q_b       (q1),    
	.address_a (bm_addr0),
	.address_b (bm_addr1),
	.clock     (clk)   
);

endmodule
