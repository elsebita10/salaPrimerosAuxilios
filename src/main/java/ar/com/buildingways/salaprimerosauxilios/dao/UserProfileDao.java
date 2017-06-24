package ar.com.buildingways.salaprimerosauxilios.dao;

import java.util.List;

import ar.com.buildingways.salaprimerosauxilios.model.UserProfile;

public interface UserProfileDao {

	List<UserProfile> findAll();
    
    UserProfile findByType(String type);
     
    UserProfile findById(int id);
}
