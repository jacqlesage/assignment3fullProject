<%-- 
    Document   : addServiceLog
    Created on : Sep 20, 2016, 10:27:02 AM
    Author     : jgoodman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "WEB-INF/jspf/header.jspf" %>
<!DOCTYPE html>
                 <form class="form-horizontal" method="post" action="addToTableServletServiceLog">
    <h1>Add service log</h1>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Date serviced</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="date_serviced" name="date_serviced" placeholder="Date serviced">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Electrical test done</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="elec_test_done" name="elec_test_done" maxlength="1" placeholder="Electrical test done Y or N">
    </div>
  </div>
    
     <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Calibration done</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="cali_done" name="cali_done" maxlength="1" placeholder="Calibration done Y or N">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Condition</label>
    <div class="col-sm-10">
      <input type="number" min="1" max="10" class="form-control" id="condition" name ="condition" placeholder="Condition">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Comments</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="comments" name="comments" placeholder="Comments">
    </div>
  </div>
 
<!--need to show the asset serial number that the log relates to -->
 <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">Asset serial number </label>
              <select id="assetSerialNum" name="assetSerialNum">
                  
                  <% 
                      HashMap assetSerialNum = ao.getAssetOptions();
                      Set<HashMap.Entry<Integer, String>> assetSet = assetSerialNum.entrySet();
                      for (Entry<Integer, String> role : assetSet)
                      {
                    %>
                         <option value="<%=role.getKey()%>">
                             <%=role.getValue() %>
                         </option>
                    <%
                      }
                  %>
                  
                  
              </select>  
           
           </div>

<!--need to show the workers name that the log relates to to show who serviced it -->
<div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">Worker name who serviced the asset </label>
              <select id="wkrWhoServiced" name="wkrWhoServiced">
                  
                  <% 
                      HashMap workerNameMap = wo.getWorkerNameOptions();
                      Set<HashMap.Entry<Integer, String>> nameSet = workerNameMap.entrySet();
                      for (Entry<Integer, String> role : nameSet)
                      {
                    %>
                         <option value="<%=role.getKey()%>">
                             <%=role.getValue() %>
                         </option>
                    <%
                      }
                  %>
                  
              </select>
           </div>


<!--need to show the workers name that updated the service log - same options as above  -->

<div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">Workers name who updated log </label>
              <select id="wkrWhoUpdated" name="wkrWhoUpdated">
                  
                  <% 
                      HashMap workerNameMap2 = wo.getWorkerNameOptions();
                      Set<HashMap.Entry<Integer, String>> nameSet2 = workerNameMap2.entrySet();
                      for (Entry<Integer, String> role : nameSet2)
                      {
                    %>
                         <option value="<%=role.getKey()%>">
                             <%=role.getValue() %>
                         </option>
                    <%
                      }
                  %>
                  
                  
              </select>  
           
           </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
</form>
