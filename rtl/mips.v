module mips(input         clk, reset, halt,
            output [31:0] pc,
            input  [31:0] instr,
            output        memwrite,
            output [31:0] aluout, writedata,
            input  [31:0] readdata,
            output [31:0] regOut);

  wire       memtoreg, alusrc, regdst, 
              regwrite, jump, pcsrc, zero;
  wire [2:0] alucontrol;

  controller c(instr[31:26], instr[5:0], zero, halt,
               memtoreg, memwrite, pcsrc,
               alusrc, regdst, regwrite, jump,
               alucontrol);
  datapath dp(clk, reset, halt, memtoreg, pcsrc,
              alusrc, regdst, regwrite, jump,
              alucontrol,
              zero, pc, instr,
              aluout, writedata, readdata, regOut);
endmodule