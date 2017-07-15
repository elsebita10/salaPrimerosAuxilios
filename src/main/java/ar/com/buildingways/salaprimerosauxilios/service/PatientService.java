package ar.com.buildingways.salaprimerosauxilios.service;

import java.util.List;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;

public interface PatientService {
	
	Patient findById(Integer id);

	Patient findByDni(Integer dni);

	void updatePatient(Patient patient);

	void deletePatientById(Integer id);

	List<Patient> getAllPatients();

}
