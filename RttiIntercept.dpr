program RttiIntercept;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Rtti,
  System.SysUtils,
  uLogik in 'uLogik.pas',
  uZauberkasten in 'uZauberkasten.pas',
  uLogging in 'uLogging.pas',
  uBerechtigung in 'uBerechtigung.pas';

procedure prg;
var
  obj: TLogik;
  i: integer;
  o: TVirtualMethodInterceptor;
begin
  obj:=TLogik.Create;
  try
    o:=TZauberkasten.Zaubern(obj);
    try
      i:=obj.Berechne(1,2);
      writeln('Ergebnis: ', i);

      aktuellerBenutzer:='Azubi';
      obj.Bezahlen();
    finally
      o.Unproxify(obj);
      o.Free;
    end;
  finally
    obj.Free;
  end;
end;

begin
  try
    prg();
  except
    on e: Exception do
      writeln(e.Message);
  end;
  readln;
end.
