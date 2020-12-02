-- Creación de tabla "nombres_ej" en base_datos_leo
CREATE TABLE `base_datos_leo`.`nombres_ej`
(
    `id` INT NOT NULL AUTO_INCREMENT ,
    `nombre` VARCHAR(25) NOT NULL ,
    `edad` INT(3) NOT NULL ,
    `alergias` BOOLEAN NOT NULL DEFAULT FALSE ,
    PRIMARY KEY (`id`)
    ) 
    ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

    --ingreso de primeros registros
    INSERT INTO `nombres_ej` (`id`, `nombre`, `edad`, `alergias`) VALUES ('1', 'Maria', '35', '1');
    INSERT INTO `nombres_ej` (`id`, `nombre`, `edad`, `alergias`) VALUES (NULL, 'Pedro', '27', '0');
    INSERT INTO `nombres_ej` ( `nombre`, `edad`, `alergias`) VALUES ('Pedro', '27', '0');
    INSERT INTO `nombres_ej` (`nombre`, `edad`) VALUES ('Pedro', '27');
    INSERT INTO `nombres_ej` (`id`,  `edad`, `alergias`) VALUES (NULL, 'Incognito', '27', '0');
    --para borarr un registro
    DELETE FROM `nombres_ej` WHERE `nombres_ej`.`id` = 3;
    --para acutalizar un registro
    UPDATE `nombres_ej` SET `nombre` = 'Andrea' WHERE `nombres_ej`.`id` = 10;