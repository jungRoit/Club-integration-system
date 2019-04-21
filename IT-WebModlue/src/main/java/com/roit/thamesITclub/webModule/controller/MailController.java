/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.AccountsDAO;
import com.roit.thamesITclub.coreModule.dao.EventsDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.entity.Accounts;
import com.roit.thamesITclub.coreModule.entity.Events;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import com.roit.thamesITclub.webModule.mail.MailMail;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author User
 */
@Controller

public class MailController {

    @Autowired
    MailMail mail;
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    NotificationsDAO notificationsDAO;
    @Autowired
    AccountsDAO accountsDAO;
    @Autowired
    EventsDAO eventsDAO;
    

    @RequestMapping(value = "dashboard/messages/mail", method = RequestMethod.POST)
    public String send(Notifications notification, @ModelAttribute("mail-message") String message, @ModelAttribute("recipient") String to, @ModelAttribute("mail-title") String title) {

        mail.sendMail(to, title, message);

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent an Email titled '"+title+"'");
            notificationsDAO.Insert(notification);
        }

        return "redirect:/dashboard/messages";
    }

    @RequestMapping(value = "dashboard/members/mail", method = RequestMethod.POST)
    public String sendToMember(@ModelAttribute("mail-message") String message, @ModelAttribute("recipient") String to, @ModelAttribute("mail-title") String title) {

        mail.sendMail(to, title, message);

        return "redirect:/dashboard/members";
    }

    @RequestMapping(value = "dashboard/mail/send", method = RequestMethod.POST)
    public String sendToAll(Notifications notification,@ModelAttribute("mail-message") String message, @ModelAttribute("recipients") String to, @ModelAttribute("mail-title") String title) {
        List<Members> membersList;

        if (to.equalsIgnoreCase("all")) {
            membersList = membersDAO.getAll();
        } else if (to.equalsIgnoreCase("general")) {
            membersList = membersDAO.getAllByDesignation("ROLE_GENERAL_MEMBER");
        } else {
            membersList = membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER");
        }
        String[] mailingList = new String[membersList.size()];
        int i = 0;
        for (Members m : membersList) {
            mailingList[i] = m.getEmail();
            System.out.println();
            i++;

        }
        
         Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m :membersList ) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent You an Email titled '"+title+"'");
            notificationsDAO.Insert(notification);
        }
        

        mail.sendMailToALl(mailingList, title, message);

        return "redirect:/dashboard/mail";
    }

    @RequestMapping(value = "dashboard/events/mailInvite", method = RequestMethod.POST)
    public String inviteAll(Notifications notification,@ModelAttribute("mail-message") String message, @ModelAttribute("recipients") String to, @ModelAttribute("mail-title") String title) {
        List<Members> membersList;

        if (to.equalsIgnoreCase("all")) {
            membersList = membersDAO.getAll();
        } else if (to.equalsIgnoreCase("general")) {
            membersList = membersDAO.getAllByDesignation("ROLE_GENERAL_MEMBER");
        } else {
            membersList = membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER");
        }
        String[] mailingList = new String[membersList.size()];
        int i = 0;
        for (Members m : membersList) {
            mailingList[i] = m.getEmail();
            System.out.println();
            i++;

        }
        
         Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m :membersList ) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent You an Email titled '"+title+"'");
            notificationsDAO.Insert(notification);
        }

        mail.sendMailToALl(mailingList, title, message);

        return "redirect:/dashboard/events";
    }

    @RequestMapping(value = "dashboard/mail/sendNew", method = RequestMethod.POST)
    public String composemail(Notifications notification,@ModelAttribute("message") String message, @ModelAttribute("to") String to, @ModelAttribute("subject") String title) {

        mail.sendMail(to, title, message);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent an Email titled '"+title+"'");
            notificationsDAO.Insert(notification);
        }

        return "redirect:/dashboard/mail";
    }
    
    @RequestMapping(value = "dashboard/accounts/expenditure/mail")
    public String expenditureEmail(@ModelAttribute("recipient")String to, Notifications notification){
        List<Accounts> expList = accountsDAO.getAllByTransactionType("expenditure");
        String subject = "Thames IT Club Expenditures";
        String message = "Hello \r\n";
        message += "The Club has incured following Expenses \r\n \r\n \r\n \r\n";
        message += "Title |     Amount |   Added Date \r\n"
               + "____________________________________________________________\r\n \r\n";
        
        
        for(Accounts acc:expList){
            message += acc.getTransactionTitle()+" |     "+ acc.getAmount()+"  |      "+acc.getAddedDate()+"\r\n \r\n";
                    
        }
        
        message += "____________________________________________________________\r\n"
                + "\r\n \r\n \r\n"
                + "Thank You \r\n"
                + "Thames IT CLub Board 2018";
        
        mail.sendMail(to, subject, message);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent an Email of Expenses to '"+to+"'");
            notificationsDAO.Insert(notification);
        }
        
        
        return "redirect:/dashboard/accounts";
    }
    
     @RequestMapping(value = "dashboard/accounts/income/mail")
    public String IncomeeEmail(@ModelAttribute("recipient")String to, Notifications notification){
        List<Accounts> expList = accountsDAO.getAllByTransactionType("income");
        String subject = "Thames IT Club Incomes";
        String message = "Hello \r\n";
        message += "The Club has recieved following Incomes \r\n \r\n \r\n \r\n";
        message += "Title |     Amount |   Added Date \r\n"
               + "____________________________________________________________\r\n \r\n";
        
        
        for(Accounts acc:expList){
            message += acc.getTransactionTitle()+" |     "+ acc.getAmount()+"  |      "+acc.getAddedDate()+"\r\n"
                    + "____________________________________________________________\r\n \r\n";
        }
        
        message += "\r\n \r\n \r\n"
                + "Thank You \r\n"
                + "Thames IT CLub Board 2018";
        
        mail.sendMail(to, subject, message);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent an Email of incomes to '"+to+"'");
            notificationsDAO.Insert(notification);
        }
        
        
        return "redirect:/dashboard/accounts";
    }
    
     @RequestMapping(value = "dashboard/accounts/event/income/mail")
    public String eventIncomeeEmail(@ModelAttribute("recipient")String to, @ModelAttribute("eventId")int id , Notifications notification){
        Events event = eventsDAO.getById(id);
        List<Accounts> expList = accountsDAO.getAllByEventAndTransaction(event, "income");
        String subject = "Thames IT Club Incomes for "+event.getEventTitle();
        String message = "Hello \r\n";
        message += "The Club has recieved following Incomes during "+event.getEventTitle()+" that was held on "+event.getEventDate()+" \r\n \r\n \r\n \r\n";
        message += "Title |     Amount |   Added Date \r\n"
               + "____________________________________________________________\r\n \r\n";
        
        
        for(Accounts acc:expList){
            message += acc.getTransactionTitle()+" |    Rs "+ acc.getAmount()+"  |      "+acc.getAddedDate()+"\r\n";
                    
        }
        
        message += "____________________________________________________________\r\n"
                + "\r\n \r\n \r\n"
                + "Thank You \r\n"
                + "Thames IT CLub Board 2018";
        
        mail.sendMail(to, subject, message);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent an Email for incomes of "+event.getEventTitle()+" to '"+to+"'");
            notificationsDAO.Insert(notification);
        }
        
        
        return "redirect:/dashboard/events/accounts/"+id;
    }
    
     @RequestMapping(value = "dashboard/accounts/event/expenditure/mail")
    public String eventExpenditureEmail(@ModelAttribute("recipient")String to, @ModelAttribute("eventId")int id , Notifications notification){
        Events event = eventsDAO.getById(id);
        List<Accounts> expList = accountsDAO.getAllByEventAndTransaction(event, "expenditure");
        String subject = "Thames IT Club Expenses for "+event.getEventTitle();
        String message = "Hello \r\n";
        message += "The Club has incured following Expenses during "+event.getEventTitle()+" that was held on "+event.getEventDate()+" \r\n \r\n \r\n \r\n";
        message += "Title |     Amount |   Added Date \r\n"
               + "____________________________________________________________\r\n \r\n";
        
        
        for(Accounts acc:expList){
            message += acc.getTransactionTitle()+" |    Rs "+ acc.getAmount()+"  |      "+acc.getAddedDate()+"\r\n";
                    
        }
        
        message += "____________________________________________________________\r\n"
                + "\r\n \r\n \r\n"
                + "Thank You \r\n"
                + "Thames IT CLub Board 2018";
        
        mail.sendMail(to, subject, message);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            notification.setMemberId(m);

             if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            notification.setNotificationIcon("fa-envelope");
            notification.setButtonColor("bg-maroon");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Sent an Email for Expenditure of "+event.getEventTitle()+" to '"+to+"'");
            notificationsDAO.Insert(notification);
        }
        
        
        return "redirect:/dashboard/events/accounts/"+id;
    }


}
