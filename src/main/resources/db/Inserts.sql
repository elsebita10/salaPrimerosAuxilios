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