`define ct 23 /**
This value will change depending of if it is
running on hardware or is on the board. 

0 = Simulation

23 = Implementation



*/

//Clock divider
module simpleDivider(clk100Mhz, slowClk, reset);
input clk100Mhz; //fast clock
output slowClk; //slow clock
input reset;
reg [27:0] counter;
//slow down clock divider
assign slowClk = counter[`ct];

always @ (posedge clk100Mhz)
begin
if (reset) begin
counter <= 0;
end else begin
counter <= counter + 1; //increment the counter every 10ns (1/100 Mhz)cycle.
end
end
endmodule