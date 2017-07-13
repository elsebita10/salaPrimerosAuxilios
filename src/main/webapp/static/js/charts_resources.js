var consultations;
var patients;

//patient variables
var men;
var women;

//rango de edades
var minor;
var adult;
var old;

//same
var yes;
var no;

//traslados
var yesTransportation;
var noTransportation;

//antecedentes
var none;
var hta;
var dbt;
var alergy;
var epilepsy;
var asthma;
var cardiac;
var psychiatric;
var acv;
var neurologycal;
var epoc;
var ca;

//motivos
var emotional;
var threwUp;
var hba_dbt;
var epilepticAttack;
var trauma;
var abdominalPain;
var slightFever;
var hypoglycemia;
var numbness;
var other;

//datas
var sexData;
var sameData;
var patientTransportationData;

$(document).ready(function(){
	getAllConsultations();
	getAllPatients();

	//obtengo todas las consultations de la BD
	function getAllConsultations(){
		$.ajax({
			type: "GET",
			url: myContextPath+"/getallconsultations",
			data: "json",
			success: function (result){
				consultations =	result;
				getConsultationData();
				createSAMEData();
				createPatientTransportationData();
				createMedicalHistoryData();
				createReasonData();
			},
			error: function (result){
				alert('hubo un error en algun lado');
			}
		})
	}
	
	//Obtengo los patients de la BD
	function getAllPatients(){
	     $.getJSON(myContextPath+'/getallpatients', function (data) {
			patients=data;
		}).done(function (data) {
			getPatientData();
			createAgeData();
			document.getElementById("sexCount").innerHTML = men + women;
			document.getElementById("menCount").innerHTML = men;
			document.getElementById("womenCount").innerHTML = women;
	    });
	}

	//Creo torta de Cantidad de ambos sexos
	function createAgeData(){
		ageData = {
				type : "pie",
				data : {
					datasets: [{
						data : [
							minor,
							adult,
							old,
						],
						backgroundColor : [
							"#F7464A",
							"#46BFBD",
							"#04B486",
						],
					}],
					labels : [
						"Menores de 18",
						"Mayores de 18",
						"Mayores de 70",
					]
				},
				options : {
					responsive : true,
					tooltips: {
						callbacks: {
							label: function(tooltipItem, data) {
								var allData = data.datasets[tooltipItem.datasetIndex].data;
								var tooltipLabel = data.labels[tooltipItem.index];
								var tooltipData = allData[tooltipItem.index];
								var total = 0;
								for (var i in allData) {
									total += allData[i];
								}
								var tooltipPercentage = Math.round((tooltipData / total) * 100);
								return tooltipLabel + ': ' + tooltipData + ' (' + tooltipPercentage + '%)';
							}
						}
					}
				}
		};
	
		var ageCanvas = document.getElementById('ageChart').getContext('2d');
		window.pie1 = new Chart(ageCanvas, ageData);
		window.pie1.update();
	}	
	//Creo torta de cantidad de llamados al SAME
	function createSAMEData(){
		sameData = {
				type : "pie",
				data : {
					datasets: [{
						data : [
							yes,
							no,
						],
						backgroundColor : [
							"#819FF7",
							"#F3F781",
						],
					}],
					labels : [
						"Si",
						"No",
					]
				},
				options : {
					responsive : true,
					tooltips: {
						callbacks: {
							label: function(tooltipItem, data) {
								var allData = data.datasets[tooltipItem.datasetIndex].data;
								var tooltipLabel = data.labels[tooltipItem.index];
								var tooltipData = allData[tooltipItem.index];
								var total = 0;
								for (var i in allData) {
									total += allData[i];
								}
								var tooltipPercentage = Math.round((tooltipData / total) * 100);
								return tooltipLabel + ': ' + tooltipData + ' (' + tooltipPercentage + '%)';
							}
						}
					}
				}
		};
	
		var sameCanvas = document.getElementById('sameChart').getContext('2d');
		window.pie2 = new Chart(sameCanvas, sameData);
		window.pie2.update();
	}
	
	//Creo torta de traslados
	function createPatientTransportationData(){
		patientTransportationData = {
				type : "pie",
				data : {
					datasets: [{
						data : [
							yesTransportation,
							noTransportation,
						],
						backgroundColor : [
							"#FAAC58",
							"#A9F5F2",
						],
					}],
					labels : [
						"Si",
						"No",
					]
				},
				options : {
					responsive : true,
					tooltips: {
						callbacks: {
							label: function(tooltipItem, data) {
								var allData = data.datasets[tooltipItem.datasetIndex].data;
								var tooltipLabel = data.labels[tooltipItem.index];
								var tooltipData = allData[tooltipItem.index];
								var total = 0;
								for (var i in allData) {
									total += allData[i];
								}
								var tooltipPercentage = Math.round((tooltipData / total) * 100);
								return tooltipLabel + ': ' + tooltipData + ' (' + tooltipPercentage + '%)';
							}
						}
					}
				}
		};
	
		var patientTransportationCanvas = document.getElementById('patientTransportationChart').getContext('2d');
		window.pie3 = new Chart(patientTransportationCanvas, patientTransportationData);
		window.pie3.update();
	}
	
	//Creo torta de antecedentes
	function createMedicalHistoryData(){
		medicalHistoryData = {
				type : "pie",
				data : {
					datasets: [{
						data : [
							none,
							hta,
							dbt,
							alergy,
							epilepsy,
							asthma,
							cardiac,
							psychiatric,
							acv,
							neurologycal,
							epoc,
							ca,
						],
						backgroundColor : [
							"#FAAC58",
							"#A9F5F2",
							"#F7464A",
							"#46BFBD",
							"#819FF7",
							"#F3F781",
							"#ACFA58",
							"#DA81F5",
							"#F5A9BC",
							"#B45F04",
							"#04B486",
							"#210B61",
						],
					}],
					labels : [
						"Ninguno",
						"HTA",
						"DBT",
						"Alergia",
						"Epilepsia",
						"Asma",
						"Card\u00EDaco",
						"Psiqui\u00E1trico",
						"ACV",
						"Neurol\u00F3gico",
						"EPOC",
						"CA",						
					]
				},
				options : {
					responsive : true,
					tooltips: {
						callbacks: {
							label: function(tooltipItem, data) {
								var allData = data.datasets[tooltipItem.datasetIndex].data;
								var tooltipLabel = data.labels[tooltipItem.index];
								var tooltipData = allData[tooltipItem.index];
								var total = 0;
								for (var i in allData) {
									total += allData[i];
								}
								var tooltipPercentage = Math.round((tooltipData / total) * 100.0);
								return tooltipLabel + ': ' + tooltipData + ' (' + tooltipPercentage + '%)';
							}
						}
					}
				}
		};
	
		var medicalHistoryCanvas = document.getElementById('medicalHistoryChart').getContext('2d');
		window.pie4 = new Chart(medicalHistoryCanvas, medicalHistoryData);
		window.pie4.update();
	}
	
	//Creo torta de motivos
	function createReasonData(){
		reasonData = {
				type : "pie",
				data : {
					datasets: [{
						data : [
							emotional,
							threwUp,
							hba_dbt,
							epilepticAttack,
							trauma,
							abdominalPain,
							slightFever,
							hypoglycemia,
							numbness,
							other,
						],
						backgroundColor : [
							"#F7464A",
							"#46BFBD",
							"#819FF7",
							"#F3F781",
							"#ACFA58",
							"#DA81F5",
							"#F5A9BC",
							"#B45F04",
							"#04B486",
							"#210B61",
						],
					}],
					labels : [
						"Contenci\u00F3n emocional",
						"Cefalea, n\u00E1useas, mareos, v\u00F3mitos",
						"HBA-DBT",
						"Ataque Epil\u00E9ptico",
						"Herida abierta, traumatismo",
						"Dolor abdominal, lumbar",
						"Febr\u00EDcula",
						"Hipoglucemia",
						"Adormecimiento MS",
						"Otros",
					]
				},
				options : {
					responsive : true,
					tooltips: {
						callbacks: {
							label: function(tooltipItem, data) {
								var allData = data.datasets[tooltipItem.datasetIndex].data;
								var tooltipLabel = data.labels[tooltipItem.index];
								var tooltipData = allData[tooltipItem.index];
								var total = 0;
								for (var i in allData) {
									total += allData[i];
								}
								var tooltipPercentage = Math.round(((tooltipData / total) * 100),2);
								return tooltipLabel + ': ' + tooltipData + ' (' + tooltipPercentage + '%)';
							}
						}
					}
				}
		};
	
		var reasonCanvas = document.getElementById('reasonChart').getContext('2d');
		window.pie5 = new Chart(reasonCanvas, reasonData);
		window.pie5.update();
	}

	//actualizo los datos (charts) cada cierto tiempo
	setInterval(function(){

		getAllConsultations();
		getAllPatients();

		window.pie1.update();
		window.pie2.update();
		window.pie3.update();
		window.pie4.update();
		window.pie5.update();
	
	}, 30000);
	
	
//	function getRandom(){
//		return Math.round(Math.random() * 100);
//	}
	
	//obtengo cantidad de cada uno de los sexos
	function getPatientData(){
		getInitializedPatientVariables();
		for (i in patients) {
			if (patients[i].sex == "Masculino"){
				 men = men + 1;
			 }else if (patients[i].sex == "Femenino"){
				 women = women + 1;
			 }else{
				 alert ('Hubo un error con el sexo del paciente'+patient[i].lastname);
			 }
			
			if (patients[i].age < 18){
				minor = minor + 1;
			}else if (patients[i].age > 18 && patients[i].age < 70){
				adult = adult + 1;
			}else{
				old = old + 1;
			}
		 }
	}
	
	function getConsultationData(){
		getInitializedConsultationsVariables();
		for (i in consultations){
			
			//pregunto por SAME
			if (consultations[i].same == true || consultations[i].same == 1){
				yes = yes + 1;
			}else if (consultations[i].same == false || consultations[i].same == 0){
				no = no + 1;
			}else{
				alert ('Hubo un error con la consulta con ID '+consultations[i].id)
			}
			
			//pregunto por Traslado
			if (consultations[i].patientTransport == true || consultations[i].patientTransport == 1){
				yesTransportation = yesTransportation + 1;
			}else if (consultations[i].patientTransport == false || consultations[i].patientTransport == 0){
				noTransportation = noTransportation + 1;
			}else{
				alert ('Hubo un error con el traslado de la consulta con ID '+consultations[i].id)
			}
			
			//pregunto por Antecedentes
			switch (consultations[i].medicalHistory){
				case "Ninguno": 
					none = none + 1;
					break;
				case "HTA":
					hta = hta + 1;
					break;
				case "DBT":
					dbt = dbt + 1;
					break;
				case "Alergia":
					alergy = alergy + 1;
					break;
				case "Epilepsia":
					epilepsy = epilepsy + 1;
					break;
				case "Asma":
					asthma = asthma + 1;
					break;
				case "Card\u00EDaco":
					cardiac = cardiac + 1;
					break;
				case "Psiqui\u00E1trico":
					psychiatric = psychiatric + 1;
					break;
				case "ACV":
					acv = acv + 1;
					break;
				case "Neurol\u00F3gico":
					neurological = neurological + 1;
					break;
				case "EPOC":
					epoc = epoc + 1;
					break;
				case "CA":
					ca = ca + 1;
					break;
			}
			
			//pregunto por motivos
			switch (consultations[i].reason){
				case "Contenci\u00F3n emocional": 
					emotional = emotional + 1;
					break;
				case "Cefalea, n\u00E1useas, mareos, v\u00F3mitos":
					threwUp = threwUp + 1;
					break;
				case "HTA-DBT":
					hba_dbt = hba_dbt + 1;
					break;
				case "Ataque epil\u00E9ptico":
					epilepticAttack = epilepticAttack + 1;
					break;
				case "Herida abierta, traumatismo":
					trauma = trauma + 1;
					break;
				case "Dolor abdominal, lumbar":
					abdominalPain = abdominalPain + 1;
					break;
				case "Febr\u00EDcula":
					slightFever = slightFever + 1;
					break;
				case "Hipoglucemia":
					hypoglycemia = hypoglycemia + 1;
					break;
				case "Adormecimiento MS":
					numbness = numbness + 1;
					break;
				default:
					other = other + 1;
			}
		}
	}
	
	//inicializo todas las variables de patients
	function getInitializedPatientVariables(){
		men = 0;
		women = 0;
		minor = 0;
		adult = 0;
		old = 0;
	}
	
	//inicializo todas las variables de consultations
	function getInitializedConsultationsVariables(){
		//same
		yes = 0;
		no = 0;
		//traslados
		yesTransportation = 0;
		noTransportation = 0;
		//antecedentes
		none = 0;
		hta = 0;
		dbt = 0;
		alergy = 0;
		epilepsy = 0;
		asthma = 0;
		cardiac = 0;
		psychiatric = 0;
		acv = 0;
		neurologycal = 0;
		epoc = 0;
		ca = 0;
		//motivos
		emotional = 0;
		threwUp = 0;
		hba_dbt = 0;
		epilepticAttack = 0;
		trauma = 0;
		abdominalPain = 0;
		slightFever = 0;
		hypoglycemia = 0;
		numbness = 0;
		other = 0;
	}
});
