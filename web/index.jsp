<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> Hair & Cia - Produtos</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 50px" >
            <div class="container px-4 px-lg-5">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!"></a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Hair & Cia</a></li>
                        <li class="nav-item"><a class="nav-link" href="servcard.jsp">Serviços</a></li>
                        <li class="nav-item"><a class="nav-link" href="admin/index.jsp">Entre</a></li>
                       
                    </ul>
                   
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Hair & Cia</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Produtos</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   
                    <%
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
                    rs = st.executeQuery("SELECT *FROM produtos ORDER BY id DESC");
                    while(rs.next()){
                        String id = rs.getString("id");
                    %>    
                    <div class="col" style="margin-bottom: 30px;">
                        <div class="card" style=" height: 580px;">
                          <img style="width:100%;height:200px;object-fit:cover;" src="arquivos/<%=rs.getString("imagem") %>" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title"><%=rs.getString("produto") %></h5>
                            <p class="card-text"><%=rs.getString("descricao") %></p>
                            <hr>
                            <p style="color:black;font-size:20px;text-align:center;">R$<%=rs.getString("valor")%></p>
                            <button class="btn btn-dark" style="width:100%;">Comprar</button>
                          </div>
                        </div>
                      </div>
                <%    }
                }catch(Exception e){
                    out.print(e);
                }
                
                %>
                     
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
