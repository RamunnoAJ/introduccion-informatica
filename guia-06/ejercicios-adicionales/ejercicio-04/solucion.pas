Program ejercicio04;
Type
    TVec = Array [1..50] of integer;
Procedure Leer(Var Enteros: TVec; Var N: byte);
var
    Arch: text;
begin
    Assign(Arch, 'enteros.txt');
    Reset(Arch);
    N := 0;

    while (NOT EOF(Arch)) do
    begin
        N := N + 1;
        Readln(Arch, Enteros[N]);
    end;

    Close(Arch);
end;
Procedure Escribir(Enteros: TVec; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
        Write(Enteros[i]:4);
    Writeln();
end;
Function ObtenerMaximo(Inicio, Fin: byte; Enteros: TVec): integer;
var
    i: byte;
    Maximo: integer;
begin
    Maximo := -1;

    for i := Inicio + 1 to Fin do
        if (Enteros[i] > Maximo) then
            Maximo := Enteros[i];

    ObtenerMaximo := Maximo;
end;
Procedure ObtenerRango(Var PrimeraPosicion, UltimaPosicion, Inicio: byte; Enteros: TVec; N: byte);
var
    i: byte;
begin
    PrimeraPosicion := 0;
    UltimaPosicion := 0;

    i := Inicio;
    while (i <= N) AND (UltimaPosicion = 0) do
    begin
        if (Enteros[i] < 0) then
            if (PrimeraPosicion = 0) then
                PrimeraPosicion := i
            else
            begin
                UltimaPosicion := i;
                Inicio := UltimaPosicion;
            end;

        i := i + 1;
    end;
end;
Var
    Enteros, NuevoArreglo: TVec;
    N, PrimeraPosicion, UltimaPosicion, Inicio, i: byte;
Begin
    Leer(Enteros, N);
    Escribir(Enteros, N);
    Inicio := 1;

    i := 0;
    while (Inicio < N) do
    begin
        i := i + 1;
        ObtenerRango(PrimeraPosicion, UltimaPosicion, Inicio, Enteros, N);
        NuevoArreglo[i] := ObtenerMaximo(PrimeraPosicion, UltimaPosicion, Enteros);
    end;

    Escribir(NuevoArreglo, i)
End.
