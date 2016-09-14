inherited FTelaCadastroUnidade: TFTelaCadastroUnidade
  Caption = 'Cadastro de Unidades'
  ClientHeight = 503
  ClientWidth = 763
  ExplicitWidth = 779
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 763
    Height = 478
    ExplicitWidth = 763
    ExplicitHeight = 478
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 755
      ExplicitHeight = 450
      inherited Grid: TDBGrid
        Width = 755
        Height = 394
      end
      inherited Panel2: TPanel
        Width = 755
        ExplicitWidth = 755
        object GroupBox2: TGroupBox
          Left = 86
          Top = 3
          Width = 185
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButtonNome: TRadioButton
            Left = 17
            Top = 16
            Width = 64
            Height = 28
            Caption = 'N'#250'mero'
            TabOrder = 0
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 755
      ExplicitHeight = 450
      inherited PanelBotoes: TPanel
        Width = 755
        ParentBackground = False
        ExplicitWidth = 755
        object BtnProprietario: TBitBtn
          Left = 408
          Top = 6
          Width = 75
          Height = 45
          Caption = 'Propriet'#225'rio'
          TabOrder = 5
          OnClick = BtnProprietarioClick
        end
        object BtnInquilino: TBitBtn
          Left = 512
          Top = 6
          Width = 75
          Height = 45
          Caption = 'Inquilino'
          TabOrder = 6
          OnClick = BtnInquilinoClick
        end
      end
      inherited PageControlEdit: TPageControl
        Width = 755
        Height = 393
        ExplicitWidth = 755
        ExplicitHeight = 393
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 747
          ExplicitHeight = 365
          inherited PanelEdits: TPanel
            Width = 747
            Height = 365
            ExplicitWidth = 747
            ExplicitHeight = 365
            object PageControlUnidade: TPageControl
              Left = 2
              Top = 0
              Width = 767
              Height = 367
              ActivePage = TabSheet1
              TabOrder = 0
              object TabSheet1: TTabSheet
                Caption = 'Unidades'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Panel1: TPanel
                  Left = -4
                  Top = 0
                  Width = 767
                  Height = 343
                  ParentBackground = False
                  TabOrder = 0
                  object Label1: TLabel
                    Left = 91
                    Top = 21
                    Width = 93
                    Height = 13
                    Caption = 'Qtd G'#225's Inicial (m'#179')'
                  end
                  object Label2: TLabel
                    Left = 190
                    Top = 21
                    Width = 59
                    Height = 13
                    Caption = #193'rea Total'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label4: TLabel
                    Left = 289
                    Top = 21
                    Width = 70
                    Height = 13
                    Caption = 'Fra'#231#227'o Ideal'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label5: TLabel
                    Left = 22
                    Top = 75
                    Width = 65
                    Height = 13
                    Caption = 'Observa'#231#227'o :'
                  end
                  object LabelEditNumero: TLabeledEdit
                    Tag = 16
                    Left = 18
                    Top = 40
                    Width = 67
                    Height = 21
                    CharCase = ecUpperCase
                    Color = clWhite
                    EditLabel.Width = 44
                    EditLabel.Height = 13
                    EditLabel.Caption = 'N'#250'mero'
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
                  object EditQtdGas: TEdit
                    Left = 91
                    Top = 40
                    Width = 93
                    Height = 21
                    TabOrder = 1
                  end
                  object EditAreaTotal: TEdit
                    Left = 190
                    Top = 40
                    Width = 93
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                  end
                  object EditFracaoIdeal: TEdit
                    Left = 289
                    Top = 40
                    Width = 93
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 3
                  end
                  object EditObservacao: TEdit
                    Left = 22
                    Top = 94
                    Width = 635
                    Height = 21
                    TabOrder = 4
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 478
    Width = 763
    ExplicitTop = 478
    ExplicitWidth = 763
  end
end
