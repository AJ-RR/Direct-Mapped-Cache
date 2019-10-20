module MainMemory(input clk,input [31:0] address,output reg [31:0] data);
always @(posedge clk)
begin
	data <= address;
end
endmodule
