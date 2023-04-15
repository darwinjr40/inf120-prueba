program proyecto;

uses
  Vcl.Forms,
  form in 'form.pas' {Form1},
  UCNatural in 'UCNatural.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
