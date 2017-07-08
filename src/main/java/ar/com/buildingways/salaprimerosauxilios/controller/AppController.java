package ar.com.buildingways.salaprimerosauxilios.controller;


import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import ar.com.buildingways.salaprimerosauxilios.model.User;
import ar.com.buildingways.salaprimerosauxilios.model.UserProfile;
import ar.com.buildingways.salaprimerosauxilios.service.UserProfileService;
import ar.com.buildingways.salaprimerosauxilios.service.UserService;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;
import ar.com.buildingways.salaprimerosauxilios.service.ConsultationService;
import ar.com.buildingways.salaprimerosauxilios.service.PatientService;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AppController {
	
	@Autowired
	UserService userService;
	@Autowired
	UserProfileService userProfileService;
	@Autowired
	MessageSource messageSource;
	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	@Autowired
	ConsultationService consultationService;
	@Autowired
	PatientService patientService;
	
	/**
	 * This method returns to home page.
	 */
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String returnHome(ModelMap model) {
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "commons/home";
	}
	
	/**
	 * This method returns to the consultation form.
	 */
	@RequestMapping(value = { "/create-consultation" }, method = RequestMethod.GET)
	public String createConsultation(ModelMap model) {
	    Consultation consultation = new Consultation();
		model.addAttribute("loggedinuser", getPrincipal());
	    model.addAttribute("consultation", consultation);
	    return "consultations/consultationForm";
	}
	
	/**
	 * This method stores the new consultation in DB
	 */
	@RequestMapping(value = { "/create-consultation" }, method = RequestMethod.POST)
	public String saveConsultation(@Valid Consultation consultation, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "consultations/consultationForm";
		}
	    consultationService.saveConsultation(consultation);
	    model.addAttribute("success", "La consulta del paciente " + consultation.getPatient().getFirstName() + " "+ consultation.getPatient().getLastName() + " fue registrada con éxito.");
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "consultations/consultationFormSuccess";
	}
	
	/**
	 * This method open the metrics page.
	 */
	@RequestMapping(value = { "/get-metrics" }, method = RequestMethod.GET)
	public String getMetrics(ModelMap model) {
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "metrics/metrics";
	}
	
	/**
	 * This method returns all consultations in DB.
	 */
	@RequestMapping(value = { "/getallconsultations" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Consultation>> getAllConsultations(ModelMap model) {
		List<Consultation> consultations = consultationService.getAllConsultations();
	    model.addAttribute("loggedinuser", getPrincipal());
	    return new ResponseEntity<List<Consultation>>(consultations,HttpStatus.OK);
	}
	
	/**
	 * This method returns all patients in DB.
	 */
	@RequestMapping(value = { "/getallpatients" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Patient>> getAllPatients(ModelMap model) {
		List<Patient> patients = patientService.getAllPatients();
	    model.addAttribute("loggedinuser", getPrincipal());
	    return new ResponseEntity<List<Patient>>(patients,HttpStatus.OK);
	}
	
	/**
	 * This method will list all existing users.
	 */
	@RequestMapping(value = { "/list-users" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		List<User> users = userService.findAllUsers();
	    model.addAttribute("users", users);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "users/usersList";
	}
	 
	/**
	 * This method will provide the medium to add a new user.
	*/
	@RequestMapping(value = { "/create-user" }, method = RequestMethod.GET)
	public String createUser(ModelMap model) {
		User user = new User();
	    model.addAttribute("user", user);
	    model.addAttribute("edit", false);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "users/userForm";
	}
	 
	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/create-user" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "users/userForm";
		}
        if(!userService.isUsernameUnique(user.getId(), user.getUsername())){
        	FieldError usernameError =new FieldError("user","username",messageSource.getMessage("non.unique.username", new String[]{user.getUsername()}, Locale.getDefault()));
	        result.addError(usernameError);
	        return "users/userForm";
	    }
	    userService.saveUser(user);
	    model.addAttribute("success", "El usuario '" + user.getUsername() + "' fue registrado con éxito.");
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "users/userFormSuccess";
	}
	 
	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-user-{username}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String username, ModelMap model) {
		User user = userService.findByUsername(username);
	    model.addAttribute("user", user);
	    model.addAttribute("edit", true);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "users/userForm";
	}
	     
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{username}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String username) {
		if (result.hasErrors()) {
			return "users/userForm";
	    }
	 
	    if(!userService.isUsernameUnique(user.getId(), user.getUsername())){
	    	FieldError usernameError =new FieldError("user","username",messageSource.getMessage("non.unique.username", new String[]{user.getUsername()}, Locale.getDefault()));
	       	result.addError(usernameError);
	        return "users/userForm";
	    }
	 
	    userService.updateUser(user);
	    model.addAttribute("success", "El usuario '" + user.getUsername() + "' fue actualizado con éxito.");
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "users/userFormSuccess";
	}
	 
	/**
	 * This method will delete an user by it's Username value.
	 */
	@RequestMapping(value = { "/delete-user-{username}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String username, ModelMap model) {
		if(username.equals(getPrincipal())){
			model.addAttribute("error", "El usuario '" + username + "' se encuentra logueado en el sistema y no puede eliminarse. " + System.getProperty("line.separator") + "Ingrese con otro usuario con rol de ADMIN para eliminarlo.");
			return "accessDenied";
		} else {
			userService.deleteUserByUsername(username);
			model.addAttribute("success", "El usuario '" + username + "' fue eliminado con éxito.");
		    model.addAttribute("loggedinuser", getPrincipal());
		    return "users/userFormSuccess";
		}
	}
	     
	/**
	  * This method will provide UserProfile list to views
	  */
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}
	     
	/**
	  * This method handles Access-Denied redirect.
	  */
	@RequestMapping(value = "/Acceso_Denegado", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
	    return "commons/accessDenied";
	}
	 
    /**
      * This method handles login GET requests.
	  * If users is already logged-in and tries to goto login page again, will be redirected to list page.
	  */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
	    } else {
	        return "redirect:/commons/home";  
	    }
	}
	 
	/**
	  * This method handles logout requests.
	  * Toggle the handlers if you are RememberMe functionality is useless in your app.
	  */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	    	//new SecurityContextLogoutHandler().logout(request, response, auth);
	    	persistentTokenBasedRememberMeServices.logout(request, response, auth);
	        SecurityContextHolder.getContext().setAuthentication(null);
	    }
	    return "redirect:/login?logout";
	}
	 
	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (principal instanceof UserDetails) {
	    	userName = ((UserDetails)principal).getUsername();
	    } else {
	        userName = principal.toString();
	    }
	    	return userName;
	}
	     
	/**
	  * This method returns true if users is already authenticated [logged-in], else false.
	  */
	private boolean isCurrentAuthenticationAnonymous() {
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    return authenticationTrustResolver.isAnonymous(authentication);
	}

}
