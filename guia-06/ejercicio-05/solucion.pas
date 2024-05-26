Program ejercicio05;
Type
    VP = Array [1..50] of string[7];
    VA = Array [1..50] of word;
    VI = Array [1..50] of real;
Procedure Leer(Var VPatentes: VP; Var VAnios: VA; Var VImportes: VI; Var N: byte);
Var
    Arch: text;
    i: byte;
begin
    Assign(Arch, 'autos.txt');
    Reset(Arch);

    Readln(Arch, N);
    for i:= 1 to N do
    begin
        Readln(Arch, VPatentes[i], VAnios[i], VImportes[i]);
        Writeln(VPatentes[i], VAnios[i]:5, VImportes[i]:8:2);
    end;

    Close(Arch);
end;
Function PrecioMinimo(Anio: word; VAnios: VA; VImportes: VI; N: byte): real;
Var
    Minimo: real;
    i: byte;
begin
    Minimo := 10000;
    for i := 1 to N do
    begin
        if (VAnios[i] = Anio) then
        begin
            if (VImportes[i] < Minimo) then
                Minimo := VImportes[i];
        end;
    end;

    PrecioMinimo := Minimo;
end;
Function MenoresPrecio(Importe: real; VImportes: VI; N: byte): byte;
Var
    i, Contador: byte;
begin
    Contador := 0;
    for i := 1 to N do
        if (VImportes[i] < Importe) then
            Contador := Contador + 1;

    MenoresPrecio := Contador;
end;
Function CalcularPromedio(Anio1, Anio2: word; VAnios: VA; VImportes: VI; N: byte): real;
Var
    i, Contador: byte;
    Suma: real;
begin
    Suma := 0; Contador := 0;
    for i := 1 to N do
    begin
        if (Anio1 <= VAnios[i]) AND (VAnios[i] <= Anio2) then
        begin
            Suma := Suma + VImportes[i];
            Contador := Contador + 1;
        end;
    end;

    if (Contador <> 0) then
        CalcularPromedio := Suma / Contador
    else
        CalcularPromedio := 0;
end;
Var
    VPatentes: VP;
    VAnios: VA;
    VImportes: VI;
    N: byte;
    Anio, Anio1, Anio2: word;
    Minimo, Importe, Promedio: real;
Begin
    Leer(VPatentes, VAnios, VImportes, N);
    Writeln('Ingrese un año');
    Readln(Anio);
    Minimo := PrecioMinimo(Anio, VAnios, VImportes, N);

    if (Minimo <> 10000) then
        Writeln('El precio mínimo es: ', Minimo:8:2)
    else
        Writeln('No hay ningún auto con ese año.');

    Writeln('Ingrese un importe');
    Readln(Importe);
    Writeln(MenoresPrecio(Importe, VImportes, N));

    Writeln('Ingrese un rango de fechas [Anio1, Anio2]');
    Readln(Anio1, Anio2);
    Promedio := CalcularPromedio(Anio1, Anio2, VAnios, VImportes, N);
    if (Promedio <> 0) then
        Writeln('El promedio de precio de los autos de los años entre ', Anio1, ' y ', Anio2, ' es ', Promedio:8:2)
    else
        Writeln('No hay autos entre los años ', Anio1, ' y ', Anio2);
End.
