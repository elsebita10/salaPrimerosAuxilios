package ar.com.buildingways.salaprimerosauxilios.service;

import java.util.List;

import ar.com.buildingways.salaprimerosauxilios.model.UserProfile;

public interface UserProfileService {

	UserProfile findById(int id);
	 
    UserProfile findByType(String type);
     
    List<UserProfile> findAll();
}
