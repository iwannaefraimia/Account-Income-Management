<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki5.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>


<%
AccountService accountService = new AccountService();
List<Account> accounts = accountService.getAccounts();

// Sort the list based on AccountNumber
accounts.sort(new Comparator<Account>() {
    public int compare(Account acc1, Account acc2) {
        return acc1.getAccNum().compareTo(acc2.getAccNum());
    }
});
%>



<!DOCTYPE html>
<html>
	<head>        
		<title>Omadiki5 - Λίστα Λογαρ. κατάθεσης Εσόδων</title>

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
        <h1>Λίστα Λογαρ. κατάθεσης Εσόδων</h1>
        <p>(Με αύξουσα σειρά ανά αρ. Λογ.)</p>
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
                    <th>Αρ. Λογαρ.</th>
                    <th>Ονομασία Λογ.</th>
                    <th>IBAN Λογ.</th>
                    <th>Περιγραφή χρήσης Λογ.</th>
                    <th class="text-center" style="width: 120px;">Επιλογές</th>
                </tr>
              </thead>
              <tbody>
<%
for (Account account : accounts) {
%>
                <tr>
                  <td><%=account.getAccNum() %></td>
                  <td><%=account.getAccName() %></td>
                  <td><%=account.getAccIBAN() %></td>
                  <td><%=account.getAccDescr() %></td>

                  <!-- action buttons -->
                  <td class="text-center">
                    <a href="editAccount.jsp?accNum=<%=account.getAccNum() %>" class="btn btn-warning btn-xs">
                      <span class="glyphicon glyphicon-pencil"></span>
                    </a>
                    <a href="deleteAccount.jsp?accNum=<%=account.getAccNum() %>" class="btn btn-danger btn-xs" 
                      onclick="confirmDelete('<%=account.getAccNum() %>')">
                      <span class="glyphicon glyphicon-trash"></span>
                    </a>
                  </td>
                </tr>
<%
}
if (accounts.size() == 0) {
%>
              <tr>
                <td colspan="7" class="text-center">Δεν βρέθηκαν Λογαρ. κατάθεσης Εσόδων</td>
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
</html>




<!-- JS script for deletion confirmation -->
<script>
  function confirmDelete(accNum) {
    var Confirmation1 = confirm("Θέλετε να διαγραφεί ο λογαριασμός " + accNum + ";");
    if (Confirmation1) {
      var Confirmation2 = confirm("Είστε 100% σίγουροί;");
      if (Confirmation2) {
        window.location.href = "deleteAccount.jsp?accNum=" + accNum;
      } else {
        // Do nothing
      }
    } else {
      // Do nothing
    }
  }
</script>