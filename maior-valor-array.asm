.data
	vet:	.word	12,43,12,43,54,12,43,1		#array
	size:	.word	8				#tamanho do array
.text

main:	
	la	$t0,size		#adress of the variable size			
	lw	$s0,0($t0)		#size of the array
	
	la	$s1,vet			#adress of the first element of the array
	
	add	$a0,$zero,$s0		#parametro para a funcao maior_valor por VALOR
	add	$a1,$zero,$s1		#parametro para a funcao maior_valor por REFERENCIA
	jal	maior_valor		#pula para maior_valor	
	
	j	exit			#pula para exit
	
maior_valor:
	#salva contexto
	addi	$sp,$sp,-8		#$sp = $sp - 8
	sw	$s0,4($sp)		#salva $s0 no endereço $sp + 4
	sw	$s1,0($sp)		#salva $s1 no endereço $sp
	#fim salva contexto
	
	lw	$v0,0($a1)		#inicializando
	addi	$a1,$a1,4		#$v0 = maior valor por enquanto
loop:	
	beq	$a0,$zero,sai_func	#se $a0 == $zero, pula para sai_func
	addi	$a0,$a0,-1		#$a0 = $a0 - 1
	
	lw	$t0,0($a1)		#busca palavra no endereço $a1+0 e salva em $t0
	addi	$a1,$a1,4		#$a1 = $a1 + 4
	slt	$t1,$t0,$v0		#se $t0 < $v0: $t1 = 1, caso contrario $t1 = 0
		
	bne	$t1,$zero,loop		#se $t1 != $zero, pula para loop
	add	$v0,$zero,$t0		#$v0 = 0 + $t0
	j	loop			#pula para loop
	
sai_func:
	#restaura contexto
	lw	$s1,0($sp)		#busca palavra no endereço $sp + 0 e salva em $s1
	lw	$s0,4($sp)		#busca palavra no endereço $sp + 4 e salva em $s0
	addi	$sp,$sp,8		#$sp = $sp + 8
	#fim restaura contexto
	
exit:	