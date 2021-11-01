module WReg (
    clk,
    rst,
    my_wr,
    CS_Reg1,
    CS_Reg2,
    CS_Reg3,
    Data,
    Reg1,
    Reg2,
    Reg3
);

input   clk,rst,my_wr;
input   CS_Reg1,CS_Reg2,CS_Reg3;
input   [7:0]Data;
output  [7:0]Reg1,Reg2,Reg3;
reg     [7:0]Reg1,Reg2,Reg3;
always @(posedge clk or negedge rst)begin
    if(!rst)begin
        Reg1 <= 8'b00000000;
        Reg2 <= 8'b00000000;
        Reg3 <= 8'b00000000;
        end
    else begin
        if(my_wr) begin
            if(CS_Reg1) Reg1 <= Data;
            else if(CS_Reg2) Reg2 <= Data;
            else if(CS_Reg3) Reg3 <= Data;
        end
        else begin
            Reg1 <= Reg1;
            Reg2 <= Reg2;
            Reg3 <= Reg3;
        end  
        end
    end
endmodule