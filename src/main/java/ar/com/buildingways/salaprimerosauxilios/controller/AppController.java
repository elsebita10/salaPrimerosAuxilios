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

import ar.com.buildingways.salaprimerosauxilios.dto.ConsultationDTO;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;
import ar.com.buildingways.salaprimerosauxilios.model.User;
import ar.com.buildingways.salaprimerosauxilios.model.UserProfile;
import ar.com.buildingways.salaprimerosauxilios.service.ConsultationService;
import ar.com.buildingways.salaprimerosauxilios.service.PatientService;
import ar.com.buildingways.salaprimerosauxilios.service.UserProfileService;
import ar.com.buildingways.salaprimerosauxilios.service.UserService;

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
		List<Patient> patients =patientService.getAllPatients();
	    model.addAttribute("loggedinuser", getPrincipal());
	    return new ResponseEntity<List<Patient>>(patients,HttpStatus.OK);
	}
	
	/**
	 * This method will list all existing consultations.
	 */
	@RequestMapping(value = { "/list-consultations" }, method = RequestMethod.GET)
	public String listConsultations(ModelMap model) {
		List<Consultation> consultations = consultationService.getAllConsultations();
	    model.addAttribute("consultations", consultations);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "consultations/consultationsList";
	}
	
	/**
	 * This method returns to the consultation form.
	 */
	@RequestMapping(value = { "/create-consultation" }, method = RequestMethod.GET)
	public String createConsultation(ModelMap model) {
	    ConsultationDTO consultationDTO = new ConsultationDTO();
		model.addAttribute("loggedinuser", getPrincipal());
	    model.addAttribute("consultationDTO", consultationDTO);
	    return "consultations/consultationForm";
	}
	
	/**
	 * This method stores the new consultation in DB
	 */
	@RequestMapping(value = { "/create-consultation" }, method = RequestMethod.POST)
	public String saveConsultation(@Valid ConsultationDTO consultationDTO, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "consultations/consultationForm";
		}
	    consultationService.saveConsultation(consultationService.convertDTOToObject(consultationDTO));
		model.addAttribute("id", consultationDTO.getId());
	    model.addAttribute("success", "La consulta del paciente " + consultationDTO.getFirstName() + " "+ consultationDTO.getLastName() + " fue registrada con éxito.");
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "consultations/consultationFormSuccess";
	}

	/**
	 * This method will provide the medium to update an existing consultation.
	 */
	@RequestMapping(value = { "/edit-consultation-{consultationId}" }, method = RequestMethod.GET)
	public String editConsultation(@PathVariable Integer consultationId, ModelMap model) {
		Consultation consultation = consultationService.findById(consultationId);
		ConsultationDTO consultationDTO = consultationService.convertObjectToDTO(consultation);
	    model.addAttribute("consultationDTO", consultationDTO);
	    model.addAttribute("edit", true);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "consultations/consultationForm";
	}
	     
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating consultation in database. It also validates the consultation input
	 */
	@RequestMapping(value = { "/edit-consultation-{consultationId}" }, method = RequestMethod.POST)
	public String updateConsultation(@Valid ConsultationDTO consultationDTO, BindingResult result, ModelMap model, @PathVariable Integer consultationId) {
		if (result.hasErrors()) {
			return "consultations/consultationForm";
	    }
	 
	    if(consultationService.findById(consultationId)==null){
	    	FieldError consultationIdError =new FieldError("consultation","id",messageSource.getMessage("not.consultation.exist", new Integer [] {consultationId}, Locale.getDefault()));
	       	result.addError(consultationIdError);
	        return "consultations/consultationForm";
	    }
	 
	    consultationService.updateConsultation(consultationDTO);
	    model.addAttribute("success", "La consulta '" + consultationDTO.getId() + "' fue actualizada con éxito.");
	    model.addAttribute("id", consultationDTO.getId());
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "consultations/consultationFormSuccess";
	}
	 
	/**
	 * This method will delete an consultation by it's ID value.
	 */
	@RequestMapping(value = { "/delete-consultation-{consultationId}" }, method = RequestMethod.GET)
	public String deleteConsultation(@PathVariable Integer consultationId, ModelMap model) {
		consultationService.deleteConsultationById(consultationId);
		model.addAttribute("success", "La consulta '" + consultationId + "' fue eliminada con éxito.");
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "consultations/consultationFormSuccess";
	}
	
	
	/**
	 * This method will list all existing users.
	 */
	@RequestMapping(value = { "/list-users" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		int usersCount=0;
		List<User> users = userService.findAllUsers();
		if (users!=null)
			usersCount = users.size();
	    model.addAttribute("users", users);
	    model.addAttribute("usersCount", usersCount);
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
	 * This method will provide the medium to see the info of an existing user.
	 */
	@RequestMapping(value = { "/info-user-{username}" }, method = RequestMethod.GET)
	public String infoUser(@PathVariable String username, ModelMap model) {
		User user = userService.findByUsername(username);
	    model.addAttribute("user", user);
	    model.addAttribute("edit", false);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "users/userDetails";
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
	 * This method will list all existing patients.
	 */
	@RequestMapping(value = { "/list-patients" }, method = RequestMethod.GET)
	public String listPatients(ModelMap model) {
		List<Patient> patients = patientService.getAllPatients();
	    model.addAttribute("patients", patients);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "patients/patientsList";
	}
	
	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-patient-{id}" }, method = RequestMethod.GET)
	public String editPatient(@PathVariable Integer id, ModelMap model) {
		Patient patient = patientService.findById(id);
	    model.addAttribute("patient", patient);
	    model.addAttribute("edit", true);
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "patients/patientForm";
	}
	     
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-patient-{id}" }, method = RequestMethod.POST)
	public String updatePatient(@Valid Patient patient, BindingResult result, ModelMap model, @PathVariable Integer id) {
		if (result.hasErrors()) {
			return "patients/patientForm";
	    }
	 
	    if(patientService.findByDni(patient.getDni())==null){
	    	FieldError patientError =new FieldError("patient","dni",messageSource.getMessage("not.patient.exists", new String[]{patient.getDni().toString()}, Locale.getDefault()));
	       	result.addError(patientError);
	        return "patients/patientForm";
	    }
	 
	    patientService.updatePatient(patient);
	    model.addAttribute("success", "El paciente con DNI " + patient.getDni() + " fue actualizado con éxito.");
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "patients/patientFormSuccess";
	}
	 
	/**
	 * This method will delete an user by it's Username value.
	 */
	@RequestMapping(value = { "/delete-patient-{id}" }, method = RequestMethod.GET)
	public String deletePatient(@PathVariable Integer id, ModelMap model) {
		Integer dniPatientDeleted = patientService.findById(id).getDni();
		patientService.deletePatientById(id);
		model.addAttribute("success", "El paciente con DNI " + dniPatientDeleted + " fue eliminado con éxito.");
	    model.addAttribute("loggedinuser", getPrincipal());
	    return "patients/patientFormSuccess";
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
