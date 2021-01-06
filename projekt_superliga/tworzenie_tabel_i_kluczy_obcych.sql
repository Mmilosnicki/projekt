CREATE DATABASE projekt_superliga;
USE projekt_superliga;

CREATE TABLE druzyny
(pozycja INT, nazwa_druzyny VARCHAR(30) PRIMARY KEY, tag_druzyny CHAR(3) NOT NULL, 
kraj_pochodzenia VARCHAR(30) NOT NULL, wygrane INT DEFAULT '0', przegrane INT DEFAULT'0');

CREATE TABLE zawodnicy
(id_zawodnika INT PRIMARY KEY AUTO_INCREMENT, imie VARCHAR(30) NOT NULL, 
nazwisko VARCHAR(30) NOT NULL, nickname VARCHAR(30) NOT NULL, 
kraj_pochodzenia VARCHAR(30) NOT NULL, wiek INT NOT NULL, 
rola VARCHAR(20) NOT NULL, druzyna VARCHAR(30) NOT NULL,

FOREIGN KEY (druzyna) REFERENCES druzyny(nazwa_druzyny));

CREATE TABLE kary
(id_kary INT PRIMARY KEY AUTO_INCREMENT, rodzaj_kary VARCHAR(30), powod VARCHAR(100), 
konsekwencja VARCHAR(100), id_zawodnika INT,

FOREIGN KEY (id_zawodnika) REFERENCES zawodnicy(id_zawodnika));

CREATE TABLE komentatorzy
(id_komentatora INT AUTO_INCREMENT PRIMARY KEY, imie VARCHAR(30) NOT NULL, 
nazwisko VARCHAR(30) NOT NULL, nickname VARCHAR(30));

CREATE TABLE harmonogram
(id_spotkania INT PRIMARY KEY AUTO_INCREMENT, druzyna_niebieska VARCHAR(30) NOT NULL,
druzyna_czerwona VARCHAR(30) NOT NULL, data_spotkania DATE, 
godzina_spotkania TIME, zwyciezca VARCHAR(30),id_komentatora INT,

FOREIGN KEY (druzyna_niebieska) REFERENCES druzyny(nazwa_druzyny),
FOREIGN KEY (druzyna_czerwona) REFERENCES druzyny(nazwa_druzyny),
FOREIGN KEY (zwyciezca) REFERENCES druzyny(nazwa_druzyny),
FOREIGN KEY (id_komentatora) REFERENCES komentatorzy(id_komentatora));
