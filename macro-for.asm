.macro for(%begin,%end,%body,%num,%int)	#macro para uma rotina de loop
	addi	$t0,$zero,%begin	#setando $t0
	addi	$t1,$zero,%end		#setando $t1
FOR:	%body(%num,%int)		#label
	addi	$t0,$t0,1		#iterador
	bne	$t0,$t1,FOR		#condição
.end_macro				#fim da macro

.macro	sum(%num,%int)			#macro para soma
	addi	%num,%num,%int		# x = x + int
.end_macro				#fim da macro

.data					#variaveis
					#NO-DATA
.text					#código
	addi	$s0,$zero,0		#s0 = 0
	for(0,5,sum,$s0,5)		#soma $s0 com 5 5 - 0 vezes
