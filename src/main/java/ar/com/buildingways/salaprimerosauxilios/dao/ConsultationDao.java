package ar.com.buildingways.salaprimerosauxilios.dao;

import java.util.List;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;

public interface ConsultationDao {
	
	void saveConsultation(Consultation row);

	List<Consultation> getAllConsultations();

}
