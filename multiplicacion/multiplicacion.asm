section .data
    x db '3'
    y db '10'
    msg db "producto de 'x' y 'y' es "
    len equ $ - msg

section .bss
    prod resb 3 ; Reservar espacio para el producto (3 bytes)

section .text
    global _start

_start:
    mov al, [x]
    sub al, '0'
    mov bl, [y]
    sub bl, '0'

    mul bl      ; Multiplicar al por bl
    ; El resultado está en ax (al = parte baja, ah = parte alta)

    add ax, '00' ; Convertir el resultado a caracteres

    mov [prod], ax ; Guardar los dos bytes del resultado en prod

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, prod
    mov edx, 2 ; Longitud del resultado (2 dígitos)
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

