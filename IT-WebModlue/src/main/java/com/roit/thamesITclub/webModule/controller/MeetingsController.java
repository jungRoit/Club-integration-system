/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.MeetingResponseDAO;
import com.roit.thamesITclub.coreModule.dao.MeetingsDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.MeetingResponse;
import com.roit.thamesITclub.coreModule.entity.Meetings;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
@RequestMapping(value = "/dashboard/meetings")
public class MeetingsController {

    @Autowired
    MeetingsDAO meetingsDAO;
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    ProfilePictureDAO profilePictureDAO;
    @Autowired
    NotificationsDAO notificationsDAO;
    @Autowired
    MeetingResponseDAO meetingResponseDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String meetings(Model generalModel,Model boardModel,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        generalModel.addAttribute("GeneralMeetings", meetingsDAO.getAllByMeetingType("General Meeting"));
        generalModel.addAttribute("BoardMeetings", meetingsDAO.getAllByMeetingType("Board Meeting"));
        return "admin/meetings/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String meetingsAdd(Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        return "admin/meetings/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String meetingsSave(Notifications notification,Meetings e, @ModelAttribute("date") String date) throws ParseException, Exception {
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date meetingDate = sim.parse(date);
        e.setMeetingDate(meetingDate);

        meetingsDAO.Insert(e);
        
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAll()) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-users");
            notification.setButtonColor("bg-teal");
            notification.setButtonText("View meeting Details");
            notification.setLink("/dashboard/notifications/meeting/"+e.getMeetingId());
            notification.setNotification("Posted a new Meeting '"+e.getMeetingTitle()+"'");
            notificationsDAO.Insert(notification);
        }
        
        return "redirect:/dashboard/meetings";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String meetingsEdit(Model model, @PathVariable("id") int id,Model memberModel,Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("meeting", meetingsDAO.getById(id));
        return "admin/meetings/edit";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String meetingsDelete(Notifications notification,@PathVariable("id") int id) {
       Meetings e=meetingsDAO.getById(id);
        meetingsDAO.delete(id);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-users");
            notification.setButtonColor("bg-teal");
            notification.setButtonText("View meetings");
            notification.setLink("/dashboard/meetings");
            notification.setNotification("Deleted a Meeting '"+e.getMeetingTitle()+"'");
            notificationsDAO.Insert(notification);
        }
         
        
        return "redirect:/dashboard/meetings";

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String meetingsUpdate(Notifications notification,Meetings e, @ModelAttribute("date") String date) throws ParseException {
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date meetingDate = sim.parse(date);
        e.setMeetingDate(meetingDate);
        meetingsDAO.update(e);
        
         Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-users");
            notification.setButtonColor("bg-teal");
            notification.setButtonText("View meetings");
            notification.setLink("/dashboard/notifications/meeting/"+e.getMeetingId());
            notification.setNotification("Edited a Meeting '"+e.getMeetingTitle()+"'");
            notificationsDAO.Insert(notification);
        }
        
        
        return "redirect:/dashboard/meetings";
    }
    
    @RequestMapping(value = "response/save", method = RequestMethod.POST)
    public String addResponse(MeetingResponse meetingResponse, @ModelAttribute("meeting")int meetingId){
         Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        Meetings meeting = meetingsDAO.getById(meetingId);
        
        meetingResponse.setMeetingId(meeting);
        meetingResponse.setMemberId(loggedInMember);
        
        meetingResponseDAO.Insert(meetingResponse);
        
        return "redirect:/dashboard/notifications/meeting/"+meetingId;
    }
    
    @RequestMapping(value = "response/{id}",method = RequestMethod.GET)
    public String showResponse(@PathVariable("id")int id, Model meetingModel, Model goingModel,Model memberModel, Model notGoingModel, Model maybeModel, Model propicModel){
         Members loggedInMember=membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member",loggedInMember );
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        Meetings meeting = meetingsDAO.getById(id);


        List<MeetingResponse> goingResponse = meetingResponseDAO.getAllByMeetingAndResponse(meeting, "Going");
        List<MeetingResponse> notGoingResponse = meetingResponseDAO.getAllByMeetingAndResponse(meeting, "Not Going");
        List<MeetingResponse> maybeResponse = meetingResponseDAO.getAllByMeetingAndResponse(meeting, "Maybe");
        
        
        meetingModel.addAttribute("meetingId", id);
       goingModel.addAttribute("going", goingResponse);
       notGoingModel.addAttribute("notGoing", notGoingResponse);
       maybeModel.addAttribute("maybe", maybeResponse);
        
        
        return "admin/meetings/response";
    }
    
    
        

}
