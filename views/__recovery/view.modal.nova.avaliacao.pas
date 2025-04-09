unit view.modal.nova.avaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, service.conexao;

type
  TViewNovaAvaliacao = class(TForm)
    pnlHeader: TPanel;
    Image1: TImage;
    pnlBtnClose: TPanel;
    btnClose: TSpeedButton;
    pnlContent: TPanel;
    cbAvaliador: TComboBox;
    cbAvaliado: TComboBox;
    lblAvaliador: TLabel;
    cbNota: TComboBox;
    edtComentario: TMemo;
    edtCategoria: TEdit;
    lblAvaliado: TLabel;
    lblNota: TLabel;
    lblCategoria: TLabel;
    lblComentário: TLabel;
    pnlBtnEnviar: TPanel;
    btnEnviar: TSpeedButton;
    lblDica: TLabel;
    lblInfo: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewNovaAvaliacao: TViewNovaAvaliacao;

implementation

{$R *.dfm}

procedure TViewNovaAvaliacao.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewNovaAvaliacao.btnEnviarClick(Sender: TObject);
var
  AvaliadorNome, AvaliadoNome, Categoria: String;
  Nota: Integer;
begin
  AvaliadorNome := cbAvaliador.Text;
  AvaliadoNome := cbAvaliado.Text;

    // verifica se o avaliador está tentando avaliar a si mesmo
  if AvaliadorNome = AvaliadoNome then
  begin
    cbAvaliado.Enabled := False;
    ShowMessage('Você não pode se avaliar. Selecione outro colega.');
    Exit;
  end;

    // validação da nota
  if cbNota.ItemIndex = -1 then  // nenhuma nota foi selecionada
  begin
    ShowMessage('Por favor, selecione uma nota.');
    Exit;
  end;

  Nota := cbNota.ItemIndex + 1;

    // validação da categoria
  Categoria := Trim(edtCategoria.Text);

  if Categoria = '' then
  begin
    ShowMessage('Por favor, insira uma categoria.');
    Exit;
  end;

  // salvar

  ServiceConexao.FDQuery_Avaliacoes.SQL.Text := 'INSERT INTO Avaliacoes (ava_avaliador, ava_avaliado, ava_categoria, ava_nota, ava_comentario) ' +
                       'VALUES (:ava_avaliador, :ava_avaliado, :ava_categoria, :ava_nota, :ava_comentario)';
  ServiceConexao.FDQuery_Avaliacoes.ParamByName('ava_avaliador').AsString := cbAvaliador.Text;
  ServiceConexao.FDQuery_Avaliacoes.ParamByName('ava_avaliado').AsString := cbAvaliado.Text;
  ServiceConexao.FDQuery_Avaliacoes.ParamByName('ava_categoria').AsString := edtCategoria.Text;
  ServiceConexao.FDQuery_Avaliacoes.ParamByName('ava_nota').AsInteger := cbNota.ItemIndex;
  ServiceConexao.FDQuery_Avaliacoes.ParamByName('ava_comentario').AsString := edtComentario.Text;
  ServiceConexao.FDQuery_Avaliacoes.ExecSQL;

  ShowMessage('Obrigado pelo seu feedback.');
end;

procedure TViewNovaAvaliacao.FormShow(Sender: TObject);
begin
  // preenche o combobox de avaliadores e avaliados
  ServiceConexao.FDQuery_Pessoas.SQL.Text := 'SELECT * FROM pessoas';
  ServiceConexao.FDQuery_Pessoas.Open;

  while not ServiceConexao.FDQuery_Pessoas.Eof do
  begin
    cbAvaliador.Items.Add(ServiceConexao.FDQuery_Pessoas.FieldByName('pes_nomecompleto').AsString);
    cbAvaliado.Items.Add(ServiceConexao.FDQuery_Pessoas.FieldByName('pes_nomecompleto').AsString);
    ServiceConexao.FDQuery_Pessoas.Next;
  end;
end;

end.
