package ar.com.buildingways.salaprimerosauxilios.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.buildingways.salaprimerosauxilios.dao.UserProfileDao;
import ar.com.buildingways.salaprimerosauxilios.model.UserProfile;
import ar.com.buildingways.salaprimerosauxilios.service.UserProfileService;

@Service("userProfileService")
@Transactional
public class UserProfileServiceImpl implements UserProfileService{

	@Autowired
    UserProfileDao userProfileDao;
	
	@Override
	public UserProfile findById(int id) {
		return userProfileDao.findById(id);
	}

	@Override
	public UserProfile findByType(String type) {
		return userProfileDao.findByType(type);
	}

	@Override
	public List<UserProfile> findAll() {
		return userProfileDao.findAll();
	}
	
	
}
