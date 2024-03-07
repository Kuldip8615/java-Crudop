<%@page import="java.sql.*" %> 


<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/demo","root","");
        pst = con.prepareStatement("delete from register where id = ?");
         pst.setString(1, id);
       int count= pst.executeUpdate();  
        if(count>0)
        {
            response.sendRedirect("index.jsp");
        }else
        {
        out.print("fail delete");
        }
%>
       