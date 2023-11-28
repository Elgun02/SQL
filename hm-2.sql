CREATE TABLE IF NOT EXISTS `player` (
    `player_id` INT PRIMARY KEY,
    `nickname` VARCHAR(128) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `email` VARCHAR(64),
    `is_blocked` BOOLEAN DEFAULT false
);

CREATE TABLE IF NOT EXISTS `maps` (
    `map_id` INT PRIMARY KEY,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `map_url` VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS `chat` (
    `chat_id` INT PRIMARY KEY,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `message` INT,
    `history` TEXT,
    `is_zip` BOOLEAN DEFAULT false,
     FOREIGN KEY (`message`) REFERENCES `message` (`message_id`)
);

CREATE TABLE IF NOT EXISTS `message` (
    `message_id` INT PRIMARY KEY,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `message` VARCHAR(128) NOT NULL,
    `author` INT,
    `receiver` INT,
    `is_read` BOOLEAN DEFAULT false,
    `is_delete` BOOLEAN DEFAULT false,
    FOREIGN KEY (`author`) REFERENCES `player` (`player_id`),
    FOREIGN KEY (`receiver`) REFERENCES `player` (`player_id`)
);

CREATE TABLE IF NOT EXISTS `match` (
    `match_id` INT PRIMARY KEY,
    `map` INT,
    `chat` INT,
    `player1` INT,
    `player2` INT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `winner` INT,
    `is_show` BOOLEAN DEFAULT true,
    FOREIGN KEY (`player1`) REFERENCES `player` (`player_id`),
    FOREIGN KEY (`player2`) REFERENCES `player` (`player_id`),
    FOREIGN KEY (`winner`) REFERENCES `player` (`player_id`),
    FOREIGN KEY (`map`) REFERENCES `maps` (`map_id`),
    FOREIGN KEY (`chat`) REFERENCES `chat` (`chat_id`)
);