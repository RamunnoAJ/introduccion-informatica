program ejercicio;
Function esMultiplo(a, b: integer): boolean;
begin
     if ((a MOD b) = 0) then
        esMultiplo := true
     else
       esMultiplo := false;
end;
Var
  N1, N2, Mayor, Menor: integer;
  Arch: text;
  Cont, ContMultiplo: byte;
begin
     Assign(Arch, 'funciones.txt');
     Reset(Arch);

     Cont := 0; ContMultiplo := 0;
     while (NOT eof(Arch)) do
     begin
          Readln(Arch, N1, N2);

          if (N1 > N2) then
          begin
               Mayor := N1;
               Menor := N2;
          end
          else
          begin
               Mayor := N2;
               Menor := N1;
          end;

          if (esMultiplo(Mayor,Menor)) then
          begin
               ContMultiplo := ContMultiplo + 1;
               Writeln(Mayor, ' es multiplo de ', Menor);
          end;

          Cont := Cont + 1;
     end;

     Writeln((ContMultiplo * 100 / Cont):8:2);

     Close(Arch);
     Readln();
end.
