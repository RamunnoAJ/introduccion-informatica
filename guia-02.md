# Guía 2

## Ejercicio 9

### Enunciado

> A partir del peso inicial y final que registró una persona en un tratamiento para adelgazar,
> calcular e informar el porcentaje que perdió con respecto al peso inicial.

### Solución

```pascal
Program Ejercicio9;
Var
    PesoInicial, PesoFinal, PorcentajePerdido: real;
Begin
Writeln('Ingrese su peso inicial');
Readln(PesoInicial);
Writeln('Ingrese su peso final');
Readln(PesoFinal);

PorcentajePerdido := ((PesoInicial - PesoFinal)/PesoInicial) * 100;
Writeln('El porcentaje de peso que perdió es de: ', PorcentajePerdido:4:2, '%');
End.
```

## Ejercicio 10

### Enunciado

> Realizar un algoritmo que permita calcular el volumen de un cilindro.
> Se ingresarán por teclado la altura y el radio del cilindro.

### Solución

```pascal
Program Ejercicio10;
Var
    Altura, Radio, Volumen: real;
Begin
Writeln('Ingrese la altura del cilindro');
Readln(Altura);
Writeln('Ingrese el radio del cilindro');
Readln(Radio);

Volumen := Pi * Altura * sqr(Radio);
Writeln('El volumen del cilindro es: ', Volumen:5:2);
End.
```

## Ejercicio 11

### Enunciado

> Escribir un programa para calcular la velocidad y el consumo por kilómetro de un automóvil.
> Ingresar por teclado la distancia (en kilómetros), el tiempo (en horas) y la cantidad
> de gasoil empleado.
> Formulas:
> Velocidad = kilómetros / horas
> consumo por km = litros/kilómetros

### Solución

```pascal
Program Ejercicio11;
Var
    Distancia, Tiempo, CantidadGasoil, Velocidad, Consumo: real;
Begin
Writeln('Ingrese la distancia recorrida en kilómetros.');
Readln(Distancia);
Writeln('Ingrese el tiempo del viaje en horas');
Readln(Tiempo);
Writeln('Ingrese la cantidad de gasoil empleado');
Readln(CantidadGasoil);

Velocidad := Distancia / Tiempo;
Consumo := CantidadGasoil / Distancia;

Writeln('La velocidad del automóvil fue de ', Velocidad:6:2, 'km/h y el consumo fue de ', Consumo:5:2, 'lts/km');
End.
```

## Ejercicio 12

### Enunciado

> Calcular e imprimir el sueldo bruto y neto de un empleado.
> Considerar la paga de $8 la hora, un descuento del 11% previsional
> y el 5% para cobertura médica.
> La cantidad de horas trabajadas es un dato de entrada.

### Solución

```pascal
Program Ejercicio12;
Const
    Paga = 8;
    DescuentoPrevisional = 0.11;
    CoberturaMedica = 0.05;
Var
    SueldoBruto, SueldoNeto: real;
    HorasTrabajadas: byte;
Begin
Writeln('Ingrese la cantidad de horas trabajadas');
Readln(HorasTrabajadas);
SueldoBruto := HorasTrabajadas * Paga;
SueldoNeto := SueldoBruto * (1 - DescuentoPrevisional) * (1 - CoberturaMedica);

Writeln('Su sueldo bruto es de $', SueldoBruto:8:2, ' y su sueldo neto es de $', SueldoNeto:8:2);
End.
```

## Ejercicio 13

### Enunciado

> Un supermercado otorga puntos para canjear por premios,
> por las compras que realiza en tres rubros.
> Otorga 1 punto cada $3 en alimentos, $2 en limpieza
> y $5 en otros. Ingresar los tres importes e informar
> los puntos obtenidos. (si en algún rubro no realizó
> compras, dicho importe es cero)

### Solución

```pascal
Program Ejercicio13;
Const
    PrecioPuntoAlimentos = 1;
    PrecioPuntoLimpieza = 2;
    PrecioPuntoOtros = 5;
Var
    ImporteAlimentos, ImporteLimpieza, ImporteOtros: real;
    Puntaje: word;
Begin
Writeln('Ingrese su importe en alimentos:');
Readln(ImporteAlimentos);
Writeln('Ingrese su importe en limpieza:');
Readln(ImporteLimpieza);
Writeln('Ingrese su importe en los demás artículos:');
Readln(ImporteOtros);

Puntaje := Round(ImporteAlimentos / PrecioPuntoAlimentos) + Round(ImporteLimpieza / PrecioPuntoLimpieza) + Round(ImporteOtros / PrecioPuntoOtros);
Writeln('El puntaje obtenido fue de ', Puntaje);
End.
```

## Ejercicio 14

### Enunciado

> Leer dos enteros, intercambiar el contenido de ambas variables
> y mostrarlas por pantalla.

### Solución

```pascal
Program Ejercicio14;
Var
    PrimerNumero, SegundoNumero, NumeroAuxiliar: integer;
Begin
Writeln('Ingrese un número entero');
Readln(PrimerNumero);
Writeln('Ingrese otro número entero');
Readln(SegundoNumero);

NumeroAuxiliar := PrimerNumero;
PrimerNumero := SegundoNumero;
SegundoNumero := NumeroAuxiliar;

Writeln('Los números invertidos son: ', PrimerNumero, ' y ', SegundoNumero);
End.
```
