module controller(input  [5:0] op, funct,
                  input        zero, halt,
                  output       memtoreg, memwrite,
                  output       pcsrc, alusrc,
                  output       regdst, regwrite,
                  output       jump,
                  output [2:0] alucontrol);

  wire [1:0] aluop;
  wire       branch;

  wire regwrite_int;

  assign regwrite = halt ? 0 : regwrite_int;
  //need to set the write functions to 0, dont use mem (lw or sw, so not necessary to change)
  //current code would corrupt memory lw sw

  maindec md(op, memtoreg, memwrite, branch,
             alusrc, regdst, regwrite_int, jump, aluop);
              
             
          aludec  ad(funct, aluop, alucontrol);
        
          assign pcsrc = branch & zero;
endmodule