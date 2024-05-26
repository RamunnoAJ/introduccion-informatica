Program ejercicio10;
Type
    TVec = Array [1..50] of real;
    VP = Array [1..50] of byte;
Procedure LeerVector(Var V: TVec; Var N: byte);
Var
    aux: real;
begin
    Writeln('Ingresa un vector de numeros reales. (0 fin de datos)');
    Read(aux);
    N := 0;
    while (aux <> 0) do
    begin
        N := N + 1;
        V[N] := aux;
        Read(aux);
    end;
end;
Procedure EscribirVector(V: TVec; N: byte);
Var
    i: byte;
begin
    for i:= 1 to N do
        Write(V[i]:6:2);
    Writeln();
end;
Procedure EscribirVectorByte(V: VP; N: byte);
Var
    i: byte;
begin
    for i:= 1 to N do
        Write(V[i]:3);
    Writeln();
end;
Procedure Buscar(X: real; VR: TVec; N: byte; Var VP: VP; Var M: byte; Var Bandera: boolean);
Var
    i: byte;
begin
    M := 0; Bandera := false;
    for i := 1 to N do
    begin
        if (VR[i] = X) then
        begin
            M := M + 1;
            VP[M] := i;
            Bandera := true;
        end;
    end;
end;
Var
    Reales: TVec;
    N, M: byte;
    X: real;
    Posiciones: VP;
    BanderaEsta: boolean;
Begin
    Write('Ingrese un número real: ');
    Readln(X);

    LeerVector(Reales, N);
    EscribirVector(Reales, N);

    Buscar(X, Reales, N, Posiciones, M, BanderaEsta);
    if (BanderaEsta) then
    begin
        Writeln('El numero pertenece al conjunto.');
        Writeln('El numero aparece ', M, ' veces');
        Write('El numero aparece en las posiciones: ');
        EscribirVectorByte(Posiciones, M);
    end
    else
        Writeln('El numero no pertence al conjunto');
End.
