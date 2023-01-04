package com.example;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PersonJDBC implements PersonDAO{
	
	private Connection connection;
	
	public PersonJDBC(String url, String user, String password) throws ClassNotFoundException, SQLException {
		//load driver communication of postgresql.
		Class.forName("org.postgresql.Driver");
		//open the connection
		this.connection = DriverManager.getConnection(url, user, password);
		
		String sql1 = "CREATE TABLE IF NOT EXISTS person ( id integer, name varchar(45) NOT NULL, identity varchar(450) NOT NULL,birthday varchar(50),enabled integer NOT NULL DEFAULT '1',PRIMARY KEY (id));";
		PreparedStatement ps1 = this.connection.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
		ps1.executeUpdate();
	}

	public void addPerson(Person person) throws SQLException {
		//query of postgresql
		String sql = "insert into person(id,name, identity, birthday)"
				+ "values (?,?,?,?)";
		
		PreparedStatement ps = this.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		
		
		// 1 = first '?' 
		ps.setString(1, 1);
		ps.setString(2, person.getName());
		// 2 - second '?'
		ps.setString(3, person.getIdentity());
		// 3 = third '?'
		ps.setString(4, person.getBirthday());
		
		//use execute update when the database return nothing
		ps.executeUpdate();
		
		ResultSet generatedKeys =  ps.getGeneratedKeys();
		if(generatedKeys.next()) {
			person.setId(generatedKeys.getInt(1));
		}
		
		
	}

	public void removePerson(Person person) throws SQLException {
		String sql = "delete from person where id_person = ?";
		PreparedStatement ps = this.connection.prepareStatement(sql);
		ps.setInt(1, person.getId());
		ps.executeUpdate();
		
		
	}

	public Person getPerson(String name) throws SQLException {
		//get all persons
		ArrayList<Person> array = getAllPersons();
		for (Person person : array) {
			if(person.getName().equals(name)) {
				return person;
			}
		}
		return null;
	}

	public ArrayList<Person> getAllPersons() throws SQLException {
		ArrayList<Person> array = new ArrayList<Person>();
		
		//get all persons
		//query of postgresql
		ResultSet result = this.connection.prepareStatement("select * from person").executeQuery();
		while(result.next()) {
			//new Person
			Person person = new Person();
			//get column of name
			person.setName(result.getString("name"));
			person.setId(result.getInt("id_person"));
			person.setIdentity(result.getString("identity"));
			person.setBirthday(result.getString("birthday"));
			array.add(person);
		}
		result.close();
		return array;
		
	}
}
