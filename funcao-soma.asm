.data
	str1:	.asciiz	"Digite o numero 1: "
	str2:	.asciiz	"Digite o numero 2: "
	str3:	.asciiz "A soma dentro da funcao eh: "
	str4:	.asciiz "\nA soma fora da funcao eh: "
	
.text
	#lendo inteiro
	la	$t0,str1		#$t0 = &str1
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para leitura	
	
	addi	$v0,$zero,5		#$v0 = 0 + 5
	syscall				#realizando leitura do inteiro
	#fim - lendo inteiro
	
	add	$s0,$zero,$v0		#armazenando inteiro lido em registrador
	
	#lendo inteiro
	la	$t0,str2		#$t0 = &str1
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para leitura	
	
	addi	$v0,$zero,5		#$v0 = 0 + 5
	syscall				#realizando leitura do inteiro
	#fim - lendo inteiro
	
	add	$s1,$zero,$v0		#armazenando inteiro lido em registrador
	
	add	$a0,$zero,$s0		#parametros
	add	$a1,$zero,$s1		#parametros
	
	jal	soma			#chamada da função passando valores de $s1 e $s0 por valor
	
	add	$s2,$s1,$s0		#soma dos numeros lidos originais
	
	la	$t0,str4		#$t0 = &str4
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para resultado
	
	addi	$v0,$zero,1		#$v0 = 0 + 1
	add	$a0,$zero,$s2		#$a0 = 0 + $s2
	syscall				#exibe resultado
	
	j	exit			#pula para fim do programa
	
soma:	#função
	#salva_contexto
	addi	$sp,$sp,-8		#$sp = $sp - 8 *stack pointer
	sw	$s0,4($sp)		#insere na pilha
	sw	$s1,0($sp)		#insere na pilha
	#fim_salva_contexto
	
	addi	$a0,$a0,-5		#subtrai cinco do valor dos parametros
	addi	$a1,$a1,-5		#subtrai cinco do valor dos parametros
	add	$s2,$a1,$a0		#soma com valores trocados
	
	la	$t0,str3		#$t0 = &str3
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para resultado
	
	addi	$v0,$zero,1		#$v0 = 0 + 1
	add	$a0,$zero,$s2		#$a0 = 0 + $s2
	syscall				#exibe resultado
	
	#retorna_contexto
	lw	$s1,0($sp)		#recupera da pilha
	lw	$s0,4($sp)		#recupera da pilha
	addi	$sp,$sp,8		#$sp = $sp + 8 *stack pointer
	#fim_retorna_contexto
	
	jr	$ra			#volta para endereço guardado em $ra

exit:	#label para o fim do programa