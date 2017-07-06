package ar.com.buildingways.salaprimerosauxilios.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ar.com.buildingways.salaprimerosauxilios.dao.ConsultationDao;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.service.ConsultationService;

@Service("consultationService")
@Transactional
public class ConsultationServiceImpl implements ConsultationService{


	@Autowired
    private ConsultationDao consultationDao;
	
	public void saveConsultation(Consultation consultation) {
		consultationDao.save(consultation);
	}

	@Override
	public void getMetrics() {
		// TODO Auto-generated method stub
		
	}


}
