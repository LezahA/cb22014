# cb22014
Soluciones a los ejercicios planteados en Diseño y Estructura de Computadoras

## Solucion resta
### Declaración de variables:
Las variables x, y y z se declaran como palabras de 16 bits (dw) con valores iniciales que son caracteres ('8', '3', '1'). Estos caracteres se almacenan en memoria como sus códigos ASCII.

### Conversión de caracteres a valores numéricos:
Al cargar estos valores en los registros eax, ebx y ecx y restarles el valor ASCII de '0', se convierten en sus equivalentes numéricos para poder realizar operaciones aritméticas con ellos.

### Operaciones aritméticas:
Se realizan las operaciones de resta entre los valores numéricos de x, y y z en los registros eax, ebx y ecx, respectivamente.

### Conversión de valores numéricos a caracteres:
Al sumar el valor ASCII de '0' al resultado en eax, se convierte de nuevo en un carácter para poder ser almacenado y mostrado como parte del mensaje.
En resumen, en este caso, se está realizando una conversión de caracteres a valores numéricos al restar el valor ASCII de '0' a las variables x, y y z, permitiendo luego realizar operaciones aritméticas con estos valores numéricos en lenguaje ensamblador.

## Solucion Multiplicacion

### Declaración de variables:

x y y son variables de 8 bits (1 byte) que almacenan los caracteres '3' y '10' respectivamente.

msg es un mensaje que se imprimirá en pantalla.

len es una constante que contiene la longitud del mensaje.

En la sección .bss, se reserva espacio en memoria para la variable prod, que almacenará el resultado de la multiplicación. Se reservan 3 bytes, ya que el resultado puede ser de hasta 2 dígitos.

En la sección .text, se define el punto de entrada del programa (_start).

Se carga el valor de x en el registro al y se convierte de carácter a número restando '0' (sub al, '0'). Lo mismo se hace con y en el registro bl.

Se realiza la multiplicación de al por bl usando la instrucción mul bl. El resultado se almacena en el registro ax, donde al contiene la parte baja (unidades) y ah la parte alta (decenas).

Se convierte el resultado a caracteres sumando '00' a ax. Esto se hace para poder imprimir el resultado como texto.

Se mueve el resultado de ax a la variable prod en memoria.

Se imprime el mensaje almacenado en msg usando las interrupciones del sistema operativo.

Se imprime el resultado almacenado en prod usando las interrupciones del sistema operativo. Se especifica que se impriman 2 bytes, ya que el resultado tiene 2 dígitos.

Finalmente, se termina el programa usando la interrupción sys_exit.

## Solucion division

### Declaración de variables:
x y y son variables de 32 bits (4 bytes) que almacenan los caracteres '7' y '3' respectivamente.

msg es un mensaje que se imprimirá en pantalla.
len es una constante que contiene la longitud del mensaje.

En la sección .bss, se reserva espacio en memoria para la variable cociente, que almacenará el resultado de la división. Se reservan 4 bytes (32 bits) para el cociente.

En la sección .text, se define el punto de entrada del programa (_start).

Se carga el valor de x en el registro eax y se convierte de carácter a número restando '0' (sub eax, '0'). Lo mismo se hace con y en el registro ebx.

Se utiliza la instrucción cdq (Convert Doubleword to Quadword) para extender el signo de eax a edx:eax. Esto es necesario porque la división puede dar un resultado negativo y se necesita un registro de 64 bits para almacenar el dividendo.

Se realiza la división de edx:eax por ebx usando la instrucción div ebx. El cociente se almacena en eax.

Se convierte el cociente a caracteres sumando '0' a eax. Esto se hace para poder imprimir el resultado como texto.

Se mueve el cociente de eax a la variable cociente en memoria.

Se imprime el mensaje almacenado en msg usando las interrupciones del sistema operativo.

Se imprime el cociente almacenado en cociente usando las interrupciones del sistema operativo. Se especifica que se impriman 4 bytes, ya que el cociente puede tener hasta 4 dígitos.
