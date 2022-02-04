
<%@page import="java.util.List"%>
<%@page import="Model.Professor"%>
<%@page import="br.servlets.professor.consultarProfessorController"%>
<%@page import="java.util.List.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>SysSchool</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
	<%
		String usuario = (String) session.getAttribute("usuario");
		if(usuario == null){
			response.sendRedirect("Login.jsp");
		}	
	%>
	
	<nav class="bananaNav">
		<ul>
			<li><img src="img/2.png" height="30px"></li>
			<div class="meuh1"> 
				<li><a class="meua" href="Dashboard.jsp">SysSchool</a></li>
			</div>
			<li><a href="Deslogar.jsp">Log out</a></li>
			<li><img src="img/LogOut.png" height="30px"></li>
		</ul>
	</nav>
	<main class="bananaMain">
		<form action="ConsultarProfessor" method="post" class="consultarcurso">
			<div>
				<h2>Consultar Professor</h2>
			</div>
			<div>
				<label><strong>CPF:</strong></label><input type="text"
					name="cpf" min="0" minlength="9" maxlength="14" required="required">
			</div>
			<br>
			<div>
				<input id="bananaButton" type="submit" name="salvar"
					value="Consultar Professor">
			</div>
		</form>
		<form action="ConsultarProfessor" method="post">
			<div>
			<%
			if(request.getAttribute("professors") != null){
				List<?> professors = (List<?>) request.getAttribute("professors");
				for(int c=0; c<(professors.size()); c++){
					Professor professor = (Professor) professors.get(c);
			%>
			<div>
				<div class="fo">
					<span><%out.print("Nome: " + professor.getNome()); %></span>
					<span><%out.print("Data Nascimento: " + professor.getDataNascimento()); %></span>
					<span><%out.print("Cidade: " + professor.getCidade()); %></span>
					<div class="submit">
						<input onclick="validarAlterarAluno();" id="Balterar" name="alterar"
							value="Alterar">
						<input onclick="validarExcluirAluno();" id="Bapagar" name="apagar"
							value="Apagar">
					</div>
				</div>
			</div>
			<%
			}
			}else{
			%>
			
			<div>
				<div class="fo">
					<h2>CPF INV�LIDO, Professor N�o Encontrado!</h2>
				</div>
			</div>
			<%} %>
			</div>
		</form>
	</main>
</body>
</html>