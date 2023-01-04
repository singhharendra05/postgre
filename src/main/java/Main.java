package com.example;
import java.sql.SQLException;
import java.util.ArrayList;

public class Main {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:postgresql://203.246.192.25:2866/scptestdb";
		//user default
		String user = "sirisha";
		//your password. root is default
		String password = "password@321";
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
	}

}
