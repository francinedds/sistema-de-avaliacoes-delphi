unit service.conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TServiceConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery_Avaliacoes: TFDQuery;
    FDQuery_Pessoas: TFDQuery;
    FDQuery_PessoasPES_CODIGO: TIntegerField;
    FDQuery_PessoasPES_NOMECOMPLETO: TStringField;
    FDQuery_PessoasPES_CPF: TStringField;
    FDQuery_PessoasPES_TELEFONE: TStringField;
    FDQuery_PessoasPES_EMAIL: TStringField;
    FDQuery_AvaliacoesAVA_CODIGO: TIntegerField;
    FDQuery_AvaliacoesAVA_AVALIADOR: TStringField;
    FDQuery_AvaliacoesAVA_AVALIADO: TStringField;
    FDQuery_AvaliacoesAVA_CATEGORIA: TStringField;
    FDQuery_AvaliacoesAVA_NOTA: TIntegerField;
    FDQuery_AvaliacoesAVA_COMENTARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServiceConexao: TServiceConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
