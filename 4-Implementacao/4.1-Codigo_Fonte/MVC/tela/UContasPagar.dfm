inherited FTelaCadastroContasPagar: TFTelaCadastroContasPagar
  Caption = 'Contas a Pagar'
  ClientHeight = 522
  ClientWidth = 887
  ExplicitWidth = 903
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 887
    Height = 497
    ActivePage = DadosCadastrais
    ExplicitWidth = 887
    ExplicitHeight = 497
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 879
      ExplicitHeight = 469
      inherited Grid: TDBGrid
        Width = 879
        Height = 413
      end
      inherited Panel2: TPanel
        Width = 879
        ExplicitWidth = 879
        inherited BitBtn2: TBitBtn
          Left = 804
          Top = 10
          ExplicitLeft = 804
          ExplicitTop = 10
        end
        inherited GroupBox1: TGroupBox
          Left = 424
          Top = 3
          ExplicitLeft = 424
          ExplicitTop = 3
          inherited EditBusca: TMaskEdit
            Left = 6
            Top = 19
            ExplicitLeft = 6
            ExplicitTop = 19
          end
        end
        inherited BotaoConsultar: TBitBtn
          Left = 737
          Top = 10
          ExplicitLeft = 737
          ExplicitTop = 10
        end
        object GroupBox2: TGroupBox
          Left = 63
          Top = 3
          Width = 355
          Height = 47
          Caption = 'Per'#237'odo'
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
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 879
      ExplicitHeight = 469
      inherited PanelBotoes: TPanel
        Width = 879
        ExplicitWidth = 879
      end
      inherited PageControlEdit: TPageControl
        Width = 879
        Height = 412
        ExplicitWidth = 879
        ExplicitHeight = 412
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 871
          ExplicitHeight = 384
          inherited PanelEdits: TPanel
            Width = 871
            Height = 384
            ExplicitWidth = 871
            ExplicitHeight = 384
            object Label1: TLabel
              Left = 16
              Top = 13
              Width = 88
              Height = 13
              Caption = 'Data Compet'#234'ncia'
            end
            object Label2: TLabel
              Left = 110
              Top = 13
              Width = 64
              Height = 13
              Caption = 'Data Emiss'#227'o'
            end
            object Label3: TLabel
              Left = 204
              Top = 13
              Width = 81
              Height = 13
              Caption = 'Data Vencimento'
            end
            object Label4: TLabel
              Left = 17
              Top = 274
              Width = 24
              Height = 13
              Caption = 'Valor'
            end
            object BtnConta: TSpeedButton
              Left = 439
              Top = 166
              Width = 23
              Height = 22
              Caption = 'P'
              OnClick = BtnContaClick
            end
            object BtnContra: TSpeedButton
              Left = 439
              Top = 206
              Width = 23
              Height = 22
              Caption = 'P'
              OnClick = BtnContraClick
            end
            object BtnHistorico: TSpeedButton
              Left = 439
              Top = 246
              Width = 23
              Height = 22
              Caption = 'P'
            end
            object BtnPessoa: TSpeedButton
              Left = 439
              Top = 126
              Width = 23
              Height = 22
              Caption = 'P'
              OnClick = BtnPessoaClick
            end
            object MaskEditComp: TMaskEdit
              Left = 16
              Top = 32
              Width = 65
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
            end
            object MaskEditEmissao: TMaskEdit
              Left = 110
              Top = 32
              Width = 66
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
            end
            object MaskEditVenc: TMaskEdit
              Left = 204
              Top = 32
              Width = 67
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 2
              Text = '  /  /    '
            end
            object LabeledEditDoc: TLabeledEdit
              Left = 16
              Top = 80
              Width = 121
              Height = 21
              EditLabel.Width = 54
              EditLabel.Height = 13
              EditLabel.Caption = 'Documento'
              TabOrder = 3
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
            end
            object LabeledEditDsConta: TLabeledEdit
              Left = 102
              Top = 167
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              TabOrder = 5
            end
            object LabeledEditContraP: TLabeledEdit
              Left = 16
              Top = 207
              Width = 80
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 13
              EditLabel.Caption = 'Contra Partida'
              TabOrder = 6
            end
            object LabeledEditDsContra: TLabeledEdit
              Left = 102
              Top = 207
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              TabOrder = 7
            end
            object LabeledEditHistorico: TLabeledEdit
              Left = 17
              Top = 247
              Width = 79
              Height = 21
              EditLabel.Width = 41
              EditLabel.Height = 13
              EditLabel.Caption = 'Hist'#243'rico'
              TabOrder = 8
            end
            object LabeledEditDsHist: TLabeledEdit
              Left = 102
              Top = 247
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              TabOrder = 9
            end
            object EditValor: TEdit
              Left = 16
              Top = 293
              Width = 80
              Height = 21
              TabOrder = 10
            end
            object LabeledEditComp: TLabeledEdit
              Left = 102
              Top = 293
              Width = 331
              Height = 21
              EditLabel.Width = 65
              EditLabel.Height = 13
              EditLabel.Caption = 'Complemento'
              TabOrder = 11
            end
            object LabeledEditPessoa: TLabeledEdit
              Left = 16
              Top = 127
              Width = 80
              Height = 21
              EditLabel.Width = 34
              EditLabel.Height = 13
              EditLabel.Caption = 'Pessoa'
              TabOrder = 12
            end
            object LabeledEditdsPessoa: TLabeledEdit
              Left = 102
              Top = 127
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              TabOrder = 13
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 497
    Width = 887
    ExplicitTop = 497
    ExplicitWidth = 887
  end
end
