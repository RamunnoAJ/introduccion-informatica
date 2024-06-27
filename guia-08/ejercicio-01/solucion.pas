Program ejercicio01;
Type
    ST10 = string[10];
    TRPaciente = Record
        Nombre: ST10;
        Edad, Peso: byte;
        Altura: real;
    end;
    TRNuevo = Record
        Nombre: ST10;
        Edad: byte;
    end;
    TV = array [1..50] of TRPaciente;
    TVNuevo = array [1..50] of TRNuevo;
Procedure Leer(Var Pacientes: TV; Var N: byte);
var
    Arch: text;
begin
    Assign(Arch, 'Pacientes.txt');
    Reset(Arch);

    N := 0;
    while (NOT EOF(Arch)) do
    begin
    N := N + 1;
        with Pacientes[N] do
        begin
            Readln(Arch, Nombre);
            Readln(Arch, Edad, Peso, Altura);
        end;
    end;

    Close(Arch);
end;
Procedure EscribirPacientes(Pacientes: TV; N: byte);
var
    i: byte;
begin
    for i := 1 to N do
    begin
        with Pacientes[i] do
        begin
            Writeln(Nombre);
            Writeln(Edad, ' ', Peso, ' ', Altura:4:2);
        end;
    end;
end;
Function ObtenerMasJoven(Pacientes: TV; N: byte): byte;
var
    i, PosMin, Min: byte;
begin
    PosMin := 1;
    Min := Pacientes[1].Edad;

    for i := 2 to N do
    with Pacientes[i] do
    begin
        if (Edad < Min) then
        begin
            PosMin := i;
            Min := Edad;
        end;
    end;

    ObtenerMasJoven := PosMin;
end;
Function ObtenerAlturaPromedio(Pacientes: TV; N: byte): real;
var
    i: byte;
    Suma: real;
begin
    Suma := 0;

    for i := 1 to N do
    with Pacientes[i] do
    begin
        Suma := Suma + Altura;
    end;

    ObtenerAlturaPromedio := Suma / N
end;
Function CalcularPesoNormal(Peso: byte; Altura: real): boolean;
var
    Resultado: real;
begin
    Resultado := Peso / (Sqr(Altura));

    CalcularPesoNormal := (18.5 <= Resultado) AND (Resultado < 25);
end;
Procedure GenerarNuevoArreglo(Pacientes: TV; N: byte; Var Nuevo: TVNuevo; Var M: byte);
var
    i: byte;
    EsNormal: boolean;
begin
    M := 0;
    for i := 1 to N do
    begin
        with Pacientes[i] do
            EsNormal := CalcularPesoNormal(Peso, Altura);

        if (EsNormal) then
        begin
            M := M + 1;
            with Nuevo[M] do
            begin
                Nombre := Pacientes[i].Nombre;
                Edad := Pacientes[i].Edad;
            end;
        end;
    end;
end;
Procedure EscribirNuevoArreglo(Nuevo: TVNuevo; M: byte);
var
    i: byte;
begin
    for i := 1 to M do
    with Nuevo[i] do
    begin
        Writeln(Nombre, ' ', Edad);
    end;
end;
Var
    Pacientes: TV;
    Nuevo: TVNuevo;
    N, M: byte;
Begin
    Leer(Pacientes, N);
    EscribirPacientes(Pacientes, N);

    Writeln('El paciente más joven es: ', Pacientes[ObtenerMasJoven(Pacientes, N)].Nombre);
    Writeln('La altura promedio es: ', ObtenerAlturaPromedio(Pacientes, N):4:2);

    GenerarNuevoArreglo(Pacientes, N, Nuevo, M);
    EscribirNuevoArreglo(Nuevo, M);
End.
