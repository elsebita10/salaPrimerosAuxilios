package ar.com.buildingways.salaprimerosauxilios.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ar.com.buildingways.salaprimerosauxilios.dao.ConsultationDao;
import ar.com.buildingways.salaprimerosauxilios.dto.ConsultationDTO;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;
import ar.com.buildingways.salaprimerosauxilios.service.ConsultationService;

@Service("consultationService")
@Transactional
public class ConsultationServiceImpl implements ConsultationService{


	@Autowired
    private ConsultationDao consultationDao;
	
	public void saveConsultation(Consultation consultation) {
		consultationDao.saveConsultation(consultation);
	}

	@Override
	public List<Consultation> getAllConsultations() {
		return consultationDao.getAllConsultations();
	}

	@Override
	public Consultation findById(Integer consultationId) {
		return consultationDao.findById(consultationId);
	}

	@Override
	public void updateConsultation(ConsultationDTO consultationDTO) {
		Consultation entity = consultationDao.findById(consultationDTO.getId());
        if(entity!=null){
            entity.setT_a(consultationDTO.getT_a());
            entity.setT(consultationDTO.getT());
            entity.setFc(consultationDTO.getFc());
            entity.setSpo2(consultationDTO.getSpo2());
            entity.setReason(consultationDTO.getReason());
            entity.setMedicalHistory(consultationDTO.getMedicalHistory());
            entity.setSame(consultationDTO.isSame());
            entity.setDoctor(consultationDTO.getDoctor());
            entity.setAmbulance(consultationDTO.getAmbulance());
            entity.setPatientTransport(consultationDTO.isPatientTransport());
            entity.setMedicalInstitution(consultationDTO.getMedicalInstitution());
            entity.setLastModifiedDate(new Date());
            Patient patient = entity.getPatient();
            patient.setFirstName(consultationDTO.getFirstName());
            patient.setLastName(consultationDTO.getLastName());
            patient.setAge(consultationDTO.getAge());
            patient.setSex(consultationDTO.getSex());
            patient.setDni(consultationDTO.getDni());
            patient.setEmail(consultationDTO.getEmail());
            patient.setAddress(consultationDTO.getAddress());
            patient.setPhone(consultationDTO.getPhone());
            entity.setPatient(patient);
        }
	}

	@Override
	public void deleteConsultationById(Integer consultationId) {
		consultationDao.deleteById(consultationId);
		
	}

	@Override
	public ConsultationDTO convertObjectToDTO(Consultation consultation) {
		ConsultationDTO consultationDTO = new ConsultationDTO();
		consultationDTO.setId(consultation.getId());
		consultationDTO.setT_a(consultation.getT_a());
        consultationDTO.setT(consultation.getT());
        consultationDTO.setFc(consultation.getFc());
        consultationDTO.setSpo2(consultation.getSpo2());
        consultationDTO.setReason(consultation.getReason());
        consultationDTO.setMedicalHistory(consultation.getMedicalHistory());
        consultationDTO.setSame(consultation.isSame());
        consultationDTO.setDoctor(consultation.getDoctor());
        consultationDTO.setAmbulance(consultation.getAmbulance());
        consultationDTO.setPatientTransport(consultation.isPatientTransport());
        consultationDTO.setMedicalInstitution(consultation.getMedicalInstitution());
        consultationDTO.setLastModifiedDate(new Date());
        Patient patient = consultation.getPatient();
        consultationDTO.setFirstName(patient.getFirstName());
        consultationDTO.setLastName(patient.getLastName());
        consultationDTO.setAge(patient.getAge());
        consultationDTO.setSex(patient.getSex());
        consultationDTO.setDni(patient.getDni());
        consultationDTO.setEmail(patient.getEmail());
        consultationDTO.setAddress(patient.getAddress());
        patient.setPhone(patient.getPhone());
		return consultationDTO;
	}

	@Override
	public Consultation convertDTOToObject(ConsultationDTO consultationDTO) {
		Consultation consultation = new Consultation();
		consultation.setId(consultationDTO.getId());
		consultation.setT_a(consultationDTO.getT_a());
        consultation.setT(consultationDTO.getT());
        consultation.setFc(consultationDTO.getFc());
        consultation.setSpo2(consultationDTO.getSpo2());
        consultation.setReason(consultationDTO.getReason());
        consultation.setMedicalHistory(consultationDTO.getMedicalHistory());
        consultation.setSame(consultationDTO.isSame());
        consultation.setDoctor(consultationDTO.getDoctor());
        consultation.setAmbulance(consultationDTO.getAmbulance());
        consultation.setPatientTransport(consultationDTO.isPatientTransport());
        consultation.setMedicalInstitution(consultationDTO.getMedicalInstitution());
        consultation.setLastModifiedDate(new Date());
        Patient patient = consultationDao.getPatientByDNI(Integer.valueOf(consultationDTO.getDni()));
        if (patient==null)
        	patient = new Patient();
        patient.setDni(consultationDTO.getDni());
        patient.setFirstName(consultationDTO.getFirstName());
        patient.setLastName(consultationDTO.getLastName());
        patient.setAge(consultationDTO.getAge());
        patient.setSex(consultationDTO.getSex());
        patient.setDni(consultationDTO.getDni());
        patient.setEmail(consultationDTO.getEmail());
        patient.setAddress(consultationDTO.getAddress());
        patient.setPhone(consultationDTO.getPhone());
        consultation.setPatient(patient);
		return consultation;
	}

}
