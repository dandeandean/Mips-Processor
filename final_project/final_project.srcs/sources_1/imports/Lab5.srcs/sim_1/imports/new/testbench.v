`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: dan dean
// 
// Create Date: 10/25/2022 09:56:16 AM
// Design Name: 
// Module Name: testbench
// Project Name: lab3
// Target Devices: 
// Tool Versions: 
// Description: testing the bench
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench();

reg clk;
initial  clk <= 0;
                                    
//wires for fetch & decode
wire [31:0] pc, dinstOut, eqa, eqb,eimm32;
wire ewreg, em2reg, ewmem, ealuimm;
wire [3:0] ealuc;
wire [4:0] edestReg;

//wires for mem

wire mwreg, mm2reg, mwmem;
wire [4:0] mdestReg;
wire [31:0] mr, mqb;
    
    
// for write
wire wwreg,wm2reg;
wire[4:0] wdestReg;
wire[31:0] wr, wdo, wbData;


// fowarding 
wire [1:0] fwda, fwdb;


datapath dp(clk, 
            pc, dinstOut, ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32,
            mwreg,mm2reg,mwmem,mdestReg,mr,mqb,
            wwreg,wm2reg,wdestReg,wr,wdo,wbData,
            fwda,fwdb);

always begin 

    #5;
    
    clk = ~clk;
 end

endmodule
