Program ejercicio09;
Type
    TVec = Array [1..50] of real;
Procedure LeerVector(Var V: TVec; Var N: byte);
Var
    aux: real;
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
    for i := 1 to N do
        Write(V[i]:5:2);
    Writeln();
end;
Function VerificarOrdenAscendente(V: TVec; N: byte): boolean;
Var
    i: byte;
    aux: real;
    Bandera: boolean;
begin
    aux := V[1];
    Bandera := true;
    for i := 1 to N do
    begin
        if NOT (aux <= V[i]) then
            Bandera := false;

        aux := V[i];
    end;

    VerificarOrdenAscendente:= Bandera;
end;
Var
    Vec: TVec;
    N: byte;
    BanderaOrden: boolean;
Begin
    LeerVector(Vec, N);
    EscribirVector(Vec, N);
    BanderaOrden := VerificarOrdenAscendente(Vec, N);

    if BanderaOrden then
        Writeln('El vector está ordenado de manera ascendente')
    else
        Writeln('El vector no está ordenado de manera ascendente');
End.
