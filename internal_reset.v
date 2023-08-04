module internal_reset(
	input rst,
    input        clk,
    output reg   reset
);
parameter cnt_cmp = 24'd5000000;
reg [23:0] clk_cnt;

always @(posedge clk or negedge rst) begin
	 if(!rst)
		clk_cnt <= 0;
    else if(clk_cnt < cnt_cmp)  
        clk_cnt <= clk_cnt + 1;
    else if(clk_cnt == cnt_cmp)  
        clk_cnt <= clk_cnt;
    else 
        clk_cnt <= 0;
end

always @(posedge clk) begin
    if(clk_cnt == cnt_cmp)
        reset <= 1'b1;
    else
        reset <= 0;
end

endmodule