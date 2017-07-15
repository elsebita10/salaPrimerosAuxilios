package ar.com.buildingways.salaprimerosauxilios.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import ar.com.buildingways.salaprimerosauxilios.dao.AbstractDao;
import ar.com.buildingways.salaprimerosauxilios.dao.PatientDao;
import ar.com.buildingways.salaprimerosauxilios.model.Patient;

@Repository("patientDao")
public class PatientDaoImpl extends AbstractDao<Integer, Patient> implements PatientDao {

	@Override
	public Patient findById(Integer id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("id",id));
		Patient patient = (Patient) criteria.uniqueResult();
		return patient;
	}

	@Override
	public Patient findByDni(Integer dni) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("dni",dni));
		Patient patient = (Patient) criteria.uniqueResult();
		return patient;
	}

	@Override
	public void deleteById(Integer id) {
		Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("id", id));
        Patient patient = (Patient)criteria.uniqueResult();
        delete(patient);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Patient> getAllPatients() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Patient> patients = (List<Patient>) criteria.list();
		return patients;
	}

}
