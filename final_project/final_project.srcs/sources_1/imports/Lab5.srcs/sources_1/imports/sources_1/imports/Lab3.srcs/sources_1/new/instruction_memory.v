`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:39:09 AM
// Design Name: 
// Module Name: instruction_memory
// Project Name: final 
// Target Devices: 
// Tool Versions: 
// Description: 
// We keep the 2d memory array in here, which we index with the pc
// This is where we are keeping the instructions that are to be executed
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_memory(
    input [31:0] pc,
    output reg [31:0] instOut
    );
    reg [31:0] memory [0:63];
    initial begin //throws error outside of initial begin
        // final project instructions
        memory[25] <= 32'h00221820; //add   $3 $1 $2
        memory[26] <= 32'h01232022; //sub   $4 $9 $3
        memory[27] <= 32'h00692825; //or    $5 $3 $9
        memory[28] <= 32'h00693026; //xor   $6 $3 $9
        memory[29] <= 32'h00693824; //and   $7 $3 $9
    end
    always @(*)begin
        instOut <= memory[pc[7:2]]; //we only need 6 bits to address 63:0
    end
endmodule
