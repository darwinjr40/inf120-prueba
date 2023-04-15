unit UCNatural;

interface

uses math, sysutils;

type
  Natural = class
    private//atributos
      n : cardinal;
    public //definicion de metodos
      procedure InserDigito(p, d : byte);   //ctrl + shift + c
      function potencia(base, exponente: cardinal): cardinal;

      procedure setvalor(x : cardinal);
      function getValor(): cardinal;
      procedure Invertir();

      function    GetDigito(p : byte) : byte;
      function    GetCantDig: byte;
      procedure   ElimPosDigito(p: byte);
      procedure   UnirNumDerecha(e : Cardinal);
      procedure   UnirNumIzquierda(e : Cardinal);
      function    GetPosDigMenor(): byte;
      function    toBase(b : cardinal) : String;
      function    ToRomano: String;
      //modelos de examen
      procedure  OrdIzdToDerAsc();
  end;

implementation

{ Natural }
//n=987  p=2    [1..3]
//k=10
procedure Natural.ElimPosDigito(p: byte);
var k : cardinal;
begin
  if not((p >= 1) and (p <= self.GetCantDig)) then
    raise Exception.Create('Posicion fuera de rango: procedure ElimPosDigito')
  else begin
    k:= potencia(10,p-1);
    n:= (n div (k*10)) * (k) + (n mod k);
  end;
end;

//n = 987   p = 2
function Natural.GetCantDig: byte;
var r : byte;
begin
  if (n = 0) then
   r:=1
  else
   r:=trunc(log10(n) + 1);

  result := r;
end;

function Natural.GetDigito(p: byte): byte;
begin
 if p = 0 then
    raise Exception.Create('Posicion fuera de rango: function GetDigito')
  else
    GetDigito := (self.n div self.potencia(10, p-1)) mod 10;
end;

function Natural.GetPosDigMenor: byte;
var d, i, men, p : byte;
    x, dim : cardinal;
begin
  x := n;
  men := x mod 10;
  if x  = 0 then
  begin
    p := 0;
  end else begin
    p := 1;
    dim := trunc(Log10(x) + 1);  //get posicion
    for i := 1 to dim do begin
      d := GetDigito(i);
      if d < men then
      begin
        men := d;
        p := i;
      end;
    end;
  end;
  result := p;
end;

function Natural.getValor: cardinal;
begin
  result := n;
end;

procedure Natural.InserDigito(p, d: byte);
var a, b, k : cardinal;
begin
  k := potencia(10, p-1); //
  a := n div k;
  a := a * 10;
  a:= a + d;
  b := n mod k;
  n := a * k + b;
end;

procedure Natural.Invertir;
var cad, pd, d, m : cardinal;
begin
  m := 0;
  cad := Trunc(ln(n) / ln(10)) + 1;
//  pd := Trunc(Exp(cad-1)*ln(10));
  pd := Trunc(power(10,cad-1));
  while n >= 1 do
  begin
    d := n mod 10;
    m := (d * pd) + m;
    pd := pd div 10;
    n := n div 10
  end;
  n := m;
end;

procedure Natural.OrdIzdToDerAsc;
var sw : Boolean;
    pos, d, c : byte;
    m : Natural;
begin
  sw := false;
  m := Natural.Create;
  c := 0;
  while n >= 1 do
  begin
    pos := self.GetPosDigMenor();
    d := self.GetDigito(pos);
    self.ElimPosDigito(pos);     //
    if d = 0 then
    begin
      c := c + 1;
    end
    else
    begin
      if c > 0 then
      begin
        m.n :=  d * self.potencia(10,c);  //m.setValor(d * self.potencia(10,c))
        c := 0;
      end
      else
      begin
        if sw then
          m.UnirNumDerecha(d)
        else
          m.UnirNumIzquierda(d);
      end;
      sw := not(sw);
    end;
  end;
  n := m.n
end;



function Natural.potencia(base, exponente: cardinal): cardinal;
begin
  result := trunc(power(base, exponente));
end;

procedure Natural.setvalor(x: cardinal);
begin
  n := x;
end;

function Natural.toBase(b: cardinal): String;
const VECTOR: Array[0..15] of string =
('0','1','2','3','4','5','6','7','8','9','A','B', 'C','D','E', 'F');
var n, d : cardinal;
    r : String;
begin
  n := self.n;  //copia
  while n > 0 do
  begin
    d := n mod b;
    n := n div b;
    R := VECTOR[d] + r;
  end;
  result := r
end;

function Natural.ToRomano: String;
const ROM : Array[1..30] of string =(
  'I','II','III','IV','V','VI','VII','VII','IX','X',
  'XX','XXX','XL','L','LX','LXX','LXX','XC','C','CC',
  'CCC','CD','D','DC','DCC','DCCC','CM','M','MM','MMM'
);
var r : string;
    n : cardinal;
    c : byte;
begin
  n := self.n ;
  r := '';
  c := 0;
  while (n > 0) do begin
    if ((n mod 10) <> 0) then
      r := ROM[n mod 10 + (c*10-c)] + r;
    inc(c);  // c = c + 1
    n := n div 10;
  end;
  result := r;
end;

//n=1  e =87    10 pot 2 = 100
procedure Natural.UnirNumDerecha(e: Cardinal);
var aux : Natural;
begin
  if e > 0 then begin
    aux := Natural.Create;
    aux.setvalor(e);
    n := n * self.potencia(10, aux.GetCantDig) + e; //187
  end;
end;
//n=1  e =87    10 pot 2 = 100
procedure Natural.UnirNumIzquierda(e: Cardinal);
var aux : Natural;
begin
  aux := Natural.Create;
  aux.n := e;
  n := e * (potencia(10, self.GetCantDig)) + n;//87 * 10 + 1=871
end;

end.
