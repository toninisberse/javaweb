<%@ page import="util.Upload" %>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>


<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    Upload up = new Upload();
    up.setFolderUpload("arquivos");
    
    if(up.formProcess(getServletContext(), request)) {
    
    String imagem = up.getFiles().get(0);
    String nome = up.getForm().get("nome").toString();
    String desc = up.getForm().get("desc").toString();
    Float valor = Float.parseFloat(up.getForm().get("valor").toString());
    

    String url = "jdbc:postgresql://localhost:5432/trabfinal";
    String usuario = "postgres";
    String senhaBD = "adminadmin";
    
    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url, usuario, senhaBD);
        st = con.createStatement();
        st.execute("INSERT INTO servicos (nome, descricao, valor, imagem) VALUES ('"+nome+"', '"+desc+"', '"+valor+"', '"+imagem+"')");
        response.sendRedirect("../servicos.jsp?status=1");
    } catch (Exception e) {
        out.print (e);
    }
    
    }
    

%>