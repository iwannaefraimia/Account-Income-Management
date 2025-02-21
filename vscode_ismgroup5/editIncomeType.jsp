<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki5.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>


<%

IncomeTypeService incomeTypeService = new IncomeTypeService();
List<IncomeType> incomeTypes = incomeTypeService.getIncomeTypes();


ALEService aleService = new ALEService();
List<ALE> ales = aleService.getALEs();

// Sort the list based on ALE description
ales.sort(new Comparator<ALE>() {
	public int compare(ALE ale1, ALE ale2) {
		return ale1.getALEDescr().compareTo(ale2.getALEDescr());
	}
});

%>






<!DOCTYPE html>
<html lang="en">
	<head>        
		<title>Omadiki5 - Επεξεργασία κατηγορίας εσόδων</title>

<%@include file="components\header.jsp" %>


	</head>

	
	<body class="d-flex flex-column">


<!-- login guard -->
<%@include file="components\loginGuard.jsp" %>


		<div class="container theme-showcase" role="main">

			<!-- Page Title -->
			<div class="page-header">
				<h1>Επεξεργασία κατηγορίας εσόδων</h1>
			</div>


			

<%
if (request.getAttribute("errorMessage") != null) {	
%>				
			<div class="row">
				<div class="col-xs-12">

					<div class="alert alert-danger">
						<%=(String)request.getAttribute("errorMessage") %>
					</div>

				</div>
			</div>
<%
}			
%>


			<div class="row">
								
				<div class="col-xs-12">

					<form class="form-horizontal" method="POST" action="updateIncomeType.jsp">
						
						<!-- income type category name -->
						<div class="form-group">
							<label for="IncomeTypeName" class="col-sm-3 control-label main-label">Όνομα κατηγορίας εσόδων: </label>
							<div class="col-sm-7">
							<input type="text" name="IncomeTypeName" id="IncomeTypeName" class="form-control" placeholder="Εισάγετε το όνομα νέας κατηγορίας εσόδων (περιγραφικό)" title="Εισάγετε το όνομα της νέας κατηγορίας εσόδων (περιγραφικό)">
							</div>
						</div>

						<!-- ALE -->
						<div class="form-group">
							<label for="ALE" class="col-sm-3 control-label main-label">Συνδεδεμένο ΑΛΕ: </label>
							<div class="col-sm-8">
								<select id="ALE" name="ALE" class="form-control" title="Επιλέξτε ΑΛΕ, με τον οποίο συνδέεται η κατηγορία εσόδων που εισάγετε">
									<option value="">--- Επιλέξτε ΑΛΕ ---</option>
<%
for (ALE ale : ales) { 
%>
									<option value="<%=ale.getALENum() %>"><%=ale.getALEDescr() %> (<%=ale.getALENum() %>)</option>
<% } %>
								</select>
							</div>
							<div class="col-sm-1">
								<button type="button" class="btn btn-warning btn-xs" 
									onclick="openPopup('newALE.jsp')" 
									data-toggle="tooltip" data-placement="top" title="Προσθήκη νέου ΑΛΕ">
									<span class="glyphicon glyphicon-plus"></span></button>
							</div>
						</div>

						<!-- buttons -->
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Οριστικοποίηση</button> 
								<button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Ακύρωση</button>
							</div>
						</div>					

					</form>
				</div>
			</div>
		</div><!-- /.container -->

<% } %>
<!-- This extra bracket } exists to complete the loginGuard.jsp loop -->

	</body>
</html>
