Program ejercicio05;
Procedure Fraccion(N1, D1, N2, D2: integer; Var R1, R2: integer);
Begin
    R1 := (N1 * D2) + (N2 * D1);
    R2 := D1 * D2;
End;
Var
    N1, N2, D1, D2, R1, R2: integer;
Begin
    Repeat
        Writeln('Ingrese numerador 1');
        Readln(N1);
    until (N1 <> 0);
    Repeat
        Writeln('Ingrese denominador 1');
        Readln(D1);
    until (D1 <> 0);
    Repeat
        Writeln('Ingrese numerador 2');
        Readln(N2);
    until (N2 <> 0);
    Repeat
        Writeln('Ingrese denominador 2');
        Readln(D2);
    until (D2 <> 0);

    Fraccion(N1, D1, N2, D2, R1, R2);
    Writeln('La suma es: ', R1, '/', R2);
    Readln()
End.
