# Procedura pozwala na opóznienie meczy danego dnia o 30 minut.

DELIMITER $$
CREATE PROCEDURE opoznienie (IN termin_spotkania DATE)
BEGIN
UPDATE harmonogram
SET godzina_spotkania = DATE_ADD(godzina_spotkania, INTERVAL 30 MINUTE)
WHERE data_spotkania = termin_spotkania;
 
END$$

