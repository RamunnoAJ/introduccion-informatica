Program ejercicio16;
Var
    Distancia, DistanciaMax, DistanciaMedia, SumDistancia: real;
    N, i: byte;
    Documento, Ganador: string[8];
Begin
    Writeln('Ingrese la cantidad de participantes');
    Readln(N);

    DistanciaMax := 0; SumDistancia := 0;

    for i := 1 to N do
        begin
        Writeln('Ingrese su documento');
        Readln(Documento);
        Writeln('Ingrese la distancia de jabalina lanzada');
        Readln(Distancia);

        SumDistancia := SumDistancia + Distancia;

        if (Distancia > DistanciaMax) then
            begin
            DistanciaMax := Distancia;
            Ganador := Documento;
            end;
        end;

    DistanciaMedia := SumDistancia / N;

    Writeln('El ganador es el de documento n° ', Ganador, ' y su distancia fue ', DistanciaMax:8:2);
    Writeln('La distancia promedio fue ', DistanciaMedia:8:2);
    Readln();
End.
