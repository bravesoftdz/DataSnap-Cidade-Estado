unit UnitServidor_Principal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TServidor_Principal = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ActConexao: TActionList;
    ActConexao_Servidor: TAction;
    edtPorta: TEdit;
    Label2: TLabel;
    procedure ActConexao_ServidorExecute(Sender: TObject);
  private
    procedure RealizarConexao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Servidor_Principal: TServidor_Principal;

implementation

{$R *.dfm}

uses UnitServidor_Principal_Container;

procedure TServidor_Principal.ActConexao_ServidorExecute(Sender: TObject);
begin
  RealizarConexao;
end;

procedure TServidor_Principal.RealizarConexao;
begin
  try
    if (ActConexao_Servidor.Caption = 'Conectar') then
      begin
        Servidor_Principal_Container.DSTCPServerTransport1.Port := StrToInt(edtPorta.Text);
        Servidor_Principal_Container.DSServer1.Start;
        if (Servidor_Principal_Container.DSServer1.Started) then
          ActConexao_Servidor.Caption := 'Desconectar';
      end
    else
      begin
        Servidor_Principal_Container.DSServer1.Stop;
          ActConexao_Servidor.Caption := 'Conectar';
      end;
  except
    on e : Exception do
      ShowMessage('Ocorreu erro na conex�o!'+sLineBreak+
      e.Message);
  end;
end;
end.

