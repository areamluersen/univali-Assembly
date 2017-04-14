# Disciplina: Arquitetura e Organização de Computadores 
# Atividade: Avaliação 02  Programação em Linguagem de Montagem 
# Programa 02 
# Grupo: - Aream Luersen
#        - Gustavo Cassol

  	.data

Msg1: .asciiz "\nEntre com o tamanho do vetor (máx. = 8): "
Msg2: .asciiz "\nO A soma de todos os elementos do vetor é "
Msg3: .asciiz "\nVetor_A["
Msg4: .asciiz "] = "
Msg5: .asciiz "\nVetor_B["
Msg6: .asciiz "\nVetor_C["
Vetor_A: .word 0,0,0,0,0,0,0,0  
Vetor_B: .word 0,0,0,0,0,0,0,0
Vetor_C: .word 0,0,0,0,0,0,0,0

	.text
	
main:
	 la  $s6, Vetor_A   	#Carrega posição base do vetor em s6
	 add $s0, $0, 0	  	# s0 = 0
	 add $s1, $0, 4  	#s1 = 4		
	 add $s3, $0, 0 	#Controla qual Vetor recebe elementos.

vetor:	
entrada: li  $v0,  4		#v0 = 4 print String
	 la  $a0,  Msg1		#a0 recebe mensagem a ser impressa
	 syscall		#imprime mensagem
	 
	 li  $v0, 5		#v0 = 5 le valor inteiro
	 syscall
	 add $s2, $0, $v0
	 bgt $s2, 8, entrada	#Se entrada do usuário for maior que 8 volta para entrada.
	 blt $s2, 1, entrada	#Se entrada do usuário for menor que 1 volta para entrada.
	
	 
preenche:li  $v0,  4		#v0 = 4 print String
	 la  $a0,  Msg5
	 beq $s3, 1, texto	#Controla o texto a ser printado
	 la  $a0,  Msg3		#a0 recebe mensagem a ser impressa	
texto:	 
	 syscall		#imprime mensagem "\nVetor_A["
	 li  $v0,  1		#v0 = 1 print inteiro
	 add $a0, $0, $s0	#a0 recebe o valor inteiro da posição do vetor para imprimir.
	 syscall
	 li  $v0,  4		#v0 = 4 print String
	 la  $a0,  Msg4		#a0 recebe mensagem a ser impressa
	 syscall
	 li  $v0,  5		#v0 = 5 lê Inteiro
	 syscall
	 
	 sw  $v0, 0($s6)	#armazena o valor lido na posição armazenada.
	 add $s6,$s6, $s1	#Aumenta uma posição no vetor.
	 
	 add $s0, $s0, 1	#aumenta um valor para controle do loop.
	 
	 
	 bne $s0, $s2, preenche #Enquanto posição for diferente do tamanho informado pelo usuário volta a preenche.
	 
	 add $s3, $s3, 1 	#Aumenta valor que controla em qual vetor trabalhar.
	 add $s0, $0, 0	  	# s0 = 0
	 
	 la  $s6, Vetor_B   	#Carrega posição base do vetor em s6
	 bne $s3, 2, vetor	#Manda para o início se ainda não preencheu os 2 vetores.
	 
	 la  $s6, Vetor_A   	#Carrega posição base do vetor em s6
	 la  $s5, Vetor_B   	#Carrega posição base do vetor em s5
	 la  $s4, Vetor_C	#Carrega posição base do vetor em s4
	 add $s0, $0, 0	  	# s0 = 0
	 
	 
vetorC:
	 lw  $s2, 0($s6)
	 lw  $s3, 0($s5)
	 blt $s2, $s3, Bmaior
	 
	 sw  $s2, 0($s4)
	 
	 j   Amaior
	 
Bmaior:	 sw  $s3, 0($s4)
Amaior:	 
	 add $s6, $s6, $s1
	 add $s5, $s5, $s1
	 add $s4, $s4, $s1
	 add $s0, $s0, 1
	 
	 bne $s0, 8, vetorC	
	 
	 la  $s4, Vetor_C	#Carrega posição base do vetor em s4
	 add $s0, $0, 0	  	# s0 = 0
	 
print:
	 li  $v0,  4		#v0 = 4 print String
	 la  $a0,  Msg6		#a0 recebe mensagem a ser impressa
	 syscall
	 li  $v0,  1		#v0 = 1 print inteiro
	 add $a0, $0, $s0	#a0 recebe o valor inteiro da posição do vetor para imprimir.
	 syscall
	 add $s0, $s0, 1
	 li  $v0,  4		#v0 = 4 print String
	 la  $a0,  Msg4		#a0 recebe mensagem a ser impressa
	 syscall
	 li  $v0,  1
	 lw $a0, 0($s4)
	 syscall
	 add $s4, $s4, $s1
	 bne $s0, 8, print
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 