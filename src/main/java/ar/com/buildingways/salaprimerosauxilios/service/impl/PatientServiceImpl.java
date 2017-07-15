package ar.com.buildingways.salaprimerosauxilios.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.com.buildingways.salaprimerosauxilios.dao.PatientDao;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;
import ar.com.buildingways.salaprimerosauxilios.service.PatientService;

@Service("patientService")
@Transactional
public class PatientServiceImpl implements PatientService {

	@Autowired
    private PatientDao patientDao;
	
	@Override
	public Patient findById(Integer id) {
		return patientDao.findById(id);
	}

	@Override
	public Patient findByDni(Integer dni) {
		return patientDao.findByDni(dni);
	}

	@Override
	public void updatePatient(Patient patient) {
		Patient entity = patientDao.findById(patient.getId());
        if(entity!=null){
        	entity.setId(patient.getId());
            entity.setFirstName(patient.getFirstName());
            entity.setLastName(patient.getLastName());
            entity.setAge(patient.getAge());
            entity.setSex(patient.getSex());
            entity.setDni(patient.getDni());
            entity.setAddress(patient.getAddress());
            entity.setEmail(patient.getEmail());
            entity.setPhone(patient.getPhone());
            entity.setConsultations(patient.getConsultations());
        }
	}

	@Override
	public void deletePatientById(Integer id) {
		patientDao.deleteById(id);
	}

	@Override
	public List<Patient> getAllPatients() {
		return patientDao.getAllPatients();
	}

}
