Program ejercicio;
Function CalcImporte(TPago: char; Importe: real): real;
begin
     case TPago of
         'C': CalcImporte := Importe * 1.07;
         'D': CalcImporte := Importe * 1.05;
         'E': CalcImporte := Importe * 0.9;
     end;
end;
Var
    FormaPago: char;
    Importe: real;
Begin
    Writeln('Ingrese el importe');
    Readln(Importe);
    Writeln('Ingrese la forma de pago ([C]redito, [D]ebito, [E]fectivo)');
    Readln(FormaPago);

    FormaPago := Upcase(FormaPago);
    Writeln(CalcImporte(FormaPago, Importe):8:2);
    Readln();
End.
