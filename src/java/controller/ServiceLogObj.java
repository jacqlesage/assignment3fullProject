/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jgoodman
 */
public class ServiceLogObj {
    
    String date_serviced;
    String electrical_test_done;
    String calabration_done;
    int condition;
    //electrical test due and calibration due derived attributes
    String comments;
    int asset_id; //references asset_id in asset table
    int service_id; //references worker id
    int update_id; //references worker id
    String url = "jdbc:oracle:thin:@" + "silver" + ":1527:cosc344";

    public ServiceLogObj(String date_serviced, String electrical_test_done, String calabration_done, int condition, String comments, int asset_id, int service_id, int update_id) {
        this.date_serviced = date_serviced;
        this.electrical_test_done = electrical_test_done;
        this.calabration_done = calabration_done;
        this.condition = condition;
        this.comments = comments;
        this.asset_id = asset_id;
        this.service_id = service_id;
        this.update_id = update_id;
    }

    public ServiceLogObj() {
    }

    public String getDate_serviced() {
        return date_serviced;
    }

    public String getElectrical_test_done() {
        return electrical_test_done;
    }

    public String getCalabration_done() {
        return calabration_done;
    }

    public int getCondition() {
        return condition;
    }

    public String getComments() {
        return comments;
    }

    public int getAsset_id() {
        return asset_id;
    }

    public int getService_id() {
        return service_id;
    }

    public int getUpdate_id() {
        return update_id;
    }
    
    public void insertServiceLogObj (ServiceLogObj slo) throws SQLException, ParseException{
        System.out.println("inside service object");
        int assetID = slo.getAsset_id();
        String elecDone = slo.getElectrical_test_done();
        String caliDone = slo.getCalabration_done();
        String comments = slo.getComments();
        int condition = slo.getCondition();
        int serviceID = slo.getService_id();
        int updateID = slo.getUpdate_id();
        String dateServiced = slo.getDate_serviced();
        
        
         SimpleDateFormat f = new SimpleDateFormat("dd/mm/yyyy");
           java.util.Date date1 = f.parse(dateServiced);
        
        
        
        String sql = "INSERT INTO service_log(DATE_SERVICED, ELECTRICAL_TEST_DONE, CALIBRATION_DONE, CONDITION, COMMENTS, ASSET_ID, SERVICE_ID, UPDATE_ID)"
                + "values(?,?,?,?,?,?,?,?)";
            
             DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
            
             try (Connection con = DriverManager.getConnection(url, "jgoodman", "g00dmans");
            PreparedStatement stmt = con.prepareStatement(sql);
              ){
            
                 stmt.setDate(1,new java.sql.Date(date1.getTime()));
                 stmt.setString(2, elecDone);
                 stmt.setString(3, caliDone);
                 stmt.setInt(4, condition);
                 stmt.setString(5,comments);
                 stmt.setInt(6,assetID);
                 stmt.setInt(7,serviceID);
                 stmt.setInt(8,updateID);
                 //stmt.setInt(4, 1);

         
                 stmt.executeUpdate();
         
         
    } catch (SQLException ex) {
            System.out.println("no customer found");
            Logger.getLogger(WorkerObj.class.getName()).log(Level.SEVERE, null, ex); 
    }
    }
    
}
