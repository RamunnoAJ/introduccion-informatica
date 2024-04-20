Program tp_ciclos;
Const
    PrecioRosas = 2000;
    PrecioFresias = 800;
    PrecioMargaritas = 500;
Var
    N, i, CantMasVendida, Cant, CantR, CantF, CantM: byte;
    MontoRosas, MontoFresias, MontoMargaritas: real;
    Arch: text;
    TFlor, FlorMasVendida: char;
Begin
Assign(Arch, 'Floreria.txt');
Reset(Arch);
Readln(Arch, N);

CantMasVendida := 0;
MontoRosas := 0; MontoFresias := 0; MontoMargaritas := 0;
CantR := 0; CantF := 0; CantM := 0;

For i := 1 To N Do
Begin
    Readln(Arch, TFlor, Cant);
    case TFlor of
        'R': begin
             MontoRosas := MontoRosas + (Cant * PrecioRosas);
             CantR := CantR + Cant;
             end;
        'F': begin
             MontoFresias := MontoFresias + (Cant * PrecioFresias);
             CantF := CantF + Cant;
             end;
        'M': begin
             MontoMargaritas := MontoMargaritas + (Cant * PrecioMargaritas);
             CantM := CantM + Cant;
             end;
    end;
end;

Writeln('Por la venta de rosas se recaudaron: $', MontoRosas:8:2);
Writeln('Por la venta de fresias se recaudaron: $', MontoFresias:8:2);
Writeln('Por la venta de margaritas se recaudaron: $', MontoMargaritas:8:2);

if (CantR > CantF) and (CantR > CantM) then
    Writeln('La flor más vendida fue la rosa, y se vendieron ', CantR)
    else
        if (CantF > CantM) then
            Writeln('La flor más vendida fue la fresia, y se vendieron ', CantF)
            else
                Writeln('La flor más vendida fue la margarita, y se vendieron ', CantM);

Readln();
End.
