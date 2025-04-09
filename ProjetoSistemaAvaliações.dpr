program ProjetoSistemaAvaliações;

uses
  Vcl.Forms,
  view.principal in 'views\view.principal.pas' {ViewPrincipal},
  view.modal.nova.avaliacao in 'views\view.modal.nova.avaliacao.pas' {ViewNovaAvaliacao},
  view.fundo in 'views\view.fundo.pas' {ViewFundo},
  service.conexao in 'services\service.conexao.pas' {ServiceConexao: TDataModule},
  view.cadastro in 'views\view.cadastro.pas' {ViewCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TViewNovaAvaliacao, ViewNovaAvaliacao);
  Application.CreateForm(TViewFundo, ViewFundo);
  Application.CreateForm(TServiceConexao, ServiceConexao);
  Application.Run;
end.
