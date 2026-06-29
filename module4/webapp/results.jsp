<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="module4_2.EncabulatorSurvey" %>
<%@ page import="module4_2.EncabulatorSurvey.SideFumblingCategory" %>
<!DOCTYPE html>
<!-- 
CSD430: Server Side Development
Module 4: Java Beans
  Assignment 2: Programming Assignment
Isaac Ellingson
6/28/2026

Using module 3.2's code and data as a base, we demonstrate placing data into a stateful session bean (in survey.jsp),
and using that data later in the same session (in this docuiment, results.jsp).

In the deal we gained the ability to safely refresh the results page and the data stays... until the session
expires. At that point the data currently "dummies out". Future work could display a session expiration notice
and link back to the survey page.
-->
<html>
<head>
	<meta charset="UTF-8">
	<title>CSD430 Assignment 3.2</title>
	<link rel="stylesheet" href="mod4_2.css">
</head>
<body>
<main>
<jsp:useBean id="surveyResults" class="module4_2.EncabulatorSurvey" scope="session" />
<section>
<%
	final String SPURVING_PREFILL = "They are in a direct line with the panametric fan";

	// Gather and process data from the bean
	
	List<String> pros = new ArrayList<>();
	List<String> cons = new ArrayList<>();
	
	if (surveyResults.wasCurrentSupplied()) {
		pros.add("Inverse reactive current was adequately supplied to their unilateral phase detractor(s).");
	} else {
		cons.add("Inverse reactive current was NOT adequately supplied to their unilateral phase detractor(s).");
	}
	
	if (surveyResults.getGrammeterSyncRating() == 5) {
		pros.add("Their cardinal grammeters were automatically synchronized.");
	} else if (surveyResults.getGrammeterSyncRating() == 4) {
		pros.add("Their cardinal grammeters were adequately synchronized.");
	} else {
		cons.add("Their cardinal grammeters were not adequately synchronized (Reported level: " + surveyResults.getGrammeterSyncRating() + " out of 5).");
	}
	
	if (SPURVING_PREFILL.equals(surveyResults.getSpurvingBearingAlignment())) {
		pros.add("Their spurving bearings are in direct line with the panametric fan.");
	}
	
	if (surveyResults.getSideFumblingCategory() == EncabulatorSurvey.SideFumblingCategory.NONE) {
		pros.add("Side-fumbling was effectively prevented.");
	} else {
		cons.add("Side-fumbling was not prevented. Customer reported fumbling " + surveyResults.getSideFumblingCategory().getDescription() + ".");
	}
	
	// ... And now we can emit the results! We've already collected categorized lists of commentary above,
	// so we just use jsp loops to emit them.
%>
<h1>Turbo Encabulator Survey Results</h1>

<p>The customer's survey has been organized into three parts: Customer Satisfaction, Customer Issues, and Information.

<h2>Customer Satisfaction</h2>
<ul>
<% for(String pro : pros) {%>
	<li><%= pro %>
<% } %>

<% if (pros.isEmpty()) { %>
	<li>The customer was highly dissatisfied with the product.
<% } %>
</ul>

<h2>Customer Issues</h2>
<ul>
<% for(String con : cons) {%>
	<li><%= con %>
<% } %>
</ul>

<h2>Information</h2>
<ul>
<li>Their turbo encabulator had <%= surveyResults.getSemiBoloidSlotCount() %> semi-boloid slots.

<% if (!SPURVING_PREFILL.equals(surveyResults.getSpurvingBearingAlignment())) { %>
<li>The customer had the following thoughts about the alignment of their spurving bearings:
<p><pre><%= surveyResults.getSpurvingBearingAlignment() %></pre>
<% } %>
</ul>
</section>
<section>
<!-- 
	Since we MUST emit a data table, here you go. Not the most elegant way to present the data though.
-->
<h2>Raw Data</h2>
<table>
<tr><td>Current Supplied?</td><td><%= surveyResults.wasCurrentSupplied() %></td></tr>
<tr><td>Sync Level Reported</td><td><%= surveyResults.getGrammeterSyncRating() %></td></tr>
<tr><td>Semi-Boloid Slots</td><td><%= surveyResults.getSemiBoloidSlotCount() %></td></tr>
<tr><td>Spurving Bearing Alignment</td><td><%= surveyResults.getSpurvingBearingAlignment() %></td></tr>
<tr><td>Side-Fumbling Type</td><td><%= surveyResults.getSideFumblingCategory() %></td></tr>
</table>

<h2>Context</h2>
<p>The Turbo Encabulator script is a long-running engineer gag that has been recorded and printed in several different versions over the years. A notable example is the video below:
<p><iframe width="560" height="315" src="https://www.youtube.com/embed/Ac7G7xOG2Ag?si=biMcpBpt1iXi0D2p" title="YouTube video player" frameborder="0"
	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
	referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</section>

</main>
</body>
</html>