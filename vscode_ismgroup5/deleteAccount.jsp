<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki5.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>


<!-- login guard -->
<%@include file="components\loginGuard.jsp" %>



<%

String accNum = request.getParameter("accNum");

AccountService accountService = new AccountService();
accountService.deleteAccount(accNum);
request.setAttribute("successMessage", "Account no: " + accNum + " deleted successfully!");
    
%>
<jsp:forward page="listAccounts.jsp"/>



<!-- extra bracket to close the login guard jsp loop...) -->
<%
}
%>				
