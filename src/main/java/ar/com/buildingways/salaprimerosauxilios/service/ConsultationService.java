package ar.com.buildingways.salaprimerosauxilios.service;

import java.util.List;

import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.service.ConsultationService;

public interface ConsultationService {

	void saveConsultation(Consultation consultation);

	List<Consultation> getAllConsultations();
}
