// UCA 2010
//=========================================================
// Simple testbench
//=========================================================
// This testbench does not verify the functionality of MIPS UUT.
// It loads "instruction.txt" into instruction memory,
//    simulates MIPS UUT and prints out the internal states
//    of UUT to "output.txt".
// This information helps you to debug.
//
//=========================================================
// You can modify instruction.txt or this testbench file to 
//    verify yor hardware design :)

`define CYCLE_TIME 50

module Test_Bench
#(
    parameter CC=60
);


localparam          W = 32;
localparam          L = 6;
localparam          N = 2**L;


genvar              g;
integer             i;
integer             outfile;
integer             counter;

reg                 clk;
reg                 rst;

reg     [W-1:0]     data_mem_in     [0:N-1];
reg     [W-1:0]     inst_mem_in     [0:N-1];
reg     [W-1:0]     data_mem_out    [0:N-1];


wire    [W*N-1:0]   inst_mem_in_wire;
wire    [W*N-1:0]   data_mem_in_wire;
wire    [W*N-1:0]   data_mem_out_wire; 

generate
for (g = 0; g < N; g = g + 1)
begin:MEM_INIT
    assign data_mem_in_wire[(g+1)*W-1:g*W] =  data_mem_in[g];
    assign inst_mem_in_wire[(g+1)*W-1:g*W] =  inst_mem_in[g];
    always@* data_mem_out[g] = data_mem_out_wire[(g+1)*W-1:g*W];
end
endgenerate



always #(`CYCLE_TIME/2) clk = ~clk;    


Lite_MIPS
#
(
    .W(W),
    .L(L)
)
UUT
(
    .clk(clk),
    .rst(rst),
    .inst_mem_in_wire(inst_mem_in_wire),
    .data_mem_in_wire(data_mem_in_wire),
    .data_mem_out_wire(data_mem_out_wire)
);

  
initial 
begin
    // Initialize data memory
    for(i=0; i<N; i=i+1) begin
        inst_mem_in[i] = {W{1'b0}};
    end    

    // Initialize instruction memory
    for(i=0; i<N; i=i+1) begin
        data_mem_in[i] = {W{1'b0}};
    end
        
    // Load instructions into instruction memory
    $readmemh("inst_mem_in.hex", inst_mem_in);

    // Load data into data memory
    $readmemh("data_mem_in.hex", data_mem_in);
    
    // Open output file
    outfile = $fopen("execution.log") | 1;
    
    counter = 0;
    clk = 0;
    rst = 1;
    
    #(`CYCLE_TIME/4) 
    rst = 0;
end
  
always@(posedge clk) begin      
    // print PC
    $fdisplay(outfile, "PC = %X", UUT.pc_current);

    // print instruction
    $fdisplay(outfile, "INST:");
    if((UUT.pc_current)>=2)
        $fdisplay(outfile, "  \t%X=%X", UUT.pc_current-2, inst_mem_in[UUT.pc_current-2]);
    if((UUT.pc_current)>=1)
        $fdisplay(outfile, "  \t%X=%X", UUT.pc_current-1, inst_mem_in[UUT.pc_current-1]);
    $fdisplay(outfile, "->\t%X=%X", UUT.pc_current+0, inst_mem_in[UUT.pc_current+0]);
    $fdisplay(outfile, "  \t%X=%X", UUT.pc_current+1, inst_mem_in[UUT.pc_current+1]);
    $fdisplay(outfile, "  \t%X=%X", UUT.pc_current+2, inst_mem_in[UUT.pc_current+2]);

    
    // print Registers
    $fdisplay(outfile, "REG:");
    $fdisplay(outfile, "R0(r0)=%X, R8 (t0)=%X, R16(s0)=%X, R24(t8)=%X", UUT.Reg_Bank.registers[0], UUT.Reg_Bank.registers[8] , UUT.Reg_Bank.registers[16], UUT.Reg_Bank.registers[24]);
    $fdisplay(outfile, "R1(at)=%X, R9 (t1)=%X, R17(s1)=%X, R25(t9)=%X", UUT.Reg_Bank.registers[1], UUT.Reg_Bank.registers[9] , UUT.Reg_Bank.registers[17], UUT.Reg_Bank.registers[25]);
    $fdisplay(outfile, "R2(v0)=%X, R10(t2)=%X, R18(s2)=%X, R26(k0)=%X", UUT.Reg_Bank.registers[2], UUT.Reg_Bank.registers[10], UUT.Reg_Bank.registers[18], UUT.Reg_Bank.registers[26]);
    $fdisplay(outfile, "R3(v1)=%X, R11(t3)=%X, R19(s3)=%X, R27(k1)=%X", UUT.Reg_Bank.registers[3], UUT.Reg_Bank.registers[11], UUT.Reg_Bank.registers[19], UUT.Reg_Bank.registers[27]);
    $fdisplay(outfile, "R4(a0)=%X, R12(t4)=%X, R20(s4)=%X, R28(gp)=%X", UUT.Reg_Bank.registers[4], UUT.Reg_Bank.registers[12], UUT.Reg_Bank.registers[20], UUT.Reg_Bank.registers[28]);
    $fdisplay(outfile, "R5(a1)=%X, R13(t5)=%X, R21(s5)=%X, R29(sp)=%X", UUT.Reg_Bank.registers[5], UUT.Reg_Bank.registers[13], UUT.Reg_Bank.registers[21], UUT.Reg_Bank.registers[29]);
    $fdisplay(outfile, "R6(a2)=%X, R14(t6)=%X, R22(s6)=%X, R30(s8)=%X", UUT.Reg_Bank.registers[6], UUT.Reg_Bank.registers[14], UUT.Reg_Bank.registers[22], UUT.Reg_Bank.registers[30]);
    $fdisplay(outfile, "R7(a3)=%X, R15(t7)=%X, R23(s7)=%X, R31(ra)=%X", UUT.Reg_Bank.registers[7], UUT.Reg_Bank.registers[15], UUT.Reg_Bank.registers[23], UUT.Reg_Bank.registers[31]);

    // print Data Memory
    $fdisplay(outfile, "MEM:");
    $fdisplay(outfile, "%X=%X", 0*4,UUT.Data_Mem.memory[0]);
    $fdisplay(outfile, "%X=%X", 1*4,UUT.Data_Mem.memory[1]);
    $fdisplay(outfile, "%X=%X", 2*4,UUT.Data_Mem.memory[2]);
    $fdisplay(outfile, "%X=%X", 3*4,UUT.Data_Mem.memory[3]);
    $fdisplay(outfile, "%X=%X", 4*4,UUT.Data_Mem.memory[4]);
    $fdisplay(outfile, "%X=%X", 5*4,UUT.Data_Mem.memory[5]);
    $fdisplay(outfile, "%X=%X", 6*4,UUT.Data_Mem.memory[6]);
    $fdisplay(outfile, "%X=%X", 7*4,UUT.Data_Mem.memory[7]);
	
    $fdisplay(outfile, "\n");
    
    if(counter == CC || (inst_mem_in[UUT.pc_current+0] == 32'b0 && inst_mem_in[UUT.pc_current+1] == 32'b0))
    begin
        // Load data into data memory
        $writememh("data_mem_out.hex", data_mem_out, 0, N-1);
        $finish;
    end

    counter = counter + 1;
end

  
endmodule
