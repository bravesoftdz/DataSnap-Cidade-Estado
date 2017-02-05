unit UnitCliente_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Datasnap.DBClient,
  Datasnap.DSConnect, Data.DB, Data.SqlExpr, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TCliente_Principal = class(TForm)
    Panel1: TPanel;
    ActConexao: TActionList;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ActEstado: TAction;
    ActCidade: TAction;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ActEstadoExecute(Sender: TObject);
    procedure ActCidadeExecute(Sender: TObject);
  private
    procedure Conectar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cliente_Principal: TCliente_Principal;

implementation

{$R *.dfm}

uses UnitCad_Estado, UnitCad_Cidade;

procedure TCliente_Principal.ActCidadeExecute(Sender: TObject);
begin
  Application.CreateForm(TCad_Cidade, Cad_Cidade);
  try
    Cad_Cidade.ShowModal;
  finally
    FreeAndNil(Cad_Cidade);
  end;
end;

procedure TCliente_Principal.ActEstadoExecute(Sender: TObject);
begin
  Application.CreateForm(TCad_Estado, Cad_Estado);
  try
    Cad_Estado.ShowModal;
  finally
    FreeAndNil(Cad_Estado);
  end;
end;

procedure TCliente_Principal.Conectar;
begin
  SQLConnection1.Connected := True;
end;
procedure TCliente_Principal.FormCreate(Sender: TObject);
begin
  Conectar;
end;

end.
