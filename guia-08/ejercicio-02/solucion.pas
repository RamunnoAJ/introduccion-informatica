Program ejercicio02;
Type
    ST10 = string[10];
    TRAtleta = Record
        Nombre: ST10;
        L1, L2: real
    end;
    TVAtletas = array [1..50] of TRAtleta;
Procedure Leer(Var Atletas: TVAtletas; Var N: byte);
var
    Arch: text;
begin
    Assign(Arch, 'Lanzamientos.txt');
    Reset(Arch);

    N := 0;
    while (NOT EOF(Arch)) do
    begin
        N := N + 1;
        with Atletas[N] do
        begin
            Readln(Arch, Nombre);
            Readln(Arch, L1);
            Readln(Arch, L2);
        end;
    end;

    Close(Arch);
end;
Procedure EscribirAtletas(Atletas: TVAtletas; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
        with Atletas[i] do
        begin
            Writeln(Nombre);
            Writeln(L1:5:2);
            Writeln(L2:5:2);
        end;
end;
Function SuperoPrimerLanzamiento(L1, L2: real): byte;
begin
    if (L2 > L1) then
        SuperoPrimerLanzamiento := 1
    else
        SuperoPrimerLanzamiento := 0;
end;
Function ObtenerCantidadSuperoL1(Atletas: TVAtletas; N: byte): byte;
var
    i, Cont: byte;
begin
    Cont := 0;

    for i := 1 to N do
        with Atletas[i] do
            Cont := Cont + SuperoPrimerLanzamiento(L1, L2);

    ObtenerCantidadSuperoL1 := Cont;
end;
Function ObtenerMejorMarca(Atletas: TVAtletas; N: byte): real;
var
    Max: real;
    i: byte;
begin
    Max := 0;

    for i := 1 to N do
        with Atletas[i] do
        begin
            if (L1 > Max) then
                Max := L1;
            if (L2 > Max) then
                Max := L2;
        end;

    ObtenerMejorMarca := Max;
end;
Function ObtenerPorNombre(Atletas: TVAtletas; N: byte; Nombre: ST10): byte;
var
    i: byte;
begin
    i := 1;
    while (i <= N) AND (Nombre <> Atletas[i].Nombre) do
        i := i + 1;

    ObtenerPorNombre := i;
end;
Var
    Atletas: TVAtletas;
    N, PosObtenido: byte;
    Nombre: ST10;
Begin
    Leer(Atletas, N);
    EscribirAtletas(Atletas, N);
    Writeln(ObtenerCantidadSuperoL1(Atletas, N), ' atleta/s superó/superaron su primer lanzamiento');
    Writeln('La mejor marca es: ', ObtenerMejorMarca(Atletas, N):5:2);

    Writeln('Ingrese el nombre de un atleta para ver sus lanzamientos');
    Readln(Nombre);
    PosObtenido := ObtenerPorNombre(Atletas, N, Nombre);
    if (PosObtenido <= N) then
        with Atletas[PosObtenido] do
        begin
            Writeln('1°: ', L1:5:2);
            Writeln('2°: ', L2:5:2);
        end
    else
        Writeln('No se encontro el atleta ', Nombre);
End.
