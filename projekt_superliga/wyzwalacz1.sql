# Wyzwalacz zmienia liczbe wygranych i przegranych po dodaniu zwycięzcy. Ten wyzwalacz działa jako pierwszy.

DELIMITER $$
CREATE TRIGGER nowy_bilans AFTER UPDATE ON harmonogram
FOR EACH ROW

BEGIN
UPDATE druzyny SET wygrane = wygrane + 1
WHERE nazwa_druzyny = new.zwyciezca;
UPDATE druzyny SET przegrane = przegrane + 1
WHERE nazwa_druzyny = IF (new.zwyciezca = new.druzyna_czerwona, new.druzyna_niebieska, new.druzyna_czerwona);
END$$