segment .data
arre db 0,0,0
len equ $-arre

ln db 10,13
lenln equ $-ln

segment .bss
  datos resb 4

segment .text
global _start
_start:


ciclo:


mov eax, 3
mov ebx, 0
mov ecx, datos
mov edx, 2
int 80h

mov eax, [datos+0]
sub eax, 48
mov ebx, [datos+1]
sub ebx, 48

mov edi, 10
mul edi
add eax,ebx

mov [arre+0], eax

mov eax, 4
mov ebx, 0
mov ecx, arre
mov edx, 1
int 80h


;add edi, 1 ; aumentamos en dos el valor del contador
;cmp edi,len
; preguntamos si ya hemos impreso todos los
; datos del arreglo
;jb ciclo

salir:
mov eax, 1
xor ebx, ebx
int 0x80
