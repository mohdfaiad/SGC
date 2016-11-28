object FTelaLivroDiario: TFTelaLivroDiario
  Left = 0
  Top = 0
  Caption = 'Livro Di'#225'rio'
  ClientHeight = 198
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 198
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 303
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 265
      Height = 177
      Caption = 'Per'#237'odo : '
      TabOrder = 0
      object DataInicial: TMaskEdit
        Tag = 1
        Left = 44
        Top = 42
        Width = 69
        Height = 21
        EditMask = '!99/99/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '01/01/0001'
      end
      object DataFinal: TMaskEdit
        Tag = 1
        Left = 144
        Top = 42
        Width = 68
        Height = 21
        EditMask = '!99/99/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '31/12/9999'
      end
      object BitBtn1: TBitBtn
        Left = 44
        Top = 136
        Width = 81
        Height = 25
        Caption = 'Imprimir'
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
        NumGlyphs = 2
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 131
        Top = 136
        Width = 81
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = BitBtn2Click
      end
    end
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = True
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 5
    Margens.Right = 5
    Margens.Top = 5
    Margens.Bottom = 5
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'DELTRESS SISTEMAS S/S LTDA'
    RegistroUsuario.SerieProduto = 'DEMONSTRA'#199#195'O'
    RegistroUsuario.AutorizacaoKey = '*** SEM REGISTRO ***'
    About = 'RDprint 6.0 -  C'#243'pia de Demonstra'#231#227'o '
    Acentuacao = Transliterate
    CaptionSetup = 'RDprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERIC=EPSON'
      'TEXT=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DR700=DARUMA'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    FonteGrafica = sCourierNew
    ReduzParaCaber = True
    OnNewPage = RDprint1NewPage
    Left = 464
    Top = 48
  end
  object CDDiariotESTE: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 136
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
    object CDDiariotESTEIDLCTO: TIntegerField
      FieldName = 'IDLCTO'
    end
    object CDDiariotESTEIDCONTADEBITO: TIntegerField
      FieldName = 'IDCONTADEBITO'
    end
    object CDDiariotESTEIDCONTACREDITO: TIntegerField
      FieldName = 'IDCONTACREDITO'
    end
    object CDDiariotESTEDSCONTADEBITO: TStringField
      FieldName = 'DSCONTADEBITO'
    end
    object CDDiariotESTEDSCONTACREDITO: TStringField
      FieldName = 'DSCONTACREDITO'
    end
    object CDDiariotESTEVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CDDiariotESTEIDHISTORICO: TIntegerField
      FieldName = 'IDHISTORICO'
    end
    object CDDiariotESTEDTLCTO: TDateTimeField
      FieldName = 'DTLCTO'
    end
    object CDDiariotESTECOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
  end
  object CDDiario: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 144
    Data = {
      200100009619E0BD01000000180000000A00000000000300000020010649444C
      43544F04000100000000000D4944434F4E544144454249544F04000100000000
      000E4944434F4E54414352454449544F04000100000000000D4453434F4E5441
      44454249544F01004900000001000557494454480200020014000E4453434F4E
      54414352454449544F0100490000000100055749445448020002001400055641
      4C4F52080004000000010007535542545950450200490006004D6F6E6579000B
      4944484953544F5249434F04000100000000000644544C43544F080008000000
      00000B434F4D504C454D454E544F010049000000010005574944544802000200
      14000B4453484953544F5249434F010049000000010005574944544802000200
      14000000}
    object CDDiarioIDLCTO: TIntegerField
      FieldName = 'IDLCTO'
    end
    object CDDiarioIDCONTADEBITO: TIntegerField
      FieldName = 'IDCONTADEBITO'
    end
    object CDDiarioIDCONTACREDITO: TIntegerField
      FieldName = 'IDCONTACREDITO'
    end
    object CDDiarioDSCONTADEBITO: TStringField
      FieldName = 'DSCONTADEBITO'
    end
    object CDDiarioDSCONTACREDITO: TStringField
      FieldName = 'DSCONTACREDITO'
    end
    object CDDiarioVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CDDiarioIDHISTORICO: TIntegerField
      FieldName = 'IDHISTORICO'
    end
    object CDDiarioDTLCTO: TDateTimeField
      FieldName = 'DTLCTO'
    end
    object CDDiarioCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object CDDiarioDSHISTORICO: TStringField
      FieldName = 'DSHISTORICO'
    end
  end
end
