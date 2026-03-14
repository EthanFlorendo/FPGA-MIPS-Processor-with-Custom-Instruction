module top(input        clk100Mhz, reset, halt,
           //output  [31:0] writedata, dataadr, 
           //output         memwrite,
           output [7:0]   regOut
           );

  //make unused address bus and data bus wires
  wire  [31:0] writedata, dataadr;
  wire         memwrite;


  wire [31:0] pc, instr, readdata;
  
  
  //add clock divider
  wire clk;
  simpleDivider clkDiv(clk100Mhz,clk,reset);
  
  // instantiate processor and memories
  mips mips(clk, reset, halt, pc, instr, memwrite, dataadr, 
            writedata, readdata, regOut);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, dataadr, writedata, readdata);
  
endmodule