Program ejercicio07;
Type
    ST5 = string[5];
    ST6 = string[6];
    ST7 = string[7];
    TVClientes = Array [1..50] of ST5;
    TVPatentes = Array [1..50] of ST6;
    TVTipos = Array [1..50] of byte;
    TVToneladas = Array [1..50] of real;
    TVCereales = Array [1..4] of ST7;
    TVTons = Array [1..4] of real;
Const
    Cereales: TVCereales = ('trigo', 'girasol', 'soja', 'maiz');
Procedure Menu(Var Op: byte);
begin
    Writeln('Elija una opción');

    Repeat
        Writeln('1) Obtener el porcentaje de toneladas de cada cereal respecto al total');
        Writeln('2) Dada una patente obtener el tipo de cereal, la cantidad de toneladas y el cliente');
        Writeln('3) Mostrar los clientes que transportaron mas de X peso');
        Writeln('0) Fin');

        Readln(Op);
    Until Op < 4;
end;
Procedure Inicializar(Var Tonsig: TVTons);
var
    i: byte;
begin
    for i := 1 to 4 do
        Tonsig[i] := 0;
end;
Procedure Leer(Var Clientes: TVClientes; Var Patentes: TVPatentes; Var Tipos: TVTipos; Var Toneladas: TVToneladas; Var Tonsig: TVTons; Var N: byte);
var
    Arch: text;
    espacio: char;
begin
    Assign(Arch, 'Planta.txt');
    Reset(Arch);
    N := 0;

    while (NOT EOF(Arch)) do
    begin
        N := N + 1;
        Readln(Arch, Clientes[N], espacio, Patentes[N], Tipos[N], Toneladas[N]);
        Tonsig[Tipos[N]] := Tonsig[Tipos[N]] + Toneladas[N];
    end;

    Close(Arch);
end;
Function Suma(Tonsig: TVTons): real;
var
    i: byte;
    aux: real;
begin
    aux := 0;
    for i := 1 to 4 do
        aux := aux + Tonsig[i];

    Suma := aux;
end;
Procedure ObtenerPorcentaje(Tonsig: TVTons; Total: real);
var
    i: byte;
begin
    for i := 1 to 4 do
        Writeln('Porcentaje de participación del cereal ', Cereales[i], ' es de: ', ((Tonsig[i] * 100) /Total ):8:2);
end;
Function BuscarPatente(Patente: ST6; Patentes: TVPatentes; N: byte): byte;
var
    i: byte;
begin
    i := 1;
    while (i <= N) AND (Patentes[i] <> Patente) do
        i := i + 1;

    if (i <= N) then
        BuscarPatente := i
    else
        BuscarPatente := 0;
end;
Procedure GenerarNuevoArreglo(X: real; Clientes: TVClientes; Toneladas: TVToneladas; N: byte; Var Vector: TVClientes; Var M: byte);
var
    i: byte;
begin
    M := 0;
    for i := 1 to N do
        if (Toneladas[i] > X) then
        begin
            M := M + 1;
            Vector[M] := Clientes[i];
        end;
end;
Procedure OrdenarArregloAlfabeticamente(Var Clientes: TVClientes; N: byte);
var
    i, j: byte;
    aux: ST5;
begin
    for i := 1 to N - 1 do
        for j := i + 1 to N do
            if (Clientes[i] > Clientes[j]) then
                begin
                    aux := Clientes[i];
                    Clientes[i] := Clientes[j];
                    Clientes[j] := aux;
                end;
end;
Procedure EscribeClientes(Clientes: TVClientes; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
        Writeln(Clientes[i]);
end;
Var
    Clientes, NuevosClientes: TVClientes;
    Patentes: TVPatentes;
    Tipos: TVTipos;
    Toneladas: TVToneladas;
    Tonsig: TVTons;
    N, PosPatente, M, Op: byte;
    Patente: ST6;
    X: real;
Begin
    Inicializar(Tonsig);
    Leer(Clientes, Patentes, Tipos, Toneladas, Tonsig, N);

    Repeat
        Repeat
            Menu(Op);
            Writeln(Op);
        Until Op < 4;

        Case Op of
            1: ObtenerPorcentaje(Tonsig, Suma(Tonsig));
            2: begin
                    Writeln('Ingrese patente: ');
                    Readln(Patente);
                    PosPatente := BuscarPatente(Patente, Patentes, N);

                    if (PosPatente <> 0) then
                        Writeln(Patentes[PosPatente], ' ', Cereales[Tipos[PosPatente]], ' ', Toneladas[PosPatente]:8:2, ' ', Clientes[PosPatente])
                    else
                        Writeln('No se encontró la patente ', Patente);
                end;
            3: begin
                    Repeat
                        Writeln('Ingrese X toneladas');
                        Readln(X);
                    Until X > 0;

                    GenerarNuevoArreglo(X, Clientes, Toneladas, N, NuevosClientes, M);
                    OrdenarArregloAlfabeticamente(NuevosClientes, M);
                    EscribeClientes(NuevosClientes, M);
                end;
        end;
    Until Op = 0;
End.
