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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jgoodman
 */
public class AssetObj {
    int asset_ID;
    String install_date;
    String purchase_date;
    String model;
    String serial_number;
    int num_of_services;
    int cur_condtion;
    String photo;
    String url = "jdbc:oracle:thin:@" + "silver" + ":1527:cosc344";
    
    int business_id;
    int industry_id;

    public AssetObj(String install_date, String purchase_date, String model, String serial_number, int num_of_services, int cur_condtion, String photo) {
        this.install_date = install_date;
        this.purchase_date = purchase_date;
        this.model = model;
        this.serial_number = serial_number;
        this.num_of_services = num_of_services;
        this.cur_condtion = cur_condtion;
        this.photo = photo;
    }

    public AssetObj(String install_date, String purchase_date, String model, String serial_number, int num_of_services, int cur_condtion, String photo, int business_id, int industry_id) {
        this.install_date = install_date;
        this.purchase_date = purchase_date;
        this.model = model;
        this.serial_number = serial_number;
        this.num_of_services = num_of_services;
        this.cur_condtion = cur_condtion;
        this.photo = photo;
        this.business_id = business_id;
        this.industry_id = industry_id;
    }
    
    

    public AssetObj() {
    }

    public int getBusiness_id() {
        return business_id;
    }

    public int getIndustry_id() {
        return industry_id;
    }

    public int getAsset_ID() {
        return asset_ID;
    }

    public String getInstall_date() {
        return install_date;
    }

    public String getPurchase_date() {
        return purchase_date;
    }

    public String getModel() {
        return model;
    }

    public String getSerial_number() {
        return serial_number;
    }

    public int getNum_of_services() {
        return num_of_services;
    }

    public int getCur_condtion() {
        return cur_condtion;
    }

    public String getPhoto() {
        return photo;
    }


    
    
    
    public void insertAssetObj (AssetObj ao) throws SQLException, ParseException{
        System.out.println("inside asset object");
        int curCondition = ao.getCur_condtion();
        String insDate = ao.getInstall_date();
        String model = ao.getModel();
        int numServices = ao.getNum_of_services();
        String purDate = ao.getPurchase_date();
        String photo = ao.getPhoto();
        String serialNum = ao.getSerial_number();
        int busID = ao.getBusiness_id();
        int indID = ao.getIndustry_id();
        System.out.print(busID + "******");
         SimpleDateFormat f = new SimpleDateFormat("dd/mm/yyyy");
            java.util.Date date1 = f.parse(purDate);
            java.util.Date date2 = f.parse(insDate);
        
        
        String sql = "INSERT INTO ASSET(INSTALL_DATE, PURCHASE_DATE, MODEL, SERIAL_NUMBER, NUMBER_SERVICES, CUR_CONDITION, PHOTO, BUSINESS_ID, INDUSTRY_ID)"
                + "values(?,?,?,?,?,?,?,?,?)";
            
             DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
             try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
                 stmt.setDate(1,new java.sql.Date(date2.getTime()) );
                 stmt.setDate(2, new java.sql.Date(date1.getTime()));
                 stmt.setString(3, model);
                 stmt.setString(4, serialNum);
                 stmt.setInt(5, numServices);
                 stmt.setInt(6, curCondition);
                 stmt.setString(7, photo);
                 stmt.setInt(8, busID);
                 stmt.setInt(9, indID);

         
                 stmt.executeUpdate();
         
         
    } catch (SQLException ex) {
            System.out.println("no customer found");
            Logger.getLogger(WorkerObj.class.getName()).log(Level.SEVERE, null, ex); 
    }
    
            
}
    public HashMap getAssetOptions() throws SQLException{
        //return a hasMap which I can then use for the Role type, which
        //we can then use to link the workers role to the specific Id's that have 
        //been input into the worker_role table anyway
        HashMap<Integer, String> hmap = new HashMap<Integer, String>(); 
        
        String sql = "SELECT ASSET_ID, SERIAL_NUMBER FROM ASSET";
            
            DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
            try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
                
                ResultSet rs = stmt.executeQuery(sql);
                 
                while(rs.next()){
                     
                    hmap.put(rs.getInt("ASSET_ID"), rs.getString("SERIAL_NUMBER"));
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
