package control;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author CaronteTNH
 */
public class login {
   static final String DEFAULT_ENCODING="UTF-8"; 
   static BASE64Encoder enc=new BASE64Encoder();
   static BASE64Decoder dec=new BASE64Decoder();
   private static Connection conexion;
   private static String host="127.0.0.1:3306";
   private static String db="greadideas";
   private static String user="root";
   private static String passwd="";
    
    public static boolean login_user(String name,String pass){
        

        ResultSet resultados;

         try {
             
             Class.forName("com.mysql.jdbc.Driver");
             conexion = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
            byte[] bname = name.getBytes();
            byte[] bpass = pass.getBytes();
            
            String sname = "";
            String spass = "";
  for (int i=0; i < bname.length; i++) {
    sname +=
          Integer.toString( ( bname[i] & 0xff ) + 0x100, 16).substring( 1 );
  }
  for (int i=0; i < bpass.length; i++) {
    spass +=
          Integer.toString( ( bpass[i] & 0xff ) + 0x100, 16).substring( 1 );
  }
            System.out.println("encode!");
            System.out.println(sname+" "+spass);
            String sen = "SELECT  * from usuarios order by id";
            Statement sentencia = conexion.createStatement();
            resultados = sentencia.executeQuery(sen);
            System.out.println("yeih!");

            while(resultados.next()){
                if(sname.equals(resultados.getString("correo"))&&spass.equals(resultados.getString("password"))){
                    return true;
                }
            }
         return false;
      }
      catch ( Exception e ) {
          System.out.println(e.getMessage());
         return false;
      }
    }
    public static boolean sign_user(String name,String pass){

        ResultSet resultados;

         try {
             
             Class.forName("com.mysql.jdbc.Driver");
             conexion = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
            byte[] bname = name.getBytes();
            byte[] bpass = pass.getBytes();
            
            String sname = "";
            String spass = "";
  for (int i=0; i < bname.length; i++) {
    sname +=
          Integer.toString( ( bname[i] & 0xff ) + 0x100, 16).substring( 1 );
  }
  for (int i=0; i < bpass.length; i++) {
    spass +=
          Integer.toString( ( bpass[i] & 0xff ) + 0x100, 16).substring( 1 );
  }
            System.out.println("encode!");
            System.out.println(sname+" "+spass);
            String sen = "SELECT  * from usuarios order by id";
            Statement sentencia = conexion.createStatement();
            resultados = sentencia.executeQuery(sen);
            System.out.println("yeih!");
            int id=0;
            while(resultados.next()){
                if(sname.equals(resultados.getString("correo"))){
                    return false;
                }
                id=Integer.parseInt(resultados.getString("id"))+1;
            }
            
            System.out.println("count!");
            System.out.println("INSERT  into usuarios (id,correo,password) Values ('"+id+"','"+sname+"','"+spass+"')");
            String ins = "INSERT  into usuarios (id,correo,password) Values ('"+id+"','"+sname+"','"+spass+"')";
            sentencia.executeUpdate(ins);
            System.out.println("add!");
         return true;
      }
      catch ( Exception e ) {
          System.out.println(e.getMessage());
         return false;
      }
    }
    public static String create_idea(String name,String pass,String author){

        ResultSet resultados;

         try {
             
             Class.forName("com.mysql.jdbc.Driver");
             conexion = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
           
            String sen = "SELECT  * from ideas order by id";
            Statement sentencia = conexion.createStatement();
            resultados = sentencia.executeQuery(sen);
            System.out.println("yeih!");
            int id=0;
            String id_user="";
            while(resultados.next()){
                id=Integer.parseInt(resultados.getString("id"))+1;
            }
            
            String sen2 = "SELECT  * from usuarios where correo='"+author+"'";
            resultados = sentencia.executeQuery(sen2);
            
            while(resultados.next()){
                id_user=resultados.getString("id");
            }

            System.out.println(id_user);
            System.out.println("INSERT  into ideas (id,id_usuario,titulo,info,votos,fecha) Values ('"+id+"','"+id_user+"','"+name+"','"+pass+"','0',NOW())");
            String ins = "INSERT  into ideas (id,id_usuario,titulo,info,votos,fecha) Values ('"+id+"','"+id_user+"','"+name+"','"+pass+"','0',NOW())";
            sentencia.executeUpdate(ins);
            System.out.println("add!");
         return id+"";
      }
      catch ( Exception e ) {
          System.out.println(e.getMessage());
         return "-1";
      }
    }
    public static ArrayList<idea> getGreatIdeas(){
        ArrayList<idea> ideas=new ArrayList<idea>();
            
         ResultSet resultados;
         Blob img ;
            byte[] imgData = null ;
         try {
             
             Class.forName("com.mysql.jdbc.Driver");
             conexion = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
                    String sen = "SELECT  * from ideas order by votos";
            Statement sentencia = conexion.createStatement();
            resultados = sentencia.executeQuery(sen);
            System.out.println("yeih!");
            int cont =0;
            while(resultados.next()){
                if(cont>=3){
                    break;
                }
                img = resultados.getBlob(4);
                imgData = img.getBytes(1,(int)img.length());
                idea i=new idea(resultados.getString("id"),resultados.getString("id_usuario"),resultados.getString("titulo"),imgData,resultados.getString("info"),resultados.getString("votos"),resultados.getString("fecha"));
                ideas.add(i);
            }
        
        return ideas;
    }
        catch ( Exception e ) {
          System.out.println(e.getMessage());
         return null;
      }
    }
    
     public static ArrayList<idea> getIdeas(){
        ArrayList<idea> ideas=new ArrayList<idea>();
            
         ResultSet resultados;
         Blob img ;
            byte[] imgData = null ;
         try {
             
             Class.forName("com.mysql.jdbc.Driver");
             conexion = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
                    String sen = "SELECT  * from ideas order by fecha";
            Statement sentencia = conexion.createStatement();
            resultados = sentencia.executeQuery(sen);
            System.out.println("yeih!");
            int cont =0;
            while(resultados.next()){
                if(cont>=3){
                    break;
                }
                img = resultados.getBlob(4);
                imgData = img.getBytes(1,(int)img.length());
                idea i=new idea(resultados.getString("id"),resultados.getString("id_usuario"),resultados.getString("titulo"),imgData,resultados.getString("info"),resultados.getString("votos"),resultados.getString("fecha"));
                ideas.add(i);
            }
        
        return ideas;
    }
        catch ( Exception e ) {
          System.out.println(e.getMessage());
         return null;
      }
    }
    
    public static idea getIdea(String id){
        ResultSet resultados;

         try {
             
             Class.forName("com.mysql.jdbc.Driver");
             conexion = DriverManager.getConnection("jdbc:mysql://"+host+"/" + db+"?user="+user+"&password="+passwd+"&autoReconnect=true");
             System.out.println("hello");
           
            Statement sentencia = conexion.createStatement();
            
            String sen2 = "SELECT  * from ideas where id='"+id+"'";
            resultados = sentencia.executeQuery(sen2);
            System.out.println(id);
            idea i=null;
            while(resultados.next()){
                 Blob img ;
            byte[] imgData = null ;
             img = resultados.getBlob(4);
                imgData = img.getBytes(1,(int)img.length());
                System.out.println(resultados.getString("id"));
                i=new idea(resultados.getString("id"),resultados.getString("id_usuario"),resultados.getString("titulo"),imgData,resultados.getString("info"),resultados.getString("votos"),resultados.getString("fecha"));  
            }
            System.out.println("SI");
            return i;
            
         }
         catch ( Exception e ) {
          System.out.println(e.getMessage());
         return null;
      }
    }
}
