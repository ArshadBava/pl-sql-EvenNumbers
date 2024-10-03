DELIMITER $$
CREATE PROCEDURE generate_even_numbers(
    IN n INT
)
BEGIN
    DECLARE i INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS EvenNumbers (
        number INT
    );

    WHILE i < n DO
        INSERT INTO EvenNumbers (number) VALUES (i * 2);
        SET i = i + 1;
    END WHILE;

    SELECT * FROM EvenNumbers;

    DROP TEMPORARY TABLE IF EXISTS EvenNumbers;
END $$
DELIMITER ;

CALL generate_even_numbers(6);