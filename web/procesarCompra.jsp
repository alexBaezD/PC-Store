<%-- 
    Document   : procesarCompra
    Author     : Alejandro Báez
--%>

<%@page import="Principal.BD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Principal.producto"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Procesar Compra</title>
     <link href="css/bootstrap.css" rel="stylesheet">
        <style>
            body{
               background-color:#59ABE3;
               color:black;
            }
            .fin{
                margin-top: 10%;
            }
        </style>
            
    </head>
    <body>
        <div class="container">
            <div class="row fin">
                <div class="col-sm-12">
                    <div class="list-group">
                    <a href="#" class="list-group-item active">
                      <h1>24 Store</h1>
                    </a>
                   
                  
                 
             <% 
             ArrayList<producto> productos= (ArrayList<producto>) session.getAttribute("productos");
                    BD bd=new BD();
                    Connection conexion=bd.conexion();
                
                if (!conexion.isClosed()){
                   // La consulta
                    java.sql.Statement st = conexion.createStatement(); 
                    productos= (ArrayList<producto>) session.getAttribute("productos");    
                for(producto articulo : productos){
                    for(int i=0;i<articulo.getCantidad();i++){
                         String consulta="call decExistence("+articulo.getRuta()+")";
                                  st.executeQuery(consulta);
                    }
                    }
           
           
                }
                   session.removeAttribute("productos");
                   session.invalidate();
                
              
                    %>
                    <h1 class="list-group-item">Su Compra se ha hecho Satisfactoriamente</h1>
                    <h2> <a href='index.jsp' class="list-group-item">volver </a></h2>
                     
                  </div>
            </div>
            </div>
            
        </div>
       
    </body>
</html>
