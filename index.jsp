
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
if(request.getParameter("submit")!=null)
{
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con;
PreparedStatement pst;
ResultSet rs;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/demo","root","");
        pst = con.prepareStatement("insert into register(name,email,password)values(?,?,?)");
        pst.setString(1, username);
        pst.setString(2, email);
        pst.setString(3, password);
      int count=  pst.executeUpdate();  
      if(count>0)
      {
      response.sendRedirect("index.jsp");
      }else
      {
      out.print("fail not insert record");
      
      }
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
        <h4 class="text-center mt-3 mb-2"> Registation System Crud using-JSP</h4>
        </br>
        <div class="card container">
            <!--<div class="col-md-6 card container">!-->
            <form  method="POST" action="#" > 

                <div alight="">
                    <label class="form-label">username</label>
                    <input type="text" class="form-control " placeholder="username" name="username"  required >
                </div>

                <div alight="">
                    <label class="form-label">email</label>
                    <input type="email" class="form-control" placeholder="email" name="email"required >
                </div>

                <div alight="left">
                    <label class="form-label">password</label>
                    <input type="password" class="form-control" placeholder="password" name="password" required >
                </div>
                </br>

                <div class="row">
                    <div class="col">  
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info w-100">&nbsp; 
                    </div>  
                    <div class="col">  
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning w-100">
                    </div>  
                </div>
            </form>
            <!--</div>!-->
        </div>
        <div class="container">
        <div class="row container   mt-4 mb-3 text-center">
                     <table id="tbl-student" class="table table-hover" cellpadding ="0" >
                         <thead>
                             <tr>
                                    <th>sr</th>
                                    <th>username</th>
                                    <th>email</th>
                                    <th>password</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/demo","root","");
                                
                                  String query = "select * from register";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("id") %></td>
                                 <td><%=rs.getString("name") %></td>
                                 <td><%=rs.getString("email") %></td>
                                 <td><%=rs.getString("password") %></td>
                                 <td><a class="btn btn-primary" href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a class="btn btn-danger" href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
          
            </div> 
        </div>
    </body>
</html>
