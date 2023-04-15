unit form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCNatural, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    MainMenu1: TMainMenu;
    Numero1: TMenuItem;
    invertir1: TMenuItem;
    posDigMenor1: TMenuItem;
    Edit3: TEdit;
    elimiarPosDig1: TMenuItem;
    OrdIzdToDerAsc1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure invertir1Click(Sender: TObject);
    procedure posDigMenor1Click(Sender: TObject);
    procedure elimiarPosDig1Click(Sender: TObject);
    procedure OrdIzdToDerAsc1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  objeto : Natural;
implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var numero : cardinal;
    cadena : string;
    p, d : byte;
begin
  cadena := InputBox('INgrese un numero','','');
  numero := StrToInt(cadena);

  cadena := InputBox('INgrese una posicion','','');
  p := StrToInt(cadena);

  cadena := InputBox('INgrese una digito','','');
  d := StrToInt(cadena);

  objeto.setvalor(numero);
  objeto.InserDigito(p,d);

  ShowMessage(IntToStr(objeto.getValor));
end;

procedure TForm1.Button2Click(Sender: TObject);
var numero : cardinal;
    cadena : string;
begin
  cadena := edit1.Text;
  numero := StrToInt(cadena);
  objeto.setvalor(numero);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   edit2.Text := (IntToStr(objeto.getValor));
end;

procedure TForm1.elimiarPosDig1Click(Sender: TObject);
var pos : byte;
begin
  pos := StrToInt(Edit3.Text);
  objeto.ElimPosDigito(pos);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  objeto := Natural.Create;
end;

procedure TForm1.invertir1Click(Sender: TObject);
begin
   objeto.Invertir();
end;

procedure TForm1.OrdIzdToDerAsc1Click(Sender: TObject);
begin
  objeto.OrdIzdToDerAsc;
end;

procedure TForm1.posDigMenor1Click(Sender: TObject);
begin
  Edit3.Text := IntToStr(objeto.GetDigito(2));
end;

end.
