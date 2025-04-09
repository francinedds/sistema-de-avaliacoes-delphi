unit view.cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, service.conexao;

type
  TViewCadastro = class(TForm)
    pnlContent: TPanel;
    lblNomeCompleto: TLabel;
    edtNomeCompleto: TEdit;
    pnlBtnSalvar: TPanel;
    btnSalvar: TSpeedButton;
    pnlHeader: TPanel;
    Image1: TImage;
    pnlBtnClose: TPanel;
    btnClose: TSpeedButton;
    lblcpf: TLabel;
    edtCPF: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblOpcional: TLabel;
    pnlTitulo: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCadastro: TViewCadastro;

implementation

{$R *.dfm}

procedure TViewCadastro.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewCadastro.btnSalvarClick(Sender: TObject);
begin
  ServiceConexao.FDQuery_Pessoas.SQL.Text := 'INSERT INTO Pessoas (pes_nomecompleto, pes_cpf, pes_telefone, pes_email) ' +
                       'VALUES (:pes_nomecompleto, :pes_cpf, :pes_telefone, :pes_email)';
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_nomecompleto').AsString := edtNomeCompleto.Text;
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_cpf').AsString          := edtCPF.Text;
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_telefone').AsString     := edtTelefone.Text;
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_email').AsString        := edtEmail.Text;
  ServiceConexao.FDQuery_Pessoas.ExecSQL;

  ShowMessage('Salvo com sucesso!');
end;

end.
