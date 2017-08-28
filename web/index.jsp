<%-- 
    Document   : informacion
    Author     : Alejandro Báez
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Principal.BD"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>24 Store</title>
    <link href="css/bootstrap.css" rel="stylesheet">
       <link rel="stylesheet" href="css/detalleProductos.css">
     <link href="css/home_index.css" rel="stylesheet">
    <script src="js/head.built.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="css/home.built.css" type="text/css" />
   <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
   
    
    
    
 

</head>

<body id="page-top" class="index">

    <!-- Nav -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
           
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"  href="#page-top" style="color:black;">24 Store</a>
            </div>

           
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll" >
                        <a href="#productos">PRODUCTOS</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">OFERTAS</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">PROMOCION</a>
                    </li>
                    <li >
                        <div class="iconoCarro">
                         <input id="botonCart"  class="iconoCentro" type="button">
                      </div>
                    </li>
                </ul>
              
            </div>
           
             <div id="carritoCompras" >
                         <h2>Carrito</h2>
                         <div id="contenedor">
                <div id="carrito">
                    <span id="cantidad"></span>
                </div> 
                <div id="total">
                    <span id="totalA"></span>
                    <span id="pesos">$</span>
                </div>
                <div id="articulos">
                    
                    <div class="cuadroResumen" >
                        <div class="cuadroRes">
                            <div class="listaResumen">                                          
                                <div class="lista">
                                    <ul class="elemLista"></ul>
                                </div>
                                <br>
                                <p class="subtotal">SUBTOTAL:<span class="cantidad">$00.00</span>
                                </p>                                   
                                <div class="total2">
                                    <a href="pago.jsp" class="botonTotal">Finalizar Compra</a>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
                </div>    
                 
                    </div>
                    
        </div>
        <!-- FIN de NAV -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 hidden-xs">
                    <div id="main" class="main" role="main" data-hires="true">
		<div class="productbrowser gh-show-below" data-analytics-region="product browser">
	<div class="productbrowser-wrapper">
		<div class="productbrowser-groups">
			<div id="productbrowser-group-educacion" class="productbrowser-group productbrowser-group-m">
				<ul class="productbrowser-items">
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/edu1.png" width="90" height="90" alt="" />
							
                                                        <span class="productbrowser-label">Básico</span>
						</a>
					</li>
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/edu2.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Super</span>
						</a>
					</li>
				
					
					
				</ul>
			</div>
                    
                    
                        <div id="productbrowser-group-ciber" class="productbrowser-group productbrowser-group-m">
				<ul class="productbrowser-items">
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/cafe1.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Básico</span>
						</a>
					</li>
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/cafe2.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Premium</span>
						</a>
					</li>
					
					
					
				</ul>
			</div>
			
                    
                    <div id="productbrowser-group-oficina" class="productbrowser-group productbrowser-group-m">
				<ul class="productbrowser-items">
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/ofi1.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Básico</span>
						</a>
					</li>
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/ofi2.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Super Oficina</span>
						</a>
					</li>
					
					
					
				</ul>
			</div>
                    
                    
                    
                    <div id="productbrowser-group-game" class="productbrowser-group productbrowser-group-m">
				<ul class="productbrowser-items">
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/game1.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Pro Game</span>
						</a>
					</li>
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/game2.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Ultimate</span>
						</a>
					</li>
					
					
				</ul>
			</div>
                    
                    
                    <div id="productbrowser-group-programador" class="productbrowser-group productbrowser-group-m">
				<ul class="productbrowser-items">
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/pro1.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">Ultimate</span>
						</a>
					</li>
					<li class="productbrowser-item">
						<a class="productbrowser-link" href="paquete.jsp">
							<img class="productbrowser-icon productbrowser-icon-desktop" src="img/paquetes/pro2.png" width="90" height="90" alt="" />
							
							<span class="productbrowser-label">paquetITO</span>
						</a>
					</li>
					
					
					
				</ul>
			</div>
		</div>
	</div>
	<div class="productbrowser-nav">
		<div class="productbrowser-navitems">
			<span class="productbrowser-navcaret"></span>
			<a class="productbrowser-navitem" href="#productbrowser-group-educacion">Estudiante</a>
			<a class="productbrowser-navitem" href="#productbrowser-group-ciber">Ciber Cafe</a>
			<a class="productbrowser-navitem" href="#productbrowser-group-oficina">Oficina</a>
			<a class="productbrowser-navitem" href="#productbrowser-group-game">VideoGamers</a>
			<a class="productbrowser-navitem" href="#productbrowser-group-programador">Programador</a>
		</div>
	</div>
</div>
                        
       </div>
                    
                    <div class="intro-text">
                        <span class="name">Mi Tienda de Computadoras</span>
                        
                        <span class="skills">Ram,CPU,Tarjetas de Video,Tarjeta Madre,Mac</span>
                        
                    </div>
                    
                       
                        
                </div>
            </div>
        </div>
    </header>
    
   


    <!-- Productos -->
    <section id="productos">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    
                    <h2>Mis Productos</h2>
                    <hr style="border: 1px solid black">
                </div>
            </div>
            <div class="row">
             
                
                
             
               <div class="col-sm-12 productos-item">
                <%
                   BD bd=new BD();
                   ResultSet rs=bd.execQuery("SELECT * FROM producto");
                   while (rs.next()){
                %>
                    
                   
                   
                              <div class="block">
                        
			    <div class="producto">
                 <div class="venta"> Oferta</div>
			        <img src="img/productos/<%out.print(rs.getObject("id")); %>.jpg">
                                
			    </div>
			 
			    <div class="info">
			        <h4><%out.print(rs.getObject("nombre"));%></h4>
                                <h3>stock: <%out.print(rs.getObject("existencia"));%></h3>
			        <span class="price"> <%out.print(rs.getObject("precio"));%></span>
                                <form>
                               <input type="hidden"   name="nombre"  value="<%out.print(rs.getObject("nombre"));%>" />
                               <input type="hidden"   name="precio" value="<%out.print(rs.getObject("precio"));%>" />
                               <input type="hidden"   name="id" value="<%out.print(rs.getObject("id"));%>" />
                               <input type="hidden"   name="accion" value="anadirCarrito" />
                                    
                                
                                 <input  class="comprar" type="submit" value="Agregar" name="<%out.print(rs.getObject("id"));%>"/>
                                  </form>
			       
			    </div>

			    <div class="detalles">
                                <p><%out.print(rs.getObject("especificaciones"));%> <br>Modelo: <%out.print(rs.getObject("modelo"));%></p>
                                    
			    </div>
                              
                            </div> 
                <%
                   
                   }
                   // cierre de la conexion
                   bd.cerrarConexion();
            
                %>
           
                      
                
                
			    
                            
			
                
            </div>
        </div>
    </section>

    <!-- Lo mas vendido -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Lo Mas Vendido</h2>
                     <hr style="border: 1px solid white">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div id="owl-demo">
          
                    <div class="item"><img src="img/slider/1.jpg" alt="Owl Image"></div>
                    <div class="item"><img src="img/slider/2.jpg" alt="Owl Image"></div>
                    <div class="item"><img src="img/slider/3.jpg" alt="Owl Image"></div>
                    <div class="item"><img src="img/slider/4.jpg" alt="Owl Image"></div>
                    <div class="item"><img src="img/slider/5.jpg" alt="Owl Image"></div>
                    <div class="item"><img src="img/slider/6.jpg" alt="Owl Image"></div>
                    <div class="item"><img src="img/slider/7.jpg" alt="Owl Image"></div>
                    <div class="item"><img src="img/slider/8.jpg" alt="Owl Image"></div>

</div>
                    
                </div>
            </div>
        </div>
    </section>

   
    <section id="contact">
        <div class="container">
            <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Eres Estudiante , Hay Descuento Para ti</h2>
                     <hr style="border: 1px solid black">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                        Qui, ea, blanditiis quas asperiores quia at quam! 
                        Ipsa, sed, ad, doloribus omnis quaerat et officiis 
                        est tenetur illum nam perspiciatis quisquam..</p>
                </div>
                <div class="col-lg-4">
                    <img src="img/mac.png" alt="MAc">
                </div>
                
            </div>
        </div>
            
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-6">
                        <h3>Team 24</h3>
                        <p>Alejandro Báez<br>Francisco Noriega</p>
                    </div>
                    
                    <div class="footer-col col-md-6">
                        <h3>Programación Avanzada Web</h3>
                        <p>Profesora: Teresa Galan.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; ITO , Ingenieria en Sistemas Computacionales
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Boton para el movil -->
    <div class="scroll-top page-scroll visible-xs visble-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    
  
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.js"></script>
    <script type="text/javascript" src="js/home.built.js"></script> 
    <script type="text/javascript" src="js/owl.carousel.js"></script>
    <script type="text/javascript" src="js/24Store.min.js"></script>
   

</body>

</html>
