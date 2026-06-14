<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<!-- 
CSD430: Server Side Development
Module 2: Java Scriptlets
  Assignment 2: Programming Assignment
Isaac Ellingson
6/14/2026

Create a data record. Display that record's contents in a dynamically-generated table in a JSP.

The specific instructions of this assignment, as usual, are EXTREMELY poor writing. Items are supposed
to be categorized? How? How many books do I need, one or five? What's a "data file?" what's a
"scriptlet" in this context, is it a scriptlet tag? Or a standalone scriptlet?

I also feel you're confusing "record" versus "field" in places, and the whole text could use a spelling
pass.

I have chosen to use books as the assignment subject.

My best guess reading the assignment text, we require information about five books, with at least
three data elements per book. The data within each book must be displayed in an organized manner,
properly formatted and labeled.

What is "grouped into topical categories" in this context? Do you mean organizing by year or genre? Do
you mean individual tables per book? Do you mean grouping fields with their labels?

Again, guided by guesswork, I processed the whole array of books to order them by ascending release
year. Hopefully the motivation here was to require some kind of bulk processing on the data from within a
scriptlet tag. If it wasn't, well, garbage in, garbage out. Ask more clearly next time.
 -->

<html>
<head>
	<meta charset="UTF-8">
	<title>CSD430 Assignment 2.2</title>
	<link rel="stylesheet" href="mod2_2.css">
</head>
<body>
	<%!
	// Declare the data type and the data record.
	// Tomcat doesn't seem to understand the record - may be running on outdated JVM.
	// record Book(String title, String author, int publicationYear, String isbn) {}
	
	public class Book {
		private final String title;
		private final String author;
		private final int publicationYear;
		private final String isbn;
		public Book(String title, String author, int publicationYear, String isbn) {
			this.title = title;
			this.author = author;
			this.publicationYear = publicationYear;
			this.isbn = isbn;
		}
		public String title() { return title; }
		public String author() { return author; }
		public int publicationYear() { return publicationYear; }
		public String isbn() { return isbn; }
	}
	
	List<Book> books = new ArrayList<>();
	%>
	
	<%
	// Pretend we're loading this up from a database if you want.
	// The origin of the data doesn't matter.
	books.clear();
	books.add(new Book(
			"Parable of the Sower",
			"Octavia Butler",
			1993,
			"0941423999"
			));
	
	books.add(new Book(
			"Coils",
			"Fred Saberhagen, Roger Zelazny",
			1982,
			"0523485395"
			));
	
	books.add(new Book(
			"The Sandman Vol. 1: Preludes & Nocturnes",
			"Neil Gaiman",
			1993,
			"1563890119"
			));
	
	books.add(new Book(
			"Anathem",
			"Neal Stephenson",
			2008,
			"0061694940"
			));
	
	books.add(new Book(
			"Pattern Recognition",
			"William Gibson",
			2004,
			"0425192938"
			));
	
	// Do some token data processing to organize the list
	Collections.sort(books, (a, b) -> Integer.compare(a.publicationYear(), b.publicationYear()));
	
	%>

	<h1>CSD430 Module 2.2 Assignment: Java Scriptlets</h1>

	<p>Isaac Ellingson
	<p>6/14/2026

	<h2>Book Details</h2>
<% for(Book book : books) { %>	
	<table>
		<tr>
			<td>Title</td>
			<td><%= book.title() %></td>
		</tr>
		<tr>
			<td>Author</td>
			<td><%= book.author() %></td>
		</tr>
		<tr>
			<td>Publication Year</td>
			<td><%= book.publicationYear() %></td>
		</tr>
		<tr>
			<td>ISBN</td>
			<td><%= book.isbn() %></td>
		</tr>
	</table>
<% } %>	
</body>
</html>
