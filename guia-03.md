# Guía 3

## Ejercicio 7

### Enunciado

> Si un jugador sacó o no el As de Oro del maso de cartas.

### Solución

```pascal
Program As;
Var
    Numero: byte;
    Palo: char;
Begin
    Writeln('Ingrese un numero de carta (1-40)');
    Readln(Numero);
    Writeln('Ingrese un palo (B, C, E, O)');
    Readln(Palo);

    if (Numero = 1) AND (Palo = 'O') then
        Writeln('Sacaste el as de oro')
    else
        Writeln('No sacaste el as de oro');
End.
```

## Ejercicio 8

### Enunciado

> Si un jugador obtuvo 'flor' (las tres cartas del mismo palo) después de recibir tres cartas.

### Solución

```pascal
Program Flor;
Var
    PrimerPalo, SegundoPalo, TercerPalo: char;
Begin
    Writeln('Ingrese un palos de carta (B, C, E, O)');
    Readln(PrimerPalo);
    Writeln('Ingrese otro');
    Readln(SegundoPalo);
    Writeln('Ingrese el ultimo');
    Readln(TercerPalo);

    if (PrimerPalo = SegundoPalo) AND (SegundoPalo = TercerPalo) then
        Writeln('Obtuviste flor');
End.
```

## Ejercicio 9

### Enunciado

> Si a partir de la deuda y el sueldo puede cancelar la deuda y cuánto le queda del sueldo.

### Solución

```pascal
Program CalculoDeuda;
Var
    Deuda, Saldo: real;
Begin
    Writeln('Ingrese su saldo');
    Readln(Saldo);
    Writeln('Ingrese su deuda');
    Readln(Deuda);

    if Saldo >= Deuda then
        Writeln('Puedes cancelar la deuda y te quedan $', (Saldo - Deuda):8:2)
    else
        Writeln('No puedes cancelar la deuda');
End.
```

## Ejercicio 10

### Enunciado

> Dada la masa corporal de una persona si tiene o no contextura normal.

### Solución

```pascal
Program CalcularMasa;
Var
    Altura, Peso, MasaCorporal: real;
Begin
    Writeln('Ingrese su altura en metros');
    Readln(Altura);
    Writeln('Ingrese su peso en kg');
    Readln(Peso);

    MasaCorporal := Peso / sqr(Altura);

    if (MasaCorporal >= 18) AND (MasaCorporal <= 25) then
        Writeln('Tienes una contextura normal')
    else
        Writeln('No tienes una contextura normal');
End.
```

## Ejercicio 11

### Enunciado

> Ingresar dos números enteros A y B, calcular e imprimir según las siguientes condiciones:
> A + B si son ambos positivos o ambos negativos
> 0 si alguno o ambos son cero
> A - B si A > B y signos opuestos
> B - A si B > A y signos opuestos

### Solución

```pascal
Program Numeros;
Var
    A, B, Resultado: integer;
Begin
    Writeln('Ingrese un numero entero');
    Readln(A);
    Writeln('Ingrese otro numero entero');
    Readln(B);

    if ((A > 0) AND (B > 0)) OR ((A < 0) AND (B <0)) then
        Resultado := A + B
    else
        if (A = 0) OR (B = 0) then
            Resultado := 0
        else
            if A > B then
                Resultado := A - B
            else
                Resultado := B - A;
    Writeln('El resultado es: ', Resultado);
End.
```

## Ejercicio 12

### Enunciado

> Ingresar X e Y, representen ordenada y abscisa de un punto en el plano,
> determinar a qué cuadrante pertenecen, si está sobre un eje o en el centro.

### Solución

```pascal
Program Cuadrantes;
Var
    X, Y: real;
Begin
    Writeln('Ingrese un punto en el eje X');
    Readln(X);
    Writeln('Ingrese un punto en el eje Y');
    Readln(Y);

    if (X = 0) AND (Y = 0) then
        Writeln('Está en el centro')
    else
        if (X = 0) then
            Writeln('Está sobre el eje X')
        else
            if (Y = 0) then
                Writeln('Está sobre el eje Y')
            else

                if (X > 0) then
                    if (Y > 0) then
                        Writeln('Está en el primer cuadrante')
                    else
                        Writeln('Está en el cuarto cuadrante')
                else
                    if (Y > 0) then
                        Writeln('Está en el segundo cuadrante')
                    else
                        Writeln('Está en el tercer cuadrante')
End.
```

## Ejercicio 13

### Enunciado

> En el parador Honolulu se dan cursos de windsurf, el importe a abonar por los mismos se
> calcula de la siguiente forma:
> El costo por cada clase es
> - $30 hasta 5 clases
> - $25 hasta 12 clases
> - $18 más de 12 clases
> Si no dispone de equipo propio debe agregar $5 por cada clase
> Los clientes del parador con tarjeta VIP tienen un descuento del 15% sobre el total.
> Determine
> - Los datos que debe ingresar
> - Presente 2 juegos de datos y su resultado

### Solución

```pascal
Program Cursos;
Var
    CantidadClases: byte;
    TarjetaVIP, TieneEquipo: char;
    Importe: real;
Begin
    Writeln('Ingrese la cantidad de clases');
    Readln(CantidadClases);
    Writeln('¿Tiene tarjeta VIP? (S/N)');
    Readln(TarjetaVIP);
    Writeln('¿Tiene equipo propio? (S/N)');
    Readln(TieneEquipo);

    if (CantidadClases <= 5) then
        Importe := CantidadClases * 30
    else
        if (CantidadClases <= 12) then
            Importe := CantidadClases * 25
        else
            Importe := CantidadClases * 18;

    if (TieneEquipo = 'N') then
        Importe := Importe + (CantidadClases * 5);
    if (TarjetaVIP = 'S') then
        Importe := Importe * 0.85;

    Writeln(Importe:8:2);
End.
```

## Ejercicio 14

### Enunciado

> Ingresar tres números por teclado, verificar si corresponden a las medidas de los lados de un triángulo.
> Si no lo son, informar "No son lados de un triángulo". Si lo son, informar el tipo de triángulo
> formado (equilátero, isósceles, escaleno). Informar además si es rectángulo.

### Solución

```pascal
Program Triangulos;
Var
    A, B, C, LadoMayor: real;
Begin
    Writeln('Ingrese el primer lado');
    Readln(A);
    Writeln('Ingrese el segundo lado');
    Readln(B);
    Writeln('Ingrese el tercer lado');
    Readln(C);

    if (A > B) AND (A > C) then
        LadoMayor := A
    else
        if (B > C) then
            LadoMayor := B
        else
            LadoMayor := C;

    if (LadoMayor >= (A + B)) OR (LadoMayor >= (A + C)) OR (LadoMayor >= (B + C)) then
        Writeln('No son lados de un triangulo')
    else
        if (A = B) AND (B = C) then
            Writeln('Es equilatero')
        else
            if (A = B) OR (A = C) OR (B = C) then
                Writeln('Es isosceles')
            else
                Writeln('Es escaleno');
End.
```

## Ejercicio 15

### Enunciado

> a) Ingresar dos variables numéricas enteras: MES y DIA e informar a qué quincena (1ra o 2da) y trimestre pertenecen.
> b) Ingresar una fecha (año, mes y dia) informar a qué estación pertenece.
> c) Ingresar dos fechas informar si la primera es menor o igual a la segunda.

### Solución

```pascal
// a)
Program Fecha;
Var
    Mes, Dia: byte;
Begin
    Writeln('Ingrese el mes');
    Readln(Mes);
    Writeln('Ingrese el dia');
    Readln(Dia);

    if (MES <= 3) then
        Writeln('Primer trimestre')
    else
        if (MES <= 6)
            Writeln('Segundo trimestre')
        else
            if (MES <= 9)
                Writeln('Tercer trimestre')
            else
                Writeln('Cuarto trimestre');

    if (DIA <= 15) then
        Writeln('Primer quincena')
    else
        Writeln('Segunda quincena');
```

```pascal
// b)
Program Fecha;
Var
    Mes, Dia: byte;
    Anio: word;
Begin
    Writeln('Ingrese el anio');
    Readln(Anio);
    Writeln('Ingrese el mes');
    Readln(Mes);
    Writeln('Ingrese el dia');
    Readln(Dia);

    if (Mes >= 13) OR (Dia >= 32) then
        Writeln('Fecha incorrecta')
    else
        if (Mes = 1) OR (Mes = 2) then
            Writeln('Verano')
        else
            if (Mes = 4) OR (Mes = 5) then
                Writeln('Otoño')
            else
                if (Mes = 7) OR (Mes = 8) then
                    Writeln('Invierno')
                else
                    if (Mes = 10) OR (Mes = 11) then
                        Writeln('Primavera')
                    else
                        if (Mes = 3) then
                            if (Dia <= 20) then
                                Writeln('Verano')
                            else
                                Writeln('Otoño')
                        else
                            if (Mes = 6) then
                                if (Dia <= 20) then
                                    Writeln('Otoño')
                                else
                                    Writeln('Invierno')
                            else
                                if (Mes = 9) then
                                    if (Dia <= 20) then
                                        Writeln('Invierno')
                                    else
                                        Writeln('Primavera')
                                else
                                    if (Mes = 12) then
                                        if (Dia <= 20) then
                                            Writeln('Primavera')
                                        else
                                            Writeln('Verano');
end.
```

## Ejercicio 16

### Enunciado

> Rehacer el ejercicio 13 utilizando Case en lugar de alternativas anidadas.

### Solución

```pascal
Program Cursos;
Var
    CantidadClases: byte;
    TarjetaVIP, TieneEquipo: char;
    Importe: real;
Begin
    Writeln('Ingrese la cantidad de clases');
    Readln(CantidadClases);
    Writeln('¿Tiene tarjeta VIP? (S/N)');
    Readln(TarjetaVIP);
    Writeln('¿Tiene equipo? (S/N)');
    Readln(TieneEquipo);

    Case CantidadClases of
        1..5: Importe := CantidadClases * 30;
        6..12: Importe := CantidadClases * 25;
        else Importe := CantidadClases * 18;
    End;

    if (TieneEquipo = 'N') then
        Importe := Importe + (CantidadClases * 5);
    if (TarjetaVIP = 'S') then
        Importe := Importe * 0.85;

    Writeln(Importe:8:2);
End.
```

## Ejercicio 17

### Enunciado

> Un pago puede realizarse con Tarjeta de crédito, de débito o en efectivo, obteniéndose incremento del 7%,
> 5% o descuento del 10% respectivamente sobre el monto original. Se pide leer el tipo de pago (C, D, E)
> y el monto para calcular e informar el importe a abonar.

### Solución

```pascal
Program Tarjetas;
Var
    FormaPago: char;
    Importe: real;
Begin
    Writeln('Ingrese el importe');
    Readln(Importe);
    Writeln('Ingrese la forma de pago ([C]redito, [D]ebito, [E]fectivo)');
    Readln(FormaPago);

    Case FormaPago of
        'C': Importe := Importe * 1.07;
        'D': Importe := Importe * 1.05;
        'E': Importe := Importe * 0.9;
    End;

    Writeln(Importe:8:2);
End.
```
