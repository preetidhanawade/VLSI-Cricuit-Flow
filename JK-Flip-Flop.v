module jk_ff(q,qbar,clk,rst,j,k);
input clk,rst,j,k;
output q,qbar;
reg q,tq;
always@(posedge clk or negedge rst)
begin
if(!rst)
begin
q<=1'b0;
tq<=1'b0;
end
else
begin
if(j==1'b1 && k==1'b0)
q<=j;
else if(j==1'b0 && k==1'b1)
q<=1'b0;
else if(j==1'b1 && k==1'b1);
begin
tq<=~tq;
q<=tq;
end
end
end
assign qbar=~q;
endmodule
//Testbench//
module jk_ff_test;
reg clk,rst,j,k;
wire q,qbar;
jk_ff inst(q,qbar,clk,rst,j,k);
initial
clk=1'b0;
always 
#10 clk=~clk;
initial
begin
j=1'b0;k=1'b0;rst=1'b0;
#30 rst=1'b1;
#60 k=1'b1;
#29 j=1'b1;
#15 k=1'b1;
#20 j=1'b0;
#40 j=1'b1;
#25 k=1'b0;
#5 j=1'b0;
#50 rst=1'b0;
#10 $finish;
end
endmodule
