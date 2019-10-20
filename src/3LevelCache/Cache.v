module Cache(input clk,input [31:0] address,output reg [31:0] cacheOutput,output reg result);
// 1(valid bit) + 20(tag bits) + 512(16 words of 32 bits each)
reg valid;
reg [533:0] cache[0:255];
reg [19:0] tag;
reg [7:0] index;
reg [3:0] blockOffset;

always @(posedge clk)
begin
	tag <= address[31:12];
	index <= address[11:4];
	blockOffset <= address[3:0];
	valid <= cache[index][533:533];
	if(tag == cache[index][532:513] && valid == 1'b1)
	begin
		//cacheOutput<= cache[index][blockOffset*32+31-:32];
		result <= 1; //hit
	end
	else
	begin
		cache[index][532:513] = tag;
		cache[index][533:533] = 1'b1;
		result <= 0; //miss
	       		
	end 
end

endmodule

