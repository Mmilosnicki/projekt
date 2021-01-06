# Funkcja pokazuje na jakiej roli gra podany zawodnik.

DELIMITER $$
CREATE FUNCTION pokaz_role_zawodnika (nickname_zawodnika VARCHAR(50))
RETURNS VARCHAR(50) 
READS SQL DATA
DETERMINISTIC
BEGIN
DECLARE rola_zawodnika VARCHAR(50);
SET rola_zawodnika = (SELECT rola FROM zawodnicy WHERE nickname = nickname_zawodnika);
RETURN rola_zawodnika;
END$$
