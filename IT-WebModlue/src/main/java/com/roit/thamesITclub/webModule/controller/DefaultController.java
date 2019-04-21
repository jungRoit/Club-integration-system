/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.EventsDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.MessagesDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Messages;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author User
 */
@Controller
@RequestMapping(value = "/")
public class DefaultController {
    @Autowired
    EventsDAO eventsDAO;
    @Autowired
    MessagesDAO messagesDAO;
    @Autowired
    NotificationsDAO notificationsDAO;
    @Autowired
    MembersDAO membersDAO;
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "index";
    }
    
    
    @RequestMapping(value = "/events",method = RequestMethod.GET)
    public String events(Model model){
        model.addAttribute("events", eventsDAO.getAll());
        return "events";
    }
    
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String submitCOntact(Messages messages,Notifications notification){
        
        messagesDAO.Insert(messages);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        List<Members> membersList = membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER");
        for (Members m : membersList) {
            notification.setMemberId(m);

            notification.setMemberName(messages.getEmail());
            notification.setNotificationIcon("fa-folder-open");
            notification.setButtonColor("bg-lime");
            notification.setButtonText("View");
            notification.setLink("/dashboard/messages");
            notification.setNotification("added a new message");
            notificationsDAO.Insert(notification);
        }
        
        return "redirect:";
    }
    
    
      @RequestMapping(value = "/403",method = RequestMethod.GET)
    public String accessDenied(){
        return "admin/403";
    }
    
    
}
