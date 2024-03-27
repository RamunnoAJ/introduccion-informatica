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

## Ejercicio 10

### Enunciado

> Dada la masa corporal de una persona si tiene o no contextura normal.

### Solución

```pascal
```
