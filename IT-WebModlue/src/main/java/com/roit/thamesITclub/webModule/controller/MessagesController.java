/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.MessagesDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Messages;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author User
 */
@Controller
@RequestMapping(value = "/dashboard/messages")
public class MessagesController {
      @Autowired
    MessagesDAO messagesDAO;
      @Autowired
      MembersDAO membersDAO;
      @Autowired
      ProfilePictureDAO profilePictureDAO;
      
       @RequestMapping(method = RequestMethod.GET)
    public String messages(Model model,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("msg", messagesDAO.getAll());
        return "admin/messages/index";
    }
    
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String messagesAdd(){
        
        return "admin/messages/add";
    }
    
  @RequestMapping(value = "/save",method = RequestMethod.POST)
  public String messagesSave(Messages m) throws ParseException{
      messagesDAO.Insert(m);
      return "redirect:/dashboard/messages";
  }
  
  @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public String messagesEdit(Model model,@PathVariable("id")int id){
        model.addAttribute("msg", messagesDAO.getById(id));
        return "admin/messages/edit";
    }
  
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String messagesDelete(@PathVariable("id")int id){
        messagesDAO.delete(id);
        return "redirect:/dashboard/messages";
        
    }
    
     @RequestMapping(value = "/update",method = RequestMethod.POST)
  public String messagesUpdate(Messages m) throws ParseException{

      messagesDAO.update(m);
      return "redirect:/dashboard/messages";
  }
    
      
}
