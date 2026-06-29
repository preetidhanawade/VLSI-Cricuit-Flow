module dff1(q,qb,clk,rst,din);
input clk,rst,din;
output reg q;
output qb;
always @(posedge clk or posedge rst)
begin
if(rst)
q<=1’b0;
else
q<=din;
end
assign qb= ~q;
endmodule
//test bench//
module dff_t;
reg clk,din,rst;
wire q,qb;
dff1 U1(q,qb,clk,rst,din);
initial
clk=1’b0;
always
#10 clk=~clk;
initial
begin
din=1’b0;
rst=1’b1;
#20 rst=1’b0’
#10 din=1’b1;
#15  rst=1’b1;
#18 din=1’b0
#1 din=1’b1;
#20 din=1’b0;
#10 $finish;
end
endmodule
