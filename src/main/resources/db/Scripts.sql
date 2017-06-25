/*All Users gets stored in USERS table*/
create table USERS (
   id BIGINT NOT NULL AUTO_INCREMENT,
   username VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   address VARCHAR(100) NOT NULL,
   email VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (username)
);

/*All Consultations gets stored in CONSULTATIONS table*/
create table CONSULTATIONS (
   id BIGINT NOT NULL AUTO_INCREMENT,
   t_a VARCHAR(100) NOT NULL,
   t VARCHAR(100) NOT NULL,
   fc VARCHAR(100) NOT NULL,
   spo2 VARCHAR(100) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (id)
);

/*All Pacients gets stored in PACIENTS table*/
create table PACIENTS (
   id BIGINT NOT NULL AUTO_INCREMENT,
   firstname VARCHAR(100) NOT NULL,
   lastname VARCHAR(100) NOT NULL,
   age INTEGER(3) NOT NULL,
   sex VARCHAR(30) NOT NULL,
   dni INTEGER(8) NOT NULL,
   email VARCHAR(100) NULL,
   address VARCHAR(100) NULL,
   phone INTEGER(20) NULL,
   PRIMARY KEY (id),
   UNIQUE (id)
);
   
/* USER_PROFILE table contains all possible roles */ 
create table USER_PROFILES(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);
   
/* JOIN TABLE for MANY-TO-MANY relationship*/  
CREATE TABLE USERS_USER_PROFILES (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_USERS FOREIGN KEY (user_id) REFERENCES USERS (id),
    CONSTRAINT FK_USER_PROFILES FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILES (id)
);
  
/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILES(type)
VALUES ('USER');
  
INSERT INTO USER_PROFILES(type)
VALUES ('ADMIN');
  
  
/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO USERS(username, password, address, email)
VALUES ('seba','abc123', '143 y 66','seba@buildingways.com.ar');
  
INSERT INTO USERS(username, password, address, email)
VALUES ('sala1','abc123', '143 y 66','sala1@buildingways.com.ar');
  
/* Populate JOIN Table */
INSERT INTO USERS_USER_PROFILES (user_id, user_profile_id)
  SELECT user.id, profile.id FROM users user, user_profiles profile
  where user.username='seba' and profile.type='ADMIN';
  
INSERT INTO USERS_USER_PROFILES (user_id, user_profile_id)
  SELECT user.id, profile.id FROM users user, user_profiles profile
  where user.username='sala1' and profile.type='USER';
 
/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE PERSISTENT_LOGINS (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    lastUsed TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);