-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema City_Projects
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `City_Projects`;
CREATE SCHEMA IF NOT EXISTS `City_Projects` ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `City_Projects` ;

-- -----------------------------------------------------
-- Table `City_Projects`.`city_info_data`
-- -----------------------------------------------------
drop table if exists city_info_data;
CREATE TABLE IF NOT EXISTS `City_Projects`.`city_info_data` (
 `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NULL,
  `population` INT NULL,
  `coordinates` VARCHAR(45) NULL,
  `latitude` DECIMAL(9,5) NOT NULL,
  `longitude` DECIMAL(9,5) NOT NULL,
  city_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `City_Projects`.`city_weather_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `City_Projects`.`city_weather_data` (
  city_id INT UNSIGNED NOT NULL,
  `min_temperature` DECIMAL(5,2) NULL,
  `max_temperature` DECIMAL(5,2) NULL,
  `temperature` DECIMAL(5,2) NOT NULL,
  `real_feel` DECIMAL(5,2) NULL,
  `date` DATETIME NOT NULL,
  `outlook` VARCHAR(15) NULL,
  `description` VARCHAR(45) NULL,
  `rain_volume` DECIMAL(5,2) DEFAULT 0.00,
  `humidity` INT NULL,
  `wind_speed` DECIMAL(5,2) DEFAULT 0.00,
  `part_of_day` VARCHAR(8) NULL,
  CONSTRAINT fk_city_id
    FOREIGN KEY (city_id)
    REFERENCES `City_Projects`.`city_info_data` (city_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `City_Projects`.`city_airports_data`
-- -----------------------------------------------------
drop table if exists city_airports_data;
CREATE TABLE IF NOT EXISTS `City_Projects`.`city_airports_data` (
  city_id INT UNSIGNED NOT NULL,
  `airport_name` VARCHAR(60) NULL,
  `airport_iata` VARCHAR(3) NULL,
  `airport_icao` CHAR(4) NOT NULL,
  `country_code` VARCHAR(3) NOT NULL,
  `distance_to_airport_km` DECIMAL(5,2) NULL,
  airport_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (airport_id),
  CONSTRAINT fk_cit_id_airport
    FOREIGN KEY (city_id)
    REFERENCES `City_Projects`.`city_info_data` (city_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `City_Projects`.`city_flights_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `City_Projects`.`city_flights_data` (
  airport_id INT UNSIGNED NOT NULL,
  `arrival_date` DATE NOT NULL,
  `airport_iata` VARCHAR(3) NULL,
  `airport_icao` CHAR(4) NOT NULL,
  `flight_number` VARCHAR(15) NULL,
  `airline` VARCHAR(45) NULL,
  `flight_status` VARCHAR(45) NULL,
  `scheduled_arr_local_time` TIME NOT NULL,
  `actual_arr_local_time` TIME NULL,
  `scheduled_arr_UTC_time` TIME NOT NULL,
  `delay_time` TIME NULL,
  flight_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (flight_id),
  CONSTRAINT fk_airport_id
    FOREIGN KEY (airport_id)
    REFERENCES `City_Projects`.`city_airports_data` (airport_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

# airport_id	arrival_date	airport_iata	airport_icao	flight_number	airline	flight_status	scheduled_arr_local_time	actual_arr_local_time	scheduled_arr_UTC_time	delay_time	flight_id
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
