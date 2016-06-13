inherited FTelaCadastroCondominio: TFTelaCadastroCondominio
  Caption = 'Cadastro de Condom'#237'nio'
  ClientHeight = 505
  ClientWidth = 771
  ExplicitWidth = 787
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 771
    Height = 480
    inherited Consulta: TTabSheet
      ExplicitWidth = 778
      ExplicitHeight = 439
      inherited Grid: TDBGrid
        Width = 763
        Height = 396
      end
      inherited Panel2: TPanel
        Width = 763
        ExplicitWidth = 778
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
            Width = 49
            Height = 17
            Caption = 'CNPJ'
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
      inherited PanelBotoes: TPanel
        Width = 763
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
        Width = 763
        Height = 395
        inherited DadosPrincipais: TTabSheet
          inherited PanelEdits: TPanel
            Width = 755
            Height = 367
            ExplicitLeft = 3
            ExplicitTop = -3
            ExplicitWidth = 755
            ExplicitHeight = 367
            object Cep: TLabel
              Left = 624
              Top = 9
              Width = 19
              Height = 13
              Caption = 'Cep'
            end
            object LabelCnpj: TLabel
              Left = 495
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
            object Telefone_2: TLabel
              Left = 115
              Top = 142
              Width = 53
              Height = 13
              Caption = 'Telefone II'
            end
            object Telefone_1: TLabel
              Left = 16
              Top = 144
              Width = 49
              Height = 13
              Caption = 'Telefone I'
            end
            object Label1: TLabel
              Left = 15
              Top = 238
              Width = 25
              Height = 13
              Caption = 'Cnae'
            end
            object Label2: TLabel
              Left = 13
              Top = 280
              Width = 83
              Height = 13
              Caption = 'Natureza Jur'#237'dica'
            end
            object Label3: TLabel
              Left = 402
              Top = 277
              Width = 73
              Height = 13
              Caption = 'Inicio Atividade'
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
              ParentFont = False
              TabOrder = 0
            end
            object MaskEditCNPJCPF: TMaskEdit
              Tag = 15
              Left = 495
              Top = 28
              Width = 123
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
              Left = 624
              Top = 28
              Width = 64
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
              ParentFont = False
              TabOrder = 3
            end
            object LabelEditNumero: TLabeledEdit
              Tag = 16
              Left = 280
              Top = 71
              Width = 31
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
              ParentFont = False
              TabOrder = 6
            end
            object MaskEditTelefone: TMaskEdit
              Tag = 1
              Left = 16
              Top = 163
              Width = 93
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
              Left = 115
              Top = 163
              Width = 100
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
              Left = 231
              Top = 163
              Width = 457
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
              TabOrder = 15
            end
            object LabelEditCnae: TMaskEdit
              Tag = 15
              Left = 15
              Top = 253
              Width = 81
              Height = 21
              Color = clWhite
              EditMask = ' 99.99-9 / 99 ;0;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 14
              ParentFont = False
              TabOrder = 20
              Text = ''
            end
            object LabelEditDescCnae: TLabeledEdit
              Tag = 1
              Left = 102
              Top = 253
              Width = 245
              Height = 21
              EditLabel.Width = 46
              EditLabel.Height = 13
              EditLabel.Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 21
            end
            object btnConsultaCnae: TBitBtn
              Left = 353
              Top = 251
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 22
              OnClick = btnConsultaCnaeClick
            end
            object LabelEditCodCnae: TLabeledEdit
              Tag = 1
              Left = 371
              Top = 341
              Width = 71
              Height = 21
              EditLabel.Width = 25
              EditLabel.Height = 13
              EditLabel.Caption = 'Cnae'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 23
              Visible = False
            end
            object LabelEditNatureza: TMaskEdit
              Tag = 15
              Left = 13
              Top = 295
              Width = 81
              Height = 21
              Color = clWhite
              EditMask = ' 99.99-9 / 99 ;0;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 14
              ParentFont = False
              TabOrder = 24
              Text = ''
            end
            object LabelEditDescNatureza: TLabeledEdit
              Tag = 1
              Left = 100
              Top = 295
              Width = 245
              Height = 21
              EditLabel.Width = 46
              EditLabel.Height = 13
              EditLabel.Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 25
            end
            object btnConsultaNatureza: TBitBtn
              Left = 351
              Top = 291
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 26
              OnClick = btnConsultaNaturezaClick
            end
            object LabelEditCodNatureza: TLabeledEdit
              Tag = 1
              Left = 447
              Top = 341
              Width = 71
              Height = 21
              EditLabel.Width = 44
              EditLabel.Height = 13
              EditLabel.Caption = 'Natureza'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 28
              Visible = False
            end
            object LabeledEditDescCidade: TLabeledEdit
              Tag = 1
              Left = 16
              Top = 115
              Width = 193
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
              Left = 215
              Top = 113
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 8
              OnClick = btnConsultaCidadeClick
            end
            object LabeledEditDescEstado: TLabeledEdit
              Tag = 1
              Left = 251
              Top = 115
              Width = 215
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
              Left = 472
              Top = 113
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 10
              Visible = False
            end
            object LabeledEditDescPais: TLabeledEdit
              Tag = 1
              Left = 508
              Top = 115
              Width = 144
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
              Left = 658
              Top = 113
              Width = 30
              Height = 25
              Caption = 'P'
              TabOrder = 12
              Visible = False
            end
            object LabeledEditCidade: TLabeledEdit
              Tag = 1
              Left = 524
              Top = 341
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
              TabOrder = 29
              Visible = False
            end
            object LabeledEditEstado: TLabeledEdit
              Tag = 1
              Left = 601
              Top = 341
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
              TabOrder = 30
              Visible = False
            end
            object LabeledEditPais: TLabeledEdit
              Tag = 1
              Left = 678
              Top = 341
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
              TabOrder = 31
              Visible = False
            end
            object LabeledEditMetragem: TLabeledEdit
              Tag = 1
              Left = 16
              Top = 211
              Width = 73
              Height = 21
              EditLabel.Width = 48
              EditLabel.Height = 13
              EditLabel.Caption = 'Metragem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 16
            end
            object LabeledEditInsMunicipal: TLabeledEdit
              Tag = 1
              Left = 95
              Top = 211
              Width = 73
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 13
              EditLabel.Caption = 'Insc. Municipal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 17
            end
            object LabeledEditNomeFantasia: TLabeledEdit
              Tag = 1
              Left = 303
              Top = 211
              Width = 385
              Height = 21
              EditLabel.Width = 71
              EditLabel.Height = 13
              EditLabel.Caption = 'Nome Fantasia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 19
            end
            object LabeledEditRegimeTrib: TLabeledEdit
              Tag = 1
              Left = 174
              Top = 211
              Width = 123
              Height = 21
              EditLabel.Width = 84
              EditLabel.Height = 13
              EditLabel.Caption = 'Regime Tribut'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 18
            end
            object MaskEditDtInicioAtividade: TMaskEdit
              Left = 402
              Top = 296
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
              TabOrder = 27
              Text = '  /  /    '
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 480
    Width = 771
  end
end
