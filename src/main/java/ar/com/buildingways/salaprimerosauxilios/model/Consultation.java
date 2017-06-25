package ar.com.buildingways.salaprimerosauxilios.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;


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
	@Column(name="SPOT2", nullable=false)
	private String spot2;
	
	@NotEmpty
	@ManyToOne(optional = false)
    @JoinColumn(name = "ID")
	private Patient pacient;
 
   
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

	public String getSpot2() {
		return spot2;
	}

	public void setSpot2(String spot2) {
		this.spot2 = spot2;
	}

	public Patient getPacient() {
		return pacient;
	}

	public void setPacient(Patient pacient) {
		this.pacient = pacient;
	}
	
	

}
