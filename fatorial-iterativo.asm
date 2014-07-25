.data	#declaração de variáveis
	str1:	.asciiz	"Digite o numero: "
	
.text	#código
	#lendo primeiro inteiro
	la	$t0,str1		#$t0 = &str1
	addi	$v0,$zero,4		#$v0 = 0 + 4
	add	$a0,$zero,$t0		#$a0 = 0 + $t0
	syscall				#exibindo mensagem para leitura	
	
	addi	$v0,$zero,5		#$v0 = 0 + 5
	syscall				#realizando leitura do inteiro
	#fim - lendo inteiro
	
	#inicialização para laço
	add	$s0,$zero,$v0		#s0 = valor lido
	add	$s3,$zero,$s0		#s3 = 0 + $s0
	add	$t2,$s0,-1		#$t2 = $s0 - 1
	addi	$t1,$zero,1		#$t1 = 0 + 1
	
	#inicio do laço exterior
fat:	add	$t0,$zero,$t2		#$t0 = 0 + $t2
	add	$s4,$zero,$s3		#$s4 = 0 + $s3
	
	#inicio do laço interior
mult: 	add	$s3,$s3,$s4		#$s3 = $s3 + $s4
	addi	$t0,$t0,-1		#$t0 = $t0 - 1
	bne	$t0,$t1,mult		#se $t0 != $t1: goto mult
	#fim do laço interior
	
	addi	$t2,$t2,-1		#$t2 = $t2 - 1
	bne	$t2,$t1,fat		#se $t2 != $t1: goto fat
	#fim do laço exterior
	
	addi	$v0,$zero,1		#$v0 = 0 + 1
	add	$a0,$zero,$s3		#$a0 = 0 + $s3
	syscall				#exibe resultado do fatorial
