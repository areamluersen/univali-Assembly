# Disciplina: Arquitetura e Organização de Computadores 
# Atividade: Avaliação 01  Programação em Linguagem de Montagem 
# Programa 01 
# Grupo: - Aream Luersen
#        - Gustavo Cassol

  	.data

Msg1: .asciiz "\nEntre com o tamanho do vetor (máx. = 8): "
Msg2: .asciiz "\nO A soma de todos os elementos do vetor é "
Msg3: .asciiz "\nVetor_A["
Msg4: .asciiz "] = "
Vetor_A: .word 0,0,0,0,0,0,0,0  

	.text
	
main:
	 la  $s6, Vetor_A   	#Carrega posição base do vetor em s6
	 add $s0, $0, 0	  	# s0 = 0
	 add $s1, $0, 4  	#s1 = 4	
	 add $s3, $0, 0  	#s1 = 0	
	
entrada: li  $v0,  4		#v0 = 4 print String
	 la  $a0,  Msg1		#a0 recebe mensagem a ser impressa
	 syscall		#imprime mensagem
	 
	 li  $v0, 5		#v0 = 5 le valor inteiro
	 syscall
	 add $s2, $0, $v0
	 bgt $s2, 8, entrada	#Se entrada do usuário for mair que 8 volta para entrada.
	 blt $s2, 1, entrada	#Se entrada do usuário for manor que 1 volta para entrada.
	
	 
preenche:li  $v0,  4		#v0 = 4 print String
	 la  $a0,  Msg3		#a0 recebe mensagem a ser impressa
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
	 
	 la  $s6, Vetor_A   	#Carrega posição base do vetor em s6
	 add $s0, $0, 0	  	# s0 = 0
	 
soma:	 lw  $s4, 0($s6)	#s4 recebe valor armazenado na posição indicada
	 add $s6, $s6, $s1	#Aumenta uma posição no vetor.
	 add $s3, $s3, $s4	#soma os valores
	 add $s0, $s0, 1	#aumenta um valor para controle do loop.
	 
	 bne $s0, $s2, soma 	#Enquanto posição for diferente do tamanho informado pelo usuário volta a preenche.
	 
	 li  $v0, 4		#v0 = 4 print String
	 la  $a0, Msg2		#a0 recebe mensagem a imprimir
	 syscall
	 li  $v0, 1		#v0 = 1 print Inteiro
	 add $a0, $0, $s3	#a0 recebe valor da soma
	 syscall
	 
	 	
	 		
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 