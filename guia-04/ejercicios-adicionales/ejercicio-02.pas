Program ejercicio_02;
Var
    Monto: real;
    Horas, Dia, ContGratis, ContDescuento: byte;
Const
    PrecioPorHora = 1.5;
Begin
    Writeln('Ingrese la cantidad de horas');
    Readln(Horas);

    ContGratis := 0; ContDescuento := 0;

    while (Horas <> 0) then
    begin
        Repeat
            Writeln('Ingrese el día (1-30)');
            Readln(Dia);
        until (Dia >= 1) AND (Dia <= 30);

        if (Monto > 20) then
            if (Monto <= 50) then
                begin
                Monto := Monto - (PrecioPorHora * 2);
                ContDescuento := ContDescuento + 1;
                end
                else
                    if (Monto <= 100) then
                        begin
                        Monto := Monto - (PrecioPorHora * 3);
                        end
                        else
                            if (Dia <= 5) then
                                begin
                                Monto := 0;
                                ContGratis := ContGratis + 1;
                                end
                            else
                                begin
                                Monto := Monto - 8;
                                ContDescuento := ContDescuento +1;
                                end;

        Monto := PrecioPorHora * Horas;

        Writeln(Monto);
    end;

    Readln();
End.
