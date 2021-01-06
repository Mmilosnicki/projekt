# Spotkania pomiędzy podaną datą.

CREATE VIEW zapytanie1 AS 
SELECT druzyna_niebieska, druzyna_czerwona, data_spotkania FROM harmonogram 
WHERE data_spotkania BETWEEN '2021-01-08' AND '2021-01-15';

# Ilość kar podanego zawodnika.

CREATE VIEW zapytanie2 AS
SELECT id_zawodnika, COUNT(id_kary) AS Ilosc_kar_danego_zawodnika FROM kary 
WHERE id_zawodnika = (SELECT id_zawodnika FROM zawodnicy WHERE id_zawodnika=2);

# Nickname(nazwa) komentatora w danym meczu.

CREATE VIEW zapytanie3 AS 
SELECT harmonogram.druzyna_niebieska, harmonogram.druzyna_czerwona, harmonogram.data_spotkania, harmonogram.id_komentatora, komentatorzy.nickname
FROM harmonogram LEFT JOIN komentatorzy ON harmonogram.id_komentatora = komentatorzy.id_komentatora;

# Najstarszy zawodnik.

CREATE VIEW zapytanie4 AS
SELECT  CONCAT (imie, " ", nazwisko, " ",  nickname) AS najstarszy_zawodnik, MAX(wiek) AS wiek FROM zawodnicy 
WHERE wiek = (SELECT MAX(wiek) FROM zawodnicy);

# Najmłodszy zawodnik.

CREATE VIEW zapytanie5 AS
SELECT  CONCAT (imie, " ", nazwisko, " ", nickname) AS najmlodszy_zawodnik, MIN(wiek) AS wiek FROM zawodnicy 
WHERE wiek = (SELECT MIN(wiek) FROM zawodnicy);

# Średni wiek zawodników w lidze.

CREATE VIEW zapytanie6 AS
SELECT AVG(wiek) AS sredni_wiek_zawodnikow_w_lidze, ROUND(AVG(wiek)) AS zaokraglony_wiek FROM zawodnicy;

# Ilość zawodników z danego kraju.

CREATE VIEW zapytanie7 AS
SELECT kraj_pochodzenia, COUNT(kraj_pochodzenia) AS ilosc_zawodnikow FROM zawodnicy
GROUP BY kraj_pochodzenia;

# Średni wiek zawodników każdej z drużyn.

CREATE VIEW zapytanie8 AS
SELECT  druzyna, AVG(wiek) AS sredni_wiek, ROUND(AVG(wiek)) AS zaokraglony_sredni_wiek
FROM zawodnicy
GROUP BY druzyna
ORDER BY zaokraglony_sredni_wiek ASC; 

# Spis zawodników z karami.

CREATE VIEW zapytanie9 AS
SELECT zawodnicy.imie, zawodnicy.nazwisko, zawodnicy.id_zawodnika, zawodnicy.nickname, kary.rodzaj_kary, kary.powod, kary.konsekwencja
FROM zawodnicy INNER JOIN kary ON zawodnicy.id_zawodnika = kary.id_zawodnika
ORDER BY id_zawodnika;

# Ilość zawodników na danej roli w podanym wieku.

CREATE VIEW zapytanie10 AS
SELECT rola, COUNT(rola) AS zawodnicy_na_danej_roli_w_podanym_wieku
FROM zawodnicy
WHERE wiek BETWEEN 18 AND 23
GROUP BY rola;