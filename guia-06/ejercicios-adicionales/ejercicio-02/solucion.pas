Program ejercicio02;
Type
    TVec = Array [1..50] of integer;
Procedure LeerPrimos(Var Arreglo: TVec; Var N: byte);
var
    Arch: text;
    aux: integer;
begin
    Assign(Arch, 'A1.txt');
    Reset(Arch);
    N := 0;

    while (NOT EOF(Arch)) do
    begin
        Readln(Arch, aux);
        N := N + 1;
        Arreglo[N] := aux;
    end;

    Close(Arch);
end;
Procedure Escribir(VPrimos: TVec; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
        Write(VPrimos[i]:4);
    Writeln();
end;
Function EsDivisor(Numero, Primo: integer): byte;
begin
    if ((Numero MOD Primo) = 0) then
        EsDivisor := 1
    else
        EsDivisor := 0;
end;
Procedure ContarDivisores(VPrimos: TVec; N: byte);
var
    Arch: text;
    aux, i, Cont: integer;
begin
    Assign(Arch, 'A2.txt');
    Reset(Arch);

    while (NOT EOF(Arch)) do
    begin
        Cont := 0;
        Readln(Arch, aux);

        for i := 1 to N do
            Cont := Cont + EsDivisor(aux, VPrimos[i]);

        Writeln('El numero ', aux, ' tiene ', Cont, ' divisores');
    end;

    Close(Arch);
end;
Var
    VPrimos: TVec;
    N: byte;
Begin
    LeerPrimos(VPrimos, N);
    Escribir(VPrimos, N);
    ContarDivisores(VPrimos, N);

    Readln();
End.
