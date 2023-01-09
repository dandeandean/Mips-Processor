`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2022 02:06:19 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input [31:0] mr,  //address in mem
    input [31:0] mqb, //the actual data to write
    input mwmem,      //write enable
    input clock,
    output reg [31:0] mdo //data read from out data mem @ mr
    );
    //if mwmem -> memory[mr] = mqb
    reg [31:0] data [0:63];
    initial begin
    data[32'h00000000] <= 32'hA00000AA ;
    data[32'h00000001] <= 32'h10000011 ;
    data[32'h00000002] <= 32'h20000022 ;
    data[32'h00000003] <= 32'h30000033 ;
    data[32'h00000004] <= 32'h40000044 ;
    data[32'h00000005] <= 32'h50000055 ;
    data[32'h00000006] <= 32'h60000066 ;
    data[32'h00000007] <= 32'h70000077 ;
    data[32'h00000008] <= 32'h80000088 ;
    data[32'h00000009] <= 32'h90000099 ;
    end
    //for reading
    always @(*) begin
        mdo <= data[mr>>2]; // we need to shift right by two so that we access the correct data address
    end
    
    //for writing
    always @ (negedge clock) begin
        if (mwmem)begin
         data[mr>>2] <= mqb; 
        end
    end
endmodule
