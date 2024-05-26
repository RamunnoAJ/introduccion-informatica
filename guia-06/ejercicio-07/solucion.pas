Program ejercicio07;
Type
    VP = Array [1..50] of string[7];
    VA = Array [1..50] of word;
    VI = Array [1..50] of real;
Procedure Leer(Var VPatentes: VP; Var VAnios: VA; Var VImportes: VI; Var N: byte);
Var
    Arch: text;
    i: byte;
begin
    Assign(Arch, 'autos.txt');
    Reset(Arch);

    Readln(Arch, N);
    for i:= 1 to N do
    begin
        Readln(Arch, VPatentes[i], VAnios[i], VImportes[i]);
        Writeln(VPatentes[i], VAnios[i]:5, VImportes[i]:8:2);
    end;

    Close(Arch);
end;
Function BuscarPosicion(VPatentes: VP; N: byte; Patente: string): byte;
Var
    i, Posicion: byte;
begin
    Posicion := 0;

    for i:= 1 to N do
        if (Patente = VPatentes[i]) then
            Posicion := i;

    BuscarPosicion := Posicion;
end;
Var
    VPatentes: VP;
    VAnios: VA;
    VImportes: VI;
    N, Posicion: byte;
    Patente: string;
Begin
    Leer(VPatentes, VAnios, VImportes, N);

    Write('Ingrese una patente para buscar: ');
    Readln(Patente);

    Posicion := BuscarPosicion(VPatentes, N, Patente);
    if (Posicion <> 0) then
    begin
        Writeln('Año: ', VAnios[Posicion]);
        Writeln('Precio: ', VImportes[Posicion]:8:2);
    end
    else
        Writeln('No se encontró ningún auto con la patente ', Patente);
End.
