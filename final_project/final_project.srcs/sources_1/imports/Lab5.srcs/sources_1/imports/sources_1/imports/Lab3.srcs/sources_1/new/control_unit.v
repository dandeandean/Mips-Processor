`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:03:14 AM
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: given the op and func, we calculate which wires need to be high vs low 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
    input [5:0] op,
    input [5:0] func,
    
    //final inputs
    input [4:0] rs,
    input [4:0] rt,
    
    input [4:0] mdestReg,    
    input  mm2reg,
    input  mwreg,
    
    input [4:0] edestReg,
    input em2reg,
    input ewreg,
    
    output reg wreg, //writing to register?
    output reg m2reg, //are we writing from mem into a register?
    output reg wmem, //are we writing to memory
    output reg [3:0] aluc, // ALU code
    output reg aluimm, //means we are going to use the immediate
    output reg regrt, //address in rt rahter than rd
    
    output reg wpcir, 
    //forwarding 
    output reg [1:0] fwdb,
    output reg [1:0] fwda
    );
    parameter LW    = 6'b100011,
              SW    = 6'b101011,
              BEQ   = 6'b000100,
              RTYPE = 6'b000000,
              ADD   = 6'b100000,
              SUB   = 6'b100010,
              OR    = 6'b100101,
              XOR   = 6'b100110,
              AND   = 6'b100100,
              SLL   = 6'b000000, //This may cause a problem with RTYPE
              SRL   = 6'b000010,
              SRA   = 6'b000011,
              JR    = 6'b001000,
              T  = 1'b1,
              F  = 1'b0 ; //from ZYBOOK 4.14
    always @ (*) begin
        wpcir <=1;

    	case (rs)
        	edestReg: begin
        	   if (ewreg && em2reg)  fwda <= 3;
            	else if (edestReg)   fwda <= 1;
            	else                 fwda <= 0; 
        	end
        	mdestReg: begin
        	   if(mwreg && mm2reg)   fwda <= 3;
            	else if (edestReg)   fwda <= 2;
            	else                 fwda <= 0; 
        	end
        	default:                 fwda <= 0;
    	endcase
    	case (rt)
        	edestReg: begin
        	   if (ewreg && em2reg)  fwdb <= 3;
            	else if (edestReg)   fwdb <= 1;
            	else                 fwdb <= 0; 
        	end
        	mdestReg: begin
        	   if(mwreg && mm2reg)   fwdb <= 3;
            	else if (edestReg)   fwdb <= 2;
            	else                 fwdb <= 0; 
        	end
        	default:                 fwdb <= 0;
    	endcase
     
        case(op)
            RTYPE:
                begin
                //This is where we will put the R type instructions
                    case(func)
                        ADD: begin
                        //add logic
                            wreg   <= T;
                            m2reg  <= F;
                            wmem   <= F;
                            aluc   <= 4'b0010; // from 4.7.12 this is telling the ALU to add
                            aluimm <= F;       // changed in lab 5
                            regrt  <= F;       // changed in lab 5
                        end
                        SUB: begin
                        //sub logic
                            wreg   <= T;
                            m2reg  <= F;
                            wmem   <= F;
                            aluc   <= 4'b0110; // sub
                            aluimm <= F;       // changed in lab5    
                            regrt  <= F;       // changed in lab 5
                        end
                        OR: begin           //added in final
                            wreg   <= T;
                            m2reg  <= F;
                            wmem   <= F;
                            aluc   <= 4'b0001; // or
                            aluimm <= F;          
                            regrt  <= F;                         
                        end
                        XOR: begin          //added in final
                            wreg   <= T;
                            m2reg  <= F;
                            wmem   <= F;
                            aluc   <= 4'b1111; // xor
                            aluimm <= F;          
                            regrt  <= F;
                        end
                        AND: begin          //added in final
                            wreg   <= T;
                            m2reg  <= F;
                            wmem   <= F;
                            aluc   <= 4'b0000; // and
                            aluimm <= F;          
                            regrt  <= F;
                        end
                    endcase
                end
            LW: // this is lw
            begin
                wreg   <= T;
                m2reg  <= T;
                wmem   <= F;
                aluc   <= 4'b0010; // from 4.7.12 this is telling the ALU to add
                aluimm <= T;
                regrt  <= T;
            end
        endcase
    

    end
endmodule
