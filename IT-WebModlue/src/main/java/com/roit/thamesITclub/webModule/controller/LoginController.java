/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author User
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {
    
    @RequestMapping(method = RequestMethod.GET)
    public String login(Model model,@RequestParam(value = "error",required = false)String error,@RequestParam(value = "logout",required = false)String logout){
        if(error !=null){
            model.addAttribute("msg", "Invalid Username or Password");
        }
        if(logout!= null){
            model.addAttribute("msg", "Logged out Succesfully");
        }
        
        return "admin/login";
    }
    
  
    
}
