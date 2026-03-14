module imem(input   [5:0] a,
            output  [31:0] rd);

  reg [31:0] RAM[63:0];

  initial
  // Write the directory path to the ISA instructions
  //just add the file
      $readmemh("LEDLOOP.mem",RAM);
  

  assign rd = RAM[a]; // word aligned
endmodule