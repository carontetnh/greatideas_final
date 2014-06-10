/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author CaronteTNH
 */
@WebServlet(name = "VoteDown", urlPatterns = {"/VoteDown"})
public class VoteDown extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     private static Connection conn;
   private static String host="127.0.0.1:3306";
   private static String db="greadideas";
   private static String user="root";
   private static String passwd="";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
       
       String id_idea=request.getParameter("id_idea");
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
           ResultSet resultados;
           Statement sentencia = conn.createStatement();
           System.out.println(id_idea);
            String sen2 = "SELECT  * from ideas where id='"+id_idea+"'";
            resultados = sentencia.executeQuery(sen2);
            System.out.println("done1");
            int i=0;
            while(resultados.next()){
                i=Integer.parseInt(resultados.getString("votos"))-1;
                System.out.println(i);
            }
            System.out.println(i);
            // constructs SQL statement
            //String ins = "INSERT  into ideas (id,id_usuario,titulo,info,votos,fecha) Values ('"+id+"','"+id_user+"','"+name+"','"+pass+"','0',NOW())";
            String sql = "UPDATE ideas SET votos='"+i+"' where id='"+id_idea+"'";
            sentencia.executeUpdate(sql);
 
            // sends the statement to the database server
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        }  catch (ClassNotFoundException ex) {
               Logger.getLogger(UploadIdea.class.getName()).log(Level.SEVERE, null, ex);
           } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/great.jsp").forward(request, response);
        }
    }
}