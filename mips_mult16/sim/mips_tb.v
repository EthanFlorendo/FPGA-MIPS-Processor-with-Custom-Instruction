`timescale 1ns/1ns
module mips_testbench;
 reg CLK;
 reg RST;
 parameter N = 10;
 reg[31:0] expected[N:1];
 wire[31:0] WData;
 wire[31:0] DAddr; 
 wire MemWrite;
 
 integer i;
 top uProc_Inst(CLK, RST, WData, DAddr, MemWrite); 
 
always #10 CLK = ~CLK;

initial begin
 expected[1] = 32'h00000006; // $1 content=6 decimal
 expected[2] = 32'h00000012; // $2 content=18 decimal
 expected[3] = 32'h00000018; // $3 content=24 decimal
 expected[4] = 32'h0000000C; // $4 content=12 decimal
 expected[5] = 32'h00000002; // $5 content=2
 expected[6] = 32'h00000016; // $6 content=22 decimal
 expected[7] = 32'h00000001; // $7 content=1
  expected[8] = 32'h00000120; // $8 = 288 = 6 * 48 (example mult)
 expected[9] = 32'h00000003; // $9 content=3
expected[10] = 32'h00000070; // $10 = 112 = result from mult
 CLK = 0;
end

initial begin
 RST = 1;
 @(posedge CLK); //wait until posedge CLK
 RST = 0; //deassert RESET
for(i = 1; i <= N; i = i+1) begin
 @(posedge MemWrite); // When a store word is executed
 @(negedge CLK);
 if (WData != expected[i])
 $display("Output mismatch: got %d, expect %d", WData, expected[i]);
 end
 $display("Testing Finished:");
 $stop;
end
endmodule