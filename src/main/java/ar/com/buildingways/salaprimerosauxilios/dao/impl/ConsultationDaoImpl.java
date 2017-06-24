package ar.com.buildingways.salaprimerosauxilios.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import ar.com.buildingways.salaprimerosauxilios.dao.AbstractDao;
import ar.com.buildingways.salaprimerosauxilios.dao.ConsultationDao;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;

@Repository("consultationDao")
public class ConsultationDaoImpl extends AbstractDao<Integer, Consultation>implements ConsultationDao {
	
	static final Logger logger = LoggerFactory.getLogger(ConsultationDaoImpl.class);

	@Override
	public void save(Consultation consultation) {
		persist(consultation);

	}

}
