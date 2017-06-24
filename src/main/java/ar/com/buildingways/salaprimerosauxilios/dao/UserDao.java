package ar.com.buildingways.salaprimerosauxilios.dao;

import java.util.List;

import ar.com.buildingways.salaprimerosauxilios.model.User;

public interface UserDao {

	User findById(int id);
    
    User findByUsername(String username);
     
    void save(User user);
     
    void deleteByUsername(String username);
     
    List<User> findAllUsers();
}
