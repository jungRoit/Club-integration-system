/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.CommentsDAO;
import com.roit.thamesITclub.coreModule.dao.EmailTemplatesDAO;
import com.roit.thamesITclub.coreModule.dao.EventsDAO;
import com.roit.thamesITclub.coreModule.dao.MeetingsDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.dao.PostsDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import com.roit.thamesITclub.coreModule.entity.Posts;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author User
 */
@Controller
public class NotificationsController {
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    ProfilePictureDAO profilePictureDAO;
    @Autowired
    NotificationsDAO notificationsDAO;
    @Autowired
    PostsDAO postsDAO;
    @Autowired
    CommentsDAO commentsDAO;
    @Autowired
    EventsDAO eventsDAO;
    @Autowired
    EmailTemplatesDAO emailTemplatesDAO;
    @Autowired
    MeetingsDAO meetingDAO;
    
    @RequestMapping(value = "/dashboard/notifications")
    public String notifications(Model model,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        
        List<Notifications> notificationList=notificationsDAO.getAllByMember(loggedInMember);
         Comparator<Notifications> compareNotification =new Comparator<Notifications>() {

            @Override
            public int compare(Notifications t, Notifications t1) {
               return t1.getNotificationId() - t.getNotificationId();
            }
        };
        
        Collections.sort(notificationList,compareNotification);
        
        model.addAttribute("notification", notificationList);
        
        return "admin/notifications/index";
    }
    
    @RequestMapping(value = "/dashboard/notifications/post/{id}")
    public String post(@PathVariable("id")int id,Model postModel,Model commentsModel,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        Posts post=postsDAO.getById(id);
        
        
        postModel.addAttribute("post", post);
        commentsModel.addAttribute("comments", commentsDAO.getAll());
        
       return "admin/notifications/post";
    }
    
    
    @RequestMapping(value = "/dashboard/notifications/event/{id}")
    public String event(@PathVariable("id")int id,Model eventModel,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
       
        eventModel.addAttribute("event", eventsDAO.getById(id));
        
       return "admin/notifications/event";
    }
    
    
     @RequestMapping(value = "/dashboard/notifications/emailTemplate/{id}")
    public String EmailTemplate(@PathVariable("id")int id,Model emailModel,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
       
       emailModel.addAttribute("email", emailTemplatesDAO.getById(id));
        
       return "admin/notifications/template";
    }
    
    @RequestMapping(value = "/dashboard/notifications/member/{id}")
    public String member(@PathVariable("id")int id,Model model,Model modelPP,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
       
        modelPP.addAttribute("picture", profilePictureDAO.getByMemberId(membersDAO.getById(id)));
        model.addAttribute("mem", membersDAO.getById(id));
       
        
       return "admin/notifications/member";
    }
    
    
     @RequestMapping(value = "/dashboard/notifications/meeting/{id}")
    public String meeting(@PathVariable("id")int id,Model meetingModel,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
       
        meetingModel.addAttribute("meeting", meetingDAO.getById(id));
        
       return "admin/notifications/meeting";
    }
    
}
