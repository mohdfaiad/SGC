inherited FTelaCadastroEstado: TFTelaCadastroEstado
  Caption = 'Cadastro de Estado'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      inherited Panel2: TPanel
        inherited BotaoConsultar: TBitBtn
          Top = 10
          ExplicitTop = 10
        end
        object GroupBox2: TGroupBox
          Left = 86
          Top = 2
          Width = 185
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButtonNome: TRadioButton
            Left = 17
            Top = 16
            Width = 49
            Height = 28
            Caption = 'Nome'
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
            object LabelEditNome: TLabeledEdit
              Tag = 16
              Left = 16
              Top = 28
              Width = 383
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              EditLabel.Width = 32
              EditLabel.Height = 13
              EditLabel.Caption = 'Nome'
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
              ParentFont = False
              TabOrder = 0
            end
            object LabelEditNomePais: TLabeledEdit
              Tag = 1
              Left = 16
              Top = 93
              Width = 245
              Height = 21
              EditLabel.Width = 19
              EditLabel.Height = 13
              EditLabel.Caption = 'Pa'#237's'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object btnConsultaEstado: TBitBtn
              Left = 267
              Top = 91
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 2
              OnClick = btnConsultaEstadoClick
            end
            object LabelEditPais: TLabeledEdit
              Tag = 1
              Left = 312
              Top = 93
              Width = 71
              Height = 21
              EditLabel.Width = 19
              EditLabel.Height = 13
              EditLabel.Caption = 'Pa'#237's'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Visible = False
            end
          end
        end
      end
    end
  end
end
