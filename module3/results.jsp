<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<!-- 
CSD430: Server Side Development
Module 3: JSP Forms
  Assignment 2: Programming Assignment
Isaac Ellingson
6/21/2026

Gather data from a user - at least five data items, representing at least three different data types.
JSP must be used to process the data. Scriptlet sections must hold the code, no HTML tags may be
emitted by scriptlets, and the data must be displayed in an HTML table.

For this we used the classic Turbo Encabulator script to create a (in my opinion) hilarious product
survey. The data is then processed and categorized into pros, cons, and informational sections.
-->
<html>
<head>
	<meta charset="UTF-8">
	<title>CSD430 Assignment 3.2</title>
	<link rel="stylesheet" href="mod3_2.css">
</head>
<body>
<main>
<section>
<%
	final String SPURVING_PREFILL = "They are in a direct line with the panametric fan";
	final Map<String, String> FUMBLING_TYPES = Map.of(
			"waneshaft", "around the waneshaft",
			"marzlevanes", "across the hydrocoptic marzlevanes",
			"ambifacent", "when the waneshaft is in non-ambifacent mode"
			);

	// Gather data from the form request
	
	final boolean current = "supplied".equals(request.getParameter("inverseReactiveCurrent"));
	final int sync = Integer.parseInt(request.getParameter("sync"));
	final int slots = Integer.parseInt(request.getParameter("slots"));
	String spurving = request.getParameter("spurving");
	
	// Do some cursory escapes on spurving.
	// NOTE: Normally we'd pull in JSTL and use c:out for this!
	// ...or Apache Commons StringEscapeUtils, or Spring's HtmlUtils, or Guava HtmlEscapers...
	// But since we don't have orchestration tooling you wouldn't be able to run it.
	// So you get this instead.
	spurving = spurving.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	
	// Process the data and categorize it into pros and cons
	final String fumbling = request.getParameter("fumbling");
	final boolean isFumbling = !fumbling.equals("no");
	
	List<String> pros = new ArrayList<>();
	List<String> cons = new ArrayList<>();
	
	if (current) {
		pros.add("Inverse reactive current was adequately supplied to their unilateral phase detractor(s).");
	} else {
		cons.add("Inverse reactive current was NOT adequately supplied to their unilateral phase detractor(s).");
	}
	
	if (sync == 5) {
		pros.add("Their cardinal grammeters were automatically synchronized.");
	} else if (sync == 4) {
		pros.add("Their cardinal grammeters were adequately synchronized.");
	} else {
		cons.add("Their cardinal grammeters were not adequately synchronized (Reported level: " + sync + " out of 5).");
	}
	
	if (SPURVING_PREFILL.equals(spurving)) {
		pros.add("Their spurving bearings are in direct line with the panametric fan.");
	}
	
	if (!isFumbling) {
		pros.add("Side-fumbling was effectively prevented.");
	} else {
		cons.add("Side-fumbling was not prevented. Customer reported fumbling " + FUMBLING_TYPES.getOrDefault(fumbling, "of an unknown type") + ".");
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
<li>Their turbo encabulator had <%= slots %> semi-boloid slots.

<% if (!SPURVING_PREFILL.equals(spurving)) { %>
<li>The customer had the following thoughts about the alignment of their spurving bearings:
<p><pre><%= spurving %></pre>
<% } %>
</ul>
</section>
<section>
<!-- 
	Since we MUST emit a data table, here you go. Not the most elegant way to present the data though.
-->
<h2>Raw Data</h2>
<table>
<tr><td>Current Supplied?</td><td><%= current %></td></tr>
<tr><td>Sync Level Reported</td><td><%= sync %></td></tr>
<tr><td>Semi-Boloid Slots</td><td><%= slots %></td></tr>
<tr><td>Spurving Bearing Alignment</td><td><%= spurving %></td></tr>
<tr><td>Side-Fumbling Type</td><td><%= fumbling %></td></tr>
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