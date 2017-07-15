package ar.com.buildingways.salaprimerosauxilios.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="CONSULTATIONS")
public class Consultation {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
	
	@NotEmpty
	@Column(name="T_A", nullable=false)
	private String t_a;
	
	@NotEmpty
	@Column(name="T", nullable=false)
	private String t;
	
	@NotEmpty
	@Column(name="FC", nullable=false)
	private String fc;
	
	@NotEmpty
	@Column(name="SPO2", nullable=false)
	private String spo2;
	
	@NotEmpty
	@Column(name="REASON", nullable=false)
	private String reason;
	
	@NotEmpty
	@Column(name="MEDICAL_HISTORY", nullable=false)
	private String medicalHistory;
	
	@NotNull
	@Column(name="SAME", nullable=false)
	private boolean same;
	
	@Column(name="DOCTOR", nullable=false)
	private String doctor;
	
	@Column(name="AMBULANCE", nullable=false)
	private String ambulance;
	
	@Column(name="PATIENT_TRANSPORT", nullable=false)
	private boolean patientTransport;
	
	@Column(name="MEDICAL_INSTITUTION", nullable=false)
	private String medicalInstitution;
	
	@Column(name="CREATED_DATE", nullable=false)
	private Date createdDate;
	
	@Column(name="LAST_MODIFIED_DATE", nullable=false)
	private Date lastModifiedDate;
	
	@NotNull
	@ManyToOne(optional = false,cascade=CascadeType.PERSIST)
	@JoinColumn(name = "PATIENT_ID")
	private Patient patient;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getT_a() {
		return t_a;
	}

	public void setT_a(String t_a) {
		this.t_a = t_a;
	}

	public String getT() {
		return t;
	}

	public void setT(String t) {
		this.t = t;
	}

	public String getFc() {
		return fc;
	}

	public void setFc(String fc) {
		this.fc = fc;
	}

	public String getSpo2() {
		return spo2;
	}

	public void setSpo2(String spo2) {
		this.spo2 = spo2;
	}
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getMedicalHistory() {
		return medicalHistory;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public boolean isSame() {
		return same;
	}

	public void setSame(boolean same) {
		this.same = same;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public String getAmbulance() {
		return ambulance;
	}

	public void setAmbulance(String ambulance) {
		this.ambulance = ambulance;
	}

	public boolean isPatientTransport() {
		return patientTransport;
	}

	public void setPatientTransport(boolean patientTransport) {
		this.patientTransport = patientTransport;
	}

	public String getMedicalInstitution() {
		return medicalInstitution;
	}

	public void setMedicalInstitution(String medicalInstitution) {
		this.medicalInstitution = medicalInstitution;
	}
	
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	@JsonIgnore
	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
}
