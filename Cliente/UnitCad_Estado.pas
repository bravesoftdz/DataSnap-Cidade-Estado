unit UnitCad_Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TCad_Estado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ActiEstado: TActionList;
    ActIncluir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    ActSair: TAction;
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Button5: TButton;
    ActPesquisa: TAction;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtCod: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtIBGE: TEdit;
    Label5: TLabel;
    edtNome: TEdit;
    Label6: TLabel;
    edtSigla: TEdit;
    edtPais: TEdit;
    ActSalvar: TAction;
    Button6: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cad_Estado: TCad_Estado;

implementation

{$R *.dfm}

procedure TCad_Estado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
    Close;
end;

end.