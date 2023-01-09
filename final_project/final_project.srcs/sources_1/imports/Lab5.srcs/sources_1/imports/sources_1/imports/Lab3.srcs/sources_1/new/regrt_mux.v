`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:04:21 AM
// Design Name: 
// Module Name: regrt_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//          mux that decides destReg
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module regrt_mux(
    input [4:0] rt,
    input [4:0] rd,
    input regrt,
    output reg [4:0] destReg
    );

    always @(*)begin
    case(regrt)
        
        1'b0:begin 
            destReg <= rd;
        end
        1'b1:begin
            destReg <= rt;
        end
    endcase
    
    end
endmodule
