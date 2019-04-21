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
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author User
 */
@Controller
public class CSVController {

    @Autowired
    AccountsDAO accountsDAO;
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    NotificationsDAO notificationsDAO;
    @Autowired
    EventsDAO eventsDAO;

    @RequestMapping(value = "/dashboard/accounts/exportExpenses")
    public String exportExpenses(HttpServletResponse response, Notifications notification) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"expenses.csv\"");

        OutputStream outputStream = response.getOutputStream();
        String writer = "";

        int total = 0;

        writer = "Transaction,Amount,Remarks,Added date \r\n";
        for (Accounts ac : accountsDAO.getAllByTransactionType("expenditure")) {
            writer += ac.getTransactionTitle() + "," + ac.getAmount() + "," + ac.getRemarks() + "," + ac.getAddedDate() + "\r\n";
            total += ac.getAmount();
        }
        writer += "total:," + Integer.toString(total);

        outputStream.write(writer.getBytes());
        outputStream.flush();
        outputStream.close();

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        List<Members> membersList = membersDAO.getAllByDesignation("ROLE_TREASURER");
        for (Members m : membersList) {
            notification.setMemberId(m);

            if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }

            notification.setNotificationIcon("fa-download");
            notification.setButtonColor("bg-brown");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Downloaded the Expenses File");
            notificationsDAO.Insert(notification);
        }

        return "redirect:/dashboard/accounts";

    }

    @RequestMapping(value = "/dashboard/accounts/exportIncome")
    public String exportIncome(HttpServletResponse response, Notifications notification) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"income.csv\"");

        OutputStream outputStream = response.getOutputStream();
        String writer = "";

        int total = 0;

        writer = "Transaction,Amount,Remarks,Added date \r\n";
        for (Accounts ac : accountsDAO.getAllByTransactionType("income")) {
            writer += ac.getTransactionTitle() + "," + ac.getAmount() + "," + ac.getRemarks() + "," + ac.getAddedDate() + "\r\n";
            total += ac.getAmount();
        }
        writer += "total:," + Integer.toString(total);

        outputStream.write(writer.getBytes());
        outputStream.flush();
        outputStream.close();

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        List<Members> membersList = membersDAO.getAllByDesignation("ROLE_TREASURER");
        for (Members m : membersList) {
            notification.setMemberId(m);

            if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }
            
            notification.setNotificationIcon("fa-download");
            notification.setButtonColor("bg-brown");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Downloaded the Income File");
            notificationsDAO.Insert(notification);
        }

        return "redirect:/dashboard/events";
    }
    
     @RequestMapping(value = "/dashboard/events/accounts/exportEventExpenses/{id}")
    public String exportEventExpenses(HttpServletResponse response, @PathVariable("id")int id, Notifications notification) throws IOException {
        Events event = eventsDAO.getById(id);
        
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\""+event.getEventTitle()+"-expenses.csv\"");

        OutputStream outputStream = response.getOutputStream();
        String writer = "";

        int total = 0;
        
        writer = "Event:,"+event.getEventTitle() + "\r\n";
        writer += "Transaction,Amount,Remarks,Added date \r\n";
        for (Accounts ac : accountsDAO.getAllByEventAndTransaction(event, "expenditure")) {
            writer += ac.getTransactionTitle() + "," + ac.getAmount() + "," + ac.getRemarks() + "," + ac.getAddedDate() + "\r\n";
            total += ac.getAmount();
        }
        writer += "total:," + Integer.toString(total);

        outputStream.write(writer.getBytes());
        outputStream.flush();
        outputStream.close();

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        List<Members> membersList = membersDAO.getAllByDesignation("ROLE_TREASURER");
        for (Members m : membersList) {
            notification.setMemberId(m);

            if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }

            notification.setNotificationIcon("fa-download");
            notification.setButtonColor("bg-brown");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Downloaded the Expenses File of "+event.getEventTitle());
            notificationsDAO.Insert(notification);
        }

        return "redirect:/dashboard/events/accounts/{id}";

    }
//    
     @RequestMapping(value = "/dashboard/events/accounts/exportEventIncome/{id}")
    public String exportEventIncome(HttpServletResponse response, @PathVariable("id")int id, Notifications notification) throws IOException {
        Events event = eventsDAO.getById(id);
        
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\""+event.getEventTitle()+"income.csv\"");

        OutputStream outputStream = response.getOutputStream();
        String writer = "";

        int total = 0;
        
        writer = "Event:,"+event.getEventTitle() + "\r\n";
        writer += "Transaction,Amount,Remarks,Added date \r\n";
        for (Accounts ac : accountsDAO.getAllByEventAndTransaction(event, "income")) {
            writer += ac.getTransactionTitle() + "," + ac.getAmount() + "," + ac.getRemarks() + "," + ac.getAddedDate() + "\r\n";
            total += ac.getAmount();
        }
        writer += "total:," + Integer.toString(total);

        outputStream.write(writer.getBytes());
        outputStream.flush();
        outputStream.close();

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        List<Members> membersList = membersDAO.getAllByDesignation("ROLE_TREASURER");
        for (Members m : membersList) {
            notification.setMemberId(m);

            if (m.getMemberId() != loggedInMember.getMemberId()) {
                notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            } else {
                notification.setMemberName("You");
            }

            notification.setNotificationIcon("fa-download");
            notification.setButtonColor("bg-brown");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Downloaded the Expenses File of "+event.getEventTitle());
            notificationsDAO.Insert(notification);
        }

        return "redirect:/dashboard/events/accounts/{id}";

    }

}
