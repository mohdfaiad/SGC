object FormMenu: TFormMenu
  Left = 0
  Top = 0
  Caption = 'FormMenu'
  ClientHeight = 509
  ClientWidth = 924
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
  object MainMenu1: TMainMenu
    Left = 104
    Top = 72
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Pessoa1: TMenuItem
        Caption = 'Pessoa'
        OnClick = Pessoa1Click
      end
      object Pas1: TMenuItem
        Caption = 'Pa'#237's'
        OnClick = Pas1Click
      end
      object Cnae1: TMenuItem
        Caption = 'Cnae'
        OnClick = Cnae1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
