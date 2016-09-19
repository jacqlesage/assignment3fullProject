<%-- 
    Document   : addAsset
    Created on : Sep 20, 2016, 10:23:23 AM
    Author     : jgoodman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "WEB-INF/jspf/header.jspf" %>
<!DOCTYPE html>
<form class="form-horizontal" method="post" action="addToTableServletAsset">
    
    <h1>Add asset</h1>
  <div class="form-group" >
    <label for="inputEmail3" class="col-sm-2 control-label">Current condition</label>
    <div class="col-sm-10">
      <input type="number" min="1" max="10" class="form-control" id="cur_condition" name="cur_condition" placeholder="Current condition ie 1 (lowest) 10 (best)">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Install date</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="ins_date" name="ins_date" placeholder="Install date DD/MM/YYYY format">
    </div>
  </div>
    
     <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Model</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="model" name="model" placeholder="Model name">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Number of services</label>
    <div class="col-sm-10">
      <input type="number" class="form-control" min="0" id="num_services" name="num_services" placeholder="Number of services i.e 1">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Photo location</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="photo" name="photo" placeholder="File location">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Purchase date</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pur_date" name="pur_date" placeholder="Purchase date DD/MM/YYYY format">
    </div>
  </div>
    
        <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Serial number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="serial_num" name="serial_num" placeholder="Serial number">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Industry type </label>
    
    <select id="indTypeOption" name="indTypeOption">
                  
                  <% 
                      HashMap industryTypeMap = io.getIndustryOptions(); 
                      Set<HashMap.Entry<Integer, String>> indTypeSet = industryTypeMap.entrySet();
                      for (Entry<Integer, String> type : indTypeSet)
                      {
                    %>
                         <option value="<%=type.getKey()%>">
                             <%=type.getValue() %>
                         </option>
                    <%
                      }
                  %>
                  
                  
              </select>  
    
  </div>
    <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">BUSINESS</label>
     <select id="wkBusinesOption" name="wkBusinessOption">
                  
                  <% 
                      HashMap businessMapForAsset = bo.getBusinessOptions(); 
                      Set<HashMap.Entry<Integer, String>> businessList = businessMapForAsset.entrySet();
                      for (Entry<Integer, String> type : businessList)
                      {
                    %>
                         <option value="<%=type.getKey()%>">
                             <%=type.getValue() %>
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
