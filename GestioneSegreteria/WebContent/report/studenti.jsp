<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="user" class="model.Studente" scope="session" />
	<jsp:setProperty name="user" property="matricola" value="fin."/>


<html>
<head lang="it">
<title>Gestione Segreteria Studenti</title>
<meta charset="utf-8">

<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<LINK rel="stylesheet" href="css/common.css" type="text/css">

<script src="js/gestioneServizi.js"></script>

</head>
<body>

<header>
<jsp:getProperty name="user" property="matricola"/>
<h1>Elenco Studenti</h1>
<h2>Portale per la gestione degli studenti afferenti a qualche corso di laurea</h2>
</header>

<div class="table-responsive">
	<table class="table">
		<caption>Nominativo degli studenti iscritti</caption>
		<thead>
		<tr>
			<th>Matricola</th>
			<th>Nome</th>
			<th>Cognome</th>
			<th>Data di Nascita</th>			
		</tr>
		</thead>
		
		<tbody id="elencoStudenti">
		
		<c:forEach var="studente" items="${studenti}">
			<tr class="success studente">
				<td>${studente.matricola}</td>
				<td>${studente.nome}</td>
				<td>${studente.cognome}</td>
				<td><time>${studente.dataNascita}</time></td>				
			</tr>			
		</c:forEach>
							
		</tbody>
		<tfoot>
		<tr class="active">
			<td><a href="javascript:onclick=ordinaStudenti('matricola')">Ordina per Matricola</a></td>
			<td><a href="javascript:onclick=ordinaStudenti('nome')" href="">Ordina per Nome</a></td>
			<td><a href="javascript:onclick=ordinaStudenti('cognome')" href="">Ordina per Cognome</a></td>
			<td><a href="javascript:onclick=ordinaStudenti('dataNascita')" href="">Ordina per Data di nascita</a></td>	
		</tr>
		</tfoot>
	</table>
</div>


</body>
</html>