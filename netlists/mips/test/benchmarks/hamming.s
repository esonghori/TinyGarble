# memory configuration 
# 0: num
# 1: answer
# 2: A[0]
# 3: A[1]
# ...
# num+1: A[num-1]
# num+2: B[0]
# num+3: B[1]
# num+4: B[2]
# ...
# 2*num+1: B[num-1]

#hamming distance between A and B with the length of num
hamming:
	lw 		$9,	0($0) 	#load num into $9
	sll		$9, $9, 2	
	addi 	$2,	$0, 8 	#$2 := A 	
	add 	$3,	$2,	$9  #$3 := B = A + num

#	addi 	$10, $0, 0	# answer, no need to reset
	addi 	$9, $9, 8 	# num += 2 to compare with the end of A
loop:
	beq 	$2, $9, end # if A == end of A, we are done
	
	lw 		$4, 0($2) #load *A
	lw 		$5, 0($3) #load *B
	xor 	$6, $4, $5 # $6==0 if A[i]==B[i]
	beq 	$6, $0, SAME
	addi 	$10, $10, 1 # answer++
SAME:
	addi $2, $2, 4 # A++
	addi $3, $3, 4 # B++
	j loop # jump back to the top
end:
	sw $10, 4($0) #store answer
