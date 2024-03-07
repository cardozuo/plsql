CREATE OR REPLACE PROCEDURE BANCO.procedure_exportar_clob_txt IS
DECLARE
    v_clob CLOB;
    v_file UTL_FILE.FILE_TYPE;
    v_directory VARCHAR2(100) := 'DIRETORIO'; -- Diret�rio onde o arquivo ser� salvo
    v_filename VARCHAR2(100) := 'arquivoclob.txt'; -- Nome do arquivo de sa�da
    v_buffer VARCHAR2(200);
    v_offset NUMBER := 1;
    v_chunk_size NUMBER := 200;--Define o maximo de 200 carac. por linha (limita��o do arquivo txt)
BEGIN
    --Busca o campo CLOB para exportar
    SELECT DESC_MSG 
    INTO v_clob
    FROM KIPREV.PA_DADOS_SINOB_ERR_TEMP;
    
    -- Abre o arquivo para escrita
    v_file := UTL_FILE.FOPEN(v_directory, v_filename, 'W');

    -- Loop para processar a CLOB e gravar no arquivo
    LOOP
        -- L� um peda�o da CLOB
        DBMS_LOB.READ(v_clob, v_chunk_size, v_offset, v_buffer);

        -- Verifica se ainda h� conte�do a ser lido
        IF LENGTH(v_buffer) = 0 THEN
            EXIT;
        END IF;

        -- Escreve a linha no arquivo
        UTL_FILE.PUT_LINE(v_file, v_buffer);

        -- Atualiza o deslocamento
        v_offset := v_offset + v_chunk_size;
    END LOOP;

    -- Fecha o arquivo
    UTL_FILE.FCLOSE(v_file);
EXCEPTION
    WHEN OTHERS THEN
        -- Em caso de erro, fecha o arquivo se estiver aberto
        IF UTL_FILE.IS_OPEN(v_file) THEN
            UTL_FILE.FCLOSE(v_file);
        END IF;
        -- Mostra mensagem de erro
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/
