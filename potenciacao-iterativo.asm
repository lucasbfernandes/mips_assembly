.data	#declara��o de vari�veis

	str1:	.asciiz "Digite o primeiro numero: "
	str2:	.asciiz "Digite o segundo numero: "
	str3:	.asciiz "A potencia do primeiro numero com o segundo eh: "
	
.text	#c�digo
	#lendo primeiro inteiro
	la	$t0,str1		#$t0 = &str1
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para leitura
	
	addi	$v0,$zero,5		#$v0 = 0 + 5
	syscall				#realizando leitura do inteiro
	#fim - lendo primeiro inteiro
	
	add	$s0,$zero,$v0		#s0 = valor lido
	
	#lendo segundo inteiro
	la	$t0,str2		#$t0 = &str2
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para leitura
	
	addi	$v0,$zero,5		#$v0 = 0 + 5
	syscall				#realizando leitura do inteiro
	#fim - lendo segundo inteiro
	
	add	$s1,$zero,$v0		#s1 = valor lido
	
	#inicializa��o para o la�o
	add	$t2,$zero,$s1		#$t2 = $s1
	addi	$t1,$zero,1		#$t1 = 1
	add	$s3,$zero,$s0		#$s3 = $s0
	
	#inicio do la�o exterior
poten:	add	$t0,$zero,$s0		#$t0 = 0 + $s0
	add	$s4,$zero,$s3		#$s4 = 0 + $s3
	#inicio do la�o interior
mult: 	add	$s3,$s3,$s4		#$s3 = $s3 + $s4
	addi	$t0,$t0,-1		#$t0 = $t0 - 1
	bne	$t0,$t1,mult		#se $t0 != $t1: goto mult
	#fim do la�o interior
	addi	$t2,$t2,-1		#$t2 = $t2 - 1
	bne	$t2,$t1,poten		#se $t2 != $t1: goto poten
	#fim do la�o exterior
	
	la	$t0,str3		#$t0 = &str2
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para resultado
	
	addi	$v0,$zero,1		#$v0 = 0 + 1
	add	$a0,$zero,$s3		#$a0 = 0 + $s3
	syscall				#exibe resultado da potencia��o
	
	

	
