program ejercicio;
Function CalcFactorial(a: integer): integer;
var
    i, Acum: integer;
begin
     Acum := 1;
     if (a = 0) then
        CalcFactorial := 1
     else
     begin
          for i := a downto 1 do
              Acum := Acum * i;

          CalcFactorial := Acum;
     end;
end;
Var
    N: integer;
begin
     repeat
           Writeln('Ingrese un numero para calcular su factorial');
           Readln(N);
     until N >= 0;

     Writeln(CalcFactorial(N));
     Readln();
end.
