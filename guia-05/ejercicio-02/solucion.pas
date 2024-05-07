program ejercicio;
Function CalcFactorial(a: integer): integer;
var
    i: integer;
begin
     if (a = 0) then
        CalcFactorial := 1
     else
     begin
          for i := a downto 2 do
              a := a * (i - 1);

          CalcFactorial := a;
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
