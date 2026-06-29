module adder4 ( carryin,x,y,sum,carryout);
 input carryin;
 input [3:0] x,y;
 output [4:0] sum;
 output carryout;
 fulladd stage0 (carryin,x[0],y[0],sum[0],c1);
 fulladd stage1 (c1,x[1],y[1],sum[1],c2);
 fulladd stage2 (c2,x[2],y[2],sum[2],c3);
 fulladd stage3 (c3,x[3],y[3],sum[3],carryout);
 assign  sum[4]=carryout;
 endmodule

Testbench:
 module adder4_t ;
 reg [3:0] x,y;
 reg carryin;
 wire [4:0] sum;
 wire carryout;
 adder4 a1 (carryin,x,y,sum,carryout);
 initial
 begin
 x = 4'b0000; y= 4'b0000;carryin = 1'b0;
 #20 x =4'b1111; y = 4'b1010;
 #40 x =4'b1011; y =4'b0110;
 #40 x =4'b1111; y=4'b1111;
 #50 $finish;
 end
 endmodule

 module fulladd (cin,x,y,s,cout);
 input cin,x,y;
 output s,cout;
 assign s = x^y^cin;
 assign cout =( x & y) | (x & cin) |( y & cin);
 endmodule
