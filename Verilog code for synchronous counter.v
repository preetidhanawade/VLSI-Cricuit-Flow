module counter(clk,rst,m,count);
input clk,rst,m;
output reg [3:0]count;
always @(posedge clk or negedge rst)
begin 
if(!rst)
count=0;
else if(m)
count=count+1;
else
count=count-1;
end
endmodule
//test bench//
module counter_test; 
reg clk,rst,m; 
wire [3:0]count;
counter counter1(clk,rst,m,count);
initial 
clk=0; 
always 
#5 clk= ~clk;
initial
begin
rst=0; m=0; // Condition for Up-Count
#25 
rst=1;
 m=1;
#200 m=0; // Condition for Down-Count
#25 rst=1;
#200 m=1;
#140 m=0;
#250 $finish; // Finishing Simulation at t=140ns
end
endmodule
