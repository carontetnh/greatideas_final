/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import org.apache.catalina.util.Base64;

/**
 *
 * @author CaronteTNH
 */
public class idea {
    private String id;
    private String id_usuario;
    private String titulo;
    private byte[] image;
    private String info;
    private String votos;
    private String fecha;
    
    
    
    public idea(String id,String id_usuario, String titulo, byte[] image, String info, String votos, String fecha){
        this.id=id;
        this.id_usuario=id_usuario;
        this.titulo=titulo;
        this.image=image;
        this.info=info;
        this.votos=votos;
        this.fecha=fecha;
    }
    
    public String getId(){
        return id;
    }
    public String getFecha(){
        return fecha;
    }
    public String getId_usuario(){
        return id_usuario;
    }
    public String getTitulo(){
        return titulo;
    }
    public String getImage(){
        return Base64.encode(image);
    }
    public String getInfo(){
        return info;
    }
    public String getVotos(){
        return votos;
    }
}
