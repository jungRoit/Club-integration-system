/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.EmailTemplatesDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.MessagesDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.EmailTemplates;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author User
 */
@Controller
@RequestMapping(value = "/dashboard/mail")
public class MailTemplateController {
      @Autowired
    MessagesDAO messagesDAO;
      @Autowired
      EmailTemplatesDAO emailTemplatesDAO;
      @Autowired
      MembersDAO membersDAO;
      @Autowired
      ProfilePictureDAO profilePictureDAO;
      @Autowired
      NotificationsDAO notificationsDAO;
      
      
       @RequestMapping(method = RequestMethod.GET)
    public String emailTemplate(Model model,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("templates", emailTemplatesDAO.getAll());
        
        return "admin/mail/index";
    }
    
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String emailTemplateAdd(Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        
        return "admin/mail/add";
    }
    
  @RequestMapping(value = "/save",method = RequestMethod.POST)
  public String emailTemplateSave(EmailTemplates template,Notifications notification){
      emailTemplatesDAO.Insert(template);
      
      Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            if(m.getDesignation().equalsIgnoreCase("ROLE_PRESIDENT") || m.getDesignation().equalsIgnoreCase("ROLE_SECRETATY") || m.getDesignation().equalsIgnoreCase("ROLE_VICE_PRESIDENT")){

            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-pencil");
            notification.setButtonColor("bg-yellow");
            notification.setButtonText("View Templates");
            notification.setLink("/dashboard/notifications/emailTemplate/"+template.getTemplateId());
            notification.setNotification("Added a new Email Template  '" + template.getTemplateTitle()+"'");
            notificationsDAO.Insert(notification);
            }
        }
      
      
      return "redirect:/dashboard/mail";
  }
  
  @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public String emailTemplateEdit(Model model,@PathVariable("id")int id,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("template", emailTemplatesDAO.getById(id));
        return "admin/mail/edit";
    }
  
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String emailTemplateDelete(@PathVariable("id")int id,Notifications notification){
        EmailTemplates template =emailTemplatesDAO.getById(id);
        emailTemplatesDAO.delete(id);
        
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            if(m.getDesignation().equalsIgnoreCase("ROLE_PRESIDENT") || m.getDesignation().equalsIgnoreCase("ROLE_SECRETATY") || m.getDesignation().equalsIgnoreCase("ROLE_VICE_PRESIDENT")){

            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-pencil");
            notification.setButtonColor("bg-yellow");
            notification.setButtonText("view");
            notification.setLink("/dashboard/mail");
            notification.setNotification("Deleted an Email Template  '" + template.getTemplateTitle()+"'");
            notificationsDAO.Insert(notification);
            }
        }
        
        
        
        
        return "redirect:/dashboard/mail";
        
    }
    
     @RequestMapping(value = "/update",method = RequestMethod.POST)
  public String emailTemplateUpdate(EmailTemplates template,Notifications notification){

      emailTemplatesDAO.update(template);
      
      
      Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            if(m.getDesignation().equalsIgnoreCase("ROLE_PRESIDENT") || m.getDesignation().equalsIgnoreCase("ROLE_SECRETATY") || m.getDesignation().equalsIgnoreCase("ROLE_VICE_PRESIDENT")){

            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-pencil");
            notification.setButtonColor("bg-yellow");
            notification.setButtonText("View Templates");
            notification.setLink("/dashboard/notifications/emailTemplate/"+template.getTemplateId());
            notification.setNotification("Edited an Email Template  '" + template.getTemplateTitle()+"'");
            notificationsDAO.Insert(notification);
            }
        }
      
      return "redirect:/dashboard/mail";
  }
    
      
}
