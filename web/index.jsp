<%-- 
    Document   : index
    Created on : Sep 12, 2016, 8:39:31 PM
    Author     : jgoodman
--%>

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
        
    </head>
    
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Asset Wise</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Admin</a></li>
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
    
    <select id="">
                  
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

<form class="form-horizontal">
    
    <h1>Add asset</h1>
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
</form>

<form class="form-horizontal">
    <h1>Add service log</h1>
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
</form>
        
    

