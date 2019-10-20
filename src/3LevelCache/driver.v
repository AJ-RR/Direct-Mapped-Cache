`include "Cache1024.v"
`include "Cache512.v"
`include "Cache.v"
`include "MainMemory.v"
module driver(input [31:0] data,input clk,input [31:0] address,input hit256,input hit512,output reg [31:0] Misscount,output reg [31:0] Hitcount);

Cache cache(clk,address,data,hit256);
Cache512 cache512(clk,address,data,hit512,hit256);
Cache1024 cache1024(clk,address,data,hit1024,hit512,hit256);
MainMemory main_memory(clk,address,data);
always @(posedge clk)
begin
	/*if(hit == 1)
	begin	
		Hitcount <= Hitcount + 1;
	end
	else
	begin
		Misscount <= Misscount + 1 ;
				
	end*/
	if(hit256 == 0 && hit512 == 0 && hit1024 == 0)
	begin
		Misscount <= Misscount + 1;
	end
end
endmodule
