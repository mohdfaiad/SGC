inherited FTelaCadastroContador: TFTelaCadastroContador
  Caption = 'Cadastro de Contador'
  ClientWidth = 655
  ExplicitWidth = 671
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 655
    ActivePage = Consulta
    inherited Consulta: TTabSheet
      inherited Grid: TDBGrid
        Width = 647
      end
      inherited Panel2: TPanel
        Width = 647
        inherited BitBtn2: TBitBtn
          Left = 580
          Top = 10
          ExplicitLeft = 580
          ExplicitTop = 10
        end
        inherited GroupBox1: TGroupBox
          Left = 173
          Top = 5
          ExplicitLeft = 173
          ExplicitTop = 5
        end
        inherited BotaoConsultar: TBitBtn
          Left = 501
          Top = 10
          ExplicitLeft = 501
          ExplicitTop = 10
        end
        object GroupBox3: TGroupBox
          Left = 61
          Top = 3
          Width = 92
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButtonPessoa: TRadioButton
            Left = 14
            Top = 16
            Width = 54
            Height = 28
            Caption = 'CRC'
            TabOrder = 0
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      inherited PanelBotoes: TPanel
        Width = 647
        ExplicitTop = -6
      end
      inherited PageControlEdit: TPageControl
        Width = 647
        inherited DadosPrincipais: TTabSheet
          inherited PanelEdits: TPanel
            Width = 639
            ExplicitLeft = 0
            ExplicitTop = 0
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
              Left = 50
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
              Width = 61
              Height = 13
              Caption = 'Ocupa'#231#227'o :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabeledEditPessoa: TEdit
              Left = 102
              Top = 43
              Width = 64
              Height = 21
              MaxLength = 10
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
              Width = 352
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
              TabOrder = 4
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 655
  end
end
