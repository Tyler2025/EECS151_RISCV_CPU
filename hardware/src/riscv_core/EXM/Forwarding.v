module Forwarding(
    input [31:0] IDinst,
    input [31:0] EXMinst,
    input [31:0] WBinst,
    input [3:0]  IDEXMMEMWen,
    input        EXMWBRegWen,
    input        IDEXMRegWen,
    output  reg  regq1src,
    output  reg  regq2src,
    output  reg  alurs1src,
    output  reg  alurs2src,
    output  reg  memdsrc,
    output  reg  branchrs1src,
    output  reg  branchrs2src
);
    //1 cycle data hazards
    always @(*) begin
        regq1src = 1'b0;//default from regs
        regq2src = 1'b0;
        alurs1src = 1'b0;//default from regs
        alurs2src = 1'b0;
        memdsrc   = 1'b0;
        branchrs1src = 1'b0;
        branchrs2src = 1'b0;
        if(WBinst[11:7] != 5'h0 && EXMWBRegWen)begin
            //1 cycle hazards
            /*if(EXMinst[19:15] == WBinst[11:7])begin //ID/EXM.rs1 == EXM/WB.rd 
                if(EXMinst[6:2] == 5'b11000) // branch
                    branchrs1src = 1'b1;
                else if(EXMinst[6:2] != 5'b01101 && EXMinst[6:2] != 5'b00101 && EXMinst[6:2] != 5'b11011 && (EXMinst[6:2] != 5'b01101 || EXMinst[14:12] != 3'b001))//others,except LUI AUIPC JAL CSRRW
                    alurs1src = 1'b1;
            end
            else if(EXMinst[24:20] == WBinst[11:7])begin //ID/EXM.rs2 == EXM/WB.rd 
                if(EXMinst[6:2] == 5'b11000) // branch
                    branchrs2src = 1'b1;
                else if(IDEXMMEMWen)// SW
                    memdsrc = 1'b1;
                else if(EXMinst[6:2] == 5'b01100)// others,ADD SUB reg2reg arithmetric
                    alurs2src = 1'b1;
            end*/
		//1 cycle hazards
            if(EXMinst[19:15] == WBinst[11:7] && EXMinst[6:2] == 5'b11000) //ID/EXM.rs1 == EXM/WB.rd  branch
                branchrs1src = 1'b1;
            else if(EXMinst[19:15] == WBinst[11:7] && EXMinst[6:2] != 5'b01101 && EXMinst[6:2] != 5'b00101 && EXMinst[6:2] != 5'b11011 && (EXMinst[6:2] != 5'b01101 || EXMinst[14:12] != 3'b001))//others,except LUI AUIPC JAL CSRRW
                alurs1src = 1'b1;
            if(EXMinst[24:20] == WBinst[11:7] && EXMinst[6:2] == 5'b11000) //ID/EXM.rs2 == EXM/WB.rd  branch
                branchrs2src = 1'b1;
            else if(EXMinst[24:20] == WBinst[11:7] && EXMinst[6:2] == 5'b01100)// others,ADD SUB reg2reg arithmetric
                alurs2src = 1'b1;            
		if(EXMinst[24:20] == WBinst[11:7] && IDEXMMEMWen)// SW
                memdsrc = 1'b1;

            //2 cycles hazards
            if(IDinst[19:15] == WBinst[11:7] && !(EXMinst[11:7] != 5'h0 && IDEXMRegWen && IDinst[19:15] == EXMinst[11:7]) && IDinst[6:2] != 5'b01101 && IDinst[6:2] != 5'b00101 && IDinst[6:2] != 5'b11011 && (IDinst[6:2] != 5'b01101 || IDinst[14:12] != 3'b001)) //IF/ID.rs1 == EXM/WB.rd
                regq1src = 1'b1;
            if(IDinst[24:20] == WBinst[11:7] && !(EXMinst[11:7] != 5'h0 && IDEXMRegWen && IDinst[24:20] == EXMinst[11:7]) && (IDinst[6:2] == 5'b11000 || IDinst[6:2] == 5'b01000 || IDinst[6:2] == 5'b01100)) //IF/ID.rs2 == EXM/WB.rd
                regq2src = 1'b1;
        end
    end

endmodule
