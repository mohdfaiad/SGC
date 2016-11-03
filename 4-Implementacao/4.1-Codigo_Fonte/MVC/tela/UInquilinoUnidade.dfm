inherited FTelaCadastroInquilino: TFTelaCadastroInquilino
  Caption = 'Cadastro de Inquilino'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = Consulta
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 775
      ExplicitHeight = 386
      inherited PanelBotoes: TPanel
        inherited BitBtnGrava: TBitBtn
          Left = 105
          ExplicitLeft = 105
        end
      end
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
              Left = 446
              Top = 24
              Width = 64
              Height = 13
              Caption = 'Data Inicio '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelNome: TLabel
              Left = 126
              Top = 43
              Width = 3
              Height = 13
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelEditCodigo: TLabeledEdit
              Tag = 16
              Left = 18
              Top = 40
              Width = 65
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
              ReadOnly = True
              TabOrder = 0
            end
            object btnConsultaPessoa: TBitBtn
              Left = 91
              Top = 38
              Width = 27
              Height = 25
              Caption = 'P'
              TabOrder = 1
              OnClick = btnConsultaPessoaClick
            end
            object MaskEditDtInicio: TMaskEdit
              Left = 446
              Top = 40
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
              TabOrder = 2
              Text = '  /  /    '
              OnExit = MaskEditDtInicioExit
            end
          end
        end
      end
    end
  end
end
