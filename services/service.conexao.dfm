object ServiceConexao: TServiceConexao
  Height = 605
  Width = 150
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\EMANUEL\Desktop\banco\BANCOFDDS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 64
    Top = 88
  end
  object FDQuery_Avaliacoes: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from avaliacoes')
    Left = 64
    Top = 216
    object FDQuery_AvaliacoesAVA_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'AVA_CODIGO'
      Origin = 'AVA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery_AvaliacoesAVA_AVALIADOR: TStringField
      FieldName = 'AVA_AVALIADOR'
      Origin = 'AVA_AVALIADOR'
      Size = 100
    end
    object FDQuery_AvaliacoesAVA_AVALIADO: TStringField
      FieldName = 'AVA_AVALIADO'
      Origin = 'AVA_AVALIADO'
      Size = 100
    end
    object FDQuery_AvaliacoesAVA_CATEGORIA: TStringField
      FieldName = 'AVA_CATEGORIA'
      Origin = 'AVA_CATEGORIA'
    end
    object FDQuery_AvaliacoesAVA_NOTA: TIntegerField
      FieldName = 'AVA_NOTA'
      Origin = 'AVA_NOTA'
    end
    object FDQuery_AvaliacoesAVA_COMENTARIO: TStringField
      FieldName = 'AVA_COMENTARIO'
      Origin = 'AVA_COMENTARIO'
      Size = 200
    end
  end
  object FDQuery_Pessoas: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from pessoas')
    Left = 64
    Top = 296
    object FDQuery_PessoasPES_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'PES_CODIGO'
      Origin = 'PES_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery_PessoasPES_NOMECOMPLETO: TStringField
      FieldName = 'PES_NOMECOMPLETO'
      Origin = 'PES_NOMECOMPLETO'
      Size = 200
    end
    object FDQuery_PessoasPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Origin = 'PES_CPF'
    end
    object FDQuery_PessoasPES_TELEFONE: TStringField
      FieldName = 'PES_TELEFONE'
      Origin = 'PES_TELEFONE'
      Size = 50
    end
    object FDQuery_PessoasPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Origin = 'PES_EMAIL'
      Size = 200
    end
  end
end
