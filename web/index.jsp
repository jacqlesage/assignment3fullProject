<%-- 
    Document   : index
    Created on : Sep 12, 2016, 8:39:31 PM
    Author     : jgoodman
--%>

<%@page import="controller.AssetObj"%>
<%@page import="controller.WorkerObj"%>
<%@page import="controller.IndustryObj"%>
<%@page import="controller.BusinessTypeObj"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.WorkerRoleObj"%>
<%@page import="controller.BusinessObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <%WorkerRoleObj wro = new WorkerRoleObj(); %>
        <%BusinessObj bo = new BusinessObj(); %>
        <%BusinessTypeObj bto = new BusinessTypeObj(); %>
        <%IndustryObj io = new IndustryObj(); %>
        <%WorkerObj wo = new WorkerObj(); %>
        <%AssetObj ao = new AssetObj(); %>
        
    </head>
    
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Asset Wise</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Add Worker</a></li>
      <li><a href="#">Add asset</a></li>
      <li><a href="#">Add service log</a></li>
      <li><a href="#">Reports</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
        
<!End nav bar >

<!start forms>


<!--<form class="form-horizontal">
    <h1>Add business</h1>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
    
     <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
    
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
</form>-->

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
    
  </div>
    
    
     <h2>Add business</h2>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Business name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="busName" name="busName" placeholder="Business name">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Business contact number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="busConNum" name="busConNum" placeholder="Business contact number">
    </div>
  </div>
            
       <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Business type </label>
    
    <select id="busTypeOption" name="busTypeOption">
                  
                  <% 
                      HashMap businessTypeMap = bto.getBusinessTypeOptions(); 
                      Set<HashMap.Entry<Integer, String>> busTypeSet = businessTypeMap.entrySet();
                      for (Entry<Integer, String> type : busTypeSet)
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

<form class="form-horizontal" method="post" action="addToTableServlet">
    
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

                  <form class="form-horizontal" method="post" action="addToTableServlet">
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
        
    

