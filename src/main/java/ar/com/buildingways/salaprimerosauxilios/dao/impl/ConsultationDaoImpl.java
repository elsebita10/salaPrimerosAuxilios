package ar.com.buildingways.salaprimerosauxilios.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import ar.com.buildingways.salaprimerosauxilios.dao.AbstractDao;
import ar.com.buildingways.salaprimerosauxilios.dao.ConsultationDao;
import ar.com.buildingways.salaprimerosauxilios.model.Consultation;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;

@Repository("consultationDao")
public class ConsultationDaoImpl extends AbstractDao<Integer, Consultation> implements ConsultationDao {
	
	static final Logger logger = LoggerFactory.getLogger(ConsultationDaoImpl.class);

	@Override
	public void saveConsultation(Consultation consultation) {
		if(consultation.getPatient().getId()==null){
			persist(consultation);
		} else {
			getSession().saveOrUpdate(consultation);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Consultation> getAllConsultations() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
//        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Consultation> consultations = (List<Consultation>) criteria.list();
        return consultations;
	}

	@Override
	public Consultation findById(Integer consultationId) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("id",consultationId));
		Consultation consultation = (Consultation) criteria.uniqueResult();
		return consultation;
	}

	@Override
	public Patient getPatientByConsultationId(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("id",id));
		Consultation consultation = (Consultation) criteria.uniqueResult();
		return consultation.getPatient();
	}

	@Override
	public Patient getPatientByDNI(Integer dni) {
		Criteria criteria = getSession().createCriteria(Patient.class, "patient");
		criteria.add(Restrictions.eq("dni",dni));
		Patient patient = (Patient) criteria.uniqueResult();
		return patient;
	}

	@Override
	public Patient getPatientByFullName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(Integer consultationId) {
		Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("id", consultationId));
        Consultation consultation = (Consultation)criteria.uniqueResult();
        Patient patient = consultation.getPatient();
        patient.getConsultations().remove(consultation);
        delete(consultation);
	}

}
