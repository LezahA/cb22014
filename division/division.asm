section .data
    x dd '7'   ; Declarar x
    y dd '3'    ; Declarar y
    msg db "cociente de 'x' / 'y' es "
    len equ $ - msg

section .bss
    cociente resd 1 ; Reservar espacio para el cociente (32 bits)

section .text
    global _start

_start:
    mov eax, [x] ; Cargar valor de x en eax
    sub eax, '0' ; Restar '0' para convertir a valor numérico
    mov ebx, [y] ; Cargar valor de y en ebx
    sub ebx, '0' ; Restar '0' para convertir a valor numérico

    cdq          ; Extender el signo de eax a edx:eax

    div ebx      ; Dividir edx:eax por ebx, cociente en eax

    add eax, '0' ; Convertir el cociente a carácter ASCII

    mov [cociente], eax ; Guardar el cociente en la variable cociente

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, cociente
    mov edx, 4 ; Longitud del cociente (4 dígitos)
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80


