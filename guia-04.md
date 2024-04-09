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
