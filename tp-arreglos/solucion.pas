Program tp_arreglos;
Type
    ST11 = string[11];
    TVDni = array[1..50] of ST11;
    TVEdad = array[1..50] of byte;
    TVAltura = array[1..50] of real;
    TVAntecedente = array[1..50] of char;
Procedure Leer(Var VDni: TVDni; Var VEdades: TVEdad; Var VAlturas: TVAltura; Var VAntecedentes: TVAntecedente; Var N: byte);
var
    Arch: text;
    i: byte;
    espacio: char;
begin
    Assign(Arch, 'Registros.txt');
    Reset(Arch);

    i := 0;
    while (NOT EOF(Arch)) do
    begin
        i := i + 1;
        Readln(Arch, VDni[i], VEdades[i], VAlturas[i], espacio, VAntecedentes[i]);
    end;

    N := i;
    Writeln(N);
    Close(Arch);
end;
Procedure ObtenerEdadYAntecedentes(DNI: ST11; VDni:TVDni; VEdades: TVEdad; VAntecedentes: TVAntecedente; N: byte);
var
    i: byte;
    BanderaEsta: boolean;
begin
    i := 1;
    while (i < N) AND (DNI <> VDni[i]) do
        i := i + 1;

    BanderaEsta := DNI = VDni[i];

    if (BanderaEsta) then
    begin
        Writeln('Su edad es: ', VEdades[i]);
        if (VAntecedentes[i] = 'S') then
            Writeln('Tiene antecedentes penales')
        else
            Writeln('No tiene antecedentes penales');
    end
    else
        Writeln('No se encontró un registro con: ', DNI);
end;
Function CalcularEstaturaPromedio(REdad1, REdad2: real; VEdades: TVEdad; VAlturas: TVAltura; N: byte): real;
var
    i, Contador: byte;
    Suma: real;
begin
    Suma := 0;
    Contador := 0;

    for i := 1 to N do
    begin
        if (REdad1 <= VEdades[i]) AND (VEdades[i] <= REdad2) then
        begin
            Contador := Contador + 1;
            Suma := Suma + VAlturas[i];
        end;
    end;

    if (Contador > 0) then
        CalcularEstaturaPromedio := Suma / Contador
    else
        CalcularEstaturaPromedio := 0;
end;
Function CalcularCantidadAntecedentes(VAntecedentes: TVAntecedente; N: byte): byte;
var
    i, Contador: byte;
begin
    Contador := 0;

    for i := 1 to N do
        if VAntecedentes[i] = 'S' then
            Contador := Contador + 1;

    CalcularCantidadAntecedentes := Contador;
end;
Procedure Menu(Var Op: char);
begin
    Writeln('Menú de opciones');
    Writeln('1) Buscar edad y antecedentes de un registro');
    Writeln('2) Calcular estatura promedio entre un rango de edades [Edad1, Edad2]');
    Writeln('3) Mostrar cantidad de personas con antecedentes');
    Writeln('4) Fin');
    Repeat
        Write('Ingrese su opción: ');
        Readln(Op);
    Until ('1' <= Op) AND (Op <= '4' );
end;
Var
    VDni: TVDni;
    VEdades: TVEdad;
    VAlturas: TVAltura;
    VAntecedentes: TVAntecedente;
    N, Edad1, Edad2: byte;
    DNI: ST11;
    PromedioEstatura: real;
    Op: char;
Begin
    Leer(VDni, VEdades, VAlturas, VAntecedentes, N);

    Repeat
        Menu(Op);
        case Op of
        '1': begin
                Writeln('Ingresa un DNI a buscar');
                Readln(DNI);
                ObtenerEdadYAntecedentes(DNI, VDni, VEdades, VAntecedentes, N);
            end;
        '2': begin
                Repeat
                    Writeln('Ingrese edad 1');
                    Readln(Edad1);
                Until (Edad1 > 0);
                Repeat
                    Writeln('Ingrese edad 2');
                    Readln(Edad2);
                Until (Edad2 > Edad1);

                PromedioEstatura := CalcularEstaturaPromedio(Edad1, Edad2, VEdades, VAlturas, N);

                if (PromedioEstatura <> 0) then
                    Writeln('El promedio de altura entre las edades ', Edad1, ' y ', Edad2, ' es: ', PromedioEstatura:3:2)
                else
                    Writeln('No se encontraron registros con edad entre ', Edad1, ' y ', Edad2);
            end;
        '3': Writeln('La cantidad de personas con antecedentes penales es: ', CalcularCantidadAntecedentes(VAntecedentes, N));
        end;
    Until Op = '4';
End.
