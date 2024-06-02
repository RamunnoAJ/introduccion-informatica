Program ejercicio05;
Type
    ST6 = String[6];
    VP = Array [1..50] of ST6;
    VA = Array [1..50] of word;
    VI = Array [1..50] of real;
Procedure Leer(Var VPatentes: VP; Var VAnios: VA; Var VImportes: VI; Var N: byte);
Var
    Arch: text;
begin
    Assign(Arch, 'autos.txt');
    Reset(Arch);

    N := 0;
    while (NOT eof(Arch)) do
    begin
        N := N + 1;
        Readln(Arch, VPatentes[N], VAnios[N], VImportes[N]);
    end;

    Close(Arch);
end;
Procedure Mostrar(VPatentes: VP; VAnios: VA; VImportes: VI; N: byte);
Var
    i: byte;
begin
    for i := 1 to N do
        Writeln(VPatentes[i], ' ', VAnios[i], ' ', VImportes[i]:8:2);
end;
Function PrecioMinimo(Anio: word; VAnios: VA; VImportes: VI; N: byte): byte;
Var
    Minimo: real;
    i, PosMinimo: byte;
begin
    PosMinimo := 0;
    Minimo := 100000;
    for i := 1 to N do
    begin
        if (VAnios[i] = Anio) then
            if (VImportes[i] < Minimo) then
                PosMinimo := i;
                Minimo := VImportes[i];
    end;

    PrecioMinimo := PosMinimo;
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

    if (Contador > 0) then
        CalcularPromedio := Suma / Contador
    else
        CalcularPromedio := 0;
end;
Procedure Menu(Var Op: char);
begin
    Writeln('Menú de opciones');
    Writeln('1) Precio mínimo de x año');
    Writeln('2) Cantidad de autos con precio menor a x');
    Writeln('3) Promedio de precios de autos entre años x e y');
    Writeln('4) Buscar un auto con una patente dada');
    Writeln('5) Fin');
    Repeat
        Write('Ingrese su opción: ');
        Readln(Op);
    Until ('1' <= Op) AND (Op <= '5' );
end;
Function BuscarPosicion(VPatentes: VP; N: byte; Patente: string): byte;
Var
    i, Posicion: byte;
begin
    Posicion := 0;
    i := 1;

    while (i <= N) AND (VPatentes[i] <> Patente) do
        i := i + 1;

    if (i <= N) then
        Posicion := i;

    BuscarPosicion := Posicion;
end;
Var
    VPatentes: VP;
    VAnios: VA;
    VImportes: VI;
    N, Posicion, PosMinimo: byte;
    Anio, Anio1, Anio2: word;
    Importe, Promedio: real;
    Patente: ST6;
    Op: char;
Begin
    Leer(VPatentes, VAnios, VImportes, N);
    Mostrar(VPatentes, VAnios, VImportes, N);

    Repeat
    Menu(Op);
    case Op of
    '1': begin
            Repeat
                Writeln('Ingrese un año');
                Readln(Anio);
            Until (Anio > 0);
            PosMinimo := PrecioMinimo(Anio, VAnios, VImportes, N);
            if (PosMinimo <> 0) then
                Writeln('El precio mínimo es: ', VImportes[PosMinimo]:8:2)
            else
                Writeln('No hay ningún auto con ese año.');
        end;
    '2': begin
            Repeat
                Writeln('Ingrese un importe');
                Readln(Importe);
            Until (Importe > 0);
            Writeln(MenoresPrecio(Importe, VImportes, N));
        end;
    '3': begin
            Repeat
                Writeln('Ingrese año 1');
                Readln(Anio1);
            Until (Anio1 > 0);
            Repeat
                Writeln('Ingrese año 2');
                Readln(Anio2);
            Until (Anio2 > Anio1);

            Promedio := CalcularPromedio(Anio1, Anio2, VAnios, VImportes, N);
            if (Promedio <> 0) then
                Writeln('El promedio de precio de los autos de los años entre ', Anio1, ' y ', Anio2, ' es ', Promedio:8:2)
            else
                Writeln('No hay autos entre los años ', Anio1, ' y ', Anio2);
        end;
    '4': begin
            Write('Ingrese una patente para buscar: ');
            Readln(Patente);

            Posicion := BuscarPosicion(VPatentes, N, Patente);
            if (Posicion <> 0) then
            begin
                Writeln('Patente: ', VPatentes[Posicion], ' Año: ', VAnios[Posicion],' Precio: ', VImportes[Posicion]:8:2);
            end
            else
                Writeln('No se encontró ningún auto con la patente ', Patente);
        end;
    end;
    Until Op = '5';
End.
