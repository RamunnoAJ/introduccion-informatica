Program Ejercicio10;
Var
    VentasRealizadas, VentasSinBeneficio, Descuento: byte;
    Importe, ImporteTotal, ImporteMinimo: real;
    Respuesta: char;
Begin
    Writeln('Ingrese el importe minimo para obtener un descuento');
    Readln(ImporteMinimo);
    Writeln('Ingrese el descuento que desea aplicar');
    Readln(Descuento);

    Writeln('Ingrese un importe');
    Readln(Importe);

    repeat

        Writeln('Desea continuar');
        Writeln('S - Si');
        Writeln('N - No');
    until Respuesta = 'N'

    while

    ImporteTotal := 0;
End.
