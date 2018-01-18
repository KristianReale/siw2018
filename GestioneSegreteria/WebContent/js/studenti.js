$(window).on('load', function() { 	
	$("#dip").change(function () {		
		var selected = $("#dip option:selected").attr("value");
		$.ajax({
			type: "GET",		
			url: "getCorsiDiLaurea",			
			data: {valueDip: selected},
			success: function(data){
				$("#corso_laurea").html(data);
			}	
		});
	});
		
});

function dettagli(studente){	
	var studente = {
		matricola : studente.matricola,
		nome : studente.nome,
		cognome : studente.cognome,
		dataNascita : studente.dataNascita				
	};
	
	$.ajax({
		type: "POST",		
		url: "tuttiStudenti",		
		datatype : "json",
		data: JSON.stringify(studente),
		success: function(data){
			var indirizzo = JSON.parse(data);
			$("#dettagliStudente").text("Indirizzo : " + indirizzo.nome); 
		}	
	});	
	
	
}
