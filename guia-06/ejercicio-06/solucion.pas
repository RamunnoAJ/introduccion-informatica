Program ejercicio06;
Type
    TVec = Array [1..50] of integer;
Procedure LeerVector(Var V: TVec; Var N: byte);
Var
    i: byte;
begin
    Write('Ingrese numero de elementos: ');
    Readln(N);
    for i:= 1 to N do
    begin
        Write('Ingrese el elemento ', i, ' : ');
        Readln(V[i]);
    end;
end;
Procedure EscribirVector(Var V: TVec; Var N: byte);
var
    i: byte;
begin
    for i:= 1 to N do
        Write(V[i]:4);
    Writeln();
end;
Function CalcularDiferencia(V1, V2: TVec; N: byte): integer;
Var
    i: byte;
    Sum1, Sum2: integer;
begin
    Sum1 := 0; Sum2 := 0;
    for i := 1 to N do
    begin
        Sum1 := Sum1 + V1[i];
        Sum2 := Sum2 + V2[i];
    end;

    if Sum1 > Sum2 then
        CalcularDiferencia := Sum1 - Sum2
    else
        CalcularDiferencia := Sum2 - Sum1;
end;
Function CalcularSuma(V1, V2: TVec; N: byte): integer;
Var
    i: byte;
    Sum1, Sum2: integer;
begin
    Sum1 := 0; Sum2 := 0;
    for i := 1 to N do
    begin
        Sum1 := Sum1 + V1[i];
        Sum2 := Sum2 + V2[i];
    end;

    CalcularSuma := Sum1 + Sum2;
end;
Function CalcularProductoEscalar(V1, V2: TVec; N: byte): integer;
Var
    i: byte;
    Sumatoria: integer;
begin
    Sumatoria := 0;
    for i := 1 to N do
        Sumatoria := Sumatoria + (V1[i] * V2[i]);

    CalcularProductoEscalar := Sumatoria;
end;
Var
    Vec1, Vec2: TVec;
    N, M: byte;
Begin
    LeerVector(Vec1, N);
    LeerVector(Vec2, M);

    if (N <> M) then
        Writeln('Los vectores no tienen el mismo largo')
    else
    begin
        Writeln('La suma entre los vectores es: ', CalcularSuma(Vec1, Vec2, N));
        Writeln('La diferencia entre los vectores es: ', CalcularDiferencia(Vec1, Vec2, N));
        Writeln('El producto escalar entre los vectores es: ', CalcularProductoEscalar(Vec1, Vec2, N));
    end;
End.
