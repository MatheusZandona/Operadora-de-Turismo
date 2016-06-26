/*QUERY UTEIS PARA ESSA TABELA, siga a ordem caso queira deletar a coluna de pagamento e recriar*/

ALTER TABLE formapgto DROP FORMA_PAGTO; /*Deleta a coluna*/
ALTER TABLE formapgto ADD COLUMN FORMA_PAGTO ENUM('CARTAO', 'BOLETO', 'DINHEIRO') DEFAULT 'BOLETO'; /*apenas essas formas são aceitas no insert*/
DELETE FROM formapgto WHERE id = 1; /*Deleta todos os id IGUAIS a 1*/
DELETE FROM formapgto WHERE id > 1; /*Deleta todos os id MAIORES que 1*/
ALTER TABLE formapgto AUTO_INCREMENT = 1; /*Faz id voltar a incrementar do 1*/

INSERT INTO formapgto (FORMA_PAGTO) VALUES ('cartao');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('boleto');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('dinheiro');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('boleto');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('cartao');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('dinheiro');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('cartao');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('dinheiro');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('dinheiro');
INSERT INTO formapgto (FORMA_PAGTO) VALUES ('boleto');
SELECT * FROM formapgto; /*Seleciona tudo da forma de pagamento*/