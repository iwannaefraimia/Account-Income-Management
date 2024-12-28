<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki5.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>


<!-- login guard -->
<%@include file="components\loginGuard.jsp" %>



<%

String incomeTypeALE = request.getParameter("ALE");

IncomeTypeService incomeTypeService = new IncomeTypeService();
incomeTypeService.deleteIncomeType(incomeTypeALE);
request.setAttribute("successMessage", "IncomeType no: " + incomeTypeALE + " deleted successfully!");
    
%>
<jsp:forward page="listIncomeTypes.jsp"/>



<!-- extra bracket to close the login guard jsp loop...) -->
<%
}
%>				
