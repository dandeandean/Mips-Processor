`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2022 01:27:00 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] eqa,
    input [31:0] b,
    input [3:0] ealuc,
    output reg [31:0] r
    );
    parameter AND = 4'b0000,
              OR =  4'b0001,   
              ADD = 4'b0010,   
              SUB = 4'b0110,   
              SLT = 4'b0111,   
              NOR = 4'b1100,
              XOR = 4'b1111;   
  always @(*) begin
    case(ealuc)
        AND:  r<= eqa & b;     
        OR:   r<= eqa | b;
        ADD:  r<= eqa + b;      
        SUB:  r<= eqa - b;   
        XOR:  r<= eqa ^ b; //added in final
         endcase
      end
endmodule
