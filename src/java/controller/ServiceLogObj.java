/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author jgoodman
 */
public class ServiceLogObj {
    
    int date_serviced;
    String electrical_test_done;
    String calabration_done;
    int condition;
    //electrical test due and calibration due derived attributes
    String comments;
    int asset_id; //references asset_id in asset table
    int service_id; //references worker id
    int update_id; //references worker id

    public ServiceLogObj(int date_serviced, String electrical_test_done, String calabration_done, int condition, String comments, int asset_id, int service_id, int update_id) {
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

    public int getDate_serviced() {
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
    
    
    
}
