<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki5.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>


<%
IncomeTypeService incomeTypeService = new IncomeTypeService();
List<IncomeType> incomeTypes = incomeTypeService.getIncomeTypes();

// Sort the list based on IncomeTypeName
incomeTypes.sort(new Comparator<IncomeType>() {
    public int compare(IncomeType it1, IncomeType it2) {
        return it1.getIncomeTypeName().compareTo(it2.getIncomeTypeName());
    }
});
%>




<!DOCTYPE html>
<html>
	<head>        
		<title>Omadiki5 - Λίστα Κατηγοριών Εσόδων</title>

<%@include file="components\header.jsp" %>

    <style>
      .table-container {
          height: 400px; /* Set the height of the container */
          overflow-y: auto; /* Enable vertical scrolling */
      }

      th {
          position: sticky;
          top: 0;
          background-color: #f5f5f5; /* Add a background color for the header */
          z-index: 1; /* Set z-index to keep it above the table body */
      }
    </style>

	</head>
	<body class="d-flex flex-column">

    
<!-- login guard -->
<%@include file="components\loginGuard.jsp" %>


    <div class="container theme-showcase" role="main">

      <!-- Page Title -->
      <div class="page-header">
        <h1>Λίστα Κατηγοριών Εσόδων</h1>
        <p>(Με αλφαβητική σειρά ανά κατηγορία εσόδου)</p>
      </div>


<%
}
if (request.getAttribute("errorMessage") != null) {	
%>				
      <div class="row">
        <div class="col-xs-12">
          <div class="alert alert-danger">

<%= 
(String)request.getAttribute("errorMessage") 
%>

          </div>
        </div>
      </div>
<%
}			
%>
  
      <div class="row">
        <div class="col-xs-12">
          <div class="table-container">
            <table class="table table-bordered table-hover table-condensed table-responsive">
              <thead>
                <tr class="info">
                    <th>Κατηγορία Εσόδου</th>
                    <th>Συνδεδεμένος ΑΛΕ</th>
                    <th class="text-center" style="width: 120px;">Επιλογές</th>
                </tr>
              </thead>
              <tbody>
<%
for (IncomeType incomeType : incomeTypes) {
%>

                <tr>
                  <td><%=incomeType.getIncomeTypeName() %></td>
                  <td><%=incomeType.getIncomeTypeALE() %></td>

                  <td class="text-center">
                    <a href="editIncomeType.jsp?ID=<%=incomeType.getIncomeTypeID() %>" class="btn btn-warning btn-xs">
                      <span class="glyphicon glyphicon-pencil"></span>
                    </a>                        
                    <button type="button" class="btn btn-danger btn-xs" aria-expanded="false" aria-controls="confirmDeleteModal_<%=incomeType.getIncomeTypeID() %>"
                      data-toggle="collapse" data-target="#confirmDeleteModal_<%=incomeType.getIncomeTypeID() %>">
                      <span class="glyphicon glyphicon-trash"></span>
                    </button>
                    <div id="confirmDeleteModal_<%=incomeType.getIncomeTypeID() %>" class="collapse"> Διαγραφή;<br>
                      <a href="deleteIncomeTypes.jsp?am=<%=incomeType.getIncomeTypeID() %>" class="btn btn-link"  
                        data-toggle="tooltip" data-placement="top" title="Διαγραφή">Ναι</a>
                    </div>                      
                  </td>
                </tr>


<%
}

if (incomeTypes.size() == 0) {
%>
              <tr>
                <td colspan="7" class="text-center">Δεν βρέθηκαν κατηγορίες Εσόδων</td>
              </tr>
<%
}
%>

              </tbody>
            </table>
          </div>
        </div>
      </div>        
    </div><!-- /.container -->
  </body>
</h