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

/*All Pacients gets stored in PATIENTS table*/
create table PATIENTS (
   id BIGINT NOT NULL AUTO_INCREMENT,
   firstname VARCHAR(100) NOT NULL,
   lastname VARCHAR(100) NOT NULL,
   age INTEGER(3) NOT NULL,
   sex VARCHAR(30) NOT NULL,
   dni INTEGER(8) NOT NULL,
   email VARCHAR(100) NULL,
   address VARCHAR(100) NULL,
   phone VARCHAR(20) NULL,
   PRIMARY KEY (id),
   UNIQUE (id)
);

/*All Consultations gets stored in CONSULTATIONS table*/
create table CONSULTATIONS (
   id BIGINT NOT NULL AUTO_INCREMENT,
   t_a VARCHAR(100) NOT NULL,
   t VARCHAR(100) NOT NULL,
   fc VARCHAR(100) NOT NULL,
   spo2 VARCHAR(100) NOT NULL,
   reason VARCHAR(100) NOT NULL,
   medical_history VARCHAR(100) NOT NULL,
   same BOOLEAN NOT NULL,
   doctor VARCHAR(50) NULL,
   ambulance VARCHAR(20) NULL,
   patient_transport BOOLEAN NULL,
   medical_institution VARCHAR(100) NULL,
   created_date DATETIME NOT NULL,
   last_modified_date DATETIME NULL,
   patient_id BIGINT NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (id),
   CONSTRAINT consultation_patient FOREIGN KEY (patient_id) REFERENCES PATIENTS (id) ON UPDATE CASCADE ON DELETE CASCADE
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
  
 
/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE PERSISTENT_LOGINS (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    lastUsed TIMESTAMP NOT NULL,
    PRIMARY KEY (series)