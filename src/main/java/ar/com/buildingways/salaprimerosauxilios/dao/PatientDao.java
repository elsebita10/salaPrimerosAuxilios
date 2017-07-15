package ar.com.buildingways.salaprimerosauxilios.dao;

import java.util.List;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;

public interface PatientDao {
	
	Patient findById(Integer id);

	Patient findByDni(Integer dni);

	void deleteById(Integer id);

	List<Patient> getAllPatients();

}
