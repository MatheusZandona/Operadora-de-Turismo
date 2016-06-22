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

/*Table structure for table `formapgto` */

DROP TABLE IF EXISTS `formapgto`;

CREATE TABLE `formapgto` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `DESCRICA` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*Table structure for table `servicos` */

DROP TABLE IF EXISTS `servicos`;

CREATE TABLE `servicos` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(30) default NULL,
  `DESCRICAO` varchar(255) default NULL,
  `VALOR` float default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
