inherited FTelaCadastroContasReceber: TFTelaCadastroContasReceber
  Caption = 'Contas a Receber'
  ClientHeight = 502
  ClientWidth = 827
  ExplicitWidth = 843
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 827
    Height = 477
    ActivePage = Consulta
    ExplicitWidth = 827
    ExplicitHeight = 477
    inherited Consulta: TTabSheet
      ExplicitWidth = 819
      ExplicitHeight = 449
      inherited Grid: TDBGrid
        Width = 819
        Height = 393
      end
      inherited Panel2: TPanel
        Width = 819
        ExplicitWidth = 819
        inherited BitBtn2: TBitBtn
          Left = 744
          Top = 10
          ExplicitLeft = 744
          ExplicitTop = 10
        end
        inherited GroupBox1: TGroupBox
          Left = 364
          Top = 3
          ExplicitLeft = 364
          ExplicitTop = 3
        end
        inherited BotaoConsultar: TBitBtn
          Left = 677
          Top = 10
          ExplicitLeft = 677
          ExplicitTop = 10
        end
        object GroupBox2: TGroupBox
          Left = 63
          Top = 3
          Width = 154
          Height = 47
          Caption = 'Vencimento '
          TabOrder = 4
          object MaskEdit1: TMaskEdit
            Left = 3
            Top = 19
            Width = 66
            Height = 21
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '  /  /    '
          end
          object MaskEdit2: TMaskEdit
            Left = 79
            Top = 19
            Width = 66
            Height = 21
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
        end
        object GroupBox3: TGroupBox
          Left = 223
          Top = 3
          Width = 135
          Height = 47
          Caption = 'Tipo'
          TabOrder = 5
          object RadioButtonValor: TRadioButton
            Left = 3
            Top = 16
            Width = 54
            Height = 28
            Caption = 'Valor'
            TabOrder = 0
          end
          object RadioButtonDoc: TRadioButton
            Left = 53
            Top = 16
            Width = 79
            Height = 28
            Caption = 'Documento'
            TabOrder = 1
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitWidth = 819
      ExplicitHeight = 449
      inherited PanelBotoes: TPanel
        Width = 819
        ExplicitWidth = 819
      end
      inherited PageControlEdit: TPageControl
        Width = 819
        Height = 392
        ExplicitWidth = 819
        ExplicitHeight = 392
        inherited DadosPrincipais: TTabSheet
          ExplicitWidth = 811
          ExplicitHeight = 364
          inherited PanelEdits: TPanel
            Width = 811
            Height = 364
            ExplicitWidth = 811
            ExplicitHeight = 364
            object Label1: TLabel
              Left = 16
              Top = 13
              Width = 74
              Height = 13
              Caption = 'Compet'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 102
              Top = 13
              Width = 67
              Height = 13
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 17
              Top = 274
              Width = 29
              Height = 13
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MaskEditComp: TMaskEdit
              Left = 16
              Top = 32
              Width = 64
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
            end
            object MaskEditVenc: TMaskEdit
              Left = 102
              Top = 32
              Width = 67
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
            end
            object LabeledEditDoc: TLabeledEdit
              Left = 16
              Top = 80
              Width = 121
              Height = 21
              EditLabel.Width = 65
              EditLabel.Height = 13
              EditLabel.Caption = 'Documento'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clWindowText
              EditLabel.Font.Height = -11
              EditLabel.Font.Name = 'Tahoma'
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
              TabOrder = 2
            end
            object LabeledEditPessoa: TLabeledEdit
              Left = 16
              Top = 127
              Width = 80
              Height = 21
              EditLabel.Width = 39
              EditLabel.Height = 13
              EditLabel.Caption = 'Unidade'
              TabOrder = 3
              OnExit = LabeledEditPessoaExit
            end
            object LabeledEditConta: TLabeledEdit
              Left = 16
              Top = 167
              Width = 80
              Height = 21
              EditLabel.Width = 29
              EditLabel.Height = 13
              EditLabel.Caption = 'Conta'
              TabOrder = 4
              OnExit = LabeledEditContaExit
            end
            object LabeledEditContraP: TLabeledEdit
              Left = 16
              Top = 207
              Width = 80
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 13
              EditLabel.Caption = 'Contra Partida'
              TabOrder = 5
              OnExit = LabeledEditContraPExit
            end
            object BtnContra: TBitBtn
              Left = 439
              Top = 205
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 6
              OnClick = BtnContraClick
            end
            object BtnConta: TBitBtn
              Left = 439
              Top = 165
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 7
              OnClick = BtnContaClick
            end
            object BtnPessoa: TBitBtn
              Left = 439
              Top = 123
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 8
              OnClick = BtnPessoaClick
            end
            object LabeledEditHistorico: TLabeledEdit
              Left = 17
              Top = 247
              Width = 79
              Height = 21
              EditLabel.Width = 41
              EditLabel.Height = 13
              EditLabel.Caption = 'Hist'#243'rico'
              TabOrder = 9
              OnExit = LabeledEditHistoricoExit
            end
            object BtnHistorico: TBitBtn
              Left = 439
              Top = 245
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 10
              OnClick = BtnHistoricoClick
            end
            object EditValor: TEdit
              Left = 16
              Top = 288
              Width = 80
              Height = 21
              TabOrder = 11
            end
            object LabeledEditComp: TLabeledEdit
              Left = 102
              Top = 288
              Width = 331
              Height = 21
              EditLabel.Width = 65
              EditLabel.Height = 13
              EditLabel.Caption = 'Complemento'
              TabOrder = 12
            end
            object LabeledEditDsPessoa: TEdit
              Left = 102
              Top = 127
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 13
            end
            object LabeledEditDsConta: TEdit
              Left = 102
              Top = 167
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 14
            end
            object LabeledEditDsContra: TEdit
              Left = 102
              Top = 207
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 15
            end
            object LabeledEditDsHist: TEdit
              Left = 102
              Top = 247
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 16
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 477
    Width = 827
    ExplicitTop = 477
    ExplicitWidth = 827
  end
end