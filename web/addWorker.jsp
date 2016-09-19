<%-- 
    Document   : addWorker
    Created on : Sep 20, 2016, 10:08:52 AM
    Author     : jgoodman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file = "WEB-INF/jspf/header.jspf" %>
<!DOCTYPE html>
<form class="form-horizontal" method="post" action="addToTableServlet">
    <h1>Add worker</h1>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">First name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Middle name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="mname" name="mname"placeholder="Middle name">
    </div>
  </div>
    
     <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Last name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="lname" name="lname" placeholder="Last name">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Gender</label>
    <div class="col-sm-10">
      <input type="char" class="form-control" id="gender" name="gender" placeholder="Gender: 'M' or 'F'">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Date of Birth</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="dob" name="dob" placeholder="i.e DD/MM/YYYY">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Is active</label>
    <div class="col-sm-10">
      <input type="char" class="form-control" id="isActive" name="isActive" placeholder="'Y' or 'N'">
    </div>
  </div>
    
        <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Start Date</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="startDate" name="startDate" placeholder="Start Date">
    </div>
  </div>
    
      <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">Role </label>
              <select id="wkRoleOption" name="wkRoleOption">
                  
                  <% 
                      HashMap workerRoleMap = wro.getRoleOptions(); 
                      Set<HashMap.Entry<Integer, String>> entrySet = workerRoleMap.entrySet();
                      for (Entry<Integer, String> role : entrySet)
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
    <label for="inputEmail3" class="col-sm-2 control-label">BUSINESS</label>
     <select id="wkBusinesOption" name="wkBusinessOption">
                  
                  <% 
                      HashMap businessMap = bo.getBusinessOptions(); 
                      Set<HashMap.Entry<Integer, String>> entrySet2 = businessMap.entrySet();
                      for (Entry<Integer, String> type : entrySet2)
                      {
                    %>
                         <option value="<%=type.getKey()%>">
                             <%=type.getValue() %>
                         </option>
                    <%
                      }
                  %>
                  
                  
              </select>  
                  
                  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
      </div>
        
</form>
    
  
                  