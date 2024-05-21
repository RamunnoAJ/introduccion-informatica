Program ejercicio03;
Type
    TVec = Array [1..50] of integer;
Procedure Leer(Var Enteros: TVec; Var N: byte);
Var
    Arch: text;
    i: byte;
begin
    Assign(Arch, 'enteros.txt');
    Reset(Arch);

    Readln(Arch, N);
    for i := 1 to N do
        Readln(Arch, Enteros[i]);

    Close(Arch);
end;
Procedure Escribir(Vector: TVec; R: byte);
Var
    i: byte;
begin
    for i := 1 to R do
        Writeln(Vector[i]);
end;
Procedure Divide(Enteros: TVec; Var Positivos, Negativos: TVec; N:byte; Var NP, NN: byte);
Var
    i: byte;
begin
    NP := 0; NN := 0;
    for i := 1 to N do
    begin
        if (Enteros[i] < 0) then
        begin
            NN := NN + 1;
            Negativos[NN] := Enteros[i];
        end
        else
        begin
            NP := NP + 1;
            Positivos[NP] := Enteros[i];
        end;
    end;
end;
Var
    N, NP, NN: byte;
    Enteros, Positivos, Negativos: TVec;
begin
    Leer(Enteros, N);
    Divide(Enteros, Positivos, Negativos, N, NP, NN);

    if (NP > NN) then
        Escribir(Positivos, NP)
    else
        if (NN > NP) then
            Escribir(Negativos, NN)
        else
        begin
            Escribir(Positivos, NP);
            Writeln('--');
            Escribir(Negativos, NN);
        end;
End.
