module shift_add_multiplier(clk,reset,A,B,P);
    input clk,reset;
    input [3:0]A,B;     // Multiplicand and Multiplier
    output reg [7:0]P; // Product
reg [7:0]multiplicand;
reg [3:0]multiplier;
reg [2:0]count;
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        multiplicand <= 0;
        multiplier   <= 0;
        P            <= 0;
        count        <= 0;
    end
    else
    begin
        if (count == 0)
        begin
            multiplicand <= {4'b0000, A}; // Extend A to 8 bits
            multiplier   <= B;
            P            <= 0;
            count        <= 4;
        end
        else
        begin
            if (multiplier[0] == 1)
                P <= P + multiplicand;

            multiplicand <= multiplicand << 1;
            multiplier   <= multiplier >> 1;
            count        <= count - 1;
        end
    end
end
endmodule
module tb_multiplier;
reg clk,reset;
reg [3:0]A,B;
wire [7:0]P;

shift_add_multiplier uut(clk,reset,A,B,P);   
initial
clk = 0;
always #5 clk = ~clk;
initial
begin
    reset = 1;
    #10 reset = 0;
    A = 4'b0101; // 5
    B = 4'b0011; // 3
#50
   A = 4'b1011; // 11 
   B = 4'b0111; // 7
    #50 $finish;
end
endmodule
