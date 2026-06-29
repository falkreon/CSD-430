<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="module4_2.EncabulatorSurvey" %>
<!DOCTYPE html>
<!--
CSD430: Server Side Development
Module 4: Java Beans
  Assignment 2: Programming Assignment
Isaac Ellingson
6/28/2026

Main assignment notes in results.jsp
-->
<html>
<head>
<meta charset="UTF-8">
<title>CSD430 Assignment 4.2</title>
</head>
<body>
Thank you for submitting your survey. Please wait while we organize your results...
<jsp:useBean id="surveyResults" class="module4_2.EncabulatorSurvey" scope="session" />
<%
// Gather the data from the request

final boolean current = "supplied".equals(request.getParameter("inverseReactiveCurrent"));
final int sync = Integer.parseInt(request.getParameter("sync"));
final int slots = Integer.parseInt(request.getParameter("slots"));
final String spurving = request.getParameter("spurving");
final String fumbling = request.getParameter("fumbling");



// Pull all this data into the session bean

surveyResults.setCurrentSupplied(current);
surveyResults.setGrammeterSyncRating(sync);
surveyResults.setSemiBoloidSlotCount(slots);
surveyResults.setSpurvingBearingAlignment(spurving);
surveyResults.setSideFumblingCategory(EncabulatorSurvey.SideFumblingCategory.fromInput(fumbling));
%>
<!-- And now that the data is stashed and will persist through the session, redirect the user over to the results page -->
<script>
	window.location.href = "results.jsp";
</script>
</body>
</html>