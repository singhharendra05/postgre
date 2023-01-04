<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Person" %>
<%@ page import="com.example.PersonJDBC" %>

<%
//you need create database with this name 'github-example-jdbc'
		String url = "jdbc:postgresql://203.246.192.27:2866/scptestdb";
		//user default
		String user = "sirisha";
		//your password. root is default
		String password = "password@321";
		PersonJDBC pjdbc = new PersonJDBC(url, user, password);
		
		
		
		Person person = new Person();
		person.setId(5);
		person.setName("Chloe");
		person.setIdentity("ZAA21");
		person.setBirthday("10/10/1980");
		pjdbc.addPerson(person);
		
		ArrayList<Person> array = pjdbc.getAllPersons();
		
		
		
		
%>
<html>
 <head>
   <style>
   .center-screen {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  min-height: 100vh;
   font-style: oblique;
}
   </style>
 </head>
 <body>
 <div class="center-screen">
  <div>
  <h2>Hello Dev Ops Engineers!</h2><h3>Happy Learning!</h3>
   
  </div>
 </div>
	 <div>
	 <% 
	 	for (Person i : array) {
		%>
			
		 <c:out value="${i.getName()}" />
		 <%=i.getName();%>
	<% 				
		}
		
	 %>	
		System.out.println(pjdbc.getPerson("Chloe").getName());
	<% 
		pjdbc.removePerson(person);
	 %>
	 </div>
 </body>
 </html>
