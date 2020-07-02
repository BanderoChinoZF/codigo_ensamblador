segment .data
array1 db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
len equ $-array1

ln db 10,13
lenln equ $-ln

segment .bss
  array2 resb 10
  datos resb 4

segment .text
global _start
_start:
cld   ; NO LO OLVIDE!!!
mov esi, array1
mov edi, array2
mov ecx, 10

rep	movsb




mov ebp, array2
mov edi, 0

ciclo:

mov ah,0
mov al, [ebp+edi]

mov dl, 10
div dl

add al, '0'
mov [datos+0], al

add ah, '0'
mov [datos+1], ah

mov eax, 4
mov ebx, 0
mov ecx, datos
mov edx, 2
int 80h

mov eax, 4
mov ebx, 0
mov ecx, ln
mov edx, lenln
int 80h

add edi, 1 ; aumentamos en uno el valor del contador
cmp edi,10
; preguntamos si ya hemos impreso todos los
; datos del arreglo
jb ciclo


salir:
mov eax, 1
xor ebx, ebx
int 0x80
