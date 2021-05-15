unit uBerechtigung;

interface

uses
  uZauberkasten,
  System.Rtti;

type
  Berechtigung = class(TMyAttributes)
  private
    fstufe: string;
  public
    constructor Create(const astufe: String);
    procedure Doit(const Instance: TObject; const Method: TRttiMethod; const Args: TArray<TValue>; const result: TValue); override;
  end;

var
  aktuellerBenutzer: string;

implementation

uses
  System.SysUtils;

procedure Berechtigung.Doit(const Instance: TObject; const Method: TRttiMethod; const Args: TArray<TValue>; const result: TValue);
begin
  if fstufe <> aktuellerBenutzer then
    raise Exception.Create('Keine Berechtigung für ' + Method.Name + ' als ' +
      aktuellerBenutzer + ' muss ' + fstufe);
end;

constructor Berechtigung.Create(const astufe: String);
begin
  fstufe:=astufe;
end;

end.
