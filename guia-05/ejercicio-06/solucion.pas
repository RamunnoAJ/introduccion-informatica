Program ejercicio06;
Procedure Resolvente(C1, C2, C3: real; Var R1, R2: real);
begin
    R1 := (-C2 + sqrt(sqr(C2) - 4 * C1 * C3)) / (2 * C1);
    R2 := (-C2 - sqrt(sqr(C2) - 4 * C1 * C3)) / (2 * C1);
end;
Var
    Arch: text;
    N, i: byte;
    C1, C2, C3, R1, R2: real;
    Letra: char;
Begin
Assign(Arch, 'numeros.txt');
Reset(Arch);

Readln(Arch, N);

for i := 1 to N do
begin
    Readln(Arch, Letra, C1, C2, C3);
    Resolvente(C1, C2, C3, R1, R2);
    Writeln(C1:8:2, C2:8:2, C3:8:2);
    Writeln(Letra, R1:8:2, R2:8:2);
end;

Close(Arch);
Readln();
End.
