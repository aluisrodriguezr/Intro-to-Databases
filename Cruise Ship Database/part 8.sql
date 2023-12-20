USE cruise;

SELECT USER();

CREATE USER 'karin'@'localhost' IDENTIFIED BY 'cgs2545$%';
SELECT host, user, select_priv, insert_priv, update_priv, delete_priv, create_priv, drop_priv FROM mysql.user WHERE user = 'karin';

GRANT SELECT, INSERT, UPDATE ON cruise.* TO 'karin'@'localhost';
SHOW GRANTS FOR 'karin'@'localhost';


-- Terminal Commands to Switch User -> cd /usr/local/mysql/bin -> ./mysql -u karin -p
