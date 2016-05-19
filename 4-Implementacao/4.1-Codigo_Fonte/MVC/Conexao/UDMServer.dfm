object DMServer: TDMServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 240
  Width = 291
  object ADPhysIBDriverLink1: TADPhysIBDriverLink
    Left = 176
    Top = 24
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 72
    Top = 80
  end
  object ADConnection: TADConnection
    Params.Strings = (
      'SQLDialect=1'
      'Protocol='
      'DriverID=IB')
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvFmtEditNumeric]
    UpdateOptions.AssignedValues = [uvLockMode, uvLockPoint]
    LoginPrompt = False
    Left = 72
    Top = 16
  end
  object ADQueryErro: TADQuery
    CachedUpdates = True
    Connection = ADConnection
    Left = 192
    Top = 88
  end
end
