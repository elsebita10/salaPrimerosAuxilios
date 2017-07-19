package ar.com.buildingways.salaprimerosauxilios.service;

import java.util.List;

import ar.com.buildingways.salaprimerosauxilios.dto.ConsultationDTO;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;

public interface ConsultationService {

	void saveConsultation(Consultation consultation);

	List<Consultation> getAllConsultations();

	Consultation findById(Integer consultationId);

	void updateConsultation(ConsultationDTO consultationDTO);

	void deleteConsultationById(Integer consultationId);

	ConsultationDTO convertObjectToDTO(Consultation consultation);
	
	Consultation convertDTOToObject(ConsultationDTO consultationDTO);

	ConsultationDTO getConsultationDTOQWithPatient(ConsultationDTO consultationDTO, Patient patient);
	
}
