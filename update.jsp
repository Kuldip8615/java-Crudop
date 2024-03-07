
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("uid");
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/demo","root","");
        pst = con.prepareStatement("update register set name = ?,email =?,password= ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, password);
        pst.setString(4, id);
        pst.executeUpdate();  
        %>
        <script>   
            alert("Record Updateddddd");    
            <% response.sendRedirect("index.jsp");%>
       </script>
    <%             
    }

%>

      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->
    </head>
    <body>
        <h4 class="text-center mt-3 mb-2">user Registation System Crud using-JSP</h4>
        </br>
        <div class="card container">
            <!--<div class="col-md-6 card container">!-->
            <form  method="POST" action="#" >
                 <%    
                        Connection conn;
                        PreparedStatement ps;
                        ResultSet rst;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          conn = DriverManager.getConnection("jdbc:mysql://localhost/demo","root","");
                           
                          String id= request.getParameter("id");
                          
                        ps = conn.prepareStatement("select * from register where id = ?");
                        ps.setString(1, id);
                        rst = ps.executeQuery();
                        
                         while(rst.next())
                         {
                    
                    %>
                     <div alight="">
                    
                         <input type="hidden" class="form-control " placeholder="uid" value="<%=rst.getString("id")%>" name="uid"  required >
                </div>

                <div alight="">
                    <label class="form-label">username</label>
                    <input type="text" class="form-control "value="<%=rst.getString("name")%>" placeholder="username" name="username"  required >
                </div>

                <div alight="">
                    <label class="form-label">email</label>
                    <input type="email" class="form-control" value="<%=rst.getString("email")%>" placeholder="email" name="email"required >
                </div>

                <div alight="left">
                    <label class="form-label">password</label>
                    <input type="text" class="form-control" value="<%=rst.getString("password")%>" placeholder="password" name="password" required >
                </div>
                </br>
                  <% }  %>

                <div class="row">
                    <div class="col">  
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info w-100">&nbsp; 
                    </div>  
                    <div class="col">  
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning w-100">
                    </div>  
                </div>
            </form>
           
        </div>
    </body>
</html>
