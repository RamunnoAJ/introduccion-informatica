Program ejercicio1;
Var
    Nombre: string[20];
    Tipo: byte;
    Hectareas: word;
    Monto: real;
Begin
    Writeln('Ingrese su nombre');
    Readln(Nombre);

    while (Nombre <> '***') do
        begin
        Writeln('Ingrese el tipo de fumigación');
        Readln(Tipo);
        Writeln('Ingrese la cantidad de hectareas');
        Readln(Hectareas);

        case Tipo of
        1..2: Monto := 20 * Hectareas;
        3: Monto := 30 * Hectareas;
                else Monto := 40 * Hectareas;
            end;

        if (Hectareas > 100) then
        Monto := Monto * 0.95;

        if (Monto > 1600) then
        Monto := Monto - (Hectareas - 1600) * 0.9;


        Writeln('Nombre: ', Nombre, ', Tipo: ', Tipo, ', Cantidad(has): ', Hectareas);
        Writeln('Costo del trabajo: ', Monto:8:2);

        Writeln('Ingrese un nombre ("***" fin de datos)');
        Readln(Nombre)
        end;
    Readln()
End.
