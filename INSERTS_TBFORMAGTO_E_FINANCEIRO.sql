
/* INSERT TABELA FORMAPGTO */

INSERT INTO formapgto (ID, DESCRICA)
VALUES
  (1, 'A VISTA');

INSERT INTO formapgto (DESCRICA)
VALUES
  ('CARTÃO');
  
INSERT INTO formapgto (DESCRICA)
VALUES
  ('CHEQUE');
  
INSERT INTO formapgto (DESCRICA)
VALUES
  ('CREDIARIO');
  
/*-------------------------------------------------------------------------------------------------------- */
/*INSERT TABELA FINANCEIRO*/

  
INSERT INTO financeiro (
  ID,
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 1,
    1,
    1800,
    500,
    350,
    '2016-06-26',
    '2016-07-27'
  );
 
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 2,
    1500,
    300,
    150,
    '2016-06-30',
    '2016-07-03'
  ); 
  

 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 4,
    1980,
    600,
    400,
    '2016-07-01',
    '2016-07-08'
  );
  
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 3,
    1300,
    400,
    150,
    '2016-07-09',
    '2016-07-18'
  );
  
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 2,
    2000,
    900,
    500,
    '2016-07-03',
    '2016-07-10'
  );
  
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 1,
    3000,
    600,
    550,
    '2016-08-01',
    '2016-08-06'
  );
  
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 3,
    4000,
    1000,
    680,
    '2016-08-07',
    '2016-08-18'
  );
  
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 4,
    2600,
    590,
    390,
    '2016-08-18',
    '2016-08-29'
  );
  
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 1,
    4000,
    2500,
    1000,
    '2016-09-07',
    '2016-09-16'
  );
  
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 1,
    6000,
    2000,
    2500,
    '2016-09-10',
    '2016-09-15'
  );
  
 INSERT INTO financeiro (
  FORMAPGTO_ID,
  VALOR_TOTAL,
  VALOR_ADD,
  VALOR_DESC,
  DT_FINANCEIRO,
  DT_VENCIMENTO
)
VALUES
  ( 3,
    1200,
    200,
    100,
    '2016-09-07',
    '2016-09-10'
  );