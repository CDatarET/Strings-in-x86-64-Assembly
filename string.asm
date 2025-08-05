%macro rw 4		;macro for reading and writing
    mov rax, %1
    mov rdi, %2
    mov rsi, %3
    mov rdx, %4
    syscall
%endmacro

section .data
    msg1 db "Enter a String of max 25 chars", 10
    msgLen1 equ $-msg1
    
    msg2 db "Enter another String of max 25 chars", 10
    msgLen2 equ $-msg2
    
    msg3 db "Concatenated String is- ", 10
    msgLen3 equ $-msg3
    
    msg4 db "The number of spaces are-", 10
    msgLen4 equ $-msg4
    
    msg5 db "The number of words are- ", 10
    msgLen5 equ $-msg5
    
    newLine db " ", 10
    newLineLen equ $-newLine

section .bss
	string1 resb 25		;first string (taken as input)
	l1 resb 1			;length of first string
	
	string2 resb 25		;second string (taken as input)
	l2 resb 1			;length of second string
	
	string3 resb 50		;third string (concatenated string)
	l3 resb 50			;length of third string
	
	spaces resb 3		;spaces in string

section .text
    global _start
_start:
	rw 1, 1, msg1, msgLen1	;take input for string 1
	rw 0, 0, string1, 25
	dec rax
	mov [l1], rax
	
	rw 1, 1, msg2, msgLen2	;take input for string 2
	rw 0, 0, string2, 25
	dec rax
	mov [l2], rax
	
	concat:
		mov rsi, string1
		mov rdi, string3
		
		copy1:
			mov al, [rsi]
			mov [rdi], al
			inc rsi
			inc rdi
			dec byte[l1]
			jnz copy1
			
		mov rsi, string2
		copy2:
			mov al, [rsi]
			mov [rdi], al
			inc rsi
			inc rdi
			dec byte[l2]
			jnz copy2
		
	rw 1, 1, newLine, newLineLen	;print out strings and the concat string
	rw 1, 1, string1, 25
	rw 1, 1, string2, 25
	rw 1, 1, newLine, newLineLen
	rw 1, 1, msg3, msgLen3
	rw 1, 1, string3, 50
	rw 1, 1, newLine, newLineLen
	
    xor rax,rax
    mov rax, [l1]
    add rax, [l2]
    mov [l3], rax
	
	rw 1, 1, msg4, msgLen4
	rw 1, 1, spaces, 3
	rw 60, 0, 0, 0
