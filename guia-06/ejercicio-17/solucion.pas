Program ejercicio17;
Type
    ST25 = string[25];
    TV = Array[1..50] of real;
    Vehiculos = Array [1..5] of ST25;
Const
    Vehc: Vehiculos = ('particular', 'carga', 'transporte de pasajeros', 'oficial', 'servicios');
Procedure Inicializar(Var Costos: TV);
var
    i: byte;
begin
    for i := 1 to 5 do
        Costos[i] := 0;
end;
Procedure Leer(Var Costos: TV);
var
    Arch: text;
    Tipo: byte;
    Monto: real;
begin
    Assign(Arch, 'Taller.txt');
    Reset(Arch);

    while (NOT EOF(Arch)) do
    begin
        Readln(Arch, Tipo, Monto);
        Costos[Tipo] := Costos[Tipo] + Monto;
    end;

    Close(Arch);
end;
Procedure Escribir(Costos: TV);
var
    i: byte;
begin
    for i := 1 to 5 do
        Writeln('Para el tipo ', Vehc[i], 'el costo es: $', Costos[i]:8:2);
end;
Function Suma(Costos: TV): real;
var
    i: byte;
    aux: real;
begin
    aux := 0;
    for i := 1 to 5 do
        aux := aux + Costos[i];

    Suma := aux;
end;
Procedure PTotal(Costos: TV; Total: real);
var
    i: byte;
begin
    for i := 1 to 5 do
        Writeln('Para el tipo ', Vehc[i], ' el porcentaje del total es: ', ((Costos[i] * 100) / Total):8:2, '%');
end;
Var
    Costos: TV;
Begin
    Inicializar(Costos);
    Leer(Costos);
    Escribir(Costos);
    PTotal(Costos, Suma(Costos));
    Readln();
End.
