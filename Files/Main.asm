.include "MacroLib/macro-syscalls.m"
.include "MacroLib/macro-string.m"

.eqv strSize 100

.data
str:	.space strSize
strCopy:	.space strSize

strTest1: .asciz "hii. Nice to meet you"
strTest1Copy: .space strSize
strTest1Macro: .asciz "Waiit \0 stop"
strTest1CopyMacro: .space strSize
.text 
.globl  Program
Program:
	print_str ("Введите строку для копирования: ")
	la 	a0, str
	li	a1, strSize
	li	a7, 8
	ecall #input of the stroke
	
	mv	a1, a0
	
	la	a0, strCopy
	
	jal	strcpy # a0 - destination - pointer to the string where the data will be copied to; 
			#a1 – source - pointer to the source string of the copied data.
			#returns Nothing
	print_str ("Содержание скопированной строки: ")
	la	a0, strCopy
	
	li	a7, 4
	ecall
	
	#macro_test
	print_str ("Введите строку для копирования: ")
	la 	a0, str
	li	a1, strSize
	li	a7, 8
	ecall #input of the stroke
	
	mv	a1, a0
	
	la	a0, strCopy
	
	strcpy(a0, a1) # a0 - destination - pointer to the string where the data will be copied to; 
			#a1 – source - pointer to the source string of the copied data.
			#returns Nothing
			
	print_str ("Содержание скопированной строки: ")
	la	a0, strCopy
	li	a7, 4
	ecall
	
	#test_with_the_chars_stroke
	print_str ("Строка для копирования: ")
	la	a0, strTest1
	li	a7, 4
	ecall
	
	la	a0, strTest1Copy
	la	a1, strTest1
	ecall
	strcpy(a0, a1) # a0 - destination - pointer to the string where the data will be copied to; 
			#a1 – source - pointer to the source string of the copied data.
			#returns Nothing
			
	print_str ("\nСодержание скопированной строки: ")
	la	a0, strTest1Copy
	li	a7, 4
	ecall
	
	#test_with_the_chars_stroke_and_Macro
	print_str ("\nСтрока для копирования: ")
	la	a0, strTest1Macro
	li,	a7, 4
	ecall
	la	a0, strTest1CopyMacro
	la	a1, strTest1Macro
	strcpy(a0, a1) # a0 - destination - pointer to the string where the data will be copied to; 
			#a1 – source - pointer to the source string of the copied data.
			#returns Nothing
			
	print_str ("\nСодержание скопированной строки: ")
	la	a0, strTest1CopyMacro
	li	a7, 4
	ecall
	exit
