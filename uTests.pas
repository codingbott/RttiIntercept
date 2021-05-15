unit uTests;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TInterceptTests = class
  public
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
  end;

implementation

uses
  uLogik;

procedure TInterceptTests.Test1;
var
  o: TLogik;
  vmi: TObject;
  i: integer;
begin
  o:=TLogik.Create;
  try
    vmi:=TInterceptor.intercept(o);
    try
      i:=o.Berechne(1,2);
      o.Bezahlen('ich');
      o.Bezahlen('chef');
    finally
      vmi.free;
    end;
  finally
//    o.Free;
  end;
  Assert.Pass();
end;

initialization
  TDUnitX.RegisterTestFixture(TInterceptTests);

end.
