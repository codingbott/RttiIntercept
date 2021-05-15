unit uZauberkasten;

interface

uses
  System.SysUtils,
  System.Rtti;

type
  TMyAttributes = class(TCustomAttribute)
  public
    procedure Doit(const Instance: TObject; const Method: TRttiMethod; const Args: TArray<TValue>; const result: TValue); virtual; abstract;
  end;

  TZauberkasten = class
  public
    class function Zaubern(obj: TObject): TVirtualMethodInterceptor;
  end;

implementation

class function TZauberkasten.Zaubern(obj: TObject): TVirtualMethodInterceptor;
begin
  result:=TVirtualMethodInterceptor.Create(obj.ClassType);
  result.OnBefore:=
      procedure(Instance: TObject; Method: TRttiMethod;
      const Args: TArray<TValue>; out DoInvoke: Boolean; out result: TValue)
    var
      at: TCustomAttribute;
    begin
      for at in Method.GetAttributes() do
        if  (at is TMyAttributes) then
          TMyAttributes(at).Doit(Instance, method, args, result);
    end;
  result.Proxify(obj);
end;

end.
