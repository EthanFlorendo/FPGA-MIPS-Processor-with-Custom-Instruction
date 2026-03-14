module flopr #(parameter WIDTH = 8)
              (input              clk, reset, halt,
               input  [WIDTH-1:0] d, 
               output reg [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else  if (~halt)    q <= d;
    else q <= q; //this is halt
endmodule