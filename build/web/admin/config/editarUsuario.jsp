<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<%
    String id = request.getParameter("id");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    String senha = request.getParameter("senha");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/trabfinal";
    String usuario = "postgres";
    String senhaBD = "adminadmin";
    
    try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,usuario,senhaBD);
        st = con.createStatement();
        st.executeUpdate("update clientes set nome='"+nome+"', usuario='"+email+"', telefone='"+telefone+"', senha='"+senha+"' WHERE id='"+id+"' ");
        response.sendRedirect("../usuarios.jsp?status=2");//Registro atualizado com sucesso!
    }catch(Exception e){
        out.print(e);
    }

%>
