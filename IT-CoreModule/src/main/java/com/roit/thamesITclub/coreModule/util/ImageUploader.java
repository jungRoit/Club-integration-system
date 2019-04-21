/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.net.URLConnection;
import javax.imageio.ImageIO;

/**
 *
 * @author User
 */
public class ImageUploader {
   
    
    public String upload(File file){
        
        int count=100;
        String location="img/portfolio/"+count;
        String  pic="C:/Users/User/Documents/NetBeansProjects/ThamesITClub/IT-WebModlue/src/main/webapp/WEB-INF/assets/"+location;
        
        try{
             
            FileInputStream is=new FileInputStream(file);
            
            
           FileOutputStream os=new FileOutputStream(pic+".jpg");
            byte[] data=new byte[1024*5];
            int i;
             while((i=is.read(data))!=-1){
                os.write(data, 0, i);
            }
            is.close();
            os.close();
            count++;
            
        }catch(Exception ioe){
            System.out.println(ioe.getMessage());
        }
        
        return location;
        
    }
    
    
}
