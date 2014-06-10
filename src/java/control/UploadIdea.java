/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

/**
 *
 * @author CaronteTNH
 */
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/UploadIdea")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class UploadIdea extends HttpServlet {
     
    // database connection settings
   private static Connection conn;
   private static String host="127.0.0.1:3306";
   private static String db="greadideas";
   private static String user="root";
   private static String passwd="";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
       String title=request.getParameter("title");
       String desc=request.getParameter("desc");
       String id=request.getParameter("id");
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
           ResultSet resultados;
            String sen = "SELECT  * from ideas order by id";
            Statement sentencia = conn.createStatement();
            resultados = sentencia.executeQuery(sen);
            System.out.println("yeih!");
            int id2=1;
            String id_user="";
            byte[] bauthor = id.getBytes();
            String sauthor="";
  for (int i=0; i < bauthor.length; i++) {
    sauthor +=
          Integer.toString( ( bauthor[i] & 0xff ) + 0x100, 16).substring( 1 );
  }
            while(resultados.next()){
                id2=Integer.parseInt(resultados.getString("id"))+1;
            }
            
            String sen2 = "SELECT  * from usuarios where correo='"+sauthor+"'";
            resultados = sentencia.executeQuery(sen2);
            System.out.println("done1");
            while(resultados.next()){
                id_user=resultados.getString("id");
            }
            // constructs SQL statement
            //String ins = "INSERT  into ideas (id,id_usuario,titulo,info,votos,fecha) Values ('"+id+"','"+id_user+"','"+name+"','"+pass+"','0',NOW())";
            String sql = "INSERT INTO ideas (id,id_usuario,titulo,image,info,votos,fecha) values (?, ?, ?, ?, ? ,?, NOW())";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id2+"");
            statement.setString(2, id_user);
            statement.setString(3, title);
            statement.setString(5, desc);
            statement.setString(6, "0");
             
            if (inputStream != null) {
                statement.setBlob(4, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            System.out.println("done2");
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
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
            getServletContext().getRequestDispatcher("/ideaCreated.jsp").forward(request, response);
        }
    }
}