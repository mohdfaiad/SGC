unit UGenericVO;

interface

uses Atributos, Rtti, SysUtils, SQLExpr, DBClient, DB, TypInfo, DBXCommon,
  Classes, Generics.Collections, Contnrs;

type
  TGenericVO = class
  public
  end;

  TClassGenericVO = class of TGenericVO;

  TGenericVO<T: class> = class
  private
    class function CreateObject: T;
    class function GetColumn(pName: string): TColumn;
  public
    class function FromDBXReader(pReader: TDBXReader): T;
    class function FieldCaption(pFieldName: string): string;
    class function FieldLength(pFieldName: string): Integer;
  end;

implementation

class function TGenericVO<T>.CreateObject: T;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Value: TValue;
  Obj: TObject;
begin
  // Criando Objeto via RTTI para chamar o envento OnCreate no Objeto
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(TClass(T));
    Value := Tipo.GetMethod('Create').Invoke(Tipo.AsInstance.MetaclassType, []);
    Result := T(Value.AsObject);
  finally
    Contexto.Free;
  end;
end;

class function TGenericVO<T>.FromDBXReader(pReader: TDBXReader): T;
var
  Obj: T;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Propriedades: TArray<TRttiProperty>;
  Atributo: TCustomAttribute;
  Value: TValue;
  I, A: Integer;
  NomeCampo: string;
  DBXValueType: TDBXValueType;
  DBXValue: TDBXValue;
  EncontrouPropriedade: Boolean;
begin
  Obj := CreateObject;

  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(TObject(Obj).ClassType);

    Propriedades := Tipo.GetProperties;

    for I := 0 to pReader.ColumnCount - 1 do
    begin
      DBXValueType := pReader.ValueType[I];
      DBXValue := pReader.Value[I];
      NomeCampo := DBXValueType.Name;

      with TDBXDataTypes do
      begin
        case DBXValueType.DataType of
          AnsiStringType, WideStringType, BlobType:
            Value := DBXValue.AsString;

          DateType:
            begin
              if DBXValue.AsDate > 0 then
                Value := DBXValue.AsDateTime
              else
                Value := TValue.Empty;
            end;

          DateTimeType, TimeStampType:
            begin
              if DBXValue.AsDateTime > 0 then
                Value := DBXValue.AsDateTime
              else
                Value := TValue.Empty;
            end;

          TimeType:
            begin
              if DBXValue.AsTime > 0 then
                Value := DBXValue.AsTime
              else
                Value := TValue.Empty;
            end;

          Int32Type:
            begin
              if DBXValue.IsNull then
                Value := TValue.Empty
              else
                Value := DBXValue.AsInt32;
            end;

          Int64Type:
            begin
              if DBXValue.IsNull then
                Value := TValue.Empty
              else
                Value := DBXValue.AsInt64;
            end;

          DoubleType, BcdType, CurrencyType:
            begin
              if DBXValue.IsNull then
                Value := TValue.Empty
              else
                Value := DBXValue.AsDouble;
            end;

          BinaryBlobType, BytesType, VariantType:
            Value := TValue.FromVariant(DBXValue.AsVariant);

          BooleanType:
            Value := DBXValue.AsBoolean;

        else
          Value := TValue.Empty;
        end;
      end;

      EncontrouPropriedade := False;
      for A := 0 to Length(Propriedades) - 1 do
      begin
        Propriedade := Propriedades[A];
        for Atributo in Propriedade.GetAttributes do
        begin
          if Atributo is TColumn then
          begin
            if UpperCase((Atributo as TColumn).Name) = UpperCase(NomeCampo) then
            begin
              if not Value.IsEmpty then
              begin
                Propriedade.SetValue(TObject(Obj), Value);
              end;

              EncontrouPropriedade := True;
              Break;
            end;
          end
          else if Atributo is TId then
          begin
            if UpperCase((Atributo as TId).NameField) = UpperCase(NomeCampo) then
            begin
              if not Value.IsEmpty then
              begin
                Propriedade.SetValue(TObject(Obj), Value);
              end;

              EncontrouPropriedade := True;
              Break;
            end;
          end;
        end;

        if EncontrouPropriedade then
          Break;
      end;
    end;
  finally
    Contexto.Free;
  end;

  Result := Obj;
end;

class function TGenericVO<T>.GetColumn(pName: string): TColumn;
var
  Obj: T;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  Encontrou: Boolean;
begin
  Result := nil;

  Obj := CreateObject;
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(TObject(Obj).ClassType);

    Encontrou := False;
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TColumn then
        begin
          if UpperCase((Atributo as TColumn).Name) = UpperCase(pName) then
          begin
            Result := (Atributo as TColumn).Clone;
            Encontrou := True;
            Break;
          end;
        end;
      end;

      if Encontrou then
        Break;
    end;
  finally
    TObject(Obj).Free;
    Contexto.Free;
  end;
end;

class function TGenericVO<T>.FieldCaption(pFieldName: string): string;
var
  Atributo: TColumn;
begin
  Atributo := GetColumn(pFieldName);

  if Assigned(Atributo) then
  begin
    Result := Atributo.Caption;
    Atributo.Free;
  end
  else
  begin
    Result := '';
  end;
end;

class function TGenericVO<T>.FieldLength(pFieldName: string): Integer;
var
  Atributo: TColumn;
begin
  Atributo := GetColumn(pFieldName);
  if Assigned(Atributo) then
  begin
    Result := Atributo.Length;
    Atributo.Free;
  end
  else
  begin
    Result := 0;
  end;
end;

end.
