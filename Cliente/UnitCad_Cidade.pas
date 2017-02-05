unit UnitCad_Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, UnitMetodos, UnitCliente_Principal, UnitDm;

type
  TCad_Cidade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    AcCidade: TActionList;
    ActIncluir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    ActSair: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    edtPesquisa: TEdit;
    ActPesquisa: TAction;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigo: TDBEdit;
    edtIBGE: TDBEdit;
    edtLocalidade: TDBEdit;
    edtNome: TDBEdit;
    ActSalvar: TAction;
    Button6: TButton;
    ActCancela: TAction;
    Button7: TButton;
    edtEstado: TDBLookupComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActPesquisaExecute(Sender: TObject);
    procedure DS_CidadeDataChange(Sender: TObject; Field: TField);
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure ActCancelaExecute(Sender: TObject);
    procedure ActIncluirExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Filtrar;
    procedure DesabilitarEdicao;
    procedure HabilitarEdicao;
    procedure BuscarTodos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cad_Cidade: TCad_Cidade;

implementation

{$R *.dfm}

procedure TCad_Cidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DesabilitarEdicao;
  Dm.CDS_Cidade.Close;
  Dm.CDS_Estado.Close;
end;

procedure TCad_Cidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
    Close;
end;

procedure TCad_Cidade.FormShow(Sender: TObject);
begin
   Dm.CDS_Cidade.Open;
   Dm.CDS_Estado.Open;
end;

procedure TCad_Cidade.ActAlterarExecute(Sender: TObject);
begin
  Dm.CDS_Cidade.Edit;
  PageControl1.TabIndex := 0;
  ActSalvar.Enabled := True;
  HabilitarEdicao;
end;

procedure TCad_Cidade.ActCancelaExecute(Sender: TObject);
begin
  ActSalvar.Enabled := False;
  PageControl1.TabIndex := 1;
  DesabilitarEdicao;
end;

procedure TCad_Cidade.ActExcluirExecute(Sender: TObject);
var
  conexao : TServidor_Principal_MetodosClient;
begin
  conexao := TServidor_Principal_MetodosClient.Create(Dm.SQLConnection1.DBXConnection);
  try
    if Dm.CDS_Cidadecod_cidade.AsInteger > 0 then
      begin
        if MessageDlg('Deseja mesmo excluir o Estado '+Dm.CDS_Cidadenome_cidade.AsString+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            conexao.ExcluirCidade(Dm.CDS_Cidadecod_cidade.AsInteger);
            BuscarTodos;
          end;
      end;
  finally
    FreeAndNil(conexao);
  end;
end;

procedure TCad_Cidade.ActIncluirExecute(Sender: TObject);
begin
  Dm.CDS_Cidade.Append;
  PageControl1.TabIndex := 0;
  ActSalvar.Enabled := True;
  HabilitarEdicao;
end;

procedure TCad_Cidade.ActPesquisaExecute(Sender: TObject);
begin
  Filtrar;
end;

procedure TCad_Cidade.Filtrar;
begin
  with Dm.CDS_Cidade do
    begin
      if edtPesquisa.Text <> '' then
        begin
          Close;
          Filtered := False;
          Filter := ' UPPER(nome_cidade) LIKE '+QuotedStr('%'+edtPesquisa.Text+'%');
          Filtered := True;
          Open;
        end
      else
       Filtered := False;
    end;
end;

procedure TCad_Cidade.HabilitarEdicao;
begin
  edtCodigo.Enabled      := True;
  edtEstado.Enabled      := True;
  edtIBGE.Enabled        := True;
  edtLocalidade.Enabled  := True;
  edtNome.Enabled        := True;
end;

procedure TCad_Cidade.DesabilitarEdicao;
begin
  edtCodigo.Enabled      := False;
  edtEstado.Enabled      := False;
  edtIBGE.Enabled        := False;
  edtLocalidade.Enabled  := False;
  edtNome.Enabled        := False;
end;


procedure TCad_Cidade.DS_CidadeDataChange(Sender: TObject; Field: TField);
begin
  ActAlterar.Enabled := not(Dm.CDS_Cidade.IsEmpty);
  ActExcluir.Enabled := not(Dm.CDS_Cidade.IsEmpty);
end;

procedure TCad_Cidade.ActSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TCad_Cidade.ActSalvarExecute(Sender: TObject);
var
  conexao : TServidor_Principal_MetodosClient;
begin
 conexao := TServidor_Principal_MetodosClient.Create(Dm.SQLConnection1.DBXConnection);
 try
  if not(Dm.CDS_Cidadecod_cidade.AsInteger > 0) then
    begin
      conexao.InserirCidade(Dm.CDS_Cidadecod_estado.AsInteger, Dm.CDS_Cidadenome_cidade.AsString, Dm.CDS_Cidadecod_cidade_ibge.AsInteger, Dm.CDS_Cidadecodigo_localidade_anp.AsInteger);
    end
  else
    begin
      conexao.alterarCidade(Dm.CDS_Cidadecod_cidade.AsInteger,
        Dm.CDS_Cidadecod_estado.AsInteger, Dm.CDS_Cidadenome_cidade.AsString, Dm.CDS_Cidadecod_cidade_ibge.AsInteger, Dm.CDS_Cidadecodigo_localidade_anp.AsInteger);
    end;
 finally
   FreeAndNil(conexao);
   BuscarTodos;
   PageControl1.TabIndex := 1;
   ActSalvar.Enabled := False;
   DesabilitarEdicao;
 end;

end;

procedure TCad_Cidade.BuscarTodos;
var
  conexao : TServidor_Principal_MetodosClient;
begin
  conexao := TServidor_Principal_MetodosClient.Create(Dm.SQLConnection1.DBXConnection);
  try
    Dm.CDS_Cidade.Close;
    conexao.ListarCidade;
    Dm.CDS_Cidade.Open;
    Dm.CDS_Cidade.Refresh;
  finally
    FreeAndNil(conexao);
  end;
end;


end.
