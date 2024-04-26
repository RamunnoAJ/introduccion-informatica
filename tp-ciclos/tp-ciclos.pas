Program tp_ciclos;
Const
    PrecioRosas = 2000;
    PrecioFresias = 800;
    PrecioMargaritas = 500;
Var
    N, i,  Cant, CantR, CantF, CantM: byte;
    Arch: text;
    TFlor: char;
Begin
Assign(Arch, 'Floreria.txt');
Reset(Arch);
Readln(Arch, N);

CantR := 0; CantF := 0; CantM := 0;

For i := 1 To N Do
Begin
    Readln(Arch, TFlor, Cant);
    case TFlor of
        'R': CantR := CantR + Cant;
        'F': CantF := CantF + Cant;
        'M': CantM := CantM + Cant;
    end;
end;

Writeln('Por la venta de rosas se recaudaron: $', (CantR * PrecioRosas));
Writeln('Por la venta de fresias se recaudaron: $', (CantF * PrecioFresias));
Writeln('Por la venta de margaritas se recaudaron: $', (CantM * PrecioMargaritas));

if (CantR > CantF) and (CantR > CantM) then
    Writeln('La flor más vendida fue la rosa, y se vendieron ', CantR)
else
    if (CantF > CantM) then
        Writeln('La flor más vendida fue la fresia, y se vendieron ', CantF)
    else
        Writeln('La flor más vendida fue la margarita, y se vendieron ', CantM);

Readln();
Close(Arch);
End.
