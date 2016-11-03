inherited FTelaCadastroPessoa: TFTelaCadastroPessoa
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 470
  ClientWidth = 787
  OnClose = FormClose
  ExplicitWidth = 803
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 787
    Height = 445
    ActivePage = Consulta
    ExplicitWidth = 787
    ExplicitHeight = 445
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 779
      ExplicitHeight = 417
      inherited Grid: TDBGrid
        Width = 779
        Height = 361
      end
      inherited Panel2: TPanel
        Width = 779
        ExplicitWidth = 779
        inherited BitBtn2: TBitBtn
          Left = 692
          Top = 10
          ExplicitLeft = 692
          ExplicitTop = 10
        end
        inherited BotaoConsultar: TBitBtn
          Top = 10
          ExplicitTop = 10
        end
        object GroupBox2: TGroupBox
          Left = 86
          Top = 3
          Width = 185
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButtonCnpj: TRadioButton
            Left = 72
            Top = 21
            Width = 89
            Height = 17
            Caption = 'CNPJ / CPF'
            TabOrder = 0
          end
          object RadioButtonNome: TRadioButton
            Left = 17
            Top = 16
            Width = 49
            Height = 28
            Caption = 'Nome'
            TabOrder = 1
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 779
      ExplicitHeight = 417
      inherited PanelBotoes: TPanel
        Width = 779
        ExplicitWidth = 779
        inherited BitBtnNovo: TBitBtn
          TabOrder = 0
        end
        inherited BitBtnAltera: TBitBtn
          TabOrder = 1
        end
        inherited BitBtnGrava: TBitBtn
          TabOrder = 4
        end
        inherited BitBtnExclui: TBitBtn
          TabOrder = 2
        end
        inherited BitBtnCancela: TBitBtn
          TabOrder = 3
        end
      end
      inherited PageControlEdit: TPageControl
        Width = 779
        Height = 360
        ExplicitWidth = 779
        ExplicitHeight = 360
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 771
          ExplicitHeight = 332
          inherited PanelEdits: TPanel
            Width = 771
            Height = 332
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 771
            ExplicitHeight = 332
            object ScrollBox1: TScrollBox
              Left = 1
              Top = 1
              Width = 769
              Height = 330
              Align = alClient
              TabOrder = 0
              object Telefone_1: TLabel
                Left = 16
                Top = 144
                Width = 49
                Height = 13
                Caption = 'Telefone I'
              end
              object Telefone_2: TLabel
                Left = 131
                Top = 144
                Width = 53
                Height = 13
                Caption = 'Telefone II'
              end
              object Cep: TLabel
                Left = 618
                Top = 9
                Width = 19
                Height = 13
                Caption = 'Cep'
              end
              object LabelCnpj: TLabel
                Left = 481
                Top = 9
                Width = 55
                Height = 13
                Caption = 'Cpf / Cnpj'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LabelEditNome: TLabeledEdit
                Tag = 16
                Left = 16
                Top = 28
                Width = 459
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                EditLabel.Width = 115
                EditLabel.Height = 13
                EditLabel.Caption = 'Nome / Raz'#227'o Social'
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
              object MaskEditCNPJCPF: TMaskEdit
                Tag = 15
                Left = 481
                Top = 28
                Width = 131
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
              object MaskEditCep: TMaskEdit
                Tag = 15
                Left = 618
                Top = 28
                Width = 70
                Height = 21
                Color = clWhite
                EditMask = ' 99.999-999 ;0;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 12
                ParentFont = False
                TabOrder = 2
                Text = ''
              end
              object LabelEditRua: TLabeledEdit
                Tag = 16
                Left = 16
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
                MaxLength = 250
                ParentFont = False
                TabOrder = 3
              end
              object LabelEditNumero: TLabeledEdit
                Tag = 16
                Left = 280
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
                MaxLength = 50
                ParentFont = False
                TabOrder = 4
              end
              object LabelEditComplemento: TLabeledEdit
                Tag = 16
                Left = 323
                Top = 71
                Width = 152
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
                MaxLength = 250
                ParentFont = False
                TabOrder = 5
              end
              object LabelEditBairro: TLabeledEdit
                Tag = 16
                Left = 481
                Top = 71
                Width = 207
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
                MaxLength = 250
                ParentFont = False
                TabOrder = 6
              end
              object MaskEditTelefone: TMaskEdit
                Tag = 1
                Left = 16
                Top = 163
                Width = 97
                Height = 21
                Color = clWhite
                EditMask = '(999) 9999 - 9999;0;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 17
                ParentFont = False
                TabOrder = 13
                Text = ''
              end
              object MaskEditTelefone2: TMaskEdit
                Tag = 1
                Left = 131
                Top = 163
                Width = 102
                Height = 21
                Color = clWhite
                EditMask = '(999) 9999 - 9999;0;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 17
                ParentFont = False
                TabOrder = 14
                Text = ''
              end
              object LabelEditEmail: TLabeledEdit
                Tag = 1
                Left = 251
                Top = 161
                Width = 437
                Height = 21
                EditLabel.Width = 24
                EditLabel.Height = 13
                EditLabel.Caption = 'Email'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 250
                ParentFont = False
                TabOrder = 15
              end
              object LabeledEditDescCidade: TLabeledEdit
                Tag = 1
                Left = 16
                Top = 117
                Width = 254
                Height = 21
                EditLabel.Width = 33
                EditLabel.Height = 13
                EditLabel.Caption = 'Cidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
              end
              object btnConsultaCidade: TBitBtn
                Left = 276
                Top = 113
                Width = 30
                Height = 25
                Caption = 'P'
                TabOrder = 8
                OnClick = btnConsultaCidadeClick
              end
              object LabeledEditCidade: TLabeledEdit
                Tag = 1
                Left = 15
                Top = 229
                Width = 71
                Height = 21
                EditLabel.Width = 33
                EditLabel.Height = 13
                EditLabel.Caption = 'Cidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 16
                Visible = False
              end
              object LabeledEditEstado: TLabeledEdit
                Tag = 1
                Left = 103
                Top = 229
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
                TabOrder = 17
                Visible = False
              end
              object LabeledEditPais: TLabeledEdit
                Tag = 1
                Left = 199
                Top = 229
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
                TabOrder = 18
                Visible = False
              end
              object LabeledEditDescEstado: TLabeledEdit
                Tag = 1
                Left = 312
                Top = 115
                Width = 185
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
                TabOrder = 9
              end
              object BtnConsultaEstado: TBitBtn
                Left = 103
                Top = 256
                Width = 30
                Height = 25
                Caption = 'P'
                TabOrder = 10
                Visible = False
                OnClick = BtnConsultaEstadoClick
              end
              object LabeledEditDescPais: TLabeledEdit
                Tag = 1
                Left = 503
                Top = 115
                Width = 185
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
                TabOrder = 11
              end
              object BtnConsultaPais: TBitBtn
                Left = 199
                Top = 256
                Width = 30
                Height = 25
                Caption = 'P'
                TabOrder = 12
                Visible = False
                OnClick = BtnConsultaPaisClick
              end
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 445
    Width = 787
    ExplicitTop = 445
    ExplicitWidth = 787
  end
end
