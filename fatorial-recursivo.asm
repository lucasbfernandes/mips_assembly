.macro	puts(%string)
	la	$a0,%string		#$t0 = &%string
	addi	$v0,$zero,4		#$v0 = 0 + 4
	syscall				#exibindo mensagem para leitura
.end_macro

.macro	read_int
	addi	$v0,$zero,5		#$v0 = 0 + 5
	syscall				#realizando leitura do inteiro
.end_macro

.macro	print_int(%int)
	addi	$v0,$zero,1		#$v0 = 0 + 1
	add	$a0,$zero,%int		#$a0 = 0 + $%int
	syscall				#exibe inteiro
.end_macro

.data
	str1:	.asciiz	"Digite o inteiro: "
.text

main:	
	puts(str1)
	read_int			#lê inteiro
	add	$s0,$zero,$v0		#armazena em $s0
	add	$a0,$zero,$s0		#armazena em $a0 para passar por valor
	
	jal	fat			#pula para label fat
	j	exit			#pula para exit
fat:	
	addi	$sp,$sp,-8		#$sp = $sp - 8
	sw	$ra,4($sp)		#push($ra)
	sw	$a0,0($sp)		#push($a0)
	
	addi	$a0,$a0,-1		#$a0 = $a0 - 1
	beq	$a0,$zero,base_case	#se $a0 == $zero, pula para base_case
	
	jal 	fat			#pula para fat	
		
	lw	$t1,0($sp)		#pop(stack)
	lw	$ra,4($sp)		#pop(stack)
	addi	$sp,$sp,8		#$sp = $sp + 8
	
	mul	$v0,$t0,$t1		#$v0 = $t0 * $t1
	add	$t0,$zero,$v0		#$t0 = 0 +$v0
	
	jr	$ra			#pula para $ra
	
base_case:
	addi	$t0,$zero,1		#$t0 = 0 + 1
	jr	$ra			#pula para $ra

exit:	
	add	$s1,$zero,$v0		#armazenando o resultado em $s1
	print_int($s1)			#fim do programa