Program ejercicio02;
Type
    TVec = Array[1..50] of byte;
Procedure Leer(Var Naturales: TVec; Var N: byte);
Var
    Arch: text;
    i: byte;
Begin
    Assign(Arch, 'naturales.txt');
    Reset(Arch);
    Readln(Arch, N);

    for i := 1 to N do
        Readln(Arch, Naturales[i]);

    Close(Arch);
End;
Procedure Escribir(Naturales: TVec; N: byte);
Var
    i: byte;
Begin
    for i := 1 to N do
        Writeln(Naturales[i]);
End;
Procedure Divide(Naturales: TVec; N: byte; Var ContP, ContI, ContN: byte);
Var
    i: byte;
Begin
    ContP := 0; ContI := 0; ContN := 0;
    for i := 1 to N do
    begin
        if (Naturales[i] = 0) then
            ContN := ContN + 1
        else
            if ((Naturales[i] MOD 2) = 0) then
                ContP := ContP + 1
            else
                ContI := ContI + 1;
    end;
End;
Procedure Multiplicar(Var Naturales: TVec; N, X: byte);
Var
    i: byte;
Begin
    i := 2;
    while (i <= N) do
    begin
        Naturales[i] := Naturales[i] * X;
        i := i + 2;
    end;
End;
Function Mayor(Naturales: TVec; N: byte): byte;
Var
    i, PosMax, Max: byte;
Begin
    Max := 0;
    for i := 1 to N do
    begin
        if (Naturales[i] > Max) then
        begin
            Max := Naturales[i];
            PosMax := i;
        end;
    end;

    Mayor := PosMax;
End;
Var
    Naturales: TVec;
    N, ContP, ContI, ContN, X: byte;
Begin
    Leer(Naturales, N);
    Escribir(Naturales, N);
    Divide(Naturales, N, ContP, ContI, ContN);
    Writeln(ContP:5, ContI:5, ContN:5);

    Repeat
        Writeln('Ingrese x');
        Readln(X);
    Until X > 0;

    Multiplicar(Naturales, N, X);
    Escribir(Naturales, N);
    Writeln('El numero mayor estan en la posicion: ', Mayor(Naturales, N));
End.
