/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILES(type) VALUES ('1','USER');  
INSERT INTO USER_PROFILES(type) VALUES ('2','ADMIN');
  
/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO USERS(username, password, address, email) VALUES ('sala1','abc123', '143 y 66','sala1@buildingways.com.ar');
INSERT INTO USERS(username, password, address, email) VALUES ('seba','abc123', '143 y 66','seba@buildingways.com.ar');
  
/* Populate JOIN Table */
INSERT INTO USERS_USER_PROFILES (user_id, user_profile_id) VALUES ('2','1');
INSERT INTO USERS_USER_PROFILES (user_id, user_profile_id) VALUES ('1','2');

/* Populate PATIENTS Table */
INSERT INTO PATIENTS (firstname,lastname,age,sex,dni,email,address,phone) VALUES ('Cosme','Fulanito',30,'Masculino',32242389,'cosmefulanito@gmail.com','Siempreviva 731',89898998);
INSERT INTO PATIENTS (firstname,lastname,age,sex,dni,email,address,phone) VALUES ('Lalo','Landa',27,'Masculino',32342355,'lalolanda@gmail.com','Siempreviva 730',89897000);
INSERT INTO PATIENTS (firstname,lastname,age,sex,dni,email,address,phone) VALUES ('Bubby','Curvas',29,'Femenino',32347667,'bubbycurvas@gmail.com','Siempreviva 729',89896500);

/* Populate CONSULTATIONS Table */
INSERT INTO CONSULTATIONS (t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,patient_id) VALUES ('aaaaa','bbbbbb','ccccccc','dddddddd','Contención emocional','HTA',1,'Doctor Cachetes',3224,1,'Los Aromos',1);
INSERT INTO CONSULTATIONS (t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,patient_id) VALUES ('eeeee','ffffff','ggggggg','hhhhhhhh','Cefalea, náuseas, mareos, vómitos','Alergia',1,'Doctor Cachetes',3224,1,'Los Aromos',2);
INSERT INTO CONSULTATIONS (t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,patient_id) VALUES ('iiiii','jjjjjj','kkkkkkk','llllllll','Febrícula','Hipoglucemia',1,'Doctor Cachetes',3224,0,null,3);
INSERT INTO CONSULTATIONS (t_a,t,fc,spo2,reason,medical_history,same,doctor,ambulance,patient_transport,medical_institution,patient_id) VALUES ('00000','mmmmmm','nnnnnnn','pppppppp','Contención emocional','Hipoglucemia',0,null,null,null,null,1);