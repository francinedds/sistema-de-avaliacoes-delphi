unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons, view.modal.nova.avaliacao, view.fundo, Vcl.ComCtrls,
  service.conexao, Vcl.StdCtrls, view.cadastro;

type
  TViewPrincipal = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlContent: TPanel;
    Image1: TImage;
    pnlButtons: TPanel;
    pnlBtnNovaAvaliacao: TPanel;
    btnNovaAvaliacao: TSpeedButton;
    pnlBtnClose: TPanel;
    btnClose: TSpeedButton;
    ListView: TListView;
    pnlBtnAtualizar: TPanel;
    btnAtualizar: TSpeedButton;
    pnlCopy: TPanel;
    lblCopy: TLabel;
    pnlBtnCadastrar: TPanel;
    btnCadastrar: TSpeedButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnNovaAvaliacaoClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirAvaliacoes;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.btnCadastrarClick(Sender: TObject);
begin
    ViewCadastro := TViewCadastro.Create(Self);
  try
    ViewFundo.Show;
    ViewCadastro.ShowModal;
  finally
    ViewFundo.Hide;
    FreeAndNil(ViewCadastro);
  end;
end;

procedure TViewPrincipal.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TViewPrincipal.btnNovaAvaliacaoClick(Sender: TObject);
begin
  ViewNovaAvaliacao := TViewNovaAvaliacao.Create(Self);
  try
    ViewFundo.Show;
    ViewNovaAvaliacao.ShowModal;
  finally
    ViewFundo.Hide;
    FreeAndNil(ViewNovaAvaliacao);
  end;
end;

procedure TViewPrincipal.ExibirAvaliacoes;
var
  Avaliador, Avaliado, Categoria, Comentario: string;
  Nota, Codigo: Integer;
  ListItem: TListItem;
begin
  ListView.Items.Clear;

  ServiceConexao.FDQuery_Avaliacoes.SQL.Text := 'SELECT ava_codigo, ava_avaliador, ava_avaliado, ava_nota, ava_categoria, ava_comentario FROM Avaliacoes';
  ServiceConexao.FDQuery_Avaliacoes.Open;

  while not ServiceConexao.FDQuery_Avaliacoes.Eof do
  begin
    ListItem := ListView.Items.Add;

    // obtem dados da consulta
    Avaliador  := ServiceConexao.FDQuery_Avaliacoes.FieldByName('ava_avaliador').AsString;
    Avaliado   := ServiceConexao.FDQuery_Avaliacoes.FieldByName('ava_avaliado').AsString;
    Nota       := ServiceConexao.FDQuery_Avaliacoes.FieldByName('ava_nota').AsInteger;
    Categoria  := ServiceConexao.FDQuery_Avaliacoes.FieldByName('ava_categoria').AsString;
    Comentario := ServiceConexao.FDQuery_Avaliacoes.FieldByName('ava_comentario').AsString;

    // preencher as colunas do item
    ListItem.SubItems.Add(Avaliador);
    ListItem.SubItems.Add(Avaliado);
    ListItem.SubItems.Add(IntToStr(Nota));
    ListItem.SubItems.Add(Categoria);
    ListItem.SubItems.Add(Comentario);

    ServiceConexao.FDQuery_Avaliacoes.Next;
  end;

  ServiceConexao.FDQuery_Avaliacoes.Close;
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  ExibirAvaliacoes;
end;

procedure TViewPrincipal.btnAtualizarClick(Sender: TObject);
begin
  ExibirAvaliacoes;
end;

end.
