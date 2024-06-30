# Arreglos: Vectores

## Búsqueda de elementos

Para saber si un valor se encuentra en el arreglo lo que haremos es buscarlo recorriendo el
arreglo con un ciclo while, esto es así porque no necesitamos recorrer todos los elementos en todos
los casos, supongamos que el elemento que buscamos se encuentra en la primera posición:

> [32, 19, 28, 10, 19, ..., n] -> Si el número que buscamos es el 32, podemos dejar de recorrer
> el arreglo apenas nos topemos con él

El avance en el ciclo se determina por dos factores:

1. Todavía quedan elementos por inspeccionar (i <= N, N = elementos del arreglo)
2. No se encontró el valor buscado (V[i] <> X, V[i] = elemento del arreglo, X = elemento a buscar)

## Algoritmos de búsqueda

### Búsqueda Binaria

La búsqueda binaria se implementa en arreglos que estén ordenados, esto se da por el principio de
como se efectua esta búsqueda: Se parte el arreglo que tengamos a la mitad y evaluamos si ese es el
elemento que estamos buscando, si no lo es, nos fijamos si es menor o mayor al que buscamos, así
podemos determinar si se encuentra en la mitad izquierda o derecha del arreglo, repitiendo este
paso hasta que encontremos el número buscado.

> Supongamos que buscamos el número 3 del siguiente arreglo:
> [1, 2, 3, 4, 8, 9, 12] -> Lo que hacemos es agarrar el elemento del medio, en este caso el 4
> evaluamos si el número que buscamos es igual al que tomamos 3 <> 4, y determinamos que 3 es menor
> que 4 por lo que debería encontrarse a la izquierda de nuestro arreglo, terminando con este arreglo
> [1, 2, 3] -> Ahora lo que hacemos es repetir el primer paso, buscamos el elemento del medio, en
> este caso el 2 y lo evaluamos con el número buscado 2 <> 3 y 2 < 3 por lo que debería estar a la
> derecha del arreglo, esto nos termina dejando con este arreglo
> [3] -> tomamos el único elemento de este nuevo arreglo y lo evaluamos con el número buscado
> 3 = 3, por lo que 3 se encuentra en nuestro arreglo (este paso es importante para determinar si
> el número que buscamos se encuentra o no dentro del arreglo)

## Ordenación de los elementos de un vector

Algunos procesos sobre vectores, dependen de que los elementos se encuentren en orden.
Siempre es posible ordenarlos, utilizando métodos de ordenación.

### Método de burbujeo

El método de burbujeo recorre el arreglo comparando dos elementos consecutivos (V[i] y V[i + 1])
Si están desordenados (V[i] > V[i + 1]), los intercambia. Este proceso provoca que al finalizar
una "pasada" o "barrida" sobre el arreglo, el elemento mayor se desplace a la derecha, ocupando el
sitio que corresponde.
Ya que los elementos van quedando ordenados de forma creciente, siendo el último elemento el que
está ocupando su lugar correctamente, la próxima "barrida" sobre el arreglo se realiza en la
cantidad de elementos que contiene el arreglo menos 1 o más.
Puede ocurrir que a los elementos ya ordenados a la derecha, se incorpore más de un elemento, esto
es detectado para que en la próxima barrida no se revisen elementos que ya están ordenados. Esto
se logra guardando en una variable K la posición del último cambio, en la próxima barrida se avanza
hasta K - 1.
Estas barridas se repiten hasta que en una de ellas no se registren cambios, es decir, que K sea
igual a 0, o que al ir reduciendo el tamaño del arreglo a ordenar, resulte K igual a 1.

## Eliminación en un arreglo

Para eliminar un elemento en un arreglo, deberá tomar la posición del elemento que quiere eliminar,
luego tendrá que reemplazar todos los elementos del arreglo empezando desde la posición que desea
borrar por los elementos en esa posición más uno, y por último, reducir el tamaño del arreglo en 1
(N := N - 1).

```pascal
Procedure Elimina(Var V: TV; Var N: byte; Pos: byte);
Var
    i: byte;
begin
    for i := Pos to N - 1 do
        V[i] := V[i + 1];
    N := N - 1;
end;
```

## Inserción de un valor X en la posición Pos de un arreglo V de N elementos

Para insertar un elemento en un arreglo, deberá tomar tanto la posición del elemento como el mismo
elemento que quiere agregar, luego tendrá que mover todos los elementos empezando desde la posición
del elemento a insertar hacia la derecha, poner en la posición deseada el elemento a insertar y por
último incrementar el tamaño del arreglo en 1 (N := N + 1).

```pascal
Procedure Insertar(Var V: TV; Var N: byte; Pos: Byte; X: Integer);
var
    i: byte;
begin
    for i := N downto Pos do
        V[i + 1] := V[i];
    V[Pos] := X;
end;
```

## Inserción de un valor X en un arreglo ordenado V de N elementos

Para insertar un elemento en un arreglo ordenado, deberá tomar elemento que quiere agregar, luego
tendrá que buscar la posición del primer elemento que sea mayor al que quiere agregar, y mover
los elementos empezando desde la posición que obtuvo menos 1 hacia la derecha, poner en la posición
obtenida el elemento a insertar y por último incrementar el tamaño del arreglo en 1 (N := N + 1).

```pascal
Procedure InsertarOrdenado(Var V: TV; Var N: byte; X: real);
var
    j: byte;
begin
    j := N;
    while (j > 0) AND (V[j] > X) do
    begin
        V[j + 1] := V[j];
        j := j - 1;
    end;

    V[j + 1] := X;
    N := N + 1;
end;
```

## Intercalación de dos arreglos ordenados

```pascal
Procedure Intercalacion(V1, V2: TV; N, M: byte; Var V3: TV; Var K: byte);
var
    i, j, t: byte;
begin
    i := 1;
    j := 1;
    K := 0;

    while (i <= N) AND (j <= M) do
    begin
        K := K + 1;
        if V1[i] < V2[j] then
        begin
            V3[K] := V1[i];
            i := i + 1;
        end
        else
            if V1[i] > V2[j] then
            begin
                V3[K] := V2[j];
                j := j + 1;
            end
            else
            begin
                V3[K] := V1[i];
                i := i + 1;
                j := j + 1;
            end;
    end;

    for t := i to N do
    begin
        K := K + 1;
        V3[K] := V1[t];
    end;
    for t := j to M do
    begin
        K := K + 1;
        V3[K] := V2[t];
    end;
end;
```
