inherited FTelaCadastroPlano: TFTelaCadastroPlano
  Caption = 'Cadastro Plano de Contas'
  ClientWidth = 797
  OnDestroy = FormDestroy
  ExplicitWidth = 813
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 797
    ActivePage = Consulta
    ExplicitWidth = 797
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 789
      inherited Grid: TDBGrid
        Width = 789
      end
      inherited Panel2: TPanel
        Width = 789
        ExplicitWidth = 789
        inherited GroupBox1: TGroupBox
          Left = 292
          Top = 3
          ExplicitLeft = 292
          ExplicitTop = 3
        end
        object GroupBox2: TGroupBox
          Left = 63
          Top = 3
          Width = 223
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButtonClassificacao: TRadioButton
            Left = 63
            Top = 21
            Width = 87
            Height = 17
            Caption = 'Classifica'#231#227'o'
            TabOrder = 0
          end
          object RadioButtonCodigo: TRadioButton
            Left = 3
            Top = 16
            Width = 54
            Height = 28
            Caption = 'C'#243'digo'
            TabOrder = 1
          end
          object RadioButtonDescricao: TRadioButton
            Left = 147
            Top = 21
            Width = 73
            Height = 17
            Caption = 'Descri'#231#227'o'
            TabOrder = 2
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 789
      ExplicitHeight = 386
      inherited PanelBotoes: TPanel
        Width = 789
        ExplicitWidth = 789
      end
      inherited PageControlEdit: TPageControl
        Width = 789
        ExplicitWidth = 789
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 781
          ExplicitHeight = 301
          inherited PanelEdits: TPanel
            Width = 781
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 781
            object Telefone_1: TLabel
              Left = 18
              Top = 72
              Width = 72
              Height = 13
              Caption = 'Classifica'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 18
              Top = 128
              Width = 60
              Height = 13
              Caption = 'Tipo Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 18
              Top = 25
              Width = 55
              Height = 13
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelEditCodigo: TLabeledEdit
              Tag = 16
              Left = 474
              Top = 44
              Width = 67
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              EditLabel.Width = 38
              EditLabel.Height = 13
              EditLabel.Caption = 'C'#243'digo'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clWindowText
              EditLabel.Font.Height = -11
              EditLabel.Font.Name = 'Tahoma'
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              TabOrder = 0
              Visible = False
            end
            object EditClassificacao: TMaskEdit
              Tag = 1
              Left = 18
              Top = 91
              Width = 115
              Height = 21
              Color = clWhite
              EditMask = '!9.9.99.99.999.999;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 17
              ParentFont = False
              TabOrder = 2
              Text = ' . .  .  .   .   '
            end
            object ComboBoxTipo: TComboBox
              Left = 18
              Top = 147
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 3
              Text = 'S - Sint'#233'tica'
              Items.Strings = (
                'S - Sint'#233'tica'
                'B - Banco'
                'C - Caixa'
                'R - Receitas'
                'D - Despesas'
                'O - Outras')
            end
            object LabelEditDescricao: TMaskEdit
              Tag = 1
              Left = 18
              Top = 44
              Width = 342
              Height = 21
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 50
              ParentFont = False
              TabOrder = 1
              Text = ''
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 797
    ExplicitWidth = 797
  end
end
