inherited FTelaCadastroContador: TFTelaCadastroContador
  Caption = 'Cadastro de Contador'
  ClientWidth = 703
  ExplicitWidth = 719
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 496
    Top = 193
    Width = 50
    Height = 13
    Caption = 'Entrada :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited PageControl: TPageControl
    Width = 703
    ExplicitWidth = 703
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 695
      inherited Grid: TDBGrid
        Width = 695
      end
      inherited Panel2: TPanel
        Width = 695
        ExplicitWidth = 695
        inherited BitBtn2: TBitBtn
          Left = 628
          Top = 10
          ExplicitLeft = 628
          ExplicitTop = 10
        end
        inherited GroupBox1: TGroupBox
          Left = 221
          Top = 5
          ExplicitLeft = 221
          ExplicitTop = 5
        end
        inherited BotaoConsultar: TBitBtn
          Left = 549
          Top = 10
          ExplicitLeft = 549
          ExplicitTop = 10
        end
        object GroupBox3: TGroupBox
          Left = 61
          Top = 5
          Width = 154
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButtonPessoa: TRadioButton
            Left = 88
            Top = 19
            Width = 41
            Height = 25
            Caption = 'CRC'
            TabOrder = 0
          end
          object RadioButton1: TRadioButton
            Left = 22
            Top = 19
            Width = 51
            Height = 25
            Caption = 'Nome'
            TabOrder = 1
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 695
      ExplicitHeight = 386
      inherited PanelBotoes: TPanel
        Width = 695
        ExplicitWidth = 695
      end
      inherited PageControlEdit: TPageControl
        Width = 695
        ExplicitWidth = 695
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 687
          ExplicitHeight = 301
          inherited PanelEdits: TPanel
            Width = 687
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 687
            object Label6: TLabel
              Left = 32
              Top = 46
              Width = 46
              Height = 13
              Caption = 'Pessoa :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 58
              Top = 88
              Width = 28
              Height = 13
              Caption = 'CRC :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 17
              Top = 123
              Width = 55
              Height = 13
              Caption = 'Ocupa'#231#227'o :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 11
              Top = 160
              Width = 71
              Height = 13
              Caption = 'Certid'#227'o Reg.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 325
              Top = 88
              Width = 50
              Height = 13
              Caption = 'Entrada :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 488
              Top = 88
              Width = 33
              Height = 13
              Caption = 'Sa'#237'da :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 322
              Top = 160
              Width = 47
              Height = 13
              Caption = 'Validade :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object LabeledEditPessoa: TEdit
              Left = 102
              Top = 43
              Width = 64
              Height = 21
              MaxLength = 10
              NumbersOnly = True
              TabOrder = 0
              OnExit = LabeledEditPessoaExit
            end
            object BitBtn3: TBitBtn
              Left = 172
              Top = 41
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 1
              OnClick = BitBtn3Click
            end
            object LabeledEditNomePessoa: TEdit
              Left = 211
              Top = 43
              Width = 398
              Height = 21
              ReadOnly = True
              TabOrder = 2
            end
            object LabeledEditLogin: TEdit
              Left = 102
              Top = 85
              Width = 197
              Height = 21
              MaxLength = 20
              TabOrder = 3
            end
            object LabeledEditSenha: TEdit
              Left = 102
              Top = 120
              Width = 197
              Height = 21
              MaxLength = 80
              TabOrder = 6
            end
            object Edit1: TEdit
              Left = 102
              Top = 157
              Width = 197
              Height = 21
              MaxLength = 20
              TabOrder = 7
            end
            object MaskEditDtInicio: TMaskEdit
              Left = 382
              Top = 85
              Width = 64
              Height = 21
              Color = clWhite
              EditMask = '!99/99/9999;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 4
              Text = '  /  /    '
              OnExit = MaskEditDtInicioExit
            end
            object MaskEdit1: TMaskEdit
              Left = 544
              Top = 85
              Width = 64
              Height = 21
              Color = clWhite
              EditMask = '!99/99/9999;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 5
              Text = '  /  /    '
              OnExit = MaskEdit1Exit
            end
            object MaskEdit2: TMaskEdit
              Left = 382
              Top = 157
              Width = 64
              Height = 21
              Color = clWhite
              EditMask = '!99/99/9999;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 8
              Text = '  /  /    '
              OnExit = MaskEdit2Exit
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 703
    ExplicitWidth = 703
  end
end
