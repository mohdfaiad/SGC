inherited FTelaCadastroNaturezaJuridica: TFTelaCadastroNaturezaJuridica
  Caption = 'Cadastro de Natureza Jur'#237'dica'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = Consulta
    inherited DadosCadastrais: TTabSheet
      inherited PageControlEdit: TPageControl
        inherited DadosPrincipais: TTabSheet
          inherited PanelEdits: TPanel
            object LabelEditDescricao: TLabeledEdit
              Tag = 16
              Left = 16
              Top = 76
              Width = 400
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              EditLabel.Width = 46
              EditLabel.Height = 13
              EditLabel.Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object LabelEditNome: TLabeledEdit
              Tag = 16
              Left = 16
              Top = 28
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              EditLabel.Width = 83
              EditLabel.Height = 13
              EditLabel.Caption = 'Natureza Jur'#237'dica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
    end
  end
end
