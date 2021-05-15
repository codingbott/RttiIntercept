unit uLogging;

interface

uses
  System.Rtti,
  uZauberkasten;

type
  Logging = class(TMyAttributes)
  public
    procedure Doit(const Instance: TObject; const Method: TRttiMethod; const Args: TArray<TValue>; const result: TValue); override;
  end;

implementation

procedure Logging.Doit(const Instance: TObject; const Method: TRttiMethod;
  const Args: TArray<TValue>; const result: TValue);
var
  par: TArray<TRttiParameter>;
  i: integer;
begin
  par:=Method.GetParameters();
  writeln('Wird aufgerufen: ' + Method.Name);
  for i:=Low(Args) to High(Args) do
    writeln(' - ', par[i].Name, ': ', Args[i].ToString);
end;

end.
