inherited FTelaCadastroUsuario: TFTelaCadastroUsuario
  Caption = 'Cadastro de Usu'#225'rios'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = Consulta
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      inherited Panel2: TPanel
        object GroupBox3: TGroupBox
          Left = 61
          Top = 3
          Width = 195
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButtonPessoa: TRadioButton
            Left = 14
            Top = 16
            Width = 54
            Height = 28
            Caption = 'Login'
            TabOrder = 0
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 775
      ExplicitHeight = 386
      inherited PageControlEdit: TPageControl
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 767
          ExplicitHeight = 301
          inherited PanelEdits: TPanel
            ExplicitLeft = 0
            ExplicitTop = 0
            object Label1: TLabel
              Left = 20
              Top = 88
              Width = 36
              Height = 13
              Caption = 'Login :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 15
              Top = 123
              Width = 41
              Height = 13
              Caption = 'Senha :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 10
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
            object LabeledEditLogin: TEdit
              Left = 84
              Top = 85
              Width = 197
              Height = 21
              MaxLength = 50
              TabOrder = 2
            end
            object LabeledEditSenha: TEdit
              Left = 84
              Top = 112
              Width = 197
              Height = 21
              MaxLength = 50
              PasswordChar = '*'
              TabOrder = 3
            end
            object LabeledEditPessoa: TEdit
              Left = 84
              Top = 43
              Width = 64
              Height = 21
              MaxLength = 10
              NumbersOnly = True
              TabOrder = 0
              OnExit = LabeledEditPessoaExit
            end
            object BitBtn3: TBitBtn
              Left = 154
              Top = 41
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 1
              OnClick = BitBtn3Click
            end
            object LabeledEditNomePessoa: TEdit
              Left = 193
              Top = 43
              Width = 352
              Height = 21
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
      end
    end
  end
end
