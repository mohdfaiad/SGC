object FTelaCadastroContaCorrente: TFTelaCadastroContaCorrente
  Left = 0
  Top = 0
  Caption = 'Conta Corrente'
  ClientHeight = 612
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 612
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 721
      Height = 73
      Caption = 'Informa'#231#245'es Conta Corrente : '
      TabOrder = 0
      object Label1: TLabel
        Left = 150
        Top = 30
        Width = 97
        Height = 13
        Caption = 'Data Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MaskEditDtInicio: TMaskEdit
        Left = 158
        Top = 49
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
        TabOrder = 0
        Text = '  /  /    '
      end
      object BitBtnGrava: TBitBtn
        Left = 544
        Top = 21
        Width = 161
        Height = 43
        Caption = 'Gerar ContaCorrente'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        TabOrder = 1
      end
      object MaskEdit1: TMaskEdit
        Left = 11
        Top = 49
        Width = 63
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
        Text = '23/11/2016'
      end
    end
    object DBGrid2: TDBGrid
      Left = 16
      Top = 95
      Width = 721
      Height = 202
      DataSource = DSContaCorrente
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDUNIDADE'
          Title.Caption = 'C'#243'digo Unidade'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DSUNIDADE'
          Title.Caption = 'Descri'#231#227'o Unidade'
          Width = 490
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCONTAPLANO'
          Title.Caption = 'C'#243'digo Conta Plano'
          Width = 103
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 303
      Width = 721
      Height = 202
      DataSource = DSLcto
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDLCTO'
          Title.Caption = 'C'#243'digo'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTLCTO'
          Title.Caption = 'Data'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCONTADEBITO'
          Title.Caption = 'Debito'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DSCONTADEBITO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCONTACREDITO'
          Title.Caption = 'Credito'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DSCONTACREDITO'
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDHISTORICO'
          Title.Caption = 'Hist'#243'rico'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Title.Caption = 'Complemento'
          Width = 118
          Visible = True
        end>
    end
  end
  object DSContaCorrente: TDataSource
    DataSet = CDContaCorrente
    Left = 552
    Top = 232
  end
  object CDContaCorrente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = CDContaCorrenteAfterScroll
    Left = 656
    Top = 224
    Data = {
      5F0000009619E0BD0100000018000000030000000000030000005F0009494455
      4E494441444504000100000000000C4944434F4E5441504C414E4F0400010000
      000000094453554E494441444501004900000001000557494454480200020014
      000000}
    object CDContaCorrenteIDUNIDADE: TIntegerField
      FieldName = 'IDUNIDADE'
    end
    object CDContaCorrenteIDCONTAPLANO: TIntegerField
      FieldName = 'IDCONTAPLANO'
    end
    object CDContaCorrenteDSUNIDADE: TStringField
      FieldName = 'DSUNIDADE'
    end
  end
  object DSLcto: TDataSource
    DataSet = CDLcto
    Left = 528
    Top = 448
  end
  object CDLcto: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 416
    Data = {
      000100009619E0BD01000000180000000900000000000300000000010649444C
      43544F04000100000000000D4944434F4E544144454249544F04000100000000
      000E4944434F4E54414352454449544F04000100000000000D4453434F4E5441
      44454249544F01004900000001000557494454480200020014000E4453434F4E
      54414352454449544F0100490000000100055749445448020002001400055641
      4C4F52080004000000010007535542545950450200490006004D6F6E6579000B
      4944484953544F5249434F04000100000000000644544C43544F080008000000
      00000B434F4D504C454D454E544F010049000000010005574944544802000200
      14000000}
    object CDLctoIDLCTO: TIntegerField
      FieldName = 'IDLCTO'
    end
    object CDLctoIDCONTADEBITO: TIntegerField
      FieldName = 'IDCONTADEBITO'
    end
    object CDLctoIDCONTACREDITO: TIntegerField
      FieldName = 'IDCONTACREDITO'
    end
    object CDLctoDSCONTA: TStringField
      FieldName = 'DSCONTADEBITO'
    end
    object CDLctoDSCONTACREDITO: TStringField
      FieldName = 'DSCONTACREDITO'
    end
    object CDLctoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CDLctoIDHISTORICO: TIntegerField
      FieldName = 'IDHISTORICO'
    end
    object CDLctoDTLCTO: TDateTimeField
      FieldName = 'DTLCTO'
    end
    object CDLctoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
  end
end
