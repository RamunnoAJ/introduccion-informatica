Program ejercicio07;
Type
    TMat = Array [1..31, 1..25] of byte;
Procedure InicializaMat(Var Edificio: TMat);
var
    i, j: byte;
begin
    for i := 1 to 31 do
        for j := 1 to 25 do
            Edificio[i, j] := 0;
end;
Procedure Escribir(Edificio: TMat);
var
    i, j: byte;
begin
    for i := 1 to 31 do
    begin
        for j := 1 to 25 do
            Write(Edificio[i, j]:3);

    Writeln();
    end;
end;
Procedure Leer(Var Edificio: TMat);
Var
    Arch: text;
    Dia, Piso, Personas: byte;
begin
    Assign(Arch, 'edificio.txt');
    Reset(Arch);

    while (NOT EOF(Arch)) do
    begin
        Readln(Arch, Dia, Piso, Personas);
        Edificio[Dia, Piso] := Edificio[Dia, Piso] + Personas
    end;

    Close(Arch);
end;
Function ObtenerCantidadDia(Edificio: TMat; i: byte): byte;
var
    Cont, j: byte;
begin
    Cont := 0;
    for j := 1 to 25 do
        Cont := Cont + Edificio[i, j];

    ObtenerCantidadDia := Cont;
end;
Function ObtenerCantidadPiso(Edificio: TMat; j: byte): byte;
var
    Cont, i: byte;
begin
    Cont := 0;
    for i := 1 to 31 do
        Cont := Cont + Edificio[i, j];

    ObtenerCantidadPiso := Cont;
end;
Function ObtenerTotal(Edificio: TMat): word;
var
    i, j: byte;
    Cont: word;
begin
    Cont := 0;
    for i := 1 to 31 do
        for j := 1 to 25 do
            Cont := Cont + Edificio[i, j];

    ObtenerTotal := Cont;
end;
Var
    Edificio: TMat;
    i, j, Dia: byte;
    Total: word;
Begin
    InicializaMat(Edificio);
    Leer(Edificio);
    Escribir(Edificio);

    for i := 1 to 31 do
        Writeln('Cantidad de personas en el dia ', i, ' es: ', ObtenerCantidadDia(Edificio, i));
    for j := 1 to 25 do
        Writeln('Cantidad de personas en el piso ', j, ' es: ', ObtenerCantidadPiso(Edificio, j));

    for j := 1 to 25 do
        Writeln('Promedio de personas en el piso ', j, ' es: ', (ObtenerCantidadPiso(Edificio, j) / 31):8:2);

    Total := ObtenerTotal(Edificio);
    Writeln('Total de personas: ', Total);

    Repeat
        Writeln('Ingrese dia');
        Readln(Dia);
    Until (Dia > 0) AND (Dia < 32);

    Writeln('Para el dia ', Dia, ' el porcentaje de personas que ingresaron sobre el total del mes es: ', ((ObtenerCantidadDia(Edificio, Dia) * 100) / Total):8:2);
End.
