/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILES(type) VALUES ('USER');  
INSERT INTO USER_PROFILES(type) VALUES ('ADMIN');
  
/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO USERS(username, password, address, email) VALUES ('sala1','abc123', '143 y 66','sala1@buildingways.com.ar');
INSERT INTO USERS(username, password, address, email) VALUES ('seba','abc123', '143 y 66','seba@buildingways.com.ar');
  
/* Populate JOIN Table */
INSERT INTO USERS_USER_PROFILES (user_id, user_profile_id) VALUES ('2','1');
INSERT INTO USERS_USER_PROFILES (user_id, user_profile_id) VALUES ('1','2');

/* Populate PATIENTS Table */
INSERT INTO PATIENTS (id,firstname,lastname,age,sex,dni,email,address,phone) VALUES (1,'Cosme','Fulanito',30,'Masculino',32242389,'cosmefulanito@gmail.com','Siempreviva 731',89898998);
INSERT INTO PATIENTS (id,firstname,lastname,age,sex,dni,email,address,phone) VALUES (2,'Lalo','Landa',27,'Masculino',32342355,'lalolanda@gmail.com','Siempreviva 730',89897000);
INSERT INTO PATIENTS (id,firstname,lastname,age,sex,dni,email,address,phone) VALUES (3,'Bubby','Curvas',29,'Femenino',32347667,'bubbycurvas@gmail.com','Siempreviva 729',89896500);

/* Populate CONSULTATIONS Table */
INSERT INTO CONSULTATIONS (id,t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,created_date,last_modified_date,patient_id) VALUES (1,'aaaaa','bbbbbb','ccccccc','dddddddd','Contención emocional','HTA',1,'Doctor Cachetes',3224,1,'Los Aromos','2017-03-23 11:00:00',null,1);
INSERT INTO CONSULTATIONS (id,t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,created_date,last_modified_date,patient_id) VALUES (2,'eeeee','ffffff','ggggggg','hhhhhhhh','Cefalea, náuseas, mareos, vómitos','Alergia',1,'Doctor Cachetes',3224,1,'Los Aromos','2017-03-23 13:00:00',null,2);
INSERT INTO CONSULTATIONS (id,t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,created_date,last_modified_date,patient_id) VALUES (3,'iiiii','jjjjjj','kkkkkkk','llllllll','Febrícula','Hipoglucemia',1,'Doctor Cachetes',3224,0,null,'2017-03-23 17:00:00',null,3);
INSERT INTO CONSULTATIONS (id,t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,created_date,last_modified_date,patient_id) VALUES (4,'00000','mmmmmm','nnnnnnn','pppppppp','Contención emocional','Hipoglucemia',0,null,null,0,null,'2017-03-20 16:00:00',null,1);
INSERT INTO CONSULTATIONS (id,t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,created_date,last_modified_date,patient_id) VALUES (5,'iiiii','jjjjjj','kkkkkkk','llllllll','Dolor abdominal, lumbar','Alergia',0,null,null,0,null,'2017-03-21 16:00:00',null,2);
INSERT INTO CONSULTATIONS (id,t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,created_date,last_modified_date,patient_id) VALUES (6,'00000','mmmmmm','nnnnnnn','pppppppp','Adormecimiento MS','Asma',0,null,null,0,null,'2017-03-21 10:00:00',null,2);