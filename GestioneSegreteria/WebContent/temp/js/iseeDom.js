function maschera(studente){
	svuota();
	document.getElementById("selStudente").innerHTML =
		"<h4>" + studente.matricola + " : "
		+ studente.nome + " : "
		+ studente.cognome + " </h4> ";
	var numComponenti = document.getElementById("numComponenti");
	numComponenti.addEventListener("blur", aggiungiCaselle);
	var calcolaButton = document.getElementById("calcolaISEE")
	calcolaButton.addEventListener("click", calcolaISEE);
}

function aggiungiCaselle(){
	var numComponenti = document.getElementById("numComponenti");
	var nComp = numComponenti.value;
	
	var tagValori = document.getElementById("valori");
	
	svuota();
	
	for (var i = 0; i < nComp; i++){
		var redd = document.createElement("div");
		redd.setAttribute("class", "form-group");
		redd.innerHTML = "<label>REDDITO del componente:</label>" +
				"<input class='redditoComponente' type='text' " +
				"class='form-control' />";
		
		var patr = document.createElement("div");
		patr.setAttribute("class", "form-group");
		patr.innerHTML = "<label>PATRIMONIO del componente:</label>" +
				"<input class='patrimonioComponente' type='text' " +
				"class='form-control' />";
		
		tagValori.appendChild(redd);
		tagValori.insertBefore(patr, redd.nextSibling);
//		tagValori.appendChild(patr);
	}
}

function svuota(){
	var tagValori = document.getElementById("valori");
	while (tagValori.firstChild){
		tagValori.removeChild(tagValori.firstChild);
	}
}

function calcolaISEE(){		
	var numeroComponenti = parseInt(document.getElementById("numComponenti").value);	
	var redditi = document.getElementsByClassName("redditoComponente");	
	var patrimoni = document.getElementsByClassName("patrimonioComponente");
	
	var redditoComplessivo = 0;
	var patrimonioComplessivo = 0;		
		
	for (var i = 0; i < redditi.length; i++){	
		redditoComplessivo += parseInt(redditi[i].value);				
		patrimonioComplessivo += parseInt(patrimoni[i].value);
	}
	ISR = redditoComplessivo;		
	ISP = patrimonioComplessivo;
	
	ISE = ISR + ISP * 20/100;
	
	scaleEquivalenza = 
	{
		"1" : 1,
		"2" : 1.57,
		"3" : 2.04,
		"4" : 2.46,
		"5" : 2.85
	};
				
	var calcolaSE = function(numeroComponenti){
		var SE;
		if (numeroComponenti <= 5){
			SE = scaleEquivalenza[numeroComponenti];
		}else{
			SE = 2.85 + 0.2 * numeroComponenti;
		}
			
		return SE;
	};
	
		
	SE = calcolaSE(numeroComponenti);
	
	ISEE = ISE / SE;
		
	document.getElementById("ISR").innerHTML = ISR;
	document.getElementById("ISP").innerHTML = ISP;
	document.getElementById("ISE").innerHTML = ISE;
	document.getElementById("scalaEquivalenza").innerHTML = SE;
	document.getElementById("ISEE").innerHTML = ISEE;	
}

