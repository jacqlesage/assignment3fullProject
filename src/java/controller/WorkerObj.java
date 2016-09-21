/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connectToDB.ConnectToDb;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jgoodman
 */
public class WorkerObj {
    
    private String fName;
    private String mName;
    private String lName;
    private String gender;
    private String dob;
    private String start_date;
    private String is_Active;
    private int worker_ID;
    private int role_ID;
    private int bus_ID;
    
    String url = "jdbc:oracle:thin:@" + "silver" + ":1527:cosc344";

    public WorkerObj(String fName, String mName, String lName, String gender, String dob, String start_date, String is_Active, int role_ID, int bus_ID) {
        this.fName = fName;
        this.mName = mName;
        this.lName = lName;
        this.gender = gender;
        this.dob = dob;
        this.start_date = start_date;
        this.is_Active = is_Active;
        this.bus_ID = bus_ID;
        this.role_ID = role_ID;
    }

    public int getRole_ID() {
        return role_ID;
    }

    public int getBus_ID() {
        return bus_ID;
    }

    public WorkerObj() {
    }
    


    public String getfName() {
        return fName;
    }

    public int getWorker_ID() {
        return worker_ID;
    }

    public void setWorker_ID(int worker_ID) {
        this.worker_ID = worker_ID;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getIs_Active() {
        return is_Active;
    }

    public void setIs_Active(String is_Active) {
        this.is_Active = is_Active;
    }
    
     public void insertWorker(WorkerObj wo) throws SQLException, ParseException {
        System.out.println("Inside insert worker");
         int id = wo.getWorker_ID();
         String woFname = wo.getfName();
         String woMname = wo.getmName();
         String woLname = wo.getlName();
         String woGender = wo.getGender();
         String woDOB = wo.getDob();
         String woStartDate = wo.getStart_date();
         String woIsActive = wo.getIs_Active();
         int busOpt = wo.getBus_ID();
         int roleOpt = wo.getRole_ID();
         
         SimpleDateFormat f = new SimpleDateFormat("dd/mm/yyyy");
            java.util.Date date1 = f.parse(woDOB);
            java.util.Date date2 = f.parse(woStartDate);
         
                 
            String sql = "INSERT INTO WORKER(F_NAME, M_NAME, L_NAME, GENDER, D_O_B, START_DATE, IS_ACTIVE, ROLE_ID, BUSINESS_ID)"
                + "values(?,?,?,?,?,?,?,?,?)";
            
             DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
             try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
          
           
                 //stmt.setInt(1, id);
                 stmt.setString(1, woFname);
                 stmt.setString(2, woMname);
                 stmt.setString(3, woLname);
                 stmt.setString(4, String.valueOf(woGender));
                 stmt.setDate(5, new java.sql.Date(date1.getTime()));
                 stmt.setDate(6, new java.sql.Date(date2.getTime()));
                 stmt.setString(7, String.valueOf(woIsActive));
                 stmt.setInt(8, roleOpt);
                 stmt.setInt(9, busOpt);
         
                 stmt.executeUpdate();
         
         
    } catch (SQLException ex) {
            System.out.println("no customer found");
            Logger.getLogger(WorkerObj.class.getName()).log(Level.SEVERE, null, ex); 
    }
     }
     
     public HashMap getWorkerNameOptions() throws SQLException{
        //return a hasMap which I can then use for the Role type, which
        //we can then use to link the workers role to the specific Id's that have 
        //been input into the worker_role table anyway
         HashMap<Integer, String> hmap = new HashMap<Integer, String>(); 
        //should also have a where condition where active is = to on/1
        String sql = "SELECT WORKER_ID, F_NAME, M_NAME, L_NAME FROM WORKER";
            
             DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
             try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
                
                ResultSet rs = stmt.executeQuery(sql);
                 
                 while(rs.next()){
                   
                     String temp = rs.getString("F_NAME");
                      temp += " ";
                      temp += rs.getString("M_NAME");
                      temp += " ";
                      temp += rs.getString("L_NAME");
                     
                      hmap.put(rs.getInt("WORKER_ID"),temp);
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
