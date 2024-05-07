program ejercicio;
Function CalcCuadrante(x, y: real): string;
begin
     if (x = 0) AND (y = 0) then
        CalcCuadrante := 'Esta en el centro'
     else
         if (x = 0) then
            CalcCuadrante := 'Esta sobre el eje x'
         else
             if (y = 0) then
                CalcCuadrante := 'Esta sobre el eje y'
             else
                 if (x > 0) then
                    if (y > 0) then
                       CalcCuadrante := 'Esta en el primer cuadrante'
                    else
                        CalcCuadrante := 'Esta en el cuarto cuadrante'
                 else
                     if (y > 0) then
                        CalcCuadrante := 'Esta en el segundo cuadrante'
                     else
                         CalcCuadrante := 'Esta en el tercer cuadrante';
end;
var
   x, y: real;
begin
     Writeln('Ingrese un punto en el eje x');
     Readln(x);
     Writeln('Ingrese un punto en el eje y');
     Readln(y);

     Writeln(CalcCuadrante(x,y));
     Readln();
end.
