DECLARE
  vdDataOld	 VARCHAR2(50);
  vdDataNova VARCHAR2(50);

BEGIN

  vdDataOld := '21/02/2024';

  SELECT CASE
           WHEN SUBSTR(d.dat, 3, 1) = '/' THEN
            to_char(to_Date(d.dat), 'YYYY-MM-DD')
           ELSE
            d.dat
         END datas
    INTO vdDataNova
    FROM (SELECT vdDataOld dat FROM dual) d;

	--Inserir com a formatação correta
	INSERT INTO TABELA (
	DATA_IMPORTADA
	)
	VALUES (
	to_date(vdDataNova,'yyyy-mm-dd')
	);
END;