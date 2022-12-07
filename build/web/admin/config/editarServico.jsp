<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import="util.Upload" %>
<%@ page import= "java.io.File" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    Upload up = new Upload();
    up.setFolderUpload("arquivos");
    
    if(up.formProcess(getServletContext(), request)) {
        String nome = up.getForm().get("nome").toString();
        String desc = up.getForm().get("desc").toString();
        Float valor = Float.parseFloat(up.getForm().get("valor").toString());
        String id = request.getParameter("id");
        String imagem = up.getFiles().get(0);



        String url = "jdbc:postgresql://localhost:5432/trabfinal";
        String usuario = "postgres";
        String senhaBD = "adminadmin";

        try{
        Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection(url,usuario,senhaBD);
                    st = con.createStatement();
                    st.executeUpdate("UPDATE servicos set nome = '"+nome+"', descricao = '"+desc+"', valor = '"+valor+"', imagem = '"+imagem+"' WHERE id = '"+id+"' " );
                    response.sendRedirect("../servicos.jsp?erro=3");
                    }catch (Exception e){
                    out.println(e);

                    }
   }
        %>
    </body>
</html>
