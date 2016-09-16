/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectToDB;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

;


/**
 *
 * @author jgoodman
 */
public class ConnectToDb {
    
public void go() {

	// Read pass.dat
//	UserPass login = new UserPass();
//	String user = login.getUserName();
//	String pass = login.getPassWord();
	String host = "silver";

	Connection con = null;
	try {
	    // Register the driver and connect to Oracle
//            Class.forName("oracle.jdbc.driver.OracleDriver");
	    DriverManager.registerDriver 
		(new oracle.jdbc.driver.OracleDriver());
	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
	    con = DriverManager.getConnection(url, "jgoodman","" );
	    System.out.println("Connected to Oracle");
	} catch (SQLException e) {
	    System.out.println(e.getMessage());
	    System.exit(1);

	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}
    }  // end go()

// Used to output an error message and exit
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }
}
