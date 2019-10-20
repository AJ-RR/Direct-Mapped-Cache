module Cache512(input clk,input [31:0] address,output reg [31:0] cacheOutput,output reg result,input hit256);
// 1(valid bit) + 20(tag bits) + 512(16 words of 32 bits each)
reg [533:0] cache[0:511];
reg [18:0] tag;
reg [8:0] index;
reg [3:0] blockOffset;
always @(posedge clk)
begin
	tag <= address[31:13];
	index <= address[12:4];
	blockOffset <= address[3:0];
	if(tag == cache[index][532:514])
	begin
		//cacheOutput<= cache[index][blockOffset*32+31-:32];
		result <= 1; //hit
	end
	else
	begin
		if(hit256 == 0)
		begin
		cache[index][532:514] = tag;
		result <= 0; //miss
	       	end
	end 
end

endmodule

