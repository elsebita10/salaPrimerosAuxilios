package ar.com.buildingways.salaprimerosauxilios.service;

import java.util.List;
import ar.com.buildingways.salaprimerosauxilios.model.User;

public interface UserService {

	User findById(int id);
    
    User findByUsername(String username);
     
    void saveUser(User user);
     
    void updateUser(User user);
     
    void deleteUserByUsername(String username);
 
    List<User> findAllUsers(); 
     
    boolean isUsernameUnique(Integer id, String username);
}
