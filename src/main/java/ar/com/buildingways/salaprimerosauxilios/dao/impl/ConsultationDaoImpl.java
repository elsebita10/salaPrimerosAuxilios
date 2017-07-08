package ar.com.buildingways.salaprimerosauxilios.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import ar.com.buildingways.salaprimerosauxilios.dao.AbstractDao;
import ar.com.buildingways.salaprimerosauxilios.dao.ConsultationDao;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;

@Repository("consultationDao")
public class ConsultationDaoImpl extends AbstractDao<Integer, Consultation> implements ConsultationDao {
	
	static final Logger logger = LoggerFactory.getLogger(ConsultationDaoImpl.class);

	@Override
	public void saveConsultation(Consultation consultation) {
		persist(consultation);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Consultation> getAllConsultations() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
//        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Consultation> consultations = (List<Consultation>) criteria.list();
        return consultations;
	}

}
