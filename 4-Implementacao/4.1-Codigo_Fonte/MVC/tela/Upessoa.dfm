inherited FTelaCadastroPessoa: TFTelaCadastroPessoa
  Caption = 'Cadastro de Pessoas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = Consulta
    inherited Consulta: TTabSheet
      inherited Panel2: TPanel
        inherited BotaoConsultar: TBitBtn
          Top = 10
          ExplicitTop = 10
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited PageControlEdit: TPageControl
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          inherited PanelEdits: TPanel
            object ScrollBox1: TScrollBox
              Left = 1
              Top = 1
              Width = 765
              Height = 299
              Align = alClient
              TabOrder = 0
              object Telefone_1: TLabel
                Left = 17
                Top = 150
                Width = 51
                Height = 13
                Caption = 'Telefone 1'
              end
              object Telefone_2: TLabel
                Left = 106
                Top = 150
                Width = 51
                Height = 13
                Caption = 'Telefone 2'
              end
              object Label1: TLabel
                Left = 16
                Top = 55
                Width = 22
                Height = 13
                Caption = 'Cnpj'
              end
              object LabelEditNome: TLabeledEdit
                Tag = 16
                Left = 16
                Top = 28
                Width = 383
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                EditLabel.Width = 97
                EditLabel.Height = 13
                EditLabel.Caption = 'Nome / Raz'#227'o Social'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object MaskEditCNPJCPF: TMaskEdit
                Tag = 15
                Left = 405
                Top = 26
                Width = 133
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                Text = ''
              end
              object MaskEditCep: TMaskEdit
                Tag = 15
                Left = 16
                Top = 71
                Width = 62
                Height = 21
                Color = clWhite
                EditMask = '99.999-999;0;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 2
                Text = ''
              end
              object LabelEditRua: TLabeledEdit
                Tag = 16
                Left = 92
                Top = 71
                Width = 258
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                EditLabel.Width = 19
                EditLabel.Height = 13
                EditLabel.Caption = 'Rua'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object LabelEditNumero: TLabeledEdit
                Tag = 16
                Left = 363
                Top = 71
                Width = 37
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                EditLabel.Width = 37
                EditLabel.Height = 13
                EditLabel.Caption = 'N'#250'mero'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object LabelEditComplemento: TLabeledEdit
                Tag = 16
                Left = 406
                Top = 71
                Width = 133
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                EditLabel.Width = 65
                EditLabel.Height = 13
                EditLabel.Caption = 'Complemento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object LabelEditBairro: TLabeledEdit
                Tag = 16
                Left = 16
                Top = 119
                Width = 334
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                EditLabel.Width = 28
                EditLabel.Height = 13
                EditLabel.Caption = 'Bairro'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object MaskEditTelefone: TMaskEdit
                Tag = 1
                Left = 16
                Top = 167
                Width = 60
                Height = 21
                Color = clWhite
                EditMask = '9999-9999;0;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 9
                ParentFont = False
                TabOrder = 7
                Text = ''
              end
              object MaskEditTelefone2: TMaskEdit
                Tag = 1
                Left = 106
                Top = 167
                Width = 64
                Height = 21
                Color = clWhite
                EditMask = '9999-9999;0;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 9
                ParentFont = False
                TabOrder = 8
                Text = ''
              end
              object LabelEditEmail: TLabeledEdit
                Tag = 1
                Left = 16
                Top = 221
                Width = 334
                Height = 21
                EditLabel.Width = 24
                EditLabel.Height = 13
                EditLabel.Caption = 'Email'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
            end
          end
        end
      end
    end
  end
end
