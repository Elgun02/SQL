CREATE TABLE `player` (
  `player_id` integer,
  `nickname` varchar(128),
  `created_at` timestamp,
  `email` varchar(64),
  `is_blocked` bool
);

CREATE TABLE `match` (
  `match_id` integer,
  `map` map_id,
  `chat` chat_id,
  `player1` player_id,
  `player2` player_id,
  `created_at` timestamp,
  `winner` player_id,
  `is_show` bool
);

CREATE TABLE `chat` (
  `chat_id` integer,
  `created_at` timestamp,
  `message` message_id,
  `history` text,
  `is_zip` bool
);

CREATE TABLE `message` (
  `mesaage_id` int,
  `created_at` timestamp,
  `message` varchar(128),
  `author` player_id,
  `reciever` player_id,
  `is_read` bool,
  `is_delete` bool
);

CREATE TABLE `maps` (
  `map_id` int,
  `created_at` timestamp,
  `map_url` varchar(128)
);

ALTER TABLE `match` ADD FOREIGN KEY (`player1`) REFERENCES `player` (`player_id`);

ALTER TABLE `match` ADD FOREIGN KEY (`player2`) REFERENCES `player` (`player_id`);

ALTER TABLE `match` ADD FOREIGN KEY (`winner`) REFERENCES `player` (`player_id`);

ALTER TABLE `message` ADD FOREIGN KEY (`author`) REFERENCES `player` (`player_id`);

ALTER TABLE `message` ADD FOREIGN KEY (`reciever`) REFERENCES `player` (`player_id`);

ALTER TABLE `match` ADD FOREIGN KEY (`map`) REFERENCES `maps` (`map_id`);

ALTER TABLE `chat` ADD FOREIGN KEY (`message`) REFERENCES `message` (`mesaage_id`);

ALTER TABLE `chat` ADD FOREIGN KEY (`chat_id`) REFERENCES `match` (`chat`);
