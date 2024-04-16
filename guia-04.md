# Guía 4

## Ejercicio 1

### Enunciado

> Dado un conjunto de números enteros distintos de cero, informar el porcentaje de pares e impares

### Solución

```pascal
program Project1;
Var
   CantidadNumeros: byte;
   Contador: byte;
   Numero: integer;
   CantidadPares: byte;
   CantidadImpares: byte;
begin
  Writeln('Ingrese cantidad de numeros');
  Readln(CantidadNumeros);
  Contador := 0;
  CantidadPares := 0;
  CantidadImpares := 0;
  while Contador < CantidadNumeros do
        begin
          Writeln('Ingrese un numero');
          Readln(Numero);
          if Numero <> 0 then
             if Numero MOD 2 = 0 then
                CantidadPares := CantidadPares + 1
             else
                 CantidadImpares := CantidadImpares + 1;
          Contador := Contador + 1;
        end;
  Writeln('El porcentaje de numeros pares es: ', (CantidadPares * 100 / CantidadNumeros):5:2);
  Writeln('El porcentaje de numeros impares es: ', (CantidadImpares * 100 / CantidadNumeros):5:2);
  Readln();
end.
```

## Ejercicio 2

### Enunciado

> Leer dos valores reales A y B (A < B), luego N números reales, calcular e informar el
> promedio de los que pertenecen al intervalo [A, B]

### Solución

```pascal
program Project1;
Var
   CantidadNumeros, Contador, CantidadIntervalo: byte;
   Numero, SumaIntervalo: real;
   A, B: real;
begin
  Writeln('Ingrese un valor real');
  Readln(A);
  Writeln('Ingrese otro valor real mayor que el anterior');
  Readln(B);
  Writeln('Ingrese cantidad de numeros');
  Readln(CantidadNumeros);

  Contador := 0;
  CantidadIntervalo := 0;
  SumaIntervalo := 0;
  while Contador < CantidadNumeros do
        begin
          Writeln('Ingrese un numero');
          Readln(Numero);
          if (Numero >= A) AND (Numero <= B) then
             begin
             SumaIntervalo := SumaIntervalo + Numero;
             CantidadIntervalo := CantidadIntervalo + 1;
             end;
          Contador := Contador + 1;
        end;

  Writeln('El promedio es: ', (SumaIntervalo / CantidadIntervalo):5:2);
  Readln();
end.
```

## Ejercicio 3

### Enunciado

> Dado un conjunto de números enteros distintos de cero, informar el menor y el mayor de ellos.

### Solución

```pascal
program Project1;
Var
   CantidadNumeros, Contador: byte;
   Numero, Mayor, Menor: integer;
begin
  Writeln('Ingrese cantidad de numeros');
  Readln(CantidadNumeros);
  Menor := 9999;
  Mayor := -9999;

  Contador := 0;
  while Contador < CantidadNumeros do
        begin
          Writeln('Ingrese un numero');
          Readln(Numero);
          if Numero <> 0 then
             if Numero > Mayor then
                Mayor := Numero;
             if Numero < Menor then
                Menor := Numero;
          Contador := Contador + 1;
        end;

  Writeln('El numero mayor es: ', Mayor);
  Writeln('El numero menor es: ', Menor);
  Readln();
end.
```

## Ejercicio 4

### Enunciado

> Dado un conjunto de números enteros distintos de cero, informar el mayor múltiplo de 3.

### Solución

```pascal
program Project1;
Var
   CantidadNumeros, Contador: byte;
   Numero, Mayor: integer;
begin
  Writeln('Ingrese cantidad de numeros');
  Readln(CantidadNumeros);
  Mayor := -9999;

  Contador := 0;
  while Contador < CantidadNumeros do
        begin
          Writeln('Ingrese un numero');
          Readln(Numero);
          if (Numero MOD 3 = 0) then
             if Numero > Mayor then
                Mayor := Numero;
          Contador := Contador + 1;
        end;

  Writeln('El numero multiplo de 3 mayor es: ', Mayor);
  Readln();
end.
```

## Ejercicio 5

### Enunciado

> Ingresar largo y ancho de un conjunto de rectángulos, para cada uno calcular e informar la
> superficie. Detener el proceso cuando se hayan ingresado N datos o el perímetro del
> rectángulo ingresado supere un valor X. (N y X son valores ingresados por teclado).

### Solución

```pascal
program Project1;
Var
   CantidadRectangulos, Contador: byte;
   Superficie, Perimetro, PerimetroMaximo, Alto, Ancho: real;
begin
  Writeln('Ingrese cantidad de rectangulos');
  Readln(CantidadRectangulos);
  Writeln('Ingrese el perimetro maximo');
  Readln(PerimetroMaximo);

  Contador := 0;
  while Contador < CantidadRectangulos do
        begin
          Writeln('Ingrese alto del rectangulo');
          Readln(Alto);
          Writeln('Ingrese ancho del rectangulo');
          Readln(Ancho);
          Perimetro := Ancho * 2 + Alto * 2;
          Superficie := Ancho * Alto;

          Writeln('La superficie es: ', Superficie:8:2);
          if (Perimetro > PerimetroMaximo) then
             begin
             Writeln('Superaste el perimetro maximo');
             Break;
             end;
          Contador := Contador + 1;
        end;

  Readln();
end.
```

## Ejercicio 6

### Enunciado

> Dado un conjunto de figuras geométricas y sus respectivas áreas:
>
> - Figura ( ‘T’=triángulo, ‘C’=cuadrado, ‘R’=rectángulo, ‘F’=Fin de datos
> - Area
>   Informar:
>   a) Porcentaje de cada tipo de figura.
>   b)Figura con mayor área (suponer única).

### Solución

```pascal
program Project1;
Var
   CantidadFiguras, Contador: byte;
   Superficie, SuperficieMayor, Alto, Ancho: real;
   Figura: char;
begin
  Writeln('Ingrese cantidad de figuras');
  Readln(CantidadFiguras);

  Contador := 0;
  SuperficieMayor := 0;
  Superficie := 0;
  while Contador < CantidadFiguras do
        begin
          Writeln('Ingrese una figura ("T", "C", "R", "F")');
          Readln(Figura);
          Figura := Upcase(Figura);

          if Figura <> 'F' then
             begin
             Writeln('Ingrese el alto');
             Readln(Alto);
             Writeln('Ingrese el ancho');
             Readln(Ancho);
             end;

          case Figura of
               'T': Superficie := (Ancho * Alto) / 2;
               'C': Superficie := Ancho * 2;
               'R': Superficie := Ancho * Alto;
               'F': Break;
          end;

          if (Superficie > SuperficieMayor) then
             SuperficieMayor := Superficie;

          Contador := Contador + 1;
        end;

  Writeln('La superficie mayor es: ', SuperficieMayor:8:2);
  Readln();
end.
```

## Ejercicio 7

### Enunciado

> Rehacer el ejercicio 2. Ahora los datos están en el archivo ‘Numeros.TXT’ donde en la primer
> línea se encuentran los valores de A y B (con A < B), no se sabe cuántos números reales hay,
> calcular e informar el promedio de los que pertenecen al intervalo [A, B]

### Solución

```pascal
program Project1;
Var
   CantidadIntervalo: byte;
   Numero, SumaIntervalo: real;
   A, B: real;
   Archivo: text;
begin
  Assign(Archivo, 'numeros.txt');
  Reset(Archivo);
  Readln(Archivo, A, B);

  CantidadIntervalo := 0;
  SumaIntervalo := 0;
  while Not EOF(Archivo) do
        begin
          Readln(Archivo, Numero);
          if (Numero >= A) AND (Numero <= B) then
             begin
             SumaIntervalo := SumaIntervalo + Numero;
             CantidadIntervalo := CantidadIntervalo + 1;
             end;
        end;

  Writeln('El promedio es: ', (SumaIntervalo / CantidadIntervalo):5:2);
  Close(Archivo);
  Readln();
end.
```

## Ejercicio 8

### Enunciado

> Leer números desde un archivo e informar la cantidad de veces en que un número es igual al que le antecede.

### Solución

```pascal
program Project1;
Var
   Numero, Auxiliar, Contador: byte;
   Archivo: text;
begin
  Assign(Archivo, 'numeros.txt');
  Reset(Archivo);
  Readln(Archivo, Numero);

  Contador := 0;
  while Not EOF(Archivo) do
        begin
          Readln(Archivo, Auxiliar);
          if (Numero = Auxiliar) then
             Contador := Contador + 1;
          Numero := Auxiliar;
        end;

  Writeln('Se repiten: ', Contador, ' veces');
  Close(Archivo);
  Readln();
end.
```

## Ejercicio 9

### Enunciado

> Rehacer el ejercicio 4 (leyendo desde archivo) Ingresar un valor entero X por teclado y
> luego:
> a) Informar el mayor múltiplo de X, poniendo un cartel aclaratorio si no existiera.
> b) Generar un Archivo ‘Multiplo.TXT’ con todos los múltiplos de X que hubiera.

### Solución

```pascal
program Project1;
Var
   Numero, Mayor: integer;
   ArchivoE, ArchivoS: text;
begin
  Assign(ArchivoE, 'numeros.txt');
  Reset(ArchivoE);
  Assign(ArchivoS, 'salida.txt');
  Rewrite(ArchivoS);

  Readln(ArchivoE, Numero);
  Mayor := -9999;

  while Not EOF(ArchivoE) do
        begin
          Readln(ArchivoE, Numero);
          if (Numero MOD 3 = 0) then
             begin
                 Writeln(ArchivoS, Numero);
                 if (Numero > Mayor) then
                    Mayor := Numero;
             end;
        end;
  if (Mayor = -9999) then
     Writeln(ArchivoS, 'No existe ningun multiplo de 3');

  Close(ArchivoE);
  Close(ArchivoS);
  Readln();
end.
```

## Ejercicio 10

### Enunciado

> Leer un número, calcular e informar la suma de los números naturales hasta ese número.

### Solución

```pascal
Program Ejercicio10;
Var
    Numero: byte;
    Acumulador, i: word;
Begin
    Writeln('Ingrese la cantidad de numeros a ingresar');
    Readln(Numero);

    Acumulador := 0;
    for i := 1 to Numero do
        Acumulador := Acumulador + i;

    Writeln(Acumulador);
    Readln();
End.
```

## Ejercicio 11

### Enunciado

> Leer N números enteros, calcular el mínimo de los impares
> y la cantidad de repeticiones del mismo.

### Solución

```pascal
Program Ejercicio11;
Var
    N, i: word;
    Minimo, Numero: integer;
Begin
    Writeln('Ingrese la cantidad de numeros a ingrear');
    Readln(N);

    Minimo := 9999;
    for i := 1 to N do
        begin
            Writeln('Ingrese un numero entero');
            Readln(Numero);

            if Numero < Minimo then
                Minimo := Numero;
        end;

    Writeln('El numero mas chico es: ', Minimo);
    Readln();
End.
```

## Ejercicio 12

### Enunciado

> Un comercio realiza el 10% de descuento por ventas mayores a $1000.
> Leer la cantidad de ventas realizadas, y luego el importe de cada una,
> calcular e informar el importe total que se otorgo en concepto de descuento
> y la cantidad de ventas que no tuvieron dicho beneficio.
> Cómo cambiaria el código si en vez de 10% y $ 1000,
> dichos valores fueran variables (igual para todas las ventas).

### Solución

```pascal
Program Ejercicio12;
Var
    VentasRealizadas, VentasSinBeneficio, Descuento: byte;
    Importe, ImporteTotal, ImporteMinimo, ImporteDescontado: real;
    Respuesta: char;
Begin
    Writeln('Ingrese el importe minimo para obtener un descuento');
    Readln(ImporteMinimo);
    Writeln('Ingrese el descuento que desea aplicar');
    Readln(Descuento);

    Respuesta := 'N';
    VentasRealizadas := 0;
    VentasSinBeneficio := 0;
    Importe := 0;
    ImporteTotal := 0;
    ImporteDescontado := 0;
    repeat
          Writeln('Ingrese un importe');
          Readln(Importe);

          VentasRealizadas := VentasRealizadas + 1;
          if (Importe >= ImporteMinimo) then
             begin
             Importe := Importe * 0.9;
             ImporteDescontado := ImporteDescontado + (Importe * 0.1);
             end
             else
                 VentasSinBeneficio := VentasSinBeneficio + 1;

          ImporteTotal := ImporteTotal + Importe;

          Writeln('¿Desea continuar ingresando importes?');
          Writeln('[S] - Si');
          Writeln('[N] - No');
          Readln(Respuesta);
          Respuesta := UpCase(Respuesta);
    until Respuesta = 'N';

    Writeln('el importe total es: ', ImporteTotal:8:2);
    Writeln('la cantidad de ventas es: ', VentasRealizadas);
    Writeln('la cantidad de ventas sin beneficio es: ', VentasSinBeneficio);
    Readln();
End.
```

## Ejercicio 13

### Enunciado

> Para N personas, ingresar sexo ( F : femenino, M : masculino) y edad (en años).
> Calcular e informar:
> a) Porcentaje de cada sexo.
> b) Promedio general de las edades ingresadas, el promedio de edad de los varones y el
> promedio de edad de las mujeres. ¿Qué control puede hacer para darle robustez al
> algoritmo y evitar que cancele por división por 0?.

### Solución

```pascal
Program Ejercicio13;
Var
   N, Edad, i, ContadorV, ContadorM: byte;
   Sexo: char;
   PromedioV, PromedioM, Promedio: real;
   SumV, SumM: word;
Begin
    Writeln('Ingrese la cantidad de personas que quiere ingresar');
    Readln(N);

    ContadorV := 0; ContadorM := 0; PromedioV := 0; PromedioM := 0; SumV := 0; SumM := 0; Promedio := 0;

    for i := 1 to N do
        begin
          repeat
                Writeln('Ingrese el sexo de la persona masculino o femenino (M o F)');
                Readln(Sexo);
                Sexo := UpCase(Sexo);
          until (Sexo = 'M') OR (Sexo = 'F');

          Writeln('Ingrese la edad');
          Readln(Edad);

          if (Sexo = 'M') then
             begin
             ContadorV := ContadorV + 1;
             SumV := SumV + Edad;
             end
             else
                 begin
                 ContadorM := ContadorM + 1;
                 SumM := SumM + Edad;
                 end;
        end;
    if (ContadorV > 0) then
             PromedioV := SumV / ContadorV;
          if (ContadorM > 0) then
             PromedioM := SumM / ContadorM;

          Promedio := (SumV + SumM) / (ContadorM + ContadorV);

    Writeln('El promedio general es: ', Promedio:8:2);
    Writeln('El promedio de varones es: ', PromedioV:8:2);
    Writeln('El promedio de mujeres es: ', PromedioM:8:2);

    Readln();
End.
```

## Ejercicio 14

### Enunciado

> Leer las N ventas efectuadas por una farmacia Social. Por cada una se ingresa el monto y un código indicador del rubro:
> L - venta libre
> M - medicamentos (23% de descuento)
> P - perfumería (promoción 10% de descuento).
> A - accesorios (promoción, si el monto supera $X corresponde un 5% de descuento)
> Se pide informar:
> 1. por cada venta el importe a pagar (con el descuento efectuado, si corresponde)
> 2. Importe total bonificado en concepto de descuentos
> 3. Total de operaciones e importe total en venta libre
> 4. Monto de venta máximo y a que rubro pertenece

### Solución

```pascal
Program Ejercicio14;
Var
   Arch: text;
   N, i, ContadorLibre: byte;
   X, Monto, TotalLibre, Descuento, ImporteFinal, MontoMaximo: real;
   Codigo, aux, CodigoMaximo: char;
Begin
    Assign(Arch, 'farmacia.txt');
    Reset(Arch);
    Readln(Arch, N);
    Readln(Arch, X);

    TotalLibre := 0; ContadorLibre := 0; Descuento := 0; ImporteFinal := 0; MontoMaximo := -9999;
    for i := 1 to N do
        begin
        Readln(Arch, Monto, aux, Codigo);

        case Codigo of
             'L': begin
                  TotalLibre := TotalLibre + Monto;
                  ContadorLibre := ContadorLibre + 1;
                  ImporteFinal := Monto;
                  Writeln('Monto a pagar en libre es: ', Monto:8:2);
                  end;
             'P': begin
                  ImporteFinal := Monto * 0.9;
                  Writeln('Monto a pagar en perfumeria es: ', ImporteFinal:8:2);
                  Descuento := Descuento + (Monto - ImporteFinal);
                  end;
             'M': begin
                  ImporteFinal := Monto * 0.9;
                  Writeln('Monto a pagar en medicamento es: ', ImporteFinal:8:2);
                  Descuento := Descuento + (Monto - ImporteFinal);
                  end;
             'A': begin
                  ImporteFinal := Monto;
                  if (Monto > X) then
                     ImporteFinal := Monto * 0.95;
                  Writeln('Monto a pagar en accesorios es: ', ImporteFinal:8:2);
                  Descuento := Descuento + (Monto - ImporteFinal);
                  end;
             end;
        if (Monto > MontoMaximo) then
           begin
           MontoMaximo := Monto;
           CodigoMaximo := Codigo;
           end;
        end;

    Writeln('Total de operaciones realizadas en venta libre: ', ContadorLibre);
    Writeln('Importe total en venta libre: ', TotalLibre:8:2);
    Writeln('Importe total bonificado en descuentos es: ', Descuento:8:2);
    Writeln(CodigoMaximo, MontoMaximo:8:2);

    Close(Arch);
    Readln();
End.
```
