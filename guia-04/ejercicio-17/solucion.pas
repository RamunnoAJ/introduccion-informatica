Program ejercicio17;
Var
    Arch: text;
    N, Numero, i, j, Cont, Maximo: byte;
    Bandera: boolean;
Begin
    Assign(Arch, 'sorteo.txt');
    Reset(Arch);
    Readln(Arch, N);
    Cont := 0;
    for i := 1 to N do
        begin
        Maximo := 0;
        Bandera := false;
        for j := 1 to 6 do
            begin
            Read(Arch, Numero);
            if (Numero MOD 2 <> 0) then
                begin
                if (Numero MOD 2 <> 0) then
                    Bandera := true;
                end
                else
                    if (Numero > Maximo) then
                        Maximo := Numero;
            end;
        Readln(Arch);

        if (Maximo <> 0) then
            Writeln('El numero par más alto del sorteo ', i, ' fue ', Maximo)
            else
                Writeln('No hubieron pares en el sorteo ', i);

        if (Bandera) then
            Cont := Cont + 1;
        end;
Writeln('En ', Cont, ' sorteos hubo al menos un numero impar');
Close(Arch);
Readln();
End.
