/* ************************************************************************************* */
/* ---------------------------------- 01. TRIGGERS ------------------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 01. Despues de Insertar User, insertar código a estudiante. ------------------------- --
-- ------------------------------------------------------------------------------------- --
DROP TRIGGER assignment_rol_ai;
DELIMITER $$
CREATE TRIGGER assignment_rol_ai
	AFTER INSERT ON USERS FOR EACH ROW
BEGIN
	IF (NEW.rol_id = 2) THEN
		INSERT INTO TEACHERS VALUES
		(NEW.user_id);
	ELSEIF (NEW.rol_id = 3) THEN
		INSERT INTO STUDENTS VALUES
		(NEW.user_id);
	ELSEIF (NEW.rol_id = 4) THEN
		INSERT INTO ATTENDANTS VALUES
		(NEW.user_id);
	END IF;    
END;$$
DELIMITER ;

-- ------------------------------------------------------------------------------------- --
-- 02. Despues de . -------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --