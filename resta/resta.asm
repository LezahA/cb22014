section .data

; La directiva dw (define word) se utiliza para declarar variables de 16 bits (2 bytes) de tamaño

    x dw '8'    ; Declarar x como de 16 bits
    y dw '3'    ; Declarar y como de 16 bits
    z dw '1'    ; Declarar z como de 16 bits
    msg db  "diferencia de 'x', 'y' y 'z' es "
    len equ $ - msg

section .bss ; Se utiliza para reservar espacio en memoria para variables de 16 bits (2 bytes)
    diff resw 1     ; Reservar espacio para la diferencia
    
section .text
    global _start

_start:
    mov eax, [x] ; Cargar valor de x
    sub eax, '0' ; Restar cero para convertir en el equivalente de valor numerico
    mov ebx, [y] ; Cargar valor de y
    sub ebx, '0' ; Restar cero
    mov ecx, [z] ; Cargar valor de z
    sub ecx, '0' ; Restar cero

    sub eax, ebx ; almacenar en eax valor de x-y
    sub eax, ecx ; eax - z

    add eax, '0' ; sumar valor 0 para convertirlo en caracter nuevamente

    mov [diff], eax ; mover contenido de registro eax a la direccion de memoria apuntada por diff

    mov edx, len ; longitud del mensaje
    mov ecx, msg ; 
    mov ebx, 1
    mov eax, 4  ; sys_write
    int 0x80

    mov ecx, diff ; Cargar en el registro ecx la dirección de memoria donde se encuentra almacenado el resultado de la resta, que está en la variable diff.
    mov edx, 1
    mov ebx, 1
    mov eax, 4  ; sys_write
    int 0x80

    mov eax, 1 ; sys_exit
    int 0x80
