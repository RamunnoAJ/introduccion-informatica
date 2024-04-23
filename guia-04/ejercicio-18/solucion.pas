Program Ejercicio18;
Var
    ContSub, i, MaxSub: byte;
    Numero, Max: integer;
    Arch: text;
Begin
    Assign(Arch, 'numeros.txt');
    Reset(Arch);

    Readln(Arch, Numero);
    Max := -999; i := 0;

    while (Numero <> 0) do
    begin
        ContSub := 0;
        while (Numero <> 0) do
        begin
            ContSub := ContSub + 1;
            Readln(Arch, Numero);
        end;
        i := i + 1;
        if (ContSub > Max) then
        begin
            Max := ContSub;
            MaxSub := i;
        end;
        Writeln('Para el subconjunto ', i, ' hay ', ContSub, ' elementos.');
        Readln(Arch, Numero);
    end;

    Writeln('Subconjunto con mas elementos es: ', MaxSub);
    Close(Arch);
    Readln();
End.
