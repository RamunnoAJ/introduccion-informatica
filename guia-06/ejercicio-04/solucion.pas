Program ejercicio04;
Type
    TVec = array[1..50] of real;
Procedure Leer(Var Vec: TVec; Var N: byte);
Var
    Arch: text;
    aux: real;
begin
    Assign(Arch, 'reales.txt');
    Reset(Arch);
    N := 0;

    while Not EOF(Arch) do
    begin
        Readln(Arch, aux);
        N := N + 1;
        Vec[N] := aux;
    end;

    Close(Arch);
end;
Procedure Escribe(Vec: TVec; N: byte);
Var
    i: byte;
begin
    for i := 1 to N do
        Writeln(Vec[i]:5:0);
end;
Procedure Divide(Vec: TVec; N: byte; Var Vec2: TVec; Var M: byte);
Var
    i: byte;
    Suma: real;
begin
    Suma := 0;
    M := 0;

    for i := 1 to N do
    begin
        if (Vec[i] <> 0) then
            Suma := Suma + Vec[i]
        else
        begin
            M := M + 1;
            Vec2[M] := Suma;
            Suma := 0;
        end
    end;
end;
Var
    Reales, NVec: TVec;
    N, M: byte;
Begin
    Leer(Reales, N);
    Divide(Reales, N, NVec, M);
    Escribe(NVec, M);
End.
