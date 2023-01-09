`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:06:11 AM
// Design Name: 
// Module Name: register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//     This is where the registers are kept, we index them with rs & rt
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_file(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] wdestReg,    //added in lab5
    input [31:0] wbData,     //added in lab5
    input wwreg,             //added in lab5
    input clock,             //changed in final to be a single bit
    output reg [31:0] qa,
    output reg [31:0] qb
    );
    reg [31:0] registers [0:31];
    reg [4:0] i;
    initial begin
        for (i = 0; i < 32; i = i +1) begin 
            registers[i] <= 32'h00000000;
        end
        registers[32'h00000000] <= 32'hA00000AA ;
        registers[32'h00000001] <= 32'hA00000AA ;
        registers[32'h00000002] <= 32'h10000011 ;
        registers[32'h00000003] <= 32'h20000022 ;
        registers[32'h00000004] <= 32'h30000033 ;
        registers[32'h00000005] <= 32'h40000044 ;
        registers[32'h00000006] <= 32'h50000055 ;
        registers[32'h00000007] <= 32'h60000066 ;
        registers[32'h00000008] <= 32'h70000077 ;
        registers[32'h00000009] <= 32'h80000088 ;
        registers[32'h0000000A] <= 32'h90000099 ;
    end
    always @(negedge clock) begin 
        if (wwreg) registers[wdestReg] <= wbData; // set data
    end
    always  @(*) begin
        qa <= registers[rs]; 
        qb <= registers[rt];
    end
endmodule
