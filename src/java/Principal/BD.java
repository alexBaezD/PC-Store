/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Principal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author Alejandro Báez
 */



public class BD {
    
    
 Connection con;
 String username = "root";
 String password = "";
 String base="pcol";

 
   public  Connection  conexion(){
       try{
           
           String dbUrl = "jdbc:mysql://localhost:3306/"+base;
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           con=DriverManager.getConnection(dbUrl,username,password);              
          
           
       }catch(ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e){
           System.out.println("Exception al conectar a BD:   "+e);
       }
       return con;    
    
}    

   
   public void cerrarConexion(){
     try {
         con.close();
     } catch (SQLException ex) {
         Logger.getLogger(BD.class.getName()).log(Level.SEVERE, null, ex);
     }
   }
   

public   ResultSet execQuery(String sql) throws SQLException{
    
    Connection Conexion=conexion();
    Statement st = Conexion.createStatement(); 
    st.executeQuery(sql);
    ResultSet rs=st.getResultSet();
    return rs;
}


}
