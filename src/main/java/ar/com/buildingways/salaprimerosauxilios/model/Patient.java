package ar.com.buildingways.salaprimerosauxilios.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name="PATIENTS")
public class Patient {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
	
	@NotEmpty
	@Column(name="FIRSTNAME", nullable=false)
	private String firstName;
	
	@NotEmpty
	@Column(name="LASTNAME", nullable=false)
	private String lastName;
	
	@NotEmpty
	@Column(name="AGE", nullable=false)
	private String age;
	
	@NotEmpty
	@Column(name="SEX", nullable=false)
	private String sex;
	
	@NotEmpty
	@Column(name="DNI", nullable=false)
	private String dni;
	
	@Column(name="EMAIL")
	private String email;
	
	@NotEmpty
	@Column(name="ADDRESS", nullable=false)
	private String address;
	
	@NotEmpty
	@Column(name="PHONE")
	private String phone;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL, mappedBy="patient") 
	private Set<Consultation> consultations;
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@JsonProperty
	public Set<Consultation> getConsultations() {
		return consultations;
	}

	@JsonIgnore
	public void setConsultations(Set<Consultation> consultations) {
		this.consultations = consultations;
	}
	
	

	
}
