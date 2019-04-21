/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.AccountsDAO;
import com.roit.thamesITclub.coreModule.dao.EventTeamDAO;
import com.roit.thamesITclub.coreModule.dao.EventsDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Accounts;
import com.roit.thamesITclub.coreModule.entity.EventTeam;
import com.roit.thamesITclub.coreModule.entity.Events;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import com.roit.thamesITclub.coreModule.util.ImageUploader;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author User
 */
@Controller
@RequestMapping(value = "/dashboard/events")
public class EventsController {

    @Autowired
    EventsDAO eventsDAO;
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    ProfilePictureDAO profilePictureDAO;
    @Autowired
    NotificationsDAO notificationsDAO;
    @Autowired
    AccountsDAO accountsDAO;
    @Autowired
    EventTeamDAO eventTeamDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String events(Model model, Model memberModel, Model propicModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("events", eventsDAO.getAll());
        return "admin/events/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String eventsAdd(Model memberModel, Model propicModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        return "admin/events/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String eventsSave(Notifications notification, Events e, @ModelAttribute("date") String date, @ModelAttribute("file") MultipartFile file) throws ParseException, Exception {
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
        Date eventDate = sim.parse(date);
        e.setEventDate(eventDate);

       
                BufferedOutputStream outputStream = new BufferedOutputStream(
                        new FileOutputStream(new File("C:/Users/User/Documents/NetBeansProjects/ThamesITClub/IT-WebModlue/src/main/webapp/WEB-INF/assets/img/portfolio", file.getOriginalFilename())));
                    outputStream.write(file.getBytes());
                    outputStream.flush();
                

                e.setEventImage("img/portfolio/" + file.getOriginalFilename());

                eventsDAO.Insert(e);

                Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

                for (Members m : membersDAO.getAll()) {
                    notification.setMemberId(m);

                    if (m.getMemberId() != loggedInMember.getMemberId()) {
                        notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
                    } else {
                        notification.setMemberName("You");
                    }
                    notification.setNotificationIcon("fa-briefcase");
                    notification.setButtonColor("bg-green");
                    notification.setButtonText("View Details");
                    notification.setLink("/dashboard/notifications/event/" + e.getEventId());
                    notification.setNotification("Created a new Event '" + e.getEventTitle() + "' Check out the Details");
                    notificationsDAO.Insert(notification);
                }

                return "redirect:/dashboard/events";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String eventsEdit(Model model, @PathVariable("id") int id, Model memberModel, Model propicModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("event", eventsDAO.getById(id));
        return "admin/events/edit";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String eventsDelete(@PathVariable("id") int id, Notifications notification) {
        Events e = eventsDAO.getById(id);
        List<Accounts> accountsList = accountsDAO.getAllByEvent(e);
        for(Accounts acc:accountsList){
            accountsDAO.delete(acc.getTransactionId());
        }
        
        List<EventTeam> eventTeams = eventTeamDAO.getAllByEvent(e);
        for(EventTeam et:eventTeams){
            eventTeamDAO.delete(et.getId());
        }
        
        eventsDAO.delete(id);

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {

            notification.setMemberId(m);

            if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-times");
            notification.setButtonColor("bg-green");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Deleted  '" + e.getEventTitle() + "' Event");
            notificationsDAO.Insert(notification);

        }

        return "redirect:/dashboard/events";

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String eventsUpdate(Events e, @ModelAttribute("date") String date, Notifications notification) throws ParseException {
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
        Date eventDate = sim.parse(date);
        e.setEventDate(eventDate);
        eventsDAO.update(e);

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {

            notification.setMemberId(m);

            if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-edit");
            notification.setButtonColor("bg-green");
            notification.setButtonText("View Details");
            notification.setLink("/dashboard/notifications/event/" + e.getEventId());
            notification.setNotification("Edited  '" + e.getEventTitle() + "' Event");
            notificationsDAO.Insert(notification);

        }

        return "redirect:/dashboard/events";
    }

    @RequestMapping(value = "/accounts/{id}", method = RequestMethod.GET)
    public String eventAccounts(@PathVariable("id") int id, Model model1, Model model2,Model eventModel, Model income, Model expenditure, Model modelCurrentBalance, Model memberModel, Model propicModel) {

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        Events event = eventsDAO.getById(id);
        List<Accounts> incomeList = accountsDAO.getAllByEventAndTransaction(event, "income");
        List<Accounts> expensesList = accountsDAO.getAllByEventAndTransaction(event, "expenditure");
        int totalIncome = 0;
        int totalExpenditure = 0;
        int currentBalance = 0;
        

        for (Accounts acc : incomeList) {
            totalIncome += acc.getAmount();
        }

        for (Accounts acc : expensesList) {
            totalExpenditure += acc.getAmount();
        }

        currentBalance = totalIncome - totalExpenditure;
            model1.addAttribute("accountIncome", incomeList);
            model2.addAttribute("accountExpenses", expensesList);
            eventModel.addAttribute("event", event);
        income.addAttribute("income", totalIncome);
        expenditure.addAttribute("expenditure", totalExpenditure);
        modelCurrentBalance.addAttribute("currentBalance", currentBalance);

        return "admin/events/accountByEvent";

    }
    
    
    @RequestMapping(value = "/team/{id}", method = RequestMethod.GET)
    public String eventTeam(@PathVariable("id")int id, Model eventModel , Model model, Model memberModel, Model propicModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        Events event = eventsDAO.getById(id);
        eventModel.addAttribute("event", event);
        model.addAttribute("eventTeam",eventTeamDAO.getAllByEvent(event));
        
        
        
        return "admin/events/team";
    }
    
    @RequestMapping(value = "/team/save")
    public String addEventTeam(EventTeam et, @ModelAttribute("eId")int eId){
          Events e = eventsDAO.getById(eId);
          
          et.setEventId(e);
          
          eventTeamDAO.Insert(et);
        
        
        return "redirect:/dashboard/events/team/"+eId;
    }
    
     @RequestMapping(value = "/team/update")
    public String editEventTeam(EventTeam et, @ModelAttribute("eId")int eId){
          Events e = eventsDAO.getById(eId);
          
          et.setEventId(e);
          
          eventTeamDAO.update(et);
        
        
        return "redirect:/dashboard/events/team/"+eId;
    }
    
     @RequestMapping(value = "/team/delete/{id}")
    public String deleteEventTeam(@PathVariable("id")int id){
        
        eventTeamDAO.delete(id);
        
        return "redirect:/dashboard/events";
    }
    

}
