module Cache1024(input clk,input [31:0] address,output reg [31:0] cacheOutput,output reg result,input hit512,input hit256);
// 1(valid bit) + 20(tag bits) + 512(16 words of 32 bits each)
reg [533:0] cache[0:1023];
reg [17:0] tag;
reg [9:0] index;
reg [3:0] blockOffset;
always @(posedge clk)
begin
	tag <= address[31:14];
	index <= address[13:4];
	blockOffset <= address[3:0];
	if(tag == cache[index][532:515])
	begin
		//cacheOutput<= cache[index][blockOffset*32+31-:32];
		result <= 1; //hit
	end
	else
	begin
		if(hit256 == 0 && hit512 == 0)
		begin
		cache[index][532:515] = tag;
		result <= 0; //miss
	       	end
	end 
end

endmodule

