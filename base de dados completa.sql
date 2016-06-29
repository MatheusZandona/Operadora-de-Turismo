/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 4.1.22-community-nt : Database - opturismo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`opturismo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `opturismo`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(40) default NULL,
  `SOBRENOME` varchar(40) default NULL,
  `RG` varchar(20) default NULL,
  `CPF` varchar(20) default NULL,
  `DT_NASCIMENTO` date default NULL,
  `EMAIL` varchar(70) default NULL,
  `TEL_CELULAR` varchar(20) default NULL,
  `TEL_RESIDENCIAL` varchar(20) default NULL,
  `TEL_TRABALHO` varchar(20) default NULL,
  `ESTADO_CIVIL` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cliente` */

insert  into `cliente`(`ID`,`NOME`,`SOBRENOME`,`RG`,`CPF`,`DT_NASCIMENTO`,`EMAIL`,`TEL_CELULAR`,`TEL_RESIDENCIAL`,`TEL_TRABALHO`,`ESTADO_CIVIL`) values (1,'João','Cabral','10.294.546-9','087.654.345-78','1976-06-09','joaocabral@hotmail.com','(45)9987-6588','(45)6554-2653','(45)2365-2653','Solteiro'),(2,'Maria','Lima','23.263.265-7','736.343.938-98','1993-03-03','mariazinha@gmail.com','(45)9987-9887','(45)8127-2652','(45)2365-7232','Casado'),(3,'Caroline','Alves','23.232.343-8','113.283.276-23','1990-05-20','carol.alves@yahoo.com','(65)2635-72637','(65)8897-2161','(65)2324-2323','Viuvo'),(4,'Marcos','Limeira','12.928.726-9','132.127.253-23','1975-12-12','mlimeira@bol.com','(23)9987-2763','(68)3683-4852','(23)2322-2323','Solteiro'),(5,'Emanoel','Assunção','38.736.635-9','763.736.376-34','1987-08-17','assuncao@assuncaobebidas.com.br','(87)9834-7364','(81)3745-2753','(87)4587-4875','Solteiro'),(6,'Guilherme','Silva','98.232.234.5','763.723.213-87','1999-11-12','guisilva@msn.com','(67)9893-3746','(92)3997-1249','(67)3453-3463','Casado'),(7,'Bruno','Vidal','13.237.237-9','712.362.726-28','1991-01-01','bruno_vidal@hotmail.com','(76)2635-2636','(28)3891-2989','(76)3476-7364','Divorciado'),(8,'Paulo','da Rosa','87.273.726-7','795.102.740-54','1966-03-03','darosa@hotmail.com','(65)6534-3746','(65)3525-1226','(65)3486-3846','Casado'),(9,'Larissa','Martins','23.237.276-2','527.948.040-14','1980-05-24','larimartins@gmail.com','(69)8347-3476','(69)3537-6771','(69)6354-7364','Divorciado'),(10,'Jaqueline','Marin','12.235.276-3','010.939.178-06','1987-10-04','jaque_martins@gmail.com','(76)3455-3676','(41)3758-4475','(76)3764-7364','Viuvo');

/*Table structure for table `financeiro` */

DROP TABLE IF EXISTS `financeiro`;

CREATE TABLE `financeiro` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `FORMAPGTO_ID` int(10) unsigned NOT NULL default '0',
  `VALOR_TOTAL` float default NULL,
  `VALOR_ADD` float default NULL,
  `VALOR_DESC` float default NULL,
  `DT_FINANCEIRO` date default NULL,
  `DT_VENCIMENTO` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FINANCEIRO_FKIndex1` (`FORMAPGTO_ID`),
  CONSTRAINT `financeiro_ibfk_1` FOREIGN KEY (`FORMAPGTO_ID`) REFERENCES `formapgto` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `financeiro` */

insert  into `financeiro`(`ID`,`FORMAPGTO_ID`,`VALOR_TOTAL`,`VALOR_ADD`,`VALOR_DESC`,`DT_FINANCEIRO`,`DT_VENCIMENTO`) values (1,1,1800,500,350,'2016-06-26','2016-07-27'),(2,2,1500,300,150,'2016-06-30','2016-07-03'),(3,4,1980,600,400,'2016-07-01','2016-07-08'),(4,3,1300,400,150,'2016-07-09','2016-07-18'),(5,2,2000,900,500,'2016-07-03','2016-07-10'),(6,1,3000,600,550,'2016-08-01','2016-08-06'),(7,3,4000,1000,680,'2016-08-07','2016-08-18'),(8,4,2600,590,390,'2016-08-18','2016-08-29'),(9,1,4000,2500,1000,'2016-09-07','2016-09-16'),(10,1,6000,2000,2500,'2016-09-10','2016-09-15'),(11,3,1200,200,100,'2016-09-07','2016-09-10');

/*Table structure for table `formapgto` */

DROP TABLE IF EXISTS `formapgto`;

CREATE TABLE `formapgto` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `DESCRICA` varchar(20) default NULL,
  `FORMA_PAGTO` enum('CARTAO','BOLETO','DINHEIRO') default 'BOLETO',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `formapgto` */

insert  into `formapgto`(`ID`,`DESCRICA`,`FORMA_PAGTO`) values (1,'CARTAO','CARTAO'),(2,'BOLETO','BOLETO'),(3,'DINHEIRO','DINHEIRO'),(4,'BOLETO','BOLETO'),(5,'CARTAO','CARTAO'),(6,'DINHEIRO','DINHEIRO'),(7,'CARTAO','CARTAO'),(8,'DINHEIRO','DINHEIRO'),(9,'DINHEIRO','DINHEIRO'),(10,'BOLETO','BOLETO');

/*Table structure for table `hotel` */

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(30) default NULL,
  `END_RUA` varchar(30) default NULL,
  `END_NUMERO` int(10) unsigned default NULL,
  `END_BAIRRO` varchar(30) default NULL,
  `END_CIDADE` varchar(30) default NULL,
  `END_UF` varchar(5) default NULL,
  `END_PAIS` varchar(30) default NULL,
  `NUM_QUARTOS` int(10) unsigned default NULL,
  `CLASSIFIC_EMBRA` int(10) unsigned default NULL,
  `ALIMENTACAO` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hotel` */

insert  into `hotel`(`ID`,`NOME`,`END_RUA`,`END_NUMERO`,`END_BAIRRO`,`END_CIDADE`,`END_UF`,`END_PAIS`,`NUM_QUARTOS`,`CLASSIFIC_EMBRA`,`ALIMENTACAO`) values (1,'Copas Executive','av brasil',12345,'centro','cascavel','pr','brasil',200,4,'t'),(2,'Bourbon','av brasil',54321,'centro','cascavel','pr','brasil',150,4,'t'),(3,'Caiua','rua parana',67890,'centro','cascavel','pr','brasil',160,4,'t'),(4,'Copas verdes','rua parana',76549,'centro','cascavel','pr','brasil',410,4,'t'),(5,'Plaza','rua parana',19843,'centro','cascavel','pr','brasil',110,4,'t'),(6,'Deville','rua rio grande do sul',65438,'centro','cascavel','pr','brasil',200,3,'t'),(7,'Regente','rua rio grande do sul',76754,'centro','cascavel','pr','brasil',180,3,'t'),(8,'Querencia','rua sao paulo',87657,'centro','cascavel','pr','brasil',120,3,'t'),(9,'Grand Prix','av brasil',13242,'centro','cascavel','pr','brasil',90,3,'t'),(10,'Maestro','rua sao paulo',98978,'centro','cascavel','pr','brasil',85,3,'t');

/*Table structure for table `hotel_quartos` */

DROP TABLE IF EXISTS `hotel_quartos`;

CREATE TABLE `hotel_quartos` (
  `HOTEL_ID` int(10) unsigned NOT NULL default '0',
  `QUARTOS_ID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`HOTEL_ID`,`QUARTOS_ID`),
  KEY `HOTEL_QUARTOS_FKIndex1` (`HOTEL_ID`),
  KEY `HOTEL_QUARTOS_FKIndex2` (`QUARTOS_ID`),
  CONSTRAINT `hotel_quartos_ibfk_1` FOREIGN KEY (`HOTEL_ID`) REFERENCES `hotel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hotel_quartos_ibfk_2` FOREIGN KEY (`QUARTOS_ID`) REFERENCES `quartos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hotel_quartos` */

insert  into `hotel_quartos`(`HOTEL_ID`,`QUARTOS_ID`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10);

/*Table structure for table `op_transporte` */

DROP TABLE IF EXISTS `op_transporte`;

CREATE TABLE `op_transporte` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(30) default NULL,
  `TRAJETO` varchar(255) default NULL,
  `NUM_ACENTOS` int(10) unsigned default NULL,
  `NUM_ACENTOS_DISP` int(10) unsigned default NULL,
  `INF_RESTRICOES` varchar(255) default NULL,
  `TAXA_ADD_EMBARQUE` float default NULL,
  `NUM_ACENTOS_MIN` int(10) unsigned default NULL,
  `TIPO` char(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `op_transporte` */

insert  into `op_transporte`(`ID`,`NOME`,`TRAJETO`,`NUM_ACENTOS`,`NUM_ACENTOS_DISP`,`INF_RESTRICOES`,`TAXA_ADD_EMBARQUE`,`NUM_ACENTOS_MIN`,`TIPO`) values (1,'Companhia x da Maria','Cascavel, Corbélia, ubiratã',23,10,'Objetos Pontiagudos, armas de fogo',20,0,'A'),(2,'Companhia H do João','Cascavel, Foz do Iguaçu, Curitiba',26,5,'Objetos Pontiagudos, armas de fogo',50,0,'A'),(3,'Companhia Y da Joana','Curitiba, Rio de janeiro, Ceara',60,20,'Objetos Pontiagudos, armas de fogo, chicletes',10,0,'A'),(4,'Companhia c da Lucao','Cascavel, Sao Paulo, fortaleza',90,2,'Objetos Pontiagudos, armas de fogo',1000,0,'A'),(5,'Princesa dos Campos','Cascavel, Corbélia, ubiratã',0,0,'',20,5,'T'),(6,'Eucatur','Cascavel, Sao paulo, Rio de janeiro',22,10,'',0,5,'T'),(7,'Princesa dos Campos','Cascavel, Sei lah, Rio de janeiro',15,10,'',0,5,'T'),(8,'Kaiwoa','Cascavel, Mato Grosso, Acre',22,10,'',0,5,'T'),(9,'Aguia Branca','Cascavel, Brasilia, Porto Velho',22,2,'',0,5,'T'),(10,'Azul','Cascavel, Foz, Curitiba, BH',120,39,'Objetos Pontiagudos, armas de fogo',20,0,'A'),(11,'Tam','Cascavel, Foz, Sao Paulo, Brasilia',150,50,'Objetos Pontiagudos, armas de fogo',200,0,'A');

/*Table structure for table `pacotes` */

DROP TABLE IF EXISTS `pacotes`;

CREATE TABLE `pacotes` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `DESCRICAO` varchar(40) default NULL,
  `HOTEL_ID` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID`),
  KEY `PACOTES_FKIndex1` (`HOTEL_ID`),
  CONSTRAINT `pacotes_ibfk_1` FOREIGN KEY (`HOTEL_ID`) REFERENCES `hotel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pacotes` */

insert  into `pacotes`(`ID`,`DESCRICAO`,`HOTEL_ID`) values (1,'basico',1),(2,'basico moderado',2),(3,'basico premium',3),(4,'basico zafira',4),(5,'premium',5),(6,'premium moderado',6),(7,'premium zafira',7),(8,'master',8),(9,'mater premium',9),(10,'master zafira',10);

/*Table structure for table `prest_servico` */

DROP TABLE IF EXISTS `prest_servico`;

CREATE TABLE `prest_servico` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(30) default NULL,
  `TEL_CELULAR` varchar(20) default NULL,
  `TELEFONE` varchar(20) default NULL,
  `CNPJ` varchar(30) default NULL,
  `EMAIL` varchar(70) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prest_servico` */

insert  into `prest_servico`(`ID`,`NOME`,`TEL_CELULAR`,`TELEFONE`,`CNPJ`,`EMAIL`) values (1,'Abc','(45) 9966-6655','(45)3098-8865','08.252.076/0001-50','abc@gmai.com'),(2,'Def','(45) 9912-9932','(44)3328-8985','09.888.021/0001-90','def@gmai.com'),(3,'Ghi','(99) 9999-0000','(00)5555-3333','00.444.999/0001-32','ghi@hotmail.com'),(4,'jkl','(45) 5555-9999','(67)1234-9876','46.876.125/0002-00','jkl01@outlook.com'),(5,'mno','(45) 2233-4455','(41)4321-6543','09.654.098/0001-22','mno10@yahoo.com'),(6,'pqr','(45) 5555-99766','(43)09876-2345','32.654.123/0001-91','pqr@gmai.com'),(7,'Def','(45) 9912-9932','(44)3328-8985','09.888.021/0001-90','def@gmai.com'),(8,'Ghi','(99) 9999-0000','(00)5555-3333','00.444.999/0001-32','ghi@hotmail.com'),(9,'jkl','(45) 5555-9999','(67)1234-9876','46.876.125/0002-00','jkl01@outlook.com'),(10,'mno','(45) 2233-4455','(41)4321-6543','09.654.098/0001-22','mno10@yahoo.com');

/*Table structure for table `prest_servico_servicos` */

DROP TABLE IF EXISTS `prest_servico_servicos`;

CREATE TABLE `prest_servico_servicos` (
  `PREST_SERVICO_ID` int(10) unsigned NOT NULL default '0',
  `SERVICOS_ID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`PREST_SERVICO_ID`,`SERVICOS_ID`),
  KEY `PREST_SERVICO_SERVICOS_FKIndex1` (`PREST_SERVICO_ID`),
  KEY `PREST_SERVICO_SERVICOS_FKIndex2` (`SERVICOS_ID`),
  CONSTRAINT `prest_servico_servicos_ibfk_1` FOREIGN KEY (`PREST_SERVICO_ID`) REFERENCES `prest_servico` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prest_servico_servicos_ibfk_2` FOREIGN KEY (`SERVICOS_ID`) REFERENCES `servicos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prest_servico_servicos` */

insert  into `prest_servico_servicos`(`PREST_SERVICO_ID`,`SERVICOS_ID`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10);

/*Table structure for table `quartos` */

DROP TABLE IF EXISTS `quartos`;

CREATE TABLE `quartos` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `DESCRICAO` varchar(30) default NULL,
  `QTD_CAMAS_CASAL` int(10) unsigned default NULL,
  `QTD_CAMAS_SOLTEIRO` int(10) unsigned default NULL,
  `NUMERO` int(10) unsigned default NULL,
  `ANDAR` int(10) unsigned default NULL,
  `VALOR` float default NULL,
  `OBS` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartos` */

insert  into `quartos`(`ID`,`DESCRICAO`,`QTD_CAMAS_CASAL`,`QTD_CAMAS_SOLTEIRO`,`NUMERO`,`ANDAR`,`VALOR`,`OBS`) values (1,'Familia',1,2,101,1,100,'quarto para familia de até 4 pessoas'),(2,'Casal',1,0,102,1,100,'quarto para casal'),(3,'Casal Premium',1,0,103,1,150,'quarto para casal'),(4,'Casal Deluxe',1,0,104,1,200,'quarto para casal'),(5,'Familia Premium',1,2,201,2,250,'quarto para familia de até 4 pessoas'),(6,'Solteiro',0,2,202,2,89,'quarto para 2 pessoas'),(7,'Solteiro Premium',0,2,203,2,120,'quarto para 2 pessoas'),(8,'Solteiro Deluxe',0,2,204,2,160,'quarto para 2 pessoas'),(9,'Familia Economic',1,2,301,3,80,'quarto para familia de até 4 pessoas'),(10,'Casal Economic',1,0,302,3,89,'quarto para casal');

/*Table structure for table `reserva` */

DROP TABLE IF EXISTS `reserva`;

CREATE TABLE `reserva` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `USUARIO_ID` int(10) unsigned NOT NULL default '0',
  `PACOTES_ID` int(10) unsigned NOT NULL default '0',
  `CLIENTE_ID` int(10) unsigned NOT NULL default '0',
  `DT_RESERVA` date default NULL,
  `PERIODO_INI` date default NULL,
  `PERIODO_FINAL` date default NULL,
  `SITUACAO` char(1) NOT NULL default '',
  `NRO_PESSOAS` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID`),
  KEY `RESERVA_FKIndex1` (`CLIENTE_ID`),
  KEY `RESERVA_FKIndex2` (`PACOTES_ID`),
  KEY `RESERVA_FKIndex3` (`USUARIO_ID`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `cliente` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`PACOTES_ID`) REFERENCES `pacotes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reserva` */

insert  into `reserva`(`ID`,`USUARIO_ID`,`PACOTES_ID`,`CLIENTE_ID`,`DT_RESERVA`,`PERIODO_INI`,`PERIODO_FINAL`,`SITUACAO`,`NRO_PESSOAS`) values (1,1,1,1,'2016-06-28','2016-06-28','2016-06-31','A',2),(2,2,2,2,'2016-06-27','2016-06-27','2016-06-30','A',4),(3,3,3,3,'2016-06-26','2016-06-26','2016-06-29','A',1),(4,4,1,4,'2016-06-25','2016-06-25','2016-06-28','A',1),(5,5,2,5,'2016-06-24','2016-06-24','2016-06-27','A',2),(7,7,7,7,'2016-06-22','2016-06-22','2016-06-25','A',5),(8,8,5,8,'2016-06-21','2016-06-21','2016-06-24','A',2),(9,9,9,9,'2016-06-20','2016-06-20','2016-06-23','A',1),(10,10,10,10,'2016-06-19','2016-06-19','2016-06-22','A',4);

/*Table structure for table `reserva_financeiro` */

DROP TABLE IF EXISTS `reserva_financeiro`;

CREATE TABLE `reserva_financeiro` (
  `RESERVA_ID` int(10) unsigned NOT NULL default '0',
  `FINANCEIRO_ID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`RESERVA_ID`,`FINANCEIRO_ID`),
  KEY `RESERVA_FINANCEIRO_FKIndex1` (`RESERVA_ID`),
  KEY `RESERVA_FINANCEIRO_FKIndex2` (`FINANCEIRO_ID`),
  CONSTRAINT `reserva_financeiro_ibfk_1` FOREIGN KEY (`RESERVA_ID`) REFERENCES `reserva` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reserva_financeiro_ibfk_2` FOREIGN KEY (`FINANCEIRO_ID`) REFERENCES `financeiro` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reserva_financeiro` */

insert  into `reserva_financeiro`(`RESERVA_ID`,`FINANCEIRO_ID`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10);

/*Table structure for table `servicos` */

DROP TABLE IF EXISTS `servicos`;

CREATE TABLE `servicos` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(30) default NULL,
  `DESCRICAO` varchar(255) default NULL,
  `VALOR` float default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `servicos` */

insert  into `servicos`(`ID`,`NOME`,`DESCRICAO`,`VALOR`) values (1,'Translado','Translado de passageiros',20),(2,'Alimentação','Alimentação por pessoa',27),(3,'Guia','Guia turístico',7),(4,'Fotos','Álbum de fotos da viagem',550),(5,'Carro','Aluguel de veículo(diário)',120),(6,'Quarto adicional','Diária de quarto adicional',150),(7,'Corcovado','Ingresso para passeio ao corcovado',80),(8,'Ultra Leve','Passeio de ultra leve',350),(9,'Cataratas','Passeio nas Cataratas do Iguaçu',30),(10,'Parque Aquático','Parque Aquático',103);

/*Table structure for table `servicos_pacotes` */

DROP TABLE IF EXISTS `servicos_pacotes`;

CREATE TABLE `servicos_pacotes` (
  `SERVICOS_ID` int(10) unsigned NOT NULL default '0',
  `PREST_SERVICO_ID` int(10) unsigned NOT NULL default '0',
  `OP_TRANSPORTE_ID` int(10) unsigned NOT NULL default '0',
  `PACOTES_ID` int(10) unsigned NOT NULL default '0',
  `DATAINICIAL` datetime default NULL,
  `DATAFINAL` datetime default NULL,
  KEY `SERVICOS_PACOTES_FKIndex1` (`PACOTES_ID`),
  KEY `SERVICOS_PACOTES_FKIndex2` (`OP_TRANSPORTE_ID`),
  KEY `SERVICOS_PACOTES_FKIndex3` (`PREST_SERVICO_ID`),
  KEY `SERVICOS_PACOTES_FKIndex4` (`SERVICOS_ID`),
  CONSTRAINT `servicos_pacotes_ibfk_1` FOREIGN KEY (`PACOTES_ID`) REFERENCES `pacotes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `servicos_pacotes_ibfk_2` FOREIGN KEY (`OP_TRANSPORTE_ID`) REFERENCES `op_transporte` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `servicos_pacotes_ibfk_3` FOREIGN KEY (`PREST_SERVICO_ID`) REFERENCES `prest_servico` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `servicos_pacotes_ibfk_4` FOREIGN KEY (`SERVICOS_ID`) REFERENCES `servicos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `servicos_pacotes` */

insert  into `servicos_pacotes`(`SERVICOS_ID`,`PREST_SERVICO_ID`,`OP_TRANSPORTE_ID`,`PACOTES_ID`,`DATAINICIAL`,`DATAFINAL`) values (1,1,1,1,'2016-06-01 14:01:00','2016-07-08 14:02:10'),(1,1,1,1,'2016-06-02 14:02:00','2016-07-09 14:03:10'),(1,1,1,1,'2016-06-03 14:03:00','2016-07-10 14:04:10'),(1,1,1,1,'2016-06-04 14:04:00','2016-07-11 14:05:10'),(1,1,1,1,'2016-06-05 14:05:00','2016-07-12 14:06:10'),(1,2,1,1,'2016-06-01 14:06:00','2016-07-08 14:07:10'),(1,3,1,1,'2016-06-02 14:07:00','2016-07-09 14:08:10'),(1,4,1,1,'2016-06-03 14:08:00','2016-07-10 14:09:10'),(1,5,1,1,'2016-06-04 14:09:00','2016-07-11 14:10:10'),(1,6,1,1,'2016-06-05 14:10:00','2016-07-12 14:11:10'),(1,1,2,1,'2016-06-01 14:11:00','2016-07-08 14:12:10'),(1,1,3,1,'2016-06-02 14:12:00','2016-07-09 14:13:10'),(1,1,4,1,'2016-06-03 14:13:00','2016-07-10 14:14:10'),(1,1,5,1,'2016-06-04 14:14:00','2016-07-11 14:15:10'),(1,1,6,1,'2016-06-05 14:15:00','2016-07-12 14:16:10'),(1,1,1,2,'2016-06-01 14:16:00','2016-07-08 14:17:10'),(1,1,1,3,'2016-06-03 14:17:00','2016-07-09 14:18:10'),(1,1,1,4,'2016-06-05 14:18:00','2016-07-10 14:19:10'),(1,1,1,5,'2016-06-06 14:19:00','2016-07-11 14:20:10'),(1,1,1,6,'2016-06-07 14:20:00','2016-07-12 14:21:10'),(2,2,1,1,'2016-06-01 14:21:00','2016-07-08 14:22:10'),(2,3,1,1,'2016-06-02 14:22:00','2016-07-09 14:23:10'),(2,4,1,1,'2016-06-03 14:23:00','2016-07-10 14:24:10'),(2,5,1,1,'2016-06-04 14:24:00','2016-07-11 14:25:10'),(2,6,1,1,'2016-06-05 14:25:00','2016-07-12 14:26:10'),(2,1,2,1,'2016-06-01 14:26:00','2016-07-08 14:27:10'),(2,1,3,1,'2016-06-02 14:27:00','2016-07-09 14:28:10'),(2,1,4,1,'2016-06-03 14:28:00','2016-07-10 14:29:10'),(2,1,5,1,'2016-06-04 14:29:00','2016-07-11 14:30:10'),(2,1,6,1,'2016-06-05 14:30:00','2016-07-12 14:31:10'),(2,1,1,2,'2016-06-01 14:31:00','2016-07-08 14:32:10'),(2,1,1,3,'2016-06-02 14:32:00','2016-07-09 14:33:10'),(2,1,1,4,'2016-06-03 14:33:00','2016-07-10 14:34:10'),(2,1,1,5,'2016-06-04 14:34:00','2016-07-11 14:35:10'),(2,1,1,6,'2016-06-05 14:35:00','2016-07-12 14:36:10'),(2,2,1,2,'2016-06-01 14:36:00','2016-07-08 14:37:10'),(2,3,1,2,'2016-06-02 14:37:00','2016-07-09 14:38:10'),(2,4,1,2,'2016-06-03 14:38:00','2016-07-10 14:39:10'),(2,5,1,2,'2016-06-04 14:39:00','2016-07-11 14:40:10'),(2,6,1,2,'2016-06-05 14:40:00','2016-07-12 14:41:10'),(2,1,2,2,'2016-06-01 14:41:00','2016-07-08 14:42:10'),(2,1,3,2,'2016-06-02 14:42:00','2016-07-09 14:43:10'),(2,1,4,2,'2016-06-03 14:43:00','2016-07-10 14:44:10'),(2,1,5,2,'2016-06-04 14:44:00','2016-07-11 14:45:10'),(2,1,6,2,'2016-06-05 14:45:00','2016-07-12 14:46:10'),(2,1,3,2,'2016-06-01 14:46:00','2016-07-08 14:47:10'),(2,1,4,3,'2016-06-02 14:47:00','2016-07-09 14:48:10'),(2,1,5,4,'2016-06-03 14:48:00','2016-07-10 14:49:10'),(2,1,6,5,'2016-06-04 14:49:00','2016-07-11 14:50:10'),(2,1,7,6,'2016-06-05 14:50:00','2016-07-12 14:51:10');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`ID`,`NOME`) values (1,'José'),(2,'Maria'),(3,'João'),(4,'Pedro'),(5,'Lucas'),(6,'Marcos'),(7,'Mateus'),(8,'Joaquim'),(9,'Antonio'),(10,'Vanessa'),(11,'Tiago'),(12,'Paulo'),(13,'Leandro'),(14,'Patricia'),(15,'Marcio'),(16,'Ronaldo'),(17,'Ricardo'),(18,'Adolfo'),(19,'Lurdes'),(20,'Felipe'),(21,'Jean'),(22,'Carlos'),(23,'Douglas'),(24,'Ezequiel'),(25,'Fernando'),(26,'Roseli'),(27,'Caroline');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
