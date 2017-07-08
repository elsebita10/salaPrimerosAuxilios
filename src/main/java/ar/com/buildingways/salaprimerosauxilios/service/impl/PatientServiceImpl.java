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
	public List<Patient> getAllPatients() {
		return patientDao.getAllPatients();
	}

}
