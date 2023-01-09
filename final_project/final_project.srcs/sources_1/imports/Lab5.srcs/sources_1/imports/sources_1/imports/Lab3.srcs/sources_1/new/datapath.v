`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 04:59:52 PM
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: we connect all of the modules that we have created with wires
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath(
    input clock,
    output  wire [31:0] pc,
    output  wire [31:0] dinstOut,
    output  wire ewreg,
    output  wire em2reg,
    output  wire ewmem,
    output  wire [3:0] ealuc,
    output  wire ealuimm,
    output  wire [4:0] edestReg,
    output  wire [31:0] eqa,
    output  wire [31:0] eqb,
    output  wire [31:0] eimm32,
    
    output  wire mwreg,
    output  wire mm2reg,
    output  wire mwmem,
    output  wire [4:0] mdestReg,
    output  wire [31:0] mr,
    output  wire [31:0] mqb,
    
    output wire wwreg,
    output wire wm2reg,
    output wire [4:0] wdestReg,
    output wire [31:0] wr,
    output wire [31:0] wdo,
    output wire [31:0] wbData,
    
    output wire [1:0] fwda, fwdb
    );
    
    wire [31:0] instOut;
    wire [31:0] next_pc;
    wire [5:0] op, func;
    wire wpcir;
    
    program_counter_register datapath_pc(next_pc,clock,pc); 
   
    //Start of IF
    pc_adder d_pca(pc,next_pc);
    instruction_memory d_im(pc, instOut); 
    ifid_pipeline_register d_ifid(wpcir,instOut,clock,dinstOut); // holds everything in this regesister for later
    
    //Start of ID
    wire regrt;
    wire [4:0]  ret, res;
    wire wreg,m2reg,wmeme,aluimm;
    wire [4:0] destReg;
    wire [3:0] aluc;
    wire [15:0] imm = dinstOut[15:0];
    wire [31:0] qa,qb,imm32;
    wire [4:0] rd = dinstOut[15:11];
    wire [4:0] rs = dinstOut[25:21];
    wire [4:0] rt = dinstOut[20:16];
    
    wire [31:0] b, r;
    
    wire [31:0] mdo;
    
    wire [31:0] pfqa, pfqb;

    
    control_unit d_control_unit(dinstOut[31:26],dinstOut[5:0],
                                rs, rt, 
                                mdestReg, mm2Reg, mwreg, 
                                edestReg, em2reg, ewreg,
                                wreg,m2reg,wmem,aluc,aluimm,regrt,wpcir,
                                fwdb, fwda);                                    //changed in final
                                
                                
    
    
                            
    regrt_mux d_regrt_mux(rt,rd,regrt,destReg);
    register_file d_register_file(rs,rt,wdestReg,wbData,wwreg,clock, qa,qb);    //changed in lab 5   
    
    
    
    
    
    immediate_extender d_immediate_extender(imm,imm32);
    
    
    
    idexe_pipeline_register d_id_exe(wreg,m2reg,wmem,aluc,aluimm,destReg,pfqa,pfqb,imm32,clock,ewreg,em2reg,ewmem,ealuc,ealuimm,edestReg,eqa,eqb,eimm32);
    
    
    //Start of EXE
    
    
    
    alu_mux                  alum(eqb,eimm32,ealuimm,b);
    alu                      ealu(eqa,b,ealuc,r);
    EXEMEM_pipeline_register exemem(ewreg,em2reg,ewmem,edestReg,r,eqb,clock,mwreg,mm2reg,mwmem,mdestReg,mr,mqb);
    
    
    
    //Start of MEM
    
    data_memory              dm(mr, mqb, mwmem, clock, mdo);
    MEMWB_pipeline_register  memwb(mwreg,mm2reg,mdestReg,mr,mdo,clock,wwreg,wm2reg,wdestReg,wr,wdo);
    
    
    //Start of WB
    
    wb_mux wbmux(wr,wdo,wm2reg,wbData);
    
    a_mux amux(fwda,qa,r,mr,mdo,pfqa);
    b_mux bmux(fwdb,qb,r,mr,mdo,pfqb);
    
    
endmodule
