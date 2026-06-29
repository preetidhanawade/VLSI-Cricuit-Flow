module alu_32bit_if(y,a,b,f);
input [31:0]a;
input [31:0]b;
input [2:0]f;
output reg [31:0]y;
always@(*)
begin
if(f==3'b000)
y=a&b; //AND Operation
else if (f==3'b001)
y=a|b; //OR Operation
else if (f==3'b010)
y=a+b; //Addition
else if (f==3'b011)
y=a-b; //Subtraction
else if (f==3'b100)
y=a*b; //Multiply
else
y=32'bx;
end
endmodule
//Test bench //
module alu_32bit_tb_if;
reg [31:0]a;
reg [31:0]b;
reg [2:0]f;
wire [31:0]y;
alu_32bit_if test(y,a,b,f);
initial
begin
a=32'h00000000;
b=32'hFFFFFFFF;
#10 f=3'b000;
#10 f=3'b001;
#10 f=3'b010;
#10 f=3'b100;
#10 f=3'b101;
#50 $finish;
end
endmodule
