Program ejercicio01;
Type
    TMatColor = Array [1..50, 1..50] of char;
    TMatCant = Array [1..50, 1..50] of byte;
    TVec = Array [1..50] of byte;
Procedure Leer(Var Colores: TMatColor; Var Cantidades: TMatCant; Var N: byte);
var
    ArchColores, ArchCantidades: text;
    i, j: byte;
    espacio: char;
begin
    Assign(ArchColores, 'colores.txt');
    Reset(ArchColores);
    Readln(ArchColores, N);

    Assign(ArchCantidades, 'cantidades.txt');
    Reset(ArchCantidades);

    for i := 1 to N do
        for j := 1 to N do
        begin
            Read(ArchColores, Colores[i, j], espacio);
            Read(ArchCantidades, Cantidades[i, j]);
        end;

    Close(ArchColores);
    Close(ArchCantidades);
end;
Procedure EscribirColores(Colores: TMatColor; N: byte);
var
    i, j: byte;
begin
    for i := 1 to N do
    begin
        for j := 1 to N do
            Write(Colores[i, j]:4);
        Writeln();
    end;
end;
Procedure EscribirCantidades(Cantidades: TMatCant; N: byte);
var
    i, j: byte;
begin
    for i := 1 to N do
    begin
        for j := 1 to N do
            Write(Cantidades[i, j]:4);
        Writeln();
    end;
end;
Function ContTodosColores(Colores: TMatColor; N: byte): byte;
var
    i, j, Cont: byte;
    BanderaA, BanderaR, BanderaV: boolean;
    Color: char;
begin
    Cont := 0;

    for j := 1 to N do
    begin
        BanderaA := false;
        BanderaR := false;
        BanderaV := false;

        for i := 1 to N do
        begin
            Color := Colores[i, j];
            if (Color= 'A') then
                BanderaA := true
            else
                if (Color = 'R') then
                    BanderaR := true
                else
                    if (Color = 'V') then
                        BanderaV := true;
        end;
        if (BanderaA AND BanderaR AND BanderaV) then
            Cont := Cont + 1;
    end;

    ContTodosColores := Cont;
end;
Procedure GenerarArregloParalelo(Var NuevoArreglo: TVec; Color: char; Colores: TMatColor; Cantidades: TMatCant; N: byte);
var
    i, j, Cont: byte;
begin
    Color := Upcase(Color);

    for i := 1 to N do
    begin
        Cont := 0;

        for j := 1 to N do
        begin
            if (Colores[i, j] = Color) then
                Cont := Cont + Cantidades[i,j];
        end;

        NuevoArreglo[i] := Cont;
    end;
end;
Procedure EscribirArreglo(Arreglo: TVec; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
        Write(Arreglo[i]:4);
    Writeln();
end;
Function ObtenerPorcentaje(Fila, N: byte; Arreglo: TVec; Cantidades: TMatCant): real;
var
    j, Suma: byte;
begin
    Suma := 0;
    for j := 1 to N do
        Suma := Suma + Cantidades[Fila, j];

    ObtenerPorcentaje := (Arreglo[Fila] * 100) / Suma;
end;
Var
    N, i: byte;
    Colores: TMatColor;
    Cantidades: TMatCant;
    ArregloParalelo: TVec;
    Color: char;
Begin
    Leer(Colores, Cantidades, N);
    EscribirColores(Colores, N);
    EscribirCantidades(Cantidades, N);

    Writeln(ContTodosColores(Colores, N));

    Readln(Color);
    GenerarArregloParalelo(ArregloParalelo, Color, Colores, Cantidades, N);

    for i := 1 to N do
        Writeln(ObtenerPorcentaje(i, N, ArregloParalelo, Cantidades):8:2);
End.
