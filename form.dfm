object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 462
  ClientWidth = 953
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 280
    Width = 209
    Height = 65
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 136
    Width = 75
    Height = 25
    Caption = 'cargar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 176
    Width = 75
    Height = 25
    Caption = 'descargar'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 368
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 368
    Top = 178
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 368
    Top = 205
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 8
    object Numero1: TMenuItem
      Caption = 'Numero'
      object invertir1: TMenuItem
        Caption = 'invertir'
        OnClick = invertir1Click
      end
      object posDigMenor1: TMenuItem
        Caption = 'posDigMenor'
        OnClick = posDigMenor1Click
      end
      object elimiarPosDig1: TMenuItem
        Caption = 'elimiarPosDig'
        OnClick = elimiarPosDig1Click
      end
      object OrdIzdToDerAsc1: TMenuItem
        Caption = 'OrdIzdToDerAsc'
        OnClick = OrdIzdToDerAsc1Click
      end
    end
  end
end
