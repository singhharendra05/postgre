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
		
		
		
		
		
		
		ArrayList<Person> array = pjdbc.getAllPersons();
		
		Person person = new Person();
		
		for (Person i : array) {
			System.out.println(i.getName()+ ", your id is "+ i.getId()+ 
					", "+ i.getBirthday());
					person.setId(i.getId()+1);
		}
		person.setName("Chloe");
		person.setIdentity("ZAA21");
		person.setBirthday("10/10/1980");
		pjdbc.addPerson(person);
		
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
