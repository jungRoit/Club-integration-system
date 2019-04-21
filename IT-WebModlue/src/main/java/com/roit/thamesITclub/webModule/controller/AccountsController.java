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
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Accounts;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
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
@RequestMapping(value = "/dashboard/accounts")
public class AccountsController {

    @Autowired
    AccountsDAO accountsDAO;
    @Autowired
    ProfilePictureDAO profilePictureDAO;
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    NotificationsDAO notificationsDAO;
    @Autowired
    EventsDAO eventsDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String accounts(Model model1, Model model2,Model eventModel, Model income, Model expenditure, Model modelCurrentBalance, Model memberModel, Model propicModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        eventModel.addAttribute("events", eventsDAO.getAll());
        int totalIncome = 0;
        int totalExpenditure = 0;
        int currentBalance = 0;

        for (Accounts acc : accountsDAO.getAllByTransactionType("income")) {
            totalIncome += acc.getAmount();
        }

        for (Accounts acc : accountsDAO.getAllByTransactionType("expenditure")) {
            totalExpenditure += acc.getAmount();
        }

        currentBalance = totalIncome - totalExpenditure;

        model1.addAttribute("accountIncome", accountsDAO.getAllByTransactionType("income"));
        model2.addAttribute("accountExpenses", accountsDAO.getAllByTransactionType("expenditure"));
        income.addAttribute("income", totalIncome);
        expenditure.addAttribute("expenditure", totalExpenditure);
        modelCurrentBalance.addAttribute("currentBalance", currentBalance);
        return "admin/accounts/index";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String accountsSave(Accounts account,@ModelAttribute("eId")int eventId, Notifications notification) throws ParseException {
        if(eventId != 0){
            account.setEventId(eventsDAO.getById(eventId));
        }
        
        accountsDAO.Insert(account);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        for (Members member : membersDAO.getAll()) {
            if (member.getMemberId() != loggedInMember.getMemberId()) {

                notification.setMemberId(member);

                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
                notification.setNotificationIcon("fa-money");
                notification.setButtonColor("bg-orange");
                notification.setButtonText("Check Accounts");
                notification.setLink("/dashboard/accounts");
                notification.setNotification("Updated the Club Accounts");
                notificationsDAO.Insert(notification);
            }else{
                notification.setMemberId(member);

                notification.setMemberName("You");
                notification.setNotificationIcon("fa-money");
                notification.setButtonColor("bg-orange");
                notification.setButtonText("Check Accounts");
                notification.setLink("/dashboard/accounts");
                notification.setNotification("Updated the Club Accounts");
                notificationsDAO.Insert(notification);
            }
        }

        return "redirect:/dashboard/accounts";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String accountsEdit(Model model, @PathVariable("id") int id) {
        model.addAttribute("accounts", accountsDAO.getById(id));
        return "admin/accounts/edit";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String accountsDelete(@PathVariable("id") int id) {
        accountsDAO.delete(id);
        return "redirect:/dashboard/accounts";

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String accountsUpdate(Accounts account) throws ParseException {

        accountsDAO.update(account);
        return "redirect:/dashboard/accounts";
    }
    
    @RequestMapping(value = "/saveEvent", method = RequestMethod.POST)
    public String accountsSaveByEvent(Accounts account,@ModelAttribute("eId")int eventId, Notifications notification) throws ParseException {
        if(eventId != 0){
            account.setEventId(eventsDAO.getById(eventId));
        }
        
        accountsDAO.Insert(account);
        
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        for (Members member : membersDAO.getAll()) {
            if (member.getMemberId() != loggedInMember.getMemberId()) {

                notification.setMemberId(member);

                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
                notification.setNotificationIcon("fa-money");
                notification.setButtonColor("bg-orange");
                notification.setButtonText("Check Accounts");
                notification.setLink("/dashboard/accounts");
                notification.setNotification("Updated the Club Accounts");
                notificationsDAO.Insert(notification);
            }else{
                notification.setMemberId(member);

                notification.setMemberName("You");
                notification.setNotificationIcon("fa-money");
                notification.setButtonColor("bg-orange");
                notification.setButtonText("Check Accounts");
                notification.setLink("/dashboard/accounts");
                notification.setNotification("Updated the Club Accounts");
                notificationsDAO.Insert(notification);
            }
        }

        return "redirect:/dashboard/events/accounts/"+eventId;
    }

}
