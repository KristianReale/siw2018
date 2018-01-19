<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> 

<html>
<head lang="it">
<title>Gestione Segreteria Studenti</title>
<meta charset="utf-8">
<style type="text/css">
	section { 
		color: brown;
		font-family: sans-serif;
	}	
</style>

<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<LINK rel="stylesheet" href="css/common.css" type="text/css">

<script>
	$(window).on('load', function(){
		$.ajax({
			type: "GET",		
			url: "https://jsonplaceholder.typicode.com/posts/1",		
			success: function(data){
				alert("FRASE DEL GIORNO:\n" + data.body);
			}	
		});	
	});
</script>


</head>
<body style="background: cyan">


<script>
function jsonFlickrFeed(data) {
	$(window).on('load', function(){
		$("#flirk").html(data.items[0].description);
	});
};
</script>

<script type="text/javascript" src="https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=owl"></script>

<header style="color: red;" class="row">
	<figure style=" text-align: center" class="col-lg-3">		
		<a href="images/segreteria.jpg"><img class="img-circle img-thumbnail" src="images/segreteria.jpg" alt="Segreteria Studenti" width="300" /></a>
		<figcaption>La nostra segreteria studenti</figcaption>		
	</figure>
	<hgroup class="col-lg-4">
	<h1>Portale Segreteria Studenti</h1>
	<h2>Portale per la gestione degli studenti afferenti a qualche corso di laurea</h2>
	</hgroup>	
	<aside class="col-lg-2">
		<figure>
			<a href="http://www.unical.it"><img src="images/logo_unical.png" alt="Sito Unical" width="300" /></a>			
		</figure>	
		<a href="checkLogin">Check Login</a><br/>
		
		<c:if test="${loggato}">
			<p>${mex}</p>
		</c:if>
		<c:if test="${not loggato}">
			<p><a href="login">Login</a></p>
		</c:if>
			
	</aside>
	<iframe class="col-lg-3" src="https://www.youtube.com/embed/H09XzN2aDGc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
	</iframe>
</header>

<nav id="cssmenu" role="navigation" class="navbar navbar-inverse">
<div class="container-fluid">
<ol class="nav navbar-nav">
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">
          Studenti
        </a>
        <ul class="dropdown-menu">
	        <li><a class="dropdown-item" href="tuttiStudenti">Soli nominativi</a></li>		
			<li><a class="dropdown-item" href="report/studentiNominativiIndirizzi.html">Nominativi e Indirizzi</a></li>
			<li><a class="dropdown-item" href="report/studentiInfoComplete.html">Informazioni complete</a></li>
			<li><a class="dropdown-item" href="iscriviStudente">Iscrivi uno studente</a></li>
			<li><a class="dropdown-item" href="servizi/isee.html">Calcola ISEE</a></li>
        </ul>
    </li>
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">
			Gruppi
		</a>	
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="report/gruppi.html">Soli nominativi</a></li>
			<li><a class="dropdown-item" href="report/studentiPerGruppo.html">Studenti per Gruppo</a></li>	
		</ul>
	</li>
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">
			Indirizzi
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="report/indirizzi.html">Soli nominativi</a></li>
			<li><a class="dropdown-item" href="report/studentiPerIndirizzo.html">Studenti per Indirizzo</a></li>		
		</ul>
	</li>
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">
			Corsi
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="report/corsi.html">Soli nominativi</a></li>
			<li><a class="dropdown-item" href="report/corsiECorsiDiLaurea.html">Nominativi e Corsi di Laurea</a></li>
			<li><a class="dropdown-item" href="report/corsiConStudentiIscritti.html">Corsi e Studenti iscritti</a></li>
		</ul>
	</li>
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">
			Corsi di Laurea
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="report/corsiDiLaurea.html">Nominativi e Dipartimento</a></li>						
		</ul>
	</li>
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">
			Dipartimenti
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="report/dipartimenti.html">Nominativi</a></li>
			<li><a class="dropdown-item" href="report/dipartimentiECorsiDiLaurea.html">Corsi di Laurea</a></li>
		</ul>
	</li>
</ol>
</div>
</nav>


<section class="row" id="intro" draggable="true">
	<div class="col-lg-6 jumbotron">
		<h2>
			Benvenuti nel portale di gestione delle Segreterie Studenti
		</h2>
		<span class="break"> Utilizza il menu in alto per <strong>navigare tra le varie sezioni della nostra pagina</strong>.</span><span>Vuoi vedere il portale delle segreterie dell'Unical?</span>
	</div>
	<div class="col-lg-6">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49396.325667490106!2d16.217289196661675!3d39.30479485437768!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133f974acd5e5e29%3A0x5619c8633cc426fa!2s87100+Cosenza+CS!5e0!3m2!1sit!2sit!4v1516273585413" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>
</section>
<section id="information" class="row">
	<article class="col-md-6 col-lg-6">
		<header class="articleHeader">
			<big>Dicono di Noi</big>
		</header>
		La Segreteria è un servizio di riferimento per informazione e procedure burocratiche riguarda allÂ´immatricolazione, iscrizione, registrazione esami, richiesta e rilascia di certificati, gestione della didattica e delle laure. 
		Ogni corso di Laurea ha la propria segreteria dove si puÃ² rivolgersi per qualsiasi informazione riguardo alla didattica dellÂ´Ateneo.
	</article>
	<article class="special col-md-6 col-lg-6">
		<header class="articleHeader">
			<big>Centro ICT di Ateneo</big>
		</header>
		Dalla pagina accessibile da <a href="http://www.unical.it/portale/strutture/centri/centroict/serviziict/homeservizicentro/">qui</a> Ã¨ possibile accedere a tutti i servizi ed al  Centro Customer Satisfaction (CCS) del Centro ICT dâAteneo. 
		Ã possibile trovare il servizio desiderato sia attraverso degli elenchi di servizi organizzati secondo la tipologia di utenza 
		sia attraverso la ricerca per parole chiave con un motore di ricerca locale google. Per ogni servizio
		Ã¨ stata approntata una scheda descrittiva contenente tutte le informazioni sullo stesso. Dal CCS 
		invece Ã¨ possibile valutare, accedere alle statistiche dâuso o sporgere reclami sui servizi. 
	</article>
	<article class="col-md-6 col-lg-6">
		<header class="articleHeader">
			<big>Notizie dal mondo</big>
		</header>
		<script src="//rss.bloople.net/?url=http%3A%2F%2Fxml2.corriereobjects.it%2Frss%2Fhomepage.xml&limit=5&showtitle=false&type=js"></script>	</article>	
	<article class="col-md-6 col-lg-6">
		<header class="articleHeader">
			<big>Foto da Flirk</big>
		</header>
		<div id="flirk"></div>
	</article>	
</section>


<footer><small>Sito Web creato da Kristian Reale. Contattalo scrivendo a <a href="mailto:reale@dlvsystem.com"> reale@dlvsystem.com</a></small> </footer>
</body>
</html>