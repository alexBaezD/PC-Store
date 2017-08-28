
package Principal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author Alejandro Báez
 */

@WebServlet(name = "agregarCarrito", urlPatterns = {"/agregarCarrito"})

public class agregarCarrito extends HttpServlet {

HttpSession sesion;
ArrayList<producto> productos;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    String operacion = request.getParameter("accion");
            switch (operacion) {
               case "anadirCarrito":
                   this.agregarProducto(request, response);
                   break;
               case "eliminarCarrito":
                   this.eliminarProducto(request, response);
                   break;
               case "contador":
                   this.contador(request, response);
                   break;
               case "mostrar":
                   this.mostrar(request, response);
                   break;   
           }
  
 }
    
    public void agregarProducto(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        
    String nombre = request.getParameter("nombre");
    Float precio = Float.parseFloat(request.getParameter("precio"));
    String ruta = request.getParameter("id");
    
    sesion= request.getSession(); 
    productos= (ArrayList<producto>) sesion.getAttribute("productos");     
   if(productos ==null){
       productos = new ArrayList<producto>();
        sesion.setAttribute("productos", productos);
    }
    
    producto comp=new producto(nombre,precio,1,ruta);
    Integer indice=null;
    
    
    for(producto articulo : productos){
     if(articulo.getRuta().equalsIgnoreCase(comp.getRuta())){
         indice=productos.indexOf(articulo);
    }
   }
     
  if(indice!=null){
      
       int c=productos.get(indice).getCantidad();
       productos.get(indice).setCantidad(c+1);
      
   }else{
    productos.add(comp);
   }
    
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    
      for(producto articulo : productos){
        out.println("<li class='elemento'>"+
                "<a href='#' class='ico'>"+
                "<img src='img/productos/"+articulo.getRuta()+".jpg' width='72px' height='72px' class='imagenArticuli' alt=''> </a>"+
                "<div class=\"textoArticulo\">"+
                "<p class=\"nomArticulo\">"+articulo.getNombre()+"<span class=\"cantidadArticulo\"><br>$"+articulo.getPrecio()+"</span></p>"+
                "<p class=\"nomArticulo\">Cantidad: "+articulo.getCantidad()+"</p>"+
                 "</div>"+
                "<a onclick=eliminar(this.id,this.name); title='Remover' name='eliminarCarrito' value='eliminarCarrito' id="+productos.indexOf(articulo)+" class='remover'>Quitar</a>"+
                "</li>"+
                "<hr>");
    }
    
    }

    
    public void eliminarProducto(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        
         int id = Integer.parseInt(request.getParameter("id"));
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         productos = (ArrayList<producto>) sesion.getAttribute("productos");
         productos.remove(id);
            
        if(productos.isEmpty()){
            out.print("No hay productos en el carrito");
        }else
            for(producto articulo : productos){
              out.println("<li class='elemento'>"+
              "<a href='#' class='ico'>"+
              "<img src='img/productos/"+articulo.getRuta()+".jpg' width='72px' height='72px' class='imagenArticuli' alt=''> </a>"+
              "<div class=\"textoArticulo\">"+
              "<p class=\"nomArticulo\">"+articulo.getNombre()+"<span class=\"cantidadArticulo\"><br>$"+articulo.getPrecio()+"</span></p>"
                      + "</div>  "+
              "<a onclick=eliminar(this.id,this.name); title='Remover' name='eliminarCarrito' value='eliminarCarrito' id="+productos.indexOf(articulo)+" class='remover'>Quitar</a>"+
             "</li>"+
             "<hr>");
            } 
         
    }
    
    
    
public Float totalComp(HttpServletRequest request, HttpServletResponse response){
            Float subtotal = 0.0F;
            for (producto p : productos) {
                subtotal=(p.getPrecio()*p.getCantidad())+subtotal;    
            }

        return subtotal;        
}
    



public void contador(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{  
    sesion= request.getSession(); 
    productos= (ArrayList<producto>) sesion.getAttribute("productos");
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();    
    Float subtotal=totalComp(request,response);
                    JSONObject obj=new JSONObject();
                    obj.put("precio",subtotal);
                int c=0;
     for(producto articulo : productos){
         c+=articulo.getCantidad();
     }
                    obj.put("total",c);
                    out.println(obj);    
    
    }

 
public void mostrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{ 
    
    sesion= request.getSession(); 
    productos= (ArrayList<producto>) sesion.getAttribute("productos");
    
    if(productos ==null){
       
        productos = new ArrayList<producto>();
        sesion.setAttribute("productos", productos);
    }
    Float subtotal=totalComp(request,response);
    int c=0;
     for(producto articulo : productos){
         c+=articulo.getCantidad();
     }
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
        out.print(""+
"<div id='carrito'>\n" +
"                <span id='cantidad'>"+c
                +"</span>\n" +
"                <span id='articulosT'>Articulos</span>\n" +
"</div>"+
"<div id='total'>\n" +
"        <span id='totalA'>"+subtotal+"</span>\n" +
"        <span id='pesos'>$</span>\n" +
"</div>"+
"    <div id='articulos'>\n" +
"        <div class='cuadroResumen' >\n" +
"            <div class='cuadroRes'>\n" +
"                <div class='listaResumen'>\n" +
"                        <div class='lista'>\n" +
"                            <ul class='elemLista'>");
        if(productos.isEmpty()){
            out.print("No hay productos en el carrito");
        }else
            
 for(producto articulo : productos){
      out.println("<li class='elemento'>"+
      "<a href='#' class='ico'>"+
      "<img src='img/productos/"+articulo.getRuta()+".jpg' width='72px' height='72px' class='imagenArticuli' alt=''> </a>"+
      "<div class=\"textoArticulo\">"+
      "<p class=\"nomArticulo\">"+articulo.getNombre()+"<span class=\"cantidadArticulo\"><br>$"+articulo.getPrecio()+"</span></p>"
              + "</div>  "+
      "<a onclick=eliminar(this.id,this.name); title='Remover' name='eliminarCarrito' value='eliminarCarrito' id="+productos.indexOf(articulo)+" class='remover'>Quitar</a>"+
     "</li>"+
     "<hr>");      
    }
out.print("                  </ul>\n" +
"                        </div>\n" +
"                        <br>\n" +
"                        <p class='subtotal'>SUBTOTAL: $\n" +
"                            <span class='cantidad'>"+subtotal+"</span>\n" +
"                        </p>\n" +
"                        <div class='total2'>\n" +
"                            <a href='pago.jsp' class='botonTotal'>Finalizar compras</a>\n" +
"                        </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"    </div>"
        );
        
      
   
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}