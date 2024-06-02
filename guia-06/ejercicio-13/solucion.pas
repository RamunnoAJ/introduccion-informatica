Program ejercicio13;
Type
    TV = array[1..50] of integer;
Procedure Leer(Var V: TV; Var N: byte);
var
    Arch: text;
    i: byte;
begin
    Assign(Arch, 'Enteros.txt');
    Reset(Arch);

    i := 0;
    while (NOT EOF(Arch)) do
    begin
        i := i + 1;
        Readln(Arch, V[i]);
    end;

    N := i;
    Close(Arch);
end;
Function ObtenerMayor(V: TV; N: byte): byte;
var
    PosMayor, i: byte;
    Mayor: integer;
begin
    Mayor := V[1];
    PosMayor := 1;

    for i := 2 to N do
        if (V[i] >= Mayor) then
        begin
            Mayor := V[i];
            PosMayor := i;
        end;

    ObtenerMayor := PosMayor;
end;
Procedure Eliminar(Var V: TV; Var N: byte; Pos: byte);
var
    i: byte;
begin
    for i := Pos to N - 1 do
        V[i] := V[i + 1];
    N := N -1;
end;
Procedure Escribe(V: TV; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
        Write(V[i]:4);
    Writeln();
end;
Var
    Enteros: TV;
    N, PosMayor: byte;
    Respuesta: char;
Begin
    Leer(Enteros, N);
    Escribe(Enteros, N);

    Repeat
        Writeln('¿Desea eliminar el numero mayor? S/N');
        Readln(Respuesta);
        Respuesta := Upcase(Respuesta);

        if (N > 0) then
        begin
            if (Respuesta = 'S') then
            begin
                PosMayor := ObtenerMayor(Enteros, N);
                Eliminar(Enteros, N, PosMayor);
                Escribe(Enteros,N);
            end;
        end
        else
            begin
            Writeln('No hay mas elementos en el arreglo');
            Respuesta := 'N';
            end;
    Until Respuesta = 'N';
End.
