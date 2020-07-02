segment .data
arre db 25,9,17
len equ $-arre

ln db 10,13
lenln equ $-ln

segment .bss
  datos resb 4

segment .text
global _start
_start:
mov ebp, arre
mov edi, 0
; colocamos la direccion de memoria en el registro ebp
; colocamos el numero que nos servira de contador en el
; registro edi


ciclo:
mov ebx, 0
mov ecx, 1
mov ax, [ebp + edi]
mov dx, 0
mov si, 10

div si

add ax, '0'
mov [datos+ebx], ax
add dx, '0'
mov [datos+ecx], dx

mov ax,0
mov dx,0

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

add edi, 1 ; aumentamos en dos el valor del contador
cmp edi,len
; preguntamos si ya hemos impreso todos los
; datos del arreglo
jb ciclo

salir:
mov eax, 1
xor ebx, ebx
int 0x80
