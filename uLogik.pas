unit uLogik;

interface

uses
  Windows,
  System.SysUtils,
  System.Rtti,
  uLogging,
  uBerechtigung;

type
  TLogik = class
  public
    [Logging]
    function Berechne(a, b: integer): integer; virtual;

    [Logging, Berechtigung('Chef')]
    procedure Bezahlen(); virtual;
  end;

implementation

{ TLogik }

function TLogik.Berechne(a, b: integer): integer;
begin
  result:=a+b;
end;

procedure TLogik.Bezahlen();
begin
end;

end.
