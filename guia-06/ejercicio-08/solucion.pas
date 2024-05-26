Program ejercicio08;
Type
    TVec = Array [1..50] of integer;
Procedure LeerVector(Var V: TVec; Var N: byte);
Var
    aux: integer;
begin
    Writeln('Ingresa un vector de numeros enteros. (0 fin de datos)');
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
        Write(V[i]:3);
    Writeln();
end;
Function VerificarPares(V: TVec; N: byte): boolean;
Var
    i: byte;
    Bandera: boolean;
begin
    i := 0; Bandera := true;
    while (Bandera) AND (i < N) do
    begin
        i := i + 1;
        if (V[i] MOD 2 <> 0) then
            Bandera := False;
    end;

    VerificarPares := Bandera;
end;
Var
    Vec: TVec;
    N: byte;
    BanderaPares: boolean;
Begin
    LeerVector(Vec, N);
    EscribirVector(Vec, N);
    BanderaPares := VerificarPares(Vec, N);
    if (BanderaPares) then
        Writeln('Todos los números del vector son pares')
    else
        Writeln('Hay numeros impares en el vector');
End.
