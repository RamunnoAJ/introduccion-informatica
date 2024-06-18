Program ejercicio08;
Type
    TMatColor = Array [1..50, 1..50] of char;
    TMatCantidad = Array [1..50, 1..50] of byte;
Procedure Leer(Var Colores: TMatColor; Var Cantidades: TMatCantidad; Var N: byte);
Var
    ArchColor, ArchCant: text;
    i, j: byte;
    espacio: char;
begin
    Assign(ArchColor, 'FichasCol.txt');
    Reset(ArchColor);
    Readln(ArchColor, N);

    Assign(ArchCant, 'FichasCant.txt');
    Reset(ArchCant);
    Readln(ArchCant, N);

    for i := 1 to N do
    begin
        for j := 1 to N do
        begin
            Read(ArchColor, Colores[i, j], espacio);
            Read(ArchCant, Cantidades[i, j]);
        end;
    end;

    Close(ArchColor);
    Close(ArchCant);
end;
Procedure EscribirColores(Colores: TMatColor; N: byte);
var
    i, j: byte;
begin
    for i := 1 to N do
    begin
        for j := 1 to N do
            Write(Colores[i, j]:3);
    Writeln();
    end
end;
Procedure EscribirCantidades(Cantidades: TMatCantidad; N: byte);
var
    i, j: byte;
begin
    for i := 1 to N do
    begin
        for j := 1 to N do
            Write(Cantidades[i, j]:3);
    Writeln();
    end
end;
Function ObtenerColorPredominante(Colores: TMatColor; N: byte): char;
var
    i, j, ContA, ContR: byte;
begin
    ContA := 0;
    ContR := 0;

    for i := 1 to N do
        for j := 1 to N do
        begin
            if (Colores[i, j] = 'A') then
                ContA := ContA + 1
            else
                ContR := ContR + 1;
        end;

    if (ContA > ContR) then
        ObtenerColorPredominante := 'A'
    else
        ObtenerColorPredominante := 'R'
end;
Function ObtenerMaxFichas(Colores: TMatColor; Cantidades: TMatCantidad; N: byte): char;
var
    i, j, ContA, ContR: byte;
begin
    ContA := 0;
    ContR := 0;

    for i := 1 to N do
        for j := 1 to N do
        begin
            if (Colores[i, j] = 'A') then
                ContA := ContA + Cantidades[i, j]
            else
                ContR := ContR + Cantidades[i, j]
        end;

    if (ContA > ContR) then
        ObtenerMaxFichas := 'A'
    else
        ObtenerMaxFichas := 'R'
end;
Function ObtenerColumnasMismoColor(Colores: TMatColor; N: byte): byte;
var
    i, j, Cont: byte;
    BanderaA, BanderaR: boolean;
begin
    Cont := 0;

    for j := 1 to N do
    begin
        i := 1;
        BanderaA := false;
        BanderaR := false;

        if (Colores[i, j] = 'A') then
            BanderaA := true
        else
            BanderaR := true;

        while (i < N) AND ((BanderaA AND NOT BanderaR) OR (NOT BanderaA AND BanderaR)) do
        begin
            i := i + 1;

            if (Colores[i, j] = 'A') then
                BanderaA := true
            else
                BanderaR := true;
        end;

        if (BanderaA AND NOT BanderaR) OR (NOT BanderaA AND BanderaR) then
            Cont := Cont + 1;
    end;

    ObtenerColumnasMismoColor := Cont;
end;
Var
    Colores: TMatColor;
    Cantidades: TMatCantidad;
    N: byte;
Begin
    Leer(Colores, Cantidades, N);
    EscribirColores(Colores, N);
    EscribirCantidades(Cantidades, N);

    Writeln('El color mas predominante es: ', ObtenerColorPredominante(Colores, N));
    Writeln('El color con mas fichas es: ', ObtenerMaxFichas(Colores, Cantidades, N));
    Writeln('Hay ', ObtenerColumnasMismoColor(Colores, N), ' columnas con el mismo color.');
End.
