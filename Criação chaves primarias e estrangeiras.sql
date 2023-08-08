alter table TB_TABELA_MAE
  add constraint CP_TABELA_MAE primary key (ID_CODIGO);
  
alter table TB_TABELA_FILHA_1
  add constraint CE_TABELA_FILHA_1 foreign key (ID_CODIGO)
  references TB_TABELA_MAE (ID_CODIGO);
  
alter table TB_TABELA_FILHA_2
  add constraint CE_TABELA_FILHA_2 foreign key (ID_CODIGO)  
  references TB_TABELA_MAE (ID_CODIGO);