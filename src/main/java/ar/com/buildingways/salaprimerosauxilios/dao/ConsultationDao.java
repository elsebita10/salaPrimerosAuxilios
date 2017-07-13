package ar.com.buildingways.salaprimerosauxilios.dao;

import java.util.List;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;

public interface ConsultationDao {
	
	void saveConsultation(Consultation row);

	List<Consultation> getAllConsultations();

	Consultation findById(Integer consultationId);

	Patient getPatientByConsultationId(Integer id);
	
	Patient getPatientByDNI(Integer dni);
	
	Patient getPatientByFullName();

	void deleteById(Integer consultationId);

}
