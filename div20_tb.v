`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/01 23:12:11
// Design Name: 
// Module Name: div32_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module div20_tb;

     reg                 clk;
     reg                 rst;
     reg                 signed_div_i;
     reg[31:0]           opdata1_i;
     reg[31:0]           opdata2_i;
     reg                 start_i;    
     wire[63:0]          result_o;
     wire                ready_o;
     
initial
     begin
        clk = 1'b0;
        forever #5 clk = ~clk;
     end
     
initial 
     begin 
        #0       rst          = `RstEnable; // 1 / 2  = 0 余1
        #10      rst          = `RstDisable;
                 signed_div_i = 1'b0;
                 opdata1_i    = 32'b1;
                 opdata2_i    = 32'b10;
                 start_i      = `DivStart;
                 
        #300     rst          = `RstEnable; // 9 / 5 = 1 余4
        #10      rst          = `RstDisable;
                 signed_div_i = 1'b0;
                 opdata1_i    = 32'b1001;
                 opdata2_i    = 32'b0101;
                 start_i      = `DivStart;
        
        #300     rst          = `RstEnable; // 0x440d8492 / 0x56518478 
        #10      rst          = `RstDisable;
                 signed_div_i = 1'b0;
                 opdata1_i    = 32'h440d8492;
                 opdata2_i    = 32'h56518478;
                 start_i      = `DivStart;
                 
        #300     rst          = `RstEnable; // 9 / 5 ，
        #10      rst          = `RstDisable;
                 signed_div_i = 1'b0;
                 opdata1_i    = 32'b1001;
                 opdata2_i    = 32'b0101;
                 start_i      = `DivStart;
                
        #30      rst          = `RstEnable; // 商1余1 ，
        #10      rst          = `RstDisable;
                 signed_div_i = 1'b0;
                 opdata1_i    = 32'b11000000000000000000000000000001;
                 opdata2_i    = 32'b11000000000000000000000000000000;
                 start_i      = `DivStart;
             
        #30      rst          = `RstEnable;
        #10      rst          = `RstDisable;
                 signed_div_i = 1'b1;
                 opdata1_i    = 32'hfffffff9;
                 opdata2_i    = 32'b0100;
                 start_i      = `DivStart;                              
                                  
                 
     end
     
div20_1 inst(
    .clk(clk),
    .rst(rst),
    .signed_div_i(signed_div_i),
    .opdata1_i(opdata1_i),
    .opdata2_i(opdata2_i),
    .start_i(start_i),

    .result_o(result_o),
    .ready_o(ready_o)   
);
     
endmodule
