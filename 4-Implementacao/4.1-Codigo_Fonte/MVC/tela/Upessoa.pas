unit Upessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids,Generics.Collections,UTela, UController,UPessoasVO,UPessoasController;

type
  TFTelaCadastroPessoa = class(TFTelaCadastro)
    ScrollBox1: TScrollBox;
    LabelEditNome: TLabeledEdit;
    MaskEditCNPJCPF: TMaskEdit;
    MaskEditCep: TMaskEdit;
    LabelEditRua: TLabeledEdit;
    LabelEditNumero: TLabeledEdit;
    LabelEditComplemento: TLabeledEdit;
    LabelEditBairro: TLabeledEdit;
    MaskEditTelefone: TMaskEdit;
    MaskEditTelefone2: TMaskEdit;
    LabelEditEmail: TLabeledEdit;
    Telefone_1: TLabel;
    Telefone_2: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    function DoSalvar:boolean;override;
    function ValidarTela:boolean;
    function MontaFiltro:string;
    procedure DoConsultar;override;
    function DoExcluir: boolean;override;
  private

  public
    procedure GridParaEdits; override;
    function EditsToObject(Pessoa:TPessoasVO):TPessoasVO;
  end;

var
  FTelaCadastroPessoa: TFTelaCadastroPessoa;

implementation

{$R *.dfm}

var
//  PessoaController: TController<TPessoasVO>;
  PessoaController: TPessoasController;


procedure TFTelaCadastroPessoa.DoConsultar;
var listaPessoa:TObjectList<TPessoasVO>;
    filtro:string;
begin
  filtro:=MontaFiltro;
  listaPessoa:= PessoaController.Consultar(filtro);
  PopulaGrid<TPessoasVO>(listaPessoa);
end;

function TFTelaCadastroPessoa.DoExcluir: boolean;
var Pessoa:TPessoasVO;
begin
  try
    try
      Pessoa := TPessoasVO.Create;
      Pessoa.idPessoa := CDSGrid.FieldByName('IDPESSOA').AsInteger;
      PessoaController.Excluir(Pessoa);
      except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao excluir o registro: '+#13+#13+e.Message);
          Result:=false;
        end;
      end;
    finally
    end;
end;

function TFTelaCadastroPessoa.DoSalvar: boolean;
var Pessoa:TPessoasVO;
begin
  if(ValidarTela)then
  begin
    try
      try
          if(StatusTela=stInserindo)then
          begin
            Pessoa:=EditsToObject(TPessoasVO.Create);
            PessoaController.Inserir(Pessoa);
            Result:=true;
          end
          else if(StatusTela=stEditando)then
          begin
            Pessoa:=PessoaController.ConsultarPorId(CDSGrid.FieldByName('IDPESSOA').AsInteger);
            Pessoa:=EditsToObject(Pessoa);
            PessoaController.Alterar(Pessoa);
            Result:=true;
          end;
        except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao salvar o registro: '+#13+#13+e.Message);
          Result:=false;
        end;
      end;
    finally
    end;
  end
  else
    Result:=false;
end;

function TFTelaCadastroPessoa.EditsToObject(Pessoa:TPessoasVO): TPessoasVO;
begin
  Pessoa.CnpjCpf:= MaskEditCnpjCpf.Text;
  Pessoa.Nome:=LabelEditNome.Text;
  Pessoa.Endereco:=LabelEditRua.Text;
  Pessoa.Bairro:=LabelEditBairro.Text;
  Pessoa.Cep:=MaskEditCep.Text;
  Pessoa.Numero:=LabelEditNumero.Text;
  Pessoa.Complemento:= LabelEditComplemento.Text;
  Pessoa.Email:= LabelEditEmail.Text;
  Pessoa.TelefoneI:= MaskEditTelefone.Text;
  Pessoa.TelefoneII:= MaskEditTelefone2.Text;
  Result:=Pessoa;
end;

procedure TFTelaCadastroPessoa.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPessoasVO;
  inherited;
end;

procedure TFTelaCadastroPessoa.GridParaEdits;
var Pessoa:TPessoasVO;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    Pessoa := PessoaController.ConsultarPorId(CDSGrid.FieldByName('IDPESSOA').AsInteger);

  if Assigned(Pessoa) then
  begin
    LabelEditNome.Text:=Pessoa.Nome;
    LabelEditRua.Text:=Pessoa.Endereco;
    LabelEditBairro.Text:=Pessoa.Bairro;
    MaskEditCep.Text:=Pessoa.Cep;
    LabelEditNumero.Text:=Pessoa.Numero;
    LabelEditComplemento.Text:=Pessoa.Complemento;
    MaskEditCnpjCpf.Text:=Pessoa.CnpjCpf;
    LabelEditEmail.Text:=Pessoa.Email;
    MaskEditTelefone.Text:=Pessoa.TelefoneI;
    MaskEditTelefone2.Text:=Pessoa.TelefoneII;
  end;

end;

function TFTelaCadastroPessoa.MontaFiltro: string;
begin
  result:='';
  if(editBusca.Text<>'')then
    result:='( NOME LIKE '+QuotedStr('%'+EditBusca.Text+'%')+' ) ';
end;

function TFTelaCadastroPessoa.ValidarTela: boolean;
begin
  Result:=true;
  if(labelEditNome.Text='')then
  begin
    ShowMessage('O campo nome � obrigat�rio!');
    Result:=false;
  end;

end;


end.
