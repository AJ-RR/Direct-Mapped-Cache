`include "Cache.v"
`include "MainMemory.v"
module driver(input [31:0] data,input clk,input [31:0] address,input hit,output reg [31:0] Misscount,output reg [31:0] Hitcount);

Cache cache(clk,address,data,hit);
MainMemory main_memory(clk,address,data);
always @(posedge clk)
begin
	if(hit == 1)
	begin
		Hitcount <= Hitcount + 1;
	end
	else
	begin
		Misscount <= Misscount + 1 ;
				
	end
end
endmodule
