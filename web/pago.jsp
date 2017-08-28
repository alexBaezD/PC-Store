<%-- 
    Document   : informacion
    Author     : Alejandro Báez
--%>

<%@page import="Principal.BD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Principal.producto"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            *{
                padding: 0;
                margin: 0;
            }
            body{
               background-color:#59ABE3;
            }
            #formulario{
                text-align: center;
                background-color:#ECF0F1;
                color:#6C7A89;
            }
            #link.active{
                color:white;
            }
            .contenido{
                margin: 5% 0 0 0;
            }
        </style>
    </head>
    <body>        
        <div class="container">
            <div class="row contenido">
                <div class="col-sm-6" >
                    <div id="formulario">
                        <div class="panel panel-primary">
                            <h1>24 Store</h1>
                        </div>
                        
                          
            <% 
             ArrayList<producto> productos= (ArrayList<producto>) session.getAttribute("productos");
              
            if (productos.isEmpty()) {
            %>
            
            <h2>Tu Orden esta vacia   </h2>  
            <br /> <br />
            <img src="img/vacio.png" alt="">
            <div id="link"><h2> <a href="index.jsp"> Comprar ahora </a> </h2>
               
            </div>
                     


                <% } else{  %>
                     <form action="procesarCompra.jsp" method="Post">                   
                
                     <div class="panel-body"> <h2> Informacion de Pago </h2> 
                      </div>
                
                
               
                         <h4> Tipo de tarjeta</h4>
                
                <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-credit-card"></span>
                <select class="form-control" name="card_type">
                    <option> American Express </option>   
                    <option> Visa </option>   
                    <option>Master Card </option>   
                   
                </select>   
                </div>
                                               
              
               <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-credit-card"></span>
                <input type="text" class="form-control" maxlength="16" placeholder="Numero de tarjeta">
                </div>
                <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-credit-card"></span>
                <input type="text" class="form-control" maxlength="4" placeholder="Digitos">
                </div>
                <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-credit-card"></span>
              
                <h3>Expira</h3> <select class="form-control" name="expiration_month">
                    <option> 1 </option> <option> 2 </option> <option> 3 </option> <option> 4 </option>   
                    <option> 5 </option> <option> 6 </option> <option> 7 </option> <option> 8 </option>   
                    <option> 9 </option> <option> 10 </option> <option> 11 </option> <option> 12 </option>   
                </select>                      
                <select class="form-control" name="expiration_year">
                    <option> 2013 </option>   
                    <option> 2014 </option>   
                    <option> 2015 </option>   
                    <option> 2016 </option>   
                </select> 
                </div>
                
                 <div class="panel-body">  <h2> Cliente </h2>  
                      </div>
               
                <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-user"></span>
                <input type="text" class="form-control" placeholder="Nombre">
                </div>
                <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-home"></span>
                <input type="text" class="form-control" placeholder="Direccion">
                </div>
                <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-globe"></span>
                <input type="text" class="form-control" placeholder="Pais">
                </div>
                <div class="input-group input-group-lg">
                <span class="input-group-addon glyphicon glyphicon-barcode"></span>
                <input type="text" class="form-control"placeholder="Codigo Postal" >
                </div>
                 <input type="submit" class="btn btn-primary btn-lg">   

                     </form>
                 </div>
                      
                </div>
                <div class="col-sm-6">
                     <div class="list-group">
                    <a href="" class="list-group-item active">
                        <h1>Su Orden</h1>
                    </a>
                    </div>
                <% 
                  productos= (ArrayList<producto>) session.getAttribute("productos");    
              for(producto articulo : productos){
                out.println("<li class='list-group-item'>"+
                "<a href='#'>"+
                "<img src='img/productos/"+articulo.getRuta()+".jpg' width='72px' height='72px'  alt=''> </a>"+
                "<div class=\"textoArticulo\">"+
                "<p class=\"nomArticulo\">"+articulo.getNombre()+
                        "<span class=\"cantidadArticulo\"><br>Cantidad: "+articulo.getCantidad()+"</span></p>"+
                        "<span ><br>Precio: "+(articulo.getCantidad()*articulo.getPrecio())+"</span></p>"
                        + "</div>  "+

               "</li>"+
               "<hr>"); 
     
            }
           
            out.println("<h2><a href='index.jsp' style='color:white;'>volver</a></h2>");
                    
                    
     }
                
                
                
    %>
                
               </div> 

         
                
            </div>
        </div>
       
    </body>
</html>
