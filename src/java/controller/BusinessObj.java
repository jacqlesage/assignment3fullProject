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
public class BusinessObj {
    
    String businessName;
    String businessConNum;
    int totalNumWorkers;
    String url = "jdbc:oracle:thin:@" + "silver" + ":1527:cosc344";

    public BusinessObj(String businessName, String businessConNum, int totalNumWorkers) {
        this.businessName = businessName;
        this.businessConNum = businessConNum;
        this.totalNumWorkers = totalNumWorkers;
    }
    
    public BusinessObj(){
    }
    

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getBusinessConNum() {
        return businessConNum;
    }

    public void setBusinessConNum(String businessConNum) {
        this.businessConNum = businessConNum;
    }

    public int getTotalNumWorkers() {
        return totalNumWorkers;
    }

    public void setTotalNumWorkers(int totalNumWorkers) {
        this.totalNumWorkers = totalNumWorkers;
    }
    
    public void insertBusinessObj (BusinessObj bo) throws SQLException{
        System.out.println("inside business object");
        String busName = bo.getBusinessName();
        String busConNum = bo.getBusinessConNum();
        int totalWorkers = bo.getTotalNumWorkers();
        
        
        String sql = "INSERT INTO BUSINESS(NAME, CONTACT_NUMBER, NUM_WORKERS)"
                + "values(?,?,?)";
            
             DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
             try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
                 stmt.setString(1,busName );
                 stmt.setString(2, busConNum);
                 stmt.setInt(3, totalWorkers);
                 //stmt.setInt(4, 1);

         
                 stmt.executeUpdate();
         
         
    } catch (SQLException ex) {
            System.out.println("no customer found");
            Logger.getLogger(WorkerObj.class.getName()).log(Level.SEVERE, null, ex); 
    }
    }
    
  public HashMap getBusinessOptions() throws SQLException{
        //return a hasMap which I can then use for the Role type, which
        //we can then use to link the workers role to the specific Id's that have 
        //been input into the worker_role table anyway
        HashMap<Integer, String> hmap = new HashMap<Integer, String>(); 
        
        String sql = "SELECT BUSINESS_ID, NAME FROM BUSINESS";
            
            DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
            try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
                
                ResultSet rs = stmt.executeQuery(sql);
                 
                while(rs.next()){
                     
                    hmap.put(rs.getInt("BUSINESS_ID"), rs.getString("NAME"));
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
