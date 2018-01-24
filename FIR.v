module FIR
(
    //系统时钟
	 CLK_50M,RST_N,
	 //SDRAM
	 SDRAM_ADDR,SDRAM_BA,SDRAM_CAS_N,SDRAM_CKE,SDRAM_CS_N,
	 SDRAM_DQ,SDRAM_DQM,SDRAM_RAS_N,SDRAM_WE_N,SDRAM_CLK,
	 //UART
	 UART_TX,UART_RX
);

//系统时钟和复位
input CLK_50M;
input RST_N;

//SDRAM
output [12:0] 	SDRAM_ADDR;
output [ 1:0] 	SDRAM_BA;
output        	SDRAM_CAS_N;
output        	SDRAM_CKE;
output        	SDRAM_CS_N;
inout  [15:0] 	SDRAM_DQ;
output [ 1:0] 	SDRAM_DQM;
output        	SDRAM_RAS_N;
output        	SDRAM_WE_N;
output        	SDRAM_CLK;

output UART_TX;
input  UART_RX;

wire CLK_100M;

PLL	         PLL_Init
(
	.inclk0     (CLK_50M   ),
	.c0         (CLK_100M  ),
	.c1         (SDRAM_CLK )
);

 CPU_qsys CPU_qsys_Init 
 (
	  .clk_clk             (CLK_100M   ), //           clk.clk
	  .reset_reset_n       (RST_N      ), //         reset.reset_n
	  .sdram_conduit_addr  (SDRAM_ADDR ), // sdram_conduit.addr
	  .sdram_conduit_ba    (SDRAM_BA   ), //              .ba
	  .sdram_conduit_cas_n (SDRAM_CAS_N), //              .cas_n
	  .sdram_conduit_cke   (SDRAM_CKE  ), //              .cke
	  .sdram_conduit_cs_n  (SDRAM_CS_N ), //              .cs_n
	  .sdram_conduit_dq    (SDRAM_DQ   ), //              .dq
	  .sdram_conduit_dqm   (SDRAM_DQM  ), //              .dqm
	  .sdram_conduit_ras_n (SDRAM_RAS_N), //              .ras_n
	  .sdram_conduit_we_n  (SDRAM_WE_N ), //              .we_n
	  .uart_conduit_rxd    (UART_TX    ), //  uart_conduit.rxd
	  .uart_conduit_txd    (UART_RX    )  //              .txd
 );

endmodule
