<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<%

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
        st.execute("Insert into clientes(usuario,nome,telefone,senha)VALUES( '"+email+"','"+nome+"', '"+telefone+"', '"+senha+"') ");
        response.sendRedirect("../usuarios.jsp?status=1");
    }catch(Exception e){
        out.print(e);
    }

%>
