module COMP_ARCH_LAB2 (F,I,clk,reset);
input clk;
input reset;
input I;
output reg F;

parameter s0=3'b000,
			s1=3'b001,
			s2=3'b010,
			s3=3'b011,
			s4=3'b100;
reg [2:0] CS, NS;
always@(posedge clk)
begin
if(reset==1)
CS <= s0;// when reset=1, reset the CS of the FSM to "S0" CS
else
CS <= NS; // otherwise, next CS
end
always @(CS,I)
begin
case(CS)
s0:begin
if(I==1)
NS = s1;
else
NS = s0;
end

s1:begin
if(I==1)
NS = s1;
else
NS = s2;
end

s2:begin
if(I==1)
NS = s1;
else
NS = s3;
end

s3:begin
if(I==1)
NS = s1;
else
NS = s0;
end

s4:begin
if(I==1)
NS = s1;
else
NS = s2;
end

default:NS = s0;
endcase
F = (CS==s4)? 1:0;
end
endmodule
