Program ejercicio01;
Type
	TVec = Array [1..50] of byte;
Procedure Leer(Var Numeros: TVec; Var N: byte);
var
	Arch: text;
begin
	Assign(Arch, 'numeros.txt');
	Reset(Arch);

	N := 0;

	while NOT EOF(Arch) do
	begin
		N := N + 1;
		Read(Arch, Numeros[N]);
	end;

	N := N - 1;
	Close(Arch);
end;
Procedure Escribir(Numeros: TVec; N: byte);
var
	i: byte;
begin
	for i := 1 to N do
		Write(Numeros[i]:3);
	Writeln();
end;
Function ObtenerMaximo(Numeros: TVec; N: byte): byte;
var
	i, Max: byte;
begin
	Max := Numeros[1];
	for i := 2 to N do
	begin
		if (Numeros[i] > Max) then
			Max := Numeros[i];
	end;

	ObtenerMaximo := Max;
end;
Procedure GenerarNuevoArreglo(Numeros: TVec; N, Maximo: byte; Var NuevoArreglo: TVec; Var Cont: byte);
var
	i: byte;
begin
	Cont := 0;

	for i := 1 to N do
	begin
		if (Numeros[i] <> Maximo) then
			NuevoArreglo[i] := Numeros[i]
		else
		begin
			if Cont <> 0 then
				NuevoArreglo[i] := 0
			else
				NuevoArreglo[i] := Numeros[i];

			Cont := Cont + 1;
		end;
	end;

	Cont := Cont - 1;
end;
Var
	Numeros, NuevoArreglo: TVec;
	N, Maximo, Cont: byte;
Begin
	Leer(Numeros, N);
	Escribir(Numeros, N);

	Maximo := ObtenerMaximo(Numeros, N);

	GenerarNuevoArreglo(Numeros, N, Maximo, NuevoArreglo, Cont);
	Escribir(NuevoArreglo, N);
	Writeln('La cantidad de reemplazos fue: ', Cont);

	Readln();
End.
