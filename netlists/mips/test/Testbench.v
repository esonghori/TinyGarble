// UCA 2010
//=========================================================
// Simple testbench
//=========================================================
// This testbench does not verify the functionality of MIPS CPU.
// It loads "instruction.txt" into instruction memory,
//    simulates MIPS CPU and prints out the internal states
//    of CPU to "output.txt".
// This information helps you to debug.
//
//=========================================================
// You can modify instruction.txt or this testbench file to 
//    verify yor hardware design :)

`define CYCLE_TIME 50

module TestBench;

reg         clk;
reg         rst_n;
integer     i, outfile, counter;

always #(`CYCLE_TIME/2) clk = ~clk;    

SingleCycle_CPU CPU(
    .clk  (clk),
    .rst_n  (rst_n)
);
  
initial begin
    // Initialize instruction memory
    for(i=0; i<256; i=i+1) begin
        CPU.Instr_Memory.memory[i] = 32'b0;
    end
    
    // Initialize data memory
    for(i=0; i<256; i=i+1) begin
        CPU.Data_Memory.memory[i] = 8'b0;
    end    
        
    // initialize Register File
    for(i=0; i<32; i=i+1) begin
        CPU.Register_File.register[i] = 32'b0;
    end
    
    // Load instructions into instruction memory
    $readmemh("instruction.txt", CPU.Instr_Memory.memory);

    // Load instructions into instruction memory
    $readmemh("data.txt", CPU.Data_Memory.memory);
    
    // Open output file
    outfile = $fopen("output.txt") | 1;
    
    counter = 0;
    clk = 0;
    rst_n = 0;
    
    #(`CYCLE_TIME/4) 
    rst_n = 1;
    
end
  
always@(posedge clk) begin
   // if(counter == 20)    // stop after 60 cycles
  //      $stop;
        
    // print PC
    $fdisplay(outfile, "PC = %X", CPU.PC.pc_out);

    // print instruction
    $fdisplay(outfile, "Instruction = %X", CPU.Instr_Memory.memory[CPU.PC.pc_out[30:2]]);
    
    // print Registers
    $fdisplay(outfile, "Registers");
    $fdisplay(outfile, "R0(r0) =%X, R8 (t0) =%X, R16(s0) =%X, R24(t8) =%X", CPU.Register_File.register[0], CPU.Register_File.register[8] , CPU.Register_File.register[16], CPU.Register_File.register[24]);
    $fdisplay(outfile, "R1(at) =%X, R9 (t1) =%X, R17(s1) =%X, R25(t9) =%X", CPU.Register_File.register[1], CPU.Register_File.register[9] , CPU.Register_File.register[17], CPU.Register_File.register[25]);
    $fdisplay(outfile, "R2(v0) =%X, R10(t2) =%X, R18(s2) =%X, R26(k0) =%X", CPU.Register_File.register[2], CPU.Register_File.register[10], CPU.Register_File.register[18], CPU.Register_File.register[26]);
    $fdisplay(outfile, "R3(v1) =%X, R11(t3) =%X, R19(s3) =%X, R27(k1) =%X", CPU.Register_File.register[3], CPU.Register_File.register[11], CPU.Register_File.register[19], CPU.Register_File.register[27]);
    $fdisplay(outfile, "R4(a0) =%X, R12(t4) =%X, R20(s4) =%X, R28(gp) =%X", CPU.Register_File.register[4], CPU.Register_File.register[12], CPU.Register_File.register[20], CPU.Register_File.register[28]);
    $fdisplay(outfile, "R5(a1) =%X, R13(t5) =%X, R21(s5) =%X, R29(sp) =%X", CPU.Register_File.register[5], CPU.Register_File.register[13], CPU.Register_File.register[21], CPU.Register_File.register[29]);
    $fdisplay(outfile, "R6(a2) =%X, R14(t6) =%X, R22(s6) =%X, R30(s8) =%X", CPU.Register_File.register[6], CPU.Register_File.register[14], CPU.Register_File.register[22], CPU.Register_File.register[30]);
    $fdisplay(outfile, "R7(a3) =%X, R15(t7) =%X, R23(s7) =%X, R31(ra) =%X", CPU.Register_File.register[7], CPU.Register_File.register[15], CPU.Register_File.register[23], CPU.Register_File.register[31]);

    // print Data Memory
    $fdisplay(outfile, "Data Memory: 0x00 =%X", {CPU.Data_Memory.memory[3] , CPU.Data_Memory.memory[2] , CPU.Data_Memory.memory[1] , CPU.Data_Memory.memory[0] });
    $fdisplay(outfile, "Data Memory: 0x04 =%X", {CPU.Data_Memory.memory[7] , CPU.Data_Memory.memory[6] , CPU.Data_Memory.memory[5] , CPU.Data_Memory.memory[4] });
    $fdisplay(outfile, "Data Memory: 0x08 =%X", {CPU.Data_Memory.memory[11], CPU.Data_Memory.memory[10], CPU.Data_Memory.memory[9] , CPU.Data_Memory.memory[8] });
    $fdisplay(outfile, "Data Memory: 0x0c =%X", {CPU.Data_Memory.memory[15], CPU.Data_Memory.memory[14], CPU.Data_Memory.memory[13], CPU.Data_Memory.memory[12]});
    $fdisplay(outfile, "Data Memory: 0x10 =%X", {CPU.Data_Memory.memory[19], CPU.Data_Memory.memory[18], CPU.Data_Memory.memory[17], CPU.Data_Memory.memory[16]});
    $fdisplay(outfile, "Data Memory: 0x14 =%X", {CPU.Data_Memory.memory[23], CPU.Data_Memory.memory[22], CPU.Data_Memory.memory[21], CPU.Data_Memory.memory[20]});
    $fdisplay(outfile, "Data Memory: 0x18 =%X", {CPU.Data_Memory.memory[27], CPU.Data_Memory.memory[26], CPU.Data_Memory.memory[25], CPU.Data_Memory.memory[24]});
    $fdisplay(outfile, "Data Memory: 0x1c =%X", {CPU.Data_Memory.memory[31], CPU.Data_Memory.memory[30], CPU.Data_Memory.memory[29], CPU.Data_Memory.memory[28]});
	
    $fdisplay(outfile, "\n");
    
    counter = counter + 1;
    $stop;
end

  
endmodule
