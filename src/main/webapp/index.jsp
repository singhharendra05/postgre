<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>

<%
//you need create database with this name 'github-example-jdbc'
		String url = "jdbc:postgresql://localhost:5432/github-example-jdbc";
		//user default
		String user = "postgres";
		//your password. root is default
		String password = "root";
		PersonJDBC pjdbc = new PersonJDBC(url, user, password);
		
		Person person = new Person();
		person.setName("Chloe");
		person.setIdentity("ZAA21");
		person.setBirthday("10/10/1980");
		pjdbc.addPerson(person);
		
		
		ArrayList<Person> array = pjdbc.getAllPersons();
		
		for (Person i : array) {
			System.out.println(i.getName()+ ", your id is "+ i.getId()+ 
					", "+ i.getBirthday());
		}
		
		System.out.println(pjdbc.getPerson("Rafael").getName());
		pjdbc.removePerson(person);
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
 </body>
 </html>
