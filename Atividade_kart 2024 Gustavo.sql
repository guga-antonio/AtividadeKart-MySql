CREATE DATABASE kart;
USE kart;


CREATE TABLE `patrocinio` (
  `idpatrocinio` int NOT NULL,
  `nomepatrocinio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpatrocinio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `temporada` (
  `idtemporada` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  PRIMARY KEY (`idtemporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `equipe` (
  `idequipe` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idpatrocinio` int DEFAULT NULL,
  PRIMARY KEY (`idequipe`),
  KEY `fk_equipe_patrocinio` (`idpatrocinio`),
  CONSTRAINT `fk_equipe_patrocinio` FOREIGN KEY (`idpatrocinio`) REFERENCES `patrocinio` (`idpatrocinio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `piloto` (
  `idpiloto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `peso` float DEFAULT NULL,
  `capitao` tinyint NOT NULL,
  `idequipe` int DEFAULT NULL,
  `nacionalidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpiloto`),
  KEY `fk_piloto_equipe` (`idequipe`),
  CONSTRAINT `fk_piloto_equipe` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `etapa` (
  `idetapa` int NOT NULL AUTO_INCREMENT,
  `local` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `hora` varchar(45) NOT NULL,
  `idtemporada` int DEFAULT NULL,
  PRIMARY KEY (`idetapa`),
  KEY `fk_etapa_temporada` (`idtemporada`),
  CONSTRAINT `fk_etapa_temporada` FOREIGN KEY (`idtemporada`) REFERENCES `temporada` (`idtemporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `etapa_has_piloto` (
  `idetapa` int NOT NULL,
  `idpiloto` int NOT NULL,
  PRIMARY KEY (`idpiloto`,`idetapa`),
  KEY `idetapa` (`idetapa`),
  CONSTRAINT `etapa_has_piloto_ibfk_1` FOREIGN KEY (`idetapa`) REFERENCES `etapa` (`idetapa`),
  CONSTRAINT `etapa_has_piloto_ibfk_2` FOREIGN KEY (`idpiloto`) REFERENCES `piloto` (`idpiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO patrocinio VALUES
(1,'MotorTech Brasil'),
(2,'Velocidade Extrema'),
(3,'Alta Performance'),
(4,'Turbo Racing'),
(5,'Pneus ProDrive');

INSERT INTO equipe VALUES
(1,'Escuderia Veloz',1),
(2,'Rápidos & Furiosos',2),
(3,'Fênix Racing',3),
(4,'Equipe Tempestade',4),
(5,'Corredores de Aço',5);

INSERT INTO temporada VALUES (1,1);

INSERT INTO etapa VALUES
(1,'São Paulo','2024-01-15','14:00:00',1),
(2,'Rio de Janeiro','2024-02-20','16:00:00',1),
(3,'Campo Grande','2024-03-18','15:00:00',1),
(4,'Londrina','2024-04-22','13:00:00',1),
(5,'Porto Alegre','2024-05-10','10:00:00',1);

INSERT INTO piloto VALUES (1,'Lucas andrade',70.5,1,1,'brasil'),(2,'Renato Figueiredo',75,0,1,'brasil'),(3,'Mateus Silva',68,0,2,'brasil'),(4,'Bruno Almeida',78.3,1,2,'brasil'),(5,'Carla Pereira',60,1,3,'portugal'),(6,'Gabriela Torres',58.5,0,3,'brasil'),(7,'João Costa',80.5,0,4,'brasil'),(8,'Thiago Santos',72.5,0,4,'brasil'),(9,'Mariana Gomes',62,1,5,'portugal'),(10,'Beatriz Lopes',63.2,1,5,'portugal');

INSERT INTO etapa_has_piloto VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);


SET SQL_SAFE_UPDATES = 0;

UPDATE etapa
SET local='Salvador'
WHERE local='Campo Grande';

UPDATE etapa
SET local='Goiânia'
WHERE local='Londrina';

UPDATE equipe
SET idpatrocinio=NULL
WHERE nome='Corredores de Aço';

DELETE FROM patrocinio
WHERE nomepatrocinio='Pneus ProDrive';

SELECT * FROM piloto;
