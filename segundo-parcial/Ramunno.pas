program parcial;
Type
    ST9 = string[9];
    TMat = Array[1..50, 1..5] of byte;
    TVec = Array[1..5] of byte;
    TVDias = Array[1..5] of ST9;
Const
     Dias: TVDias = ('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes');
Procedure Leer(Var Prendas: TMat; Var Objetivos: TVec; Var N: byte);
var
   Arch: text;
   i, j: byte;
begin
     Assign(Arch, 'Produccion.txt');
     Reset(Arch);

     Readln(Arch, N);
     for i := 1 to N do
     begin
         for j := 1 to 5 do
             Read(Arch, Prendas[i, j]);
     end;

     for j := 1 to 5 do
         Read(Arch, Objetivos[j]);

     Close(Arch);
end;
Procedure EscribirMatriz(Prendas: TMat; N: byte);
var
   i, j: byte;
begin
     for i := 1 to N do
     begin
         for j := 1 to 5 do
             Write(Prendas[i, j]:3);
         Writeln();
     end;
end;

Procedure EscribirVector(Objetivos: TVec);
var
   j: byte;
begin
     for j := 1 to 5 do
         Write(Objetivos[j]:3);
     Writeln();
end;

Function ObtenerCantidadMinima(Prendas: TMat; N, Dia: byte): byte;
var
   i, Min: byte;
begin
     Min := Prendas[1, Dia];
     for i := 2 to N do
         if (Prendas[i, Dia] < Min) then
            Min := Prendas[i, Dia];

     ObtenerCantidadMinima := Min;
end;

Procedure RestarPrendas(Var Prendas: TMat; N, X, Y, P: byte);
begin
     if (Prendas[X, Y] < P) then
        Writeln('No puedes restar mas prendas de las que hay')
     else
         Prendas[X, Y] := Prendas[X, Y] - P;

     EscribirMatriz(Prendas, N);
end;

Function CumplioObjetivo(Prendas: TMat; Objetivos: TVec; N, Dia: byte): byte;
var
   Cont, i: byte;
begin
     Cont := 0;
     i := 0;

     while (i < N) AND (Cont = 0) do
     begin
         i := i + 1;
         if (Prendas[i, Dia] < Objetivos[Dia]) then
            Cont := 1;
     end;

     CumplioObjetivo := Cont;
end;

Var
   Prendas: TMat;
   Objetivos: TVec;
   N, Dia, Min, X, Y, P, j, ContDiasNoCumplidos: byte;
begin
     Leer(Prendas, Objetivos, N);
     EscribirMatriz(Prendas, N);
     EscribirVector(Objetivos);

     Writeln('Ingrese un dia de la semana (1 a 5)');
     Readln(Dia);
     Min := ObtenerCantidadMinima(Prendas, N, Dia);
     Writeln(Dias[Dia], ' con ', Min, ' prendas');

     Repeat
           Writeln('Ingrese una maquina X y un dia Y');
           Readln(X, Y);
     until (X <= 5) AND (Y <= N);
     Repeat
           Writeln('Ingrese una cantidad P de prendas a restar');
           Readln(P);
     until (P > 0);

     RestarPrendas(Prendas, N, X, Y, P);

     ContDiasNoCumplidos := 0;
     for j := 1 to 5 do
         ContDiasNoCumplidos := ContDiasNoCumplidos + CumplioObjetivo(Prendas, Objetivos, N ,j);

     Writeln(ContDiasNoCumplidos, ' dias');

     Readln();
end.

