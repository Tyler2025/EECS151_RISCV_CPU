module control (
    input [31:0] inst,
    output reg [2:0] ImmSel,
    output reg BrUn,BSel,ASel,
    output reg [3:0] ALUSel,//ALU oprations:add,sub,sll,slt,sltu,xor,srl,sra,or,and,A,B
    output reg [3:0] MEMWen,
    output reg CSRSrc,
    output reg [2:0] LDSel,//8,16,32 sign,8 unsign,16 unsign
    output reg [1:0] WBSel,
    output reg RegWen
    //output [31:0] Inst
);

    //transport instruction
    //assign Inst = inst;

    //Decoder,Opcode->Funct3->Inst[30]
    always @(*) begin
        //avoid latch and x,so first give values
        ImmSel  = 3'h0;//I type
        BrUn    = 1'b0;//signed
        BSel    = 1'b1;//Imm
        ASel    = 1'b0;//Regs
        ALUSel  = 4'hB;//B
        MEMWen  = 4'h0;//Read
        CSRSrc  = 1'b0;//Imm
        LDSel   = 3'h2;//32 bits
        WBSel   = 2'h1;//alu
        RegWen  = 1'b0;//no write

        case(inst[6:2])
            5'b01101:begin//LUI
                    ImmSel  = 3'h3;//U type
                    BSel    = 1'h1;//Imm
                    ALUSel  = 4'hB;//B
                    MEMWen  = 4'h0;//Read
                    WBSel   = 2'h1;//Alu
                    RegWen  = 1'h1; //Write
                end
            5'b00101:begin//AUIPC
                    ImmSel  = 3'h3;//U type
                    BSel    = 1'h1;//Imm
                    ASel    = 1'h1;//PC
                    ALUSel  = 4'h0;//Add
                    MEMWen  = 4'h0;//Read
                    WBSel   = 2'h1;//Alu
                    RegWen  = 1'h1; //Write
                end
            5'b11011:begin//JAL
                    ImmSel  = 3'h4;//J type
                    BSel    = 1'h1;//Imm
                    ASel    = 1'h1;//PC
                    ALUSel  = 4'h0;//Add
                    MEMWen  = 4'h0;//Read
                    WBSel   = 2'h2;//Pc+4
                    RegWen  = 1'h1; //Write
                end
            5'b11001:begin//JALR
                    ImmSel  = 3'h0;//I type
                    BSel    = 1'h1;//Imm
                    ASel    = 1'h0;//Regs
                    ALUSel  = 4'h0;//Add
                    MEMWen  = 4'h0;//Read
                    WBSel   = 2'h2;//Pc+4
                    RegWen  = 1'h1; //Write
                end
            5'b11000:begin//Branch 
                    ImmSel  = 3'h2;//B type
                    BSel    = 1'h1;//Imm
                    ASel    = 1'h1;//PC
                    ALUSel  = 4'h0;//Add
                    MEMWen  = 4'h0;//Read
                    RegWen  = 1'h0;//nowrite
                    if(inst[14]&inst[13])//BLTU,BGEU
                        BrUn = 1'b1;
                    else//BEQ,BNE,BLT,BGE and Others
                        BrUn = 1'b0;
                end
            5'b00000:begin//Load
                    ImmSel  = 3'h0;//I type
                    BSel    = 1'h1;//Imm
                    ASel    = 1'h0;//Regs
                    ALUSel  = 4'h0;//Add
                    MEMWen  = 4'h0;//Read
                    WBSel   = 2'b0;//Mem
                    RegWen  = 1'h1;//Write
                    if(inst[14:12] == 3'b000)//LB
                        LDSel = 3'h0;//8 bits sign
                    else if(inst[14:12] == 3'b001)//LH
                        LDSel = 3'h1;//16 bits sign
                    else if(inst[14:12] == 3'b010)//LW
                        LDSel = 3'h2;//32 bits
                    else if(inst[14:12] == 3'b100)//LBU
                        LDSel = 3'h3;//8 bits unsign
                    else if(inst[14:12] == 3'b101)//LHU
                        LDSel = 3'h4;//16 bits unsign
                    else
                        LDSel = 3'h2;//default 32 bits
                end
            5'b01000:begin//store
                    ImmSel  = 3'h1;//S type
                    BSel    = 1'h1;//Imm
                    ASel    = 1'h0;//Regs
                    ALUSel  = 4'h0;//Add
                    RegWen  = 1'h0;//NoWrite
                    if(inst[14:12] == 3'h0)//SB
                        MEMWen = 4'h1;
                    else if(inst[14:12] == 3'h1)//SH
                        MEMWen = 4'h3;
                    else if(inst[14:12] == 3'h2)//SW
                        MEMWen = 4'hF;
                    else//default
                        MEMWen = 4'hF;
                end
            5'b00100:begin//Immediate Arthmetric
                    ImmSel  = 3'h0;//I type
                    BSel    = 1'h1;//Imm
                    ASel    = 1'h0;//Regs
                    MEMWen  = 4'h0;//Read
                    WBSel   = 2'h1;//Alu
                    RegWen  = 1'h1;//Write
                    if(inst[14:12] == 3'h0)//ADDI
                        ALUSel = 4'h0;//add
                    else if(inst[14:12] == 3'h2)//SLTI
                        ALUSel = 4'h3;//slt
                    else if(inst[14:12] == 3'h3)//SLTIU
                        ALUSel = 4'h4;//sltu
                    else if(inst[14:12] == 3'h4)//XORI
                        ALUSel = 4'h5;//xor
                    else if(inst[14:12] == 3'h6)//ORI
                        ALUSel = 4'h8;//or
                    else if(inst[14:12] == 3'h7)//ANDI
                        ALUSel = 4'h9;//and
                    else if(inst[14:12] == 3'h1)//SLLI
                        ALUSel = 4'h2;//sll
                    else if(inst[14:12] == 3'h5 && !inst[30])//SRLI
                        ALUSel = 4'h6;//srl
                    else if(inst[14:12] == 3'h5 && inst[30])//SRAI
                        ALUSel = 4'h7;//sra
                    else
                        ALUSel = 4'h0;//default add
                end
            5'b01100:begin//Registers Arthmetric
                    BSel    = 1'h0;//Regs
                    ASel    = 1'h0;//Regs
                    MEMWen  = 4'h0;//Read
                    WBSel   = 2'h1;//Alu
                    RegWen  = 1'h1;//Write
                    if(inst[14:12] == 3'h0 && !inst[30])//ADD
                        ALUSel = 4'h0;//add
                    else if(inst[14:12] == 3'h0 && inst[30])//SUB
                        ALUSel = 4'h1;//sub
                    else if(inst[14:12] == 3'h1)//SLL
                        ALUSel = 4'h2;//sll
                    else if(inst[14:12] == 3'h2)//SLT
                        ALUSel = 4'h3;//slt
                    else if(inst[14:12] == 3'h3)//SLTU
                        ALUSel = 4'h4;//sltu
                    else if(inst[14:12] == 3'h4)//XOR
                        ALUSel = 4'h5;//xor
                    else if(inst[14:12] == 3'h5 && !inst[30])//SRL
                        ALUSel = 4'h6;//srl
                    else if(inst[14:12] == 3'h5 && inst[30])//SRA
                        ALUSel = 4'h7;//sra
                    else if(inst[14:12] == 3'h6)//OR
                        ALUSel = 4'h8;//or
                    else if(inst[14:12] == 3'h7)//AND
                        ALUSel = 4'h9;//and
                    else
                        ALUSel = 4'h0;//default add
                end
            5'b11100:begin//CSR
                    MEMWen  = 4'hF;//32 bits
                    RegWen  = 1'b0;//nowrite
                    if(inst[14:12] == 3'h1)begin//CSRRW
                            ASel = 1'b0;//Regs
                            ALUSel = 4'hA;//A
                            CSRSrc = 1'b1;//rs1
                        end
                    else if (inst[14:12] == 3'h5)begin//CSRRWI
                            ImmSel = 3'h5;//CSRI
                            BSel = 1'b1;//imm
                            ALUSel = 4'hB;//B
                            CSRSrc = 1'b0;//Imm
                        end
                    else begin//default ** talk about later
                        ImmSel = 3'h5;//CSRI
                        ASel = 1'b0;//Regs
                        BSel = 1'b1;//Imm
                        ALUSel = 4'hB;//B
                        CSRSrc = 1'b0;//Imm
                    end
                end
            default:begin//Other Instructions
                    ImmSel  = 3'h0;//I type
                    BrUn    = 1'b0;//signed
                    BSel    = 1'b1;//Imm
                    ASel    = 1'b0;//Regs
                    ALUSel  = 4'hB;//B
                    MEMWen  = 4'h0;//Read
                    CSRSrc  = 1'b0;//Imm
                    LDSel   = 3'h2;//32 bits
                    WBSel   = 2'h1;//alu
                    RegWen  = 1'b0;//no write
                end
        endcase
    end

endmodule

