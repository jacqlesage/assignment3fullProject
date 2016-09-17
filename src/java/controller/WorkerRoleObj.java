/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jgoodman
 */
public class WorkerRoleObj {
    
    int RoleID;
    String roleDescription;
    String url = "jdbc:oracle:thin:@" + "silver" + ":1527:cosc344";

    public WorkerRoleObj() {
    }
    
    
    
    public HashMap getRoleOptions() throws SQLException{
        //return a hasMap which I can then use for the Role type, which
        //we can then use to link the workers role to the specific Id's that have 
        //been input into the worker_role table anyway
         HashMap<Integer, String> hmap = new HashMap<Integer, String>(); 
        
        String sql = "SELECT ROLE_ID, ROLE_DESCRIPTION FROM WORKER_ROLE";
            
             DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
             try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
                
                ResultSet rs = stmt.executeQuery(sql);
                 
                 while(rs.next()){
                     
                     hmap.put(rs.getInt("ROLE_ID"), rs.getString("ROLE_DESCRIPTION"));
//                     System.out.print(rs.getInt("ROLE_ID"));
//                     System.out.println(rs.getString("ROLE_DESCRIPTION"));
                 }
         
         
    } catch (SQLException ex) {
            System.out.println("no customer found");
            Logger.getLogger(WorkerObj.class.getName()).log(Level.SEVERE, null, ex); 
    }
             return hmap;
     }
        
        
}
