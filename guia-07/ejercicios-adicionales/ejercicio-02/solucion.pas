Program ejercicio02;
Type
    TVec = Array [1..5] of real;
    TMat = Array [1..50, 1..5] of real;
Function ObtenerPromedio(V: TVec; N: byte): real;
var
    i: byte;
    Suma: real;
begin
    Suma := 0;

    for i := 1 to N do
        Suma := Suma + V[i];

    ObtenerPromedio := Suma / N;
end;
Procedure Leer(Var Matriz: TMat; Var N: byte);
var
    Arch: text;
    V: TVec;
    j: byte;
begin
    Assign(Arch, 'reales.txt');
    Reset(Arch);

    N := 0;
    while (NOT EOF(Arch)) do
    begin
        j := 0;
        Readln(Arch, V[1], V[2], V[3], V[4], V[5]);

        if (ObtenerPromedio(V, 4) < V[5]) then
        begin
            N := N + 1;
            for j := 1 to 5 do
                Matriz[N, j] := V[j];
        end;
    end;

    Close(Arch);
end;
Procedure Escribir(Matriz: TMat; N: byte);
var
    i, j: byte;
begin
    for i := 1 to N do
    begin
        for j := 1 to 5 do
            Write(Matriz[i, j]:8:2);
        Writeln();
    end;
end;
Var
    Matriz: TMat;
    N: byte;
Begin
    Leer(Matriz, N);
    Escribir(Matriz, N);
End.
