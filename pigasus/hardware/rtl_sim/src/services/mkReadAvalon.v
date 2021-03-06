//
// Generated by Bluespec Compiler (build 75b53cc)
//
// On Fri Jun 11 08:05:42 EDT 2021
//
//
// Ports:
// Name                         I/O  size props
// topA_read                      O     1 reg
// topA_write                     O     1 reg
// topA_address                   O    17 reg
// topA_writedata                 O   520 reg
// topA_burstcount                O     7 const
// topA_byteenable                O    65 const
// read_txFull                    O     1
// read_rxEmpty                   O     1
// read_rx_msg                    O   622 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// topA_readdata                  I   520 reg
// topA_waitrequest               I     1
// topA_readdatavalid             I     1 reg
// read_tx_msg                    I   622
// setRd_addr_read                I    17 reg
// EN_read_tx                     I     1
// EN_read_rxPop                  I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkReadAvalon(CLK,
		    RST_N,

		    topA_read,

		    topA_write,

		    topA_address,

		    topA_writedata,

		    topA_readdata,

		    topA_waitrequest,

		    topA_readdatavalid,

		    topA_burstcount,

		    topA_byteenable,

		    read_txFull,

		    read_tx_msg,
		    EN_read_tx,

		    read_rxEmpty,

		    EN_read_rxPop,

		    read_rx_msg,

		    setRd_addr_read);
  input  CLK;
  input  RST_N;

  // value method topA_read
  output topA_read;

  // value method topA_write
  output topA_write;

  // value method topA_address
  output [16 : 0] topA_address;

  // value method topA_writedata
  output [519 : 0] topA_writedata;

  // action method topA_readdata
  input  [519 : 0] topA_readdata;

  // action method topA_waitrequest
  input  topA_waitrequest;

  // action method topA_readdatavalid
  input  topA_readdatavalid;

  // value method topA_burstcount
  output [6 : 0] topA_burstcount;

  // value method topA_byteenable
  output [64 : 0] topA_byteenable;

  // value method read_txPort_txFull
  output read_txFull;

  // action method read_txPort_tx
  input  [621 : 0] read_tx_msg;
  input  EN_read_tx;

  // value method read_rxPort_rxEmpty
  output read_rxEmpty;

  // action method read_rxPort_rxPop
  input  EN_read_rxPop;

  // value method read_rxPort_rx
  output [621 : 0] read_rx_msg;

  // action method setRd_addr_read
  input  [16 : 0] setRd_addr_read;

  // signals for module outputs
  wire [621 : 0] read_rx_msg;
  wire [519 : 0] topA_writedata;
  wire [64 : 0] topA_byteenable;
  wire [16 : 0] topA_address;
  wire [6 : 0] topA_burstcount;
  wire read_rxEmpty, read_txFull, topA_read, topA_write;

  // register regsetRd_addr_read
  reg [16 : 0] regsetRd_addr_read;
  wire [16 : 0] regsetRd_addr_read$D_IN;
  wire regsetRd_addr_read$EN;

  // register topA_convert_addrReg
  reg [16 : 0] topA_convert_addrReg;
  wire [16 : 0] topA_convert_addrReg$D_IN;
  wire topA_convert_addrReg$EN;

  // register topA_convert_dataIn
  reg [519 : 0] topA_convert_dataIn;
  wire [519 : 0] topA_convert_dataIn$D_IN;
  wire topA_convert_dataIn$EN;

  // register topA_convert_dataOut
  reg [519 : 0] topA_convert_dataOut;
  wire [519 : 0] topA_convert_dataOut$D_IN;
  wire topA_convert_dataOut$EN;

  // register topA_convert_readReg
  reg topA_convert_readReg;
  wire topA_convert_readReg$D_IN, topA_convert_readReg$EN;

  // register topA_convert_readdatavalidIn
  reg topA_convert_readdatavalidIn;
  wire topA_convert_readdatavalidIn$D_IN, topA_convert_readdatavalidIn$EN;

  // register topA_convert_state
  reg [1 : 0] topA_convert_state;
  wire [1 : 0] topA_convert_state$D_IN;
  wire topA_convert_state$EN;

  // register topA_convert_writeReg
  reg topA_convert_writeReg;
  wire topA_convert_writeReg$D_IN, topA_convert_writeReg$EN;

  // ports of submodule srvread_dBuf
  wire [519 : 0] srvread_dBuf$D_IN, srvread_dBuf$D_OUT;
  wire srvread_dBuf$CLR,
       srvread_dBuf$DEQ,
       srvread_dBuf$EMPTY_N,
       srvread_dBuf$ENQ;

  // ports of submodule srvread_mBuf
  wire [101 : 0] srvread_mBuf$D_IN, srvread_mBuf$D_OUT;
  wire srvread_mBuf$CLR,
       srvread_mBuf$DEQ,
       srvread_mBuf$ENQ,
       srvread_mBuf$FULL_N;

  // ports of submodule topA_convert_readReqQ_a
  wire [16 : 0] topA_convert_readReqQ_a$D_IN, topA_convert_readReqQ_a$D_OUT;
  wire topA_convert_readReqQ_a$CLR,
       topA_convert_readReqQ_a$DEQ,
       topA_convert_readReqQ_a$ENQ;

  // ports of submodule topA_convert_readReqQ_m
  wire [2 : 0] topA_convert_readReqQ_m$D_IN, topA_convert_readReqQ_m$D_OUT;
  wire topA_convert_readReqQ_m$CLR,
       topA_convert_readReqQ_m$DEQ,
       topA_convert_readReqQ_m$EMPTY_N,
       topA_convert_readReqQ_m$ENQ,
       topA_convert_readReqQ_m$FULL_N;

  // ports of submodule topA_convert_readRespQ
  wire [2 : 0] topA_convert_readRespQ$D_IN;
  wire topA_convert_readRespQ$CLR,
       topA_convert_readRespQ$DEQ,
       topA_convert_readRespQ$EMPTY_N,
       topA_convert_readRespQ$ENQ;

  // ports of submodule topA_convert_readRespQ_d
  wire [519 : 0] topA_convert_readRespQ_d$D_IN,
		 topA_convert_readRespQ_d$D_OUT;
  wire topA_convert_readRespQ_d$CLR,
       topA_convert_readRespQ_d$DEQ,
       topA_convert_readRespQ_d$ENQ;

  // ports of submodule topA_convert_readTagQ
  wire [2 : 0] topA_convert_readTagQ$D_IN, topA_convert_readTagQ$D_OUT;
  wire topA_convert_readTagQ$CLR,
       topA_convert_readTagQ$DEQ,
       topA_convert_readTagQ$ENQ,
       topA_convert_readTagQ$FULL_N;

  // ports of submodule topA_convert_writeDataQ
  wire [519 : 0] topA_convert_writeDataQ$D_IN, topA_convert_writeDataQ$D_OUT;
  wire topA_convert_writeDataQ$CLR,
       topA_convert_writeDataQ$DEQ,
       topA_convert_writeDataQ$ENQ;

  // ports of submodule topA_convert_writeReqQ_a
  wire [16 : 0] topA_convert_writeReqQ_a$D_IN, topA_convert_writeReqQ_a$D_OUT;
  wire topA_convert_writeReqQ_a$CLR,
       topA_convert_writeReqQ_a$DEQ,
       topA_convert_writeReqQ_a$ENQ;

  // ports of submodule topA_convert_writeReqQ_m
  wire [2 : 0] topA_convert_writeReqQ_m$D_IN, topA_convert_writeReqQ_m$D_OUT;
  wire topA_convert_writeReqQ_m$CLR,
       topA_convert_writeReqQ_m$DEQ,
       topA_convert_writeReqQ_m$EMPTY_N,
       topA_convert_writeReqQ_m$ENQ;

  // ports of submodule topA_convert_writeRespQ
  wire [2 : 0] topA_convert_writeRespQ$D_IN;
  wire topA_convert_writeRespQ$CLR,
       topA_convert_writeRespQ$DEQ,
       topA_convert_writeRespQ$ENQ;

  // rule scheduling signals
  wire WILL_FIRE_RL_topA_convert_handleReq;

  // inputs to muxes for submodule ports
  wire [1 : 0] MUX_topA_convert_state$write_1__VAL_1;
  wire MUX_topA_convert_readReg$write_1__SEL_1;

  // value method topA_read
  assign topA_read = topA_convert_readReg ;

  // value method topA_write
  assign topA_write = topA_convert_writeReg ;

  // value method topA_address
  assign topA_address = topA_convert_addrReg ;

  // value method topA_writedata
  assign topA_writedata = topA_convert_dataOut ;

  // value method topA_burstcount
  assign topA_burstcount = 7'd1 ;

  // value method topA_byteenable
  assign topA_byteenable = 65'h1FFFFFFFFFFFFFFFF ;

  // value method read_txPort_txFull
  assign read_txFull =
	     !srvread_mBuf$FULL_N || !topA_convert_readReqQ_m$FULL_N ;

  // value method read_rxPort_rxEmpty
  assign read_rxEmpty = !srvread_dBuf$EMPTY_N ;

  // value method read_rxPort_rx
  assign read_rx_msg =
	     { srvread_dBuf$D_OUT,
	       srvread_mBuf$D_OUT[84:68],
	       srvread_mBuf$D_OUT[101:85],
	       srvread_mBuf$D_OUT[67:0] } ;

  // submodule srvread_dBuf
  SizedFIFO #(.p1width(32'd520),
	      .p2depth(32'd10),
	      .p3cntr_width(32'd4),
	      .guarded(32'd0)) srvread_dBuf(.RST(RST_N),
					    .CLK(CLK),
					    .D_IN(srvread_dBuf$D_IN),
					    .ENQ(srvread_dBuf$ENQ),
					    .DEQ(srvread_dBuf$DEQ),
					    .CLR(srvread_dBuf$CLR),
					    .D_OUT(srvread_dBuf$D_OUT),
					    .FULL_N(),
					    .EMPTY_N(srvread_dBuf$EMPTY_N));

  // submodule srvread_mBuf
  SizedFIFO #(.p1width(32'd102),
	      .p2depth(32'd10),
	      .p3cntr_width(32'd4),
	      .guarded(32'd0)) srvread_mBuf(.RST(RST_N),
					    .CLK(CLK),
					    .D_IN(srvread_mBuf$D_IN),
					    .ENQ(srvread_mBuf$ENQ),
					    .DEQ(srvread_mBuf$DEQ),
					    .CLR(srvread_mBuf$CLR),
					    .D_OUT(srvread_mBuf$D_OUT),
					    .FULL_N(srvread_mBuf$FULL_N),
					    .EMPTY_N());

  // submodule topA_convert_readReqQ_a
  SizedFIFO #(.p1width(32'd17),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd0)) topA_convert_readReqQ_a(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(topA_convert_readReqQ_a$D_IN),
						       .ENQ(topA_convert_readReqQ_a$ENQ),
						       .DEQ(topA_convert_readReqQ_a$DEQ),
						       .CLR(topA_convert_readReqQ_a$CLR),
						       .D_OUT(topA_convert_readReqQ_a$D_OUT),
						       .FULL_N(),
						       .EMPTY_N());

  // submodule topA_convert_readReqQ_m
  SizedFIFO #(.p1width(32'd3),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd0)) topA_convert_readReqQ_m(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(topA_convert_readReqQ_m$D_IN),
						       .ENQ(topA_convert_readReqQ_m$ENQ),
						       .DEQ(topA_convert_readReqQ_m$DEQ),
						       .CLR(topA_convert_readReqQ_m$CLR),
						       .D_OUT(topA_convert_readReqQ_m$D_OUT),
						       .FULL_N(topA_convert_readReqQ_m$FULL_N),
						       .EMPTY_N(topA_convert_readReqQ_m$EMPTY_N));

  // submodule topA_convert_readRespQ
  FIFO2 #(.width(32'd3), .guarded(32'd0)) topA_convert_readRespQ(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(topA_convert_readRespQ$D_IN),
								 .ENQ(topA_convert_readRespQ$ENQ),
								 .DEQ(topA_convert_readRespQ$DEQ),
								 .CLR(topA_convert_readRespQ$CLR),
								 .D_OUT(),
								 .FULL_N(),
								 .EMPTY_N(topA_convert_readRespQ$EMPTY_N));

  // submodule topA_convert_readRespQ_d
  FIFO2 #(.width(32'd520),
	  .guarded(32'd0)) topA_convert_readRespQ_d(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(topA_convert_readRespQ_d$D_IN),
						    .ENQ(topA_convert_readRespQ_d$ENQ),
						    .DEQ(topA_convert_readRespQ_d$DEQ),
						    .CLR(topA_convert_readRespQ_d$CLR),
						    .D_OUT(topA_convert_readRespQ_d$D_OUT),
						    .FULL_N(),
						    .EMPTY_N());

  // submodule topA_convert_readTagQ
  SizedFIFO #(.p1width(32'd3),
	      .p2depth(32'd32),
	      .p3cntr_width(32'd5),
	      .guarded(32'd0)) topA_convert_readTagQ(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(topA_convert_readTagQ$D_IN),
						     .ENQ(topA_convert_readTagQ$ENQ),
						     .DEQ(topA_convert_readTagQ$DEQ),
						     .CLR(topA_convert_readTagQ$CLR),
						     .D_OUT(topA_convert_readTagQ$D_OUT),
						     .FULL_N(topA_convert_readTagQ$FULL_N),
						     .EMPTY_N());

  // submodule topA_convert_writeDataQ
  SizedFIFO #(.p1width(32'd520),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd0)) topA_convert_writeDataQ(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(topA_convert_writeDataQ$D_IN),
						       .ENQ(topA_convert_writeDataQ$ENQ),
						       .DEQ(topA_convert_writeDataQ$DEQ),
						       .CLR(topA_convert_writeDataQ$CLR),
						       .D_OUT(topA_convert_writeDataQ$D_OUT),
						       .FULL_N(),
						       .EMPTY_N());

  // submodule topA_convert_writeReqQ_a
  SizedFIFO #(.p1width(32'd17),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd0)) topA_convert_writeReqQ_a(.RST(RST_N),
							.CLK(CLK),
							.D_IN(topA_convert_writeReqQ_a$D_IN),
							.ENQ(topA_convert_writeReqQ_a$ENQ),
							.DEQ(topA_convert_writeReqQ_a$DEQ),
							.CLR(topA_convert_writeReqQ_a$CLR),
							.D_OUT(topA_convert_writeReqQ_a$D_OUT),
							.FULL_N(),
							.EMPTY_N());

  // submodule topA_convert_writeReqQ_m
  SizedFIFO #(.p1width(32'd3),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd0)) topA_convert_writeReqQ_m(.RST(RST_N),
							.CLK(CLK),
							.D_IN(topA_convert_writeReqQ_m$D_IN),
							.ENQ(topA_convert_writeReqQ_m$ENQ),
							.DEQ(topA_convert_writeReqQ_m$DEQ),
							.CLR(topA_convert_writeReqQ_m$CLR),
							.D_OUT(topA_convert_writeReqQ_m$D_OUT),
							.FULL_N(),
							.EMPTY_N(topA_convert_writeReqQ_m$EMPTY_N));

  // submodule topA_convert_writeRespQ
  FIFO2 #(.width(32'd3), .guarded(32'd0)) topA_convert_writeRespQ(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(topA_convert_writeRespQ$D_IN),
								  .ENQ(topA_convert_writeRespQ$ENQ),
								  .DEQ(topA_convert_writeRespQ$DEQ),
								  .CLR(topA_convert_writeRespQ$CLR),
								  .D_OUT(),
								  .FULL_N(),
								  .EMPTY_N());

  // rule RL_topA_convert_handleReq
  assign WILL_FIRE_RL_topA_convert_handleReq =
	     (topA_convert_state == 2'd1 || topA_convert_state == 2'd2) &&
	     !topA_waitrequest ;

  // inputs to muxes for submodule ports
  assign MUX_topA_convert_readReg$write_1__SEL_1 =
	     topA_convert_state == 2'd0 &&
	     (topA_convert_writeReqQ_m$EMPTY_N ||
	      topA_convert_readReqQ_m$EMPTY_N &&
	      topA_convert_readTagQ$FULL_N) ;
  assign MUX_topA_convert_state$write_1__VAL_1 =
	     topA_convert_writeReqQ_m$EMPTY_N ? 2'd2 : 2'd1 ;

  // register regsetRd_addr_read
  assign regsetRd_addr_read$D_IN = setRd_addr_read ;
  assign regsetRd_addr_read$EN = 1'd1 ;

  // register topA_convert_addrReg
  assign topA_convert_addrReg$D_IN =
	     topA_convert_writeReqQ_m$EMPTY_N ?
	       topA_convert_writeReqQ_a$D_OUT :
	       topA_convert_readReqQ_a$D_OUT ;
  assign topA_convert_addrReg$EN = MUX_topA_convert_readReg$write_1__SEL_1 ;

  // register topA_convert_dataIn
  assign topA_convert_dataIn$D_IN = topA_readdata ;
  assign topA_convert_dataIn$EN = 1'd1 ;

  // register topA_convert_dataOut
  assign topA_convert_dataOut$D_IN =
	     topA_convert_writeReqQ_m$EMPTY_N ?
	       topA_convert_writeDataQ$D_OUT :
	       520'd0 ;
  assign topA_convert_dataOut$EN = MUX_topA_convert_readReg$write_1__SEL_1 ;

  // register topA_convert_readReg
  assign topA_convert_readReg$D_IN =
	     MUX_topA_convert_readReg$write_1__SEL_1 &&
	     !topA_convert_writeReqQ_m$EMPTY_N ;
  assign topA_convert_readReg$EN =
	     MUX_topA_convert_readReg$write_1__SEL_1 ||
	     WILL_FIRE_RL_topA_convert_handleReq ;

  // register topA_convert_readdatavalidIn
  assign topA_convert_readdatavalidIn$D_IN = topA_readdatavalid ;
  assign topA_convert_readdatavalidIn$EN = 1'd1 ;

  // register topA_convert_state
  assign topA_convert_state$D_IN =
	     MUX_topA_convert_readReg$write_1__SEL_1 ?
	       MUX_topA_convert_state$write_1__VAL_1 :
	       2'd0 ;
  assign topA_convert_state$EN =
	     MUX_topA_convert_readReg$write_1__SEL_1 ||
	     WILL_FIRE_RL_topA_convert_handleReq ;

  // register topA_convert_writeReg
  assign topA_convert_writeReg$D_IN =
	     MUX_topA_convert_readReg$write_1__SEL_1 &&
	     topA_convert_writeReqQ_m$EMPTY_N ;
  assign topA_convert_writeReg$EN =
	     MUX_topA_convert_readReg$write_1__SEL_1 ||
	     WILL_FIRE_RL_topA_convert_handleReq ;

  // submodule srvread_dBuf
  assign srvread_dBuf$D_IN = topA_convert_readRespQ_d$D_OUT ;
  assign srvread_dBuf$ENQ = topA_convert_readRespQ$EMPTY_N ;
  assign srvread_dBuf$DEQ = EN_read_rxPop ;
  assign srvread_dBuf$CLR = 1'b0 ;

  // submodule srvread_mBuf
  assign srvread_mBuf$D_IN = read_tx_msg[101:0] ;
  assign srvread_mBuf$ENQ = EN_read_tx ;
  assign srvread_mBuf$DEQ = EN_read_rxPop ;
  assign srvread_mBuf$CLR = 1'b0 ;

  // submodule topA_convert_readReqQ_a
  assign topA_convert_readReqQ_a$D_IN =
	     read_tx_msg[50:34] + regsetRd_addr_read ;
  assign topA_convert_readReqQ_a$ENQ = EN_read_tx ;
  assign topA_convert_readReqQ_a$DEQ =
	     topA_convert_state == 2'd0 &&
	     !topA_convert_writeReqQ_m$EMPTY_N &&
	     topA_convert_readReqQ_m$EMPTY_N &&
	     topA_convert_readTagQ$FULL_N ;
  assign topA_convert_readReqQ_a$CLR = 1'b0 ;

  // submodule topA_convert_readReqQ_m
  assign topA_convert_readReqQ_m$D_IN = 3'd0 ;
  assign topA_convert_readReqQ_m$ENQ = EN_read_tx ;
  assign topA_convert_readReqQ_m$DEQ =
	     topA_convert_state == 2'd0 &&
	     !topA_convert_writeReqQ_m$EMPTY_N &&
	     topA_convert_readReqQ_m$EMPTY_N &&
	     topA_convert_readTagQ$FULL_N ;
  assign topA_convert_readReqQ_m$CLR = 1'b0 ;

  // submodule topA_convert_readRespQ
  assign topA_convert_readRespQ$D_IN = topA_convert_readTagQ$D_OUT ;
  assign topA_convert_readRespQ$ENQ = topA_convert_readdatavalidIn ;
  assign topA_convert_readRespQ$DEQ = topA_convert_readRespQ$EMPTY_N ;
  assign topA_convert_readRespQ$CLR = 1'b0 ;

  // submodule topA_convert_readRespQ_d
  assign topA_convert_readRespQ_d$D_IN = topA_convert_dataIn ;
  assign topA_convert_readRespQ_d$ENQ = topA_convert_readdatavalidIn ;
  assign topA_convert_readRespQ_d$DEQ = topA_convert_readRespQ$EMPTY_N ;
  assign topA_convert_readRespQ_d$CLR = 1'b0 ;

  // submodule topA_convert_readTagQ
  assign topA_convert_readTagQ$D_IN = topA_convert_readReqQ_m$D_OUT ;
  assign topA_convert_readTagQ$ENQ =
	     topA_convert_state == 2'd0 &&
	     !topA_convert_writeReqQ_m$EMPTY_N &&
	     topA_convert_readReqQ_m$EMPTY_N &&
	     topA_convert_readTagQ$FULL_N ;
  assign topA_convert_readTagQ$DEQ = topA_convert_readdatavalidIn ;
  assign topA_convert_readTagQ$CLR = 1'b0 ;

  // submodule topA_convert_writeDataQ
  assign topA_convert_writeDataQ$D_IN = 520'h0 ;
  assign topA_convert_writeDataQ$ENQ = 1'b0 ;
  assign topA_convert_writeDataQ$DEQ =
	     topA_convert_state == 2'd0 && topA_convert_writeReqQ_m$EMPTY_N ;
  assign topA_convert_writeDataQ$CLR = 1'b0 ;

  // submodule topA_convert_writeReqQ_a
  assign topA_convert_writeReqQ_a$D_IN = 17'h0 ;
  assign topA_convert_writeReqQ_a$ENQ = 1'b0 ;
  assign topA_convert_writeReqQ_a$DEQ =
	     topA_convert_state == 2'd0 && topA_convert_writeReqQ_m$EMPTY_N ;
  assign topA_convert_writeReqQ_a$CLR = 1'b0 ;

  // submodule topA_convert_writeReqQ_m
  assign topA_convert_writeReqQ_m$D_IN = 3'h0 ;
  assign topA_convert_writeReqQ_m$ENQ = 1'b0 ;
  assign topA_convert_writeReqQ_m$DEQ =
	     topA_convert_state == 2'd0 && topA_convert_writeReqQ_m$EMPTY_N ;
  assign topA_convert_writeReqQ_m$CLR = 1'b0 ;

  // submodule topA_convert_writeRespQ
  assign topA_convert_writeRespQ$D_IN = topA_convert_writeReqQ_m$D_OUT ;
  assign topA_convert_writeRespQ$ENQ =
	     topA_convert_state == 2'd0 && topA_convert_writeReqQ_m$EMPTY_N ;
  assign topA_convert_writeRespQ$DEQ = 1'b0 ;
  assign topA_convert_writeRespQ$CLR = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        regsetRd_addr_read <= `BSV_ASSIGNMENT_DELAY 17'd0;
	topA_convert_addrReg <= `BSV_ASSIGNMENT_DELAY 17'd0;
	topA_convert_dataOut <= `BSV_ASSIGNMENT_DELAY 520'd0;
	topA_convert_readReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	topA_convert_readdatavalidIn <= `BSV_ASSIGNMENT_DELAY 1'd0;
	topA_convert_state <= `BSV_ASSIGNMENT_DELAY 2'd0;
	topA_convert_writeReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (regsetRd_addr_read$EN)
	  regsetRd_addr_read <= `BSV_ASSIGNMENT_DELAY regsetRd_addr_read$D_IN;
	if (topA_convert_addrReg$EN)
	  topA_convert_addrReg <= `BSV_ASSIGNMENT_DELAY
	      topA_convert_addrReg$D_IN;
	if (topA_convert_dataOut$EN)
	  topA_convert_dataOut <= `BSV_ASSIGNMENT_DELAY
	      topA_convert_dataOut$D_IN;
	if (topA_convert_readReg$EN)
	  topA_convert_readReg <= `BSV_ASSIGNMENT_DELAY
	      topA_convert_readReg$D_IN;
	if (topA_convert_readdatavalidIn$EN)
	  topA_convert_readdatavalidIn <= `BSV_ASSIGNMENT_DELAY
	      topA_convert_readdatavalidIn$D_IN;
	if (topA_convert_state$EN)
	  topA_convert_state <= `BSV_ASSIGNMENT_DELAY topA_convert_state$D_IN;
	if (topA_convert_writeReg$EN)
	  topA_convert_writeReg <= `BSV_ASSIGNMENT_DELAY
	      topA_convert_writeReg$D_IN;
      end
    if (topA_convert_dataIn$EN)
      topA_convert_dataIn <= `BSV_ASSIGNMENT_DELAY topA_convert_dataIn$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    regsetRd_addr_read = 17'h0AAAA;
    topA_convert_addrReg = 17'h0AAAA;
    topA_convert_dataIn =
	520'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    topA_convert_dataOut =
	520'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    topA_convert_readReg = 1'h0;
    topA_convert_readdatavalidIn = 1'h0;
    topA_convert_state = 2'h2;
    topA_convert_writeReg = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkReadAvalon

