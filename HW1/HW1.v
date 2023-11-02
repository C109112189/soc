`timescale 1ns / 1ps
module HW2(led_o,clk,rst);
    input clk,rst;
    output [7:0] led_o;
    wire divclk;
    div div_1(divclk,clk,rst);
    led led_1(divclk,rst,led_o);

endmodule

module div(divclk,clk,rst);
	output divclk;
	input clk,rst;
	reg [27:0]divclkcnt;
	
	assign divclk=divclkcnt[23];
	
	always@(posedge clk or negedge rst)begin
		if(rst)
			divclkcnt = 0;
		else
			divclkcnt = divclkcnt + 1;
	end
endmodule

module led(clk,rst,led_o);
    input clk,rst;
    output reg [7:0]led_o;
    
    always@(posedge clk or negedge rst )begin
        if(rst)
            led_o<=8'd0;
        else
            led_o<=led_o + 1;
    end
endmodule
