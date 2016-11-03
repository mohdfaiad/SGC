inherited TFTelaCadastroCidade: TTFTelaCadastroCidade
  Caption = 'Cadastro de Cidade'
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
              MaxLength = 250
              ParentFont = False
              TabOrder = 0
            end
            object LabelEditNomeEstado: TLabeledEdit
              Tag = 1
              Left = 16
              Top = 93
              Width = 245
              Height = 21
              EditLabel.Width = 33
              EditLabel.Height = 13
              EditLabel.Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object LabelEditEstado: TLabeledEdit
              Tag = 1
              Left = 304
              Top = 93
              Width = 71
              Height = 21
              EditLabel.Width = 33
              EditLabel.Height = 13
              EditLabel.Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Visible = False
            end
            object btnConsultaEstado: TBitBtn
              Left = 267
              Top = 91
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 3
              OnClick = btnConsultaEstadoClick
            end
            object LabelEditNomePais: TLabeledEdit
              Tag = 1
              Left = 16
              Top = 141
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
              TabOrder = 4
            end
            object btnConsultaPais: TBitBtn
              Left = 267
              Top = 139
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 5
              Visible = False
              OnClick = btnConsultaPaisClick
            end
            object LabelEditPais: TLabeledEdit
              Tag = 1
              Left = 304
              Top = 141
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
              TabOrder = 6
              Visible = False
            end
          end
        end
      end
    end
  end
end
