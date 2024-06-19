Program ejemplo_parcial;
Type
    ST2 = string[2];
    ST15 = string[15];
    TVDias = Array [1..5] of ST2;
    TVActividades = Array [1..50] of ST15;
    TMClases = Array[1..50, 1..5] of byte;
Procedure Leer(Var Clases: TMClases; Var Dias: TVDias; Var Actividades: TVActividades; Var N: byte);
Var
    Arch: text;
    espacio: char;
    j: byte;
begin
    Assign(Arch, 'gimnasio.txt');
    Reset(Arch);

    for j := 1 to 5 do
        Read(Arch, Dias[j], espacio);

    N := 0;
    while (NOT EOF(Arch)) do
    begin
        N := N + 1;
        for j := 1 to 5 do
            Read(Arch, Clases[N, j]);
        Readln(Arch, Actividades[N]);
    end;

    Close(Arch);
end;
Procedure Escribir(Clases: TMClases; Actividades: TVActividades; N: byte);
var
    i, j: byte;
begin
    for i := 1 to N do
    begin
        for j := 1 to 5 do
        begin
            Write(Clases[i, j]:3);
        end;
        Writeln(Actividades[i]);
    end;
end;
Procedure EscribirDias(Dias: TVDias);
var
    i: byte;
begin
    for i := 1 to 5 do
            Write(Dias[i]:3);
    Writeln();
end;
Function ObtenerCantidadClasesPorFila(Clases: TMClases; Fila: byte): byte;
var
    j, Cont: byte;
begin
    Cont := 0;

    for j := 1 to 5 do
        Cont := Cont + Clases[Fila, j];

    ObtenerCantidadClasesPorFila := Cont;
end;
Function ObtenerPosMenorClases(Clases: TMClases; N: byte): byte;
var
    i, MinClases, PosMin, Min: byte;
begin
    MinClases := ObtenerCantidadClasesPorFila(Clases, 1);
    PosMin := 1;
    for i := 2 to N do
    begin
        Min := ObtenerCantidadClasesPorFila(Clases, i);
        if (Min< MinClases) then
        begin
            MinClases := Min;
            PosMin := i;
        end;
    end;

    ObtenerPosMenorClases := PosMin;
end;
Function ObtenerPosicionDia(Dias: TVDias; Dia: ST2; N: byte): byte;
var
    i: byte;
begin
    i := 1;
    while (i <= N) AND (Dias[i] <> Dia) do
        i := i + 1;

    if (i <= N) then
        ObtenerPosicionDia := i
    else
        ObtenerPosicionDia := 0;
end;
Function ObtenerActividadMasClasesXDia(Clases: TMClases; PosDia, N: byte): byte;
var
    i, Pos, Max: byte;
begin
    Pos := 1;
    Max := Clases[1, PosDia];
    for i := 2 to N do
        if (Clases[i, PosDia] > Max) then
        begin
            Max := Clases[i, PosDia];
            Pos := i;
        end;

    ObtenerActividadMasClasesXDia := Pos;
end;
Function RealizanActTodosDias(Clases: TMClases; PosActividad: byte): byte;
var
    j, Cont: byte;
begin
    Cont := 0;
    j := 0;
    while (j < 5) AND (Cont < 1) do
    begin
        j := j + 1;
        if (Clases[PosActividad, j] = 0) then
            Cont := 1;
    end;

    RealizanActTodosDias := Cont;
end;
Function ObtenerCantNoRealizan(Clases: TMClases; N: byte): byte;
var
    i, Cont: byte;
begin
    Cont := 0;
    for i := 1 to N do
        Cont := Cont + RealizanActTodosDias(Clases, i);

    ObtenerCantNoRealizan := Cont;
end;
Var
    N, PosDia: byte;
    Actividades: TVActividades;
    Dias: TVDias;
    Clases: TMClases;
    X: ST2;
Begin
    Leer(Clases, Dias, Actividades, N);
    EscribirDias(Dias);
    Escribir(Clases, Actividades, N);

    Writeln('La actividad con menos clases a la semana es: ', Actividades[ObtenerPosMenorClases(Clases, N)]);

    Writeln('Ingrese un dia X');
    Readln(X);

    PosDia := ObtenerPosicionDia(Dias, X, N);
    if PosDia > 0 then
        Writeln('La actividad en el dia ', X, ' que mas clases tiene, es: ', Actividades[ObtenerActividadMasClasesXDia(Clases, PosDia, N)])
    else
        Writeln('No existe el dia ', X);

    Writeln('No se realizan actividades todos los dias en ', ObtenerCantNoRealizan(Clases, N), ' actividades');
    Readln();
End.
