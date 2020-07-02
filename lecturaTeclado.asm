; 1.- Escribir en pantalla un numero de dos digitos
; 2.- Leer de teclado un numero de dos digitos.

;arre dy ||||||
;datos resb ||||||

;Ejercicio 2

SYS_SALIDA equ 1
SYS_LEE equ 3
SYS_PRINT equ 4
STDIN equ 0
STDOUT equ 1

segment .data
	arre db 0,0,0
	len equ $-arre
	
	ln db 
	lenln equ $-arre

segment .bss
	datos resb 4

section .text
	global start

_start:

ciclo:

	mov eax, SYS_LEE
	mov ebx, STDIN
	mov ecx, datos
	mov edx, 2
	int 80h
	
	mov eax, [datos+0]
	sub eax, 48
	mov ebx, [datos+1]
	sub ebx, 48
	
	mov edi, 10
	mul edi
	add eax, ebx
	
	mov [arre+0]

	
	mov eax, SYS_PRINT
	mov ebx, STDOUT
	mov ecx, ln
	mov edx, lenln
	int 80h


