module cache_tb();
reg clk;
reg [31:0] input_address;
wire [31:0] Hitcount;
wire [31:0] Misscount;
integer temp;
integer i;
driver uut(
	.clk(clk),
	.address(input_address),
	.Misscount(Misscount)
);

initial begin
	$dumpfile("cacheResult.vcd");
	$dumpvars(0,cache_tb);
	i = $fopen("gcc.txt","r");
	clk = 0;
	uut.Misscount = 0;
	
	while(!$feof(i)) begin
		temp = $fscanf(i,"%h\n",input_address);
		#8;
	end
	$fclose(i);
	$finish;
end
always begin
	#2 clk = ~clk;
	$display("clk=%b",clk,"misscount=%d",Misscount);
end
endmodule

			
