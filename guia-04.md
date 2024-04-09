# Guía 3

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
