-- Active: 1701414220904@@127.0.0.1@3306@ndule_DB

CREATE DATABASE IF NOT EXISTS ndule_DB;

CREATE TABLE IF NOT EXISTS musicien (
    id_musicien INT AUTO_INCREMENT NOT NULL,
    musician_name VARCHAR(50) NOT NULL,
    musician_first_name VARCHAR(50) NOT NULL,
    musician_last_name VARCHAR(50) NOT NULL,
    musician_pseudo VARCHAR(50) NOT NULL , 
    musician_gender VARCHAR(20) NOT NULL ,
    musician_phone VARCHAR(50) NOT NULL ,
    musician_facebook VARCHAR(50) NOT NULL,
    musician_instagram VARCHAR(50) NOT NULL ,
    musician_twitter VARCHAR(50) NOT NULL , 
    musician_picture VARCHAR(50) NOT NULL ,
    musician_official BOOLEAN NOT NULL DEFAULT 0,
    musician_email VARCHAR(50) NOT NULL,
    musician_password VARCHAR(50) NOT NULL , 
    musician_gender_music VARCHAR(50) NOT NULL ,
    PRIMARY KEY(id_musicien)
);

CREATE TABLE IF NOT EXISTS client (
    id_client INT AUTO_INCREMENT NOT NULL,
    client_pseudo VARCHAR(50) NOT NULL,
    client_email VARCHAR(50) NOT NULL,
    client_password VARCHAR(50) NOT NULL,
    client_profile VARCHAR(255) NOT NULL,
    client_gender VARCHAR(50) NOT NULL,
    client_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_client)
);

CREATE TABLE IF NOT EXISTS musicien_followers (
    id_follow INT AUTO_INCREMENT NOT NULL,
    id_client INT NOT NULL ,
    id_musicien INT NOT NULL , 
    date_followed DATE NOT NULL,
    PRIMARY KEY(id_follow),
    FOREIGN KEY (id_client) REFERENCES client (id_client),
    FOREIGN KEY (id_musicien) REFERENCES musicien (id_musicien)
);

CREATE TABLE IF NOT EXISTS album (
    id_album INT AUTO_INCREMENT NOT NULL ,
    album_name VARCHAR(255) NOT NULL , 
    album_date DATETIME NOT NULL,
    album_image VARCHAR(255) NOT NULL ,
    PRIMARY KEY(id_album)
);
  
CREATE TABLE IF NOT EXISTS music (
    id_music INT AUTO_INCREMENT NOT NULL,
    id_album INT NOT NULL ,
    id_musicien INT NOT NULL ,
    music_title VARCHAR(255) NOT NULL ,
    music_path VARCHAR(255) NOT NULL ,
    extract_path VARCHAR(255) NOT NULL ,
    music_gender VARCHAR(50) NOT NULL,
    music_format VARCHAR(50)  NOT NULL ,
    music_type VARCHAR(50) NOT NULL,
    back_image VARCHAR(50) NOT NULL ,
    duration INT NOT NULL , 
    music_size FLOAT NOT NULL ,
    PRIMARY KEY(id_music),
    FOREIGN KEY(id_album) REFERENCES album(id_album),
    FOREIGN KEY (id_musicien) REFERENCES musicien (id_musicien)
);

CREATE TABLE IF NOT EXISTS music_ratings(
    id_rating INT AUTO_INCREMENT NOT NULL ,
    id_music INT NOT NULL ,
    id_client INT NOT NULL ,
    category_rating  VARCHAR(255) NOT NULL,
    number_rates INT NOT NULL ,
    date_rate DATE NOT NULL ,
    PRIMARY KEY (id_rating),
    FOREIGN KEY (id_music) REFERENCES music (id_music),
    FOREIGN KEY (id_client) REFERENCES client (id_client)
);

CREATE TABLE IF NOT EXISTS album_stars (
    id_star INT AUTO_INCREMENT NOT NULL ,
    id_album INT NOT NULL,
    id_client INT NOT NULL ,
    star_value INT NOT NULL ,
    PRIMARY KEY(id_star),
    FOREIGN KEY (id_client) REFERENCES client (id_client),
    FOREIGN KEY(id_album) REFERENCES album(id_album)
);

CREATE TABLE IF NOT EXISTS abonnement_plan (
    id_abonnement_plan INT AUTO_INCREMENT NOT NULL,
    abonnement_duration INT NOT NULL ,
    abonnement_price FLOAT NOT NULL ,
    abonnement_devise FLOAT NOT NULL ,
    abonment_discount FLOAT NOT NULL,
    PRIMARY KEY(id_abonnement_plan)
    
);

CREATE TABLE IF NOT EXISTS abonnements (
    id_abonnement INT AUTO_INCREMENT NOT NULL ,
    id_abonnement_plan INT NOT NULL ,
    id_client INT NOT NULL ,
    date_abonnement DATETIME NOT NULL,
    state_abonnement BOOLEAN NOT NULL,
    PRIMARY KEY(id_abonnement),
    FOREIGN KEY (id_abonnement_plan) REFERENCES abonnement_plan (id_abonnement_plan),
    FOREIGN KEY(id_client) REFERENCES client(id_client)
);

CREATE TABLE IF NOT EXISTS play_list(
    id_play_list INT AUTO_INCREMENT NOT NULL ,
    playlist_name VARCHAR(255) NOT NULL ,
    id_client INT NOT NULL ,
    PRIMARY KEY(id_play_list),
    FOREIGN KEY(id_client) REFERENCES client(id_client)
);

CREATE TABLE IF NOT EXISTS play_list_music(
    id_play_list_music INT AUTO_INCREMENT NOT NULL,
    id_play_list INT NOT NULL ,
    id_music INT NOT NULL ,
    PRIMARY KEY (id_play_list_music),
    FOREIGN KEY ( id_play_list) REFERENCES play_list(id_play_list)
);

CREATE TABLE IF NOT EXISTS download (
    id_download INT AUTO_INCREMENT NOT NULL,
    id_client INT NOT NULL,
    id_music INT NOT NULL,
    date_download DATETIME,
    PRIMARY KEY(id_download),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_music) REFERENCES music (id_music)
);

CREATE TABLE IF NOT EXISTS stream(
    id_stream INT AUTO_INCREMENT NOT NULL,
    id_music INT NOT NULL,
    id_client INT NOT NULL,
    date_stream DATETIME,
    PRIMARY KEY (id_stream),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_music) REFERENCES music (id_music)
);

CREATE TABLE IF NOT EXISTS musicien_notification (
    id_musicien_notification INT AUTO_INCREMENT NOT NULL,
    id_musicien INT NOT NULL,
    notification_content VARCHAR(255) NOT NULL,
    date_notification DATETIME NOT NULL,
    PRIMARY KEY (id_musicien_notification),
    FOREIGN KEY (id_musicien) REFERENCES musicien (id_musicien)
);

CREATE TABLE IF NOT EXISTS client_notification(
    id_client_notification INT AUTO_INCREMENT NOT NULL,
    id_client INT NOT NULL,
    notification_content VARCHAR(255),
    date_notification DATETIME NOT NULL,
    PRIMARY KEY (id_client_notification),
    FOREIGN KEY(id_client) REFERENCES client(id_client)
);

CREATE TABLE IF NOT EXISTS signalement(
    id_signalement INT AUTO_INCREMENT,
    id_client INT NOT NULL,
    id_musicien INT NOT NULL,
    type_signalement VARCHAR(255) NOT NULL,
    date_signalement DATETIME NOT NULL,
    PRIMARY KEY (id_signalement),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_musicien) REFERENCES musicien (id_musicien)
);
