Program ejercicio03;
Type
    TVec = Array [1..50] of integer;
Procedure Leer(Var Enteros: TVec; Var N: byte);
var
    Arch: text;
    aux: integer;
begin
    Assign(Arch, 'mochila.txt');
    Reset(Arch);

    N := 1;
    Readln(Arch, Enteros[N]);

    while (NOT EOF(Arch)) do
    begin
        Readln(Arch, aux);
        if (Enteros[N] < aux) then
        begin
            N := N + 1;
            Enteros[N] := aux;
        end;
    end;

    Close(Arch);
end;
Procedure Escribir(Arreglo: TVec; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
        Write(Arreglo[i]:4);
    Writeln();
end;
Function MochilaPerfecta(Arreglo: TVec; N: byte): byte;
var
    i: byte;
    Suma: integer;
begin
    Suma := 0;
    i := 1;

    while (i <= N) AND (Suma < Arreglo[i]) do
    begin
        Suma := Suma + Arreglo[i];
        i := i + 1;
    end;

    MochilaPerfecta := i;
end;
Var
    Enteros: TVec;
    N: byte;
Begin
    Leer(Enteros, N);
    Escribir(Enteros, N);
    if (MochilaPerfecta(Enteros, N) > N) then
        Writeln('Es una mochila perfecta')
    else
        Writeln('No es una mochila perfecta')
End.
