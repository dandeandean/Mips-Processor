`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 06:03:01 PM
// Design Name: 
// Module Name: b_mux
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


module b_mux(
    input [1:0] fwdb,
    input [31:0] qb,
    input [31:0] er,
    input [31:0] mr,
    input [31:0] do,
    output reg [31:0] b
    );
    always @(*) begin 
        case(fwdb) 
            2'b00: b <= qb;
            2'b01: b <= er;
            2'b10: b <= mr;
            2'b11: b <= do;
        endcase
    end
endmodule
