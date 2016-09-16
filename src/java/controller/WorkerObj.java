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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
    
    String url = "jdbc:oracle:thin:@" + "silver" + ":1527:cosc344";

    public WorkerObj(String fName, String mName, String lName, String gender, String dob, String start_date, String is_Active) {
        this.fName = fName;
        this.mName = mName;
        this.lName = lName;
        this.gender = gender;
        this.dob = dob;
        this.start_date = start_date;
        this.is_Active = is_Active;
    }
    
//      public WorkerObj(int worker_id,String fName, String mName, String lName, String gender, String dob, String start_date, String is_Active) {
//        this.fName = fName;
//        this.mName = mName;
//        this.lName = lName;
//        this.gender = gender;
//        this.dob = dob;
//        this.start_date = start_date;
//        this.is_Active = is_Active;
//        this.worker_ID = worker_id;
//    }

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
                 stmt.setInt(8, 0);
                 stmt.setInt(9, 1);
         
                 stmt.executeUpdate();
         
         
    } catch (SQLException ex) {
            System.out.println("no customer found");
            Logger.getLogger(WorkerObj.class.getName()).log(Level.SEVERE, null, ex); 
    }
     }
     
      
}
