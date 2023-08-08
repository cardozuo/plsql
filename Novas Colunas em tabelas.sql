--Inclusão das novas colunas
ALTER TABLE TB_TABELA_MAE add (SOBRENOME_FAMILIA VARCHAR2(30));
ALTER TABLE TB_TABELA_MAE add (IDADE NUMBER(3));

--Comentario das novas colunas
COMMENT ON COLUMN OwnerBanco.TB_TABELA_MAE.SOBRENOME_FAMILIA IS 'Sobrenome da familia';
COMMENT ON COLUMN OwnerBanco.TB_TABELA_MAE.IDADE IS 'Idade da pessoa';