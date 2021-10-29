module decode (
    Addr,
    CS_,
    WR_,
    OE_,
    CS_Reg1,
    CS_Reg2,
    CS_Reg3,
    my_wr,
    my_rd
);
//CS is to select the PLD
//WR is decide write or read
//OE is enable the PLD
input  CS_,WR_,OE_;
//Addr is 8 width address of the aim register
input  [7:0]Addr;
//CS_Regx x=1.2.3 this parameter will change to 1,when the right register being selected
output CS_Reg1,CS_Reg2,CS_Reg3;
//my_wr = 1   going to write
//my_rd = 1   going to read
output my_wr,my_rd;
reg CS_Reg1,CS_Reg2,CS_Reg3;
always @(Addr,CS_)
    if(!CS_)
        begin
            case (Addr)
                8'b11110000:CS_Reg1 <= 1;
                8'b11100000:CS_Reg2 <= 1;
                8'b11000000:CS_Reg3 <= 1; 
                default: begin
                            CS_Reg1 <= 0;
                            CS_Reg2 <= 0;
                            CS_Reg3 <= 0;
                        end
            endcase
        end
    else
    begin
        CS_Reg1 <= 0;
        CS_Reg2 <= 0;
        CS_Reg3 <= 0;
    end
assign my_wr = (!WR_) && (!OE_) && (!CS_);
assign my_rd = (WR_)  && (!OE_) && (!CS_);
endmodule