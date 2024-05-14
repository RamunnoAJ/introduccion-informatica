Program ejercicio07;
Procedure Gasto(Actual, Anterior: real; Var Consumo, Importe: real);
begin
    Consumo := Actual - Anterior;

    if (Consumo <= 100) then
        Importe := 50 + (5 * Consumo)
    else
        if (Consumo <= 250) then
            Importe := 50 + (3.7 * Consumo)
        else
            Importe := 50 + (2.5 * Consumo);
end;
Var
    Arch: text;
    Cliente: string[1];
    Actual, Anterior, Consumo, Importe: real;
    N, i: byte;
Begin
Assign(Arch, 'consumo.txt');
Reset(Arch);
Readln(Arch, N);

for i := 1 to N do
begin
    Readln(Arch, Cliente, Actual, Anterior);
    Gasto(Actual, Anterior, Consumo, Importe);
    Writeln(Cliente, ' ', Consumo:8:2, ' ', Importe:8:2);
end;

Close(Arch);
Readln();
End.
