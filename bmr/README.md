Circuit file for the BMR protocol
=======
The generated circuit files follow the structure used in the implementation of the BMR protocol present [here](https://github.com/cryptobiu/Semi-Honest-BMR).
The steps to compile the Verilog/VHDL design to Boolean logic through TinyGarble is similar for both JustGarble and BMR except the last step where the circuit file is written. 

## Circuit Format
Input bits from all the parties are concatenated to form a single input `p_input`. The distribution of the bits is given as an argument to the `V2BMR_Main` function. The module structure for N-bit input and M-bit output is as follows. 
```
module _name_ ( 
  input [N-1:0] p_input,
  output [M-1:0] o
  );
  
  //description
  
endmodule 
```

## BMR Format
```
# first row is comment
<No_of_gates> <No_of_parties> <No_of_wires>
for n = 0 to No_of_parties-1
	Pn <No_of_input_wires>
	<indices of input wires that belong to Pn>
endfor
Out <No_of_output_wires>
<indices of output wires>
for g = 0 to No_of_gates-1
	<index of input0 wire> <index of input1 wire>  <index of output wire> <truth table>
endfor
```

## Usage
```
./V2BMR_Main 

  -h [ --help ]         produce help message.
  -i [ --netlist ] arg  Input netlist (verilog .v) file address.
  -b [ --bmr ] arg      Output bmr circuit file address.
  -n [ --np ] arg       Number of parties.
  -p [ --perparty ] arg No of bits for every party (seperated by space)

```
If arguments to both -n and -p are specified, the argument to -n is ignored.

## References
- Ben-Efraim, Aner, Yehuda Lindell, and Eran Omri. "Optimizing semi-honest secure multiparty computation for the internet." Proceedings of the 2016 ACM SIGSAC Conference on Computer and Communications Security. ACM, 2016. 
- Ebrahim M. Songhori, Siam U. Hussain, Ahmad-Reza Sadeghi, Thomas Schneider
and Farinaz Koushanfar, ["TinyGarble: Highly Compressed and Scalable Sequential
Garbled Circuits."](http://esonghori.github.io/file/TinyGarble.pdf) <i>Security
and Privacy, 2015 IEEE Symposium on</i> May, 2015.

