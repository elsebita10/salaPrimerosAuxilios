package ar.com.buildingways.salaprimerosauxilios.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ar.com.buildingways.salaprimerosauxilios.dao.UserDao;
import ar.com.buildingways.salaprimerosauxilios.model.User;
import ar.com.buildingways.salaprimerosauxilios.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
    private UserDao userDao;
 
    @Autowired
    private PasswordEncoder passwordEncoder;
    
	@Override
	public User findById(int id) {
		return userDao.findById(id);
	}

	@Override
	public User findByUsername(String username) {
		User user = userDao.findByUsername(username);
        return user;
	}

	@Override
	public void saveUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDao.save(user);
	}

	@Override
	public void updateUser(User user) {
		User entity = userDao.findById(user.getId());
        if(entity!=null){
            entity.setUsername(user.getUsername());
            if(!user.getPassword().equals(entity.getPassword())){
                entity.setPassword(passwordEncoder.encode(user.getPassword()));
            }
            entity.setAddress(user.getAddress());
            entity.setEmail(user.getEmail());
            entity.setUserProfiles(user.getUserProfiles());
        }
	}

	@Override
	public void deleteUserByUsername(String username) {
		userDao.deleteByUsername(username);
	}

	@Override
	public List<User> findAllUsers() {
		return userDao.findAllUsers();
	}

	@Override
	public boolean isUsernameUnique(Integer id, String username) {
		User user = findByUsername(username);
        return ( user == null || ((id != null) && (user.getId() == id)));
	}

}
