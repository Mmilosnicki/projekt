# Wyzwalacz ustawia pozycje drużyn wg. zwycięstw. Ten wyzwalacz działa jako drugi.

DELIMITER $$
CREATE TRIGGER ustaw_pozycje AFTER UPDATE ON harmonogram
FOR EACH ROW
FOLLOWS nowy_bilans 
BEGIN

UPDATE druzyny d INNER JOIN (SELECT *, RANK() OVER (ORDER BY wygrane DESC) AS ranking FROM druzyny ) dd ON dd.nazwa_druzyny = d.nazwa_druzyny 
SET d.pozycja = ranking;


END$$