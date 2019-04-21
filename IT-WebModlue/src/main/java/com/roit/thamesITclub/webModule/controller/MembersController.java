/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.dao.PostsDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import com.roit.thamesITclub.coreModule.entity.Posts;
import com.roit.thamesITclub.coreModule.entity.ProfilePicture;
import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author User
 */
@Controller
@RequestMapping(value = "/dashboard/members")
public class MembersController {

    @Autowired
    MembersDAO membersDAO;
    @Autowired
    ProfilePictureDAO profilePictureDAO;
    @Autowired
    PostsDAO postsDAO;
    @Autowired
    NotificationsDAO notificationsDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String members(Model model, Model bodModel, Model loggedInMemberModel, Model propicModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        loggedInMemberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("members", membersDAO.getAllByDesignation("ROLE_GENERAL_MEMBER"));
        bodModel.addAttribute("bodMembers", membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER"));

        return "admin/members/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String membersAdd(Model memberModel, Model propicModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        return "admin/members/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String membersSave(Notifications notification, Members member, ProfilePicture proPic) throws ParseException {

        membersDAO.Insert(member);
        proPic.setMemberId(member);
        proPic.setPicture("img/profilePic/default.jpg");
        proPic.setIsCurrentPic(true);
        profilePictureDAO.Insert(proPic);

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        for (Members m : membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER")) {
            if (m.getMemberId() != member.getMemberId()) {
                notification.setMemberId(m);

                if (m.getMemberId() != loggedInMember.getMemberId()) {
                    notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
                } else {
                    notification.setMemberName("You");
                }
                notification.setNotificationIcon("fa-user");
                notification.setButtonColor("bg-aqua");
                notification.setButtonText("View Member Details");
                notification.setLink("/dashboard/notifications/member/" + member.getMemberId());
                notification.setNotification("Added a New Member '" + member.getFirstName() + " " + member.getLastName() + "'");
                notificationsDAO.Insert(notification);
            } else {
                notification.setMemberId(m);
                notification.setMemberName("Thames IT Club");

                notification.setNotificationIcon("fa-user");
                notification.setButtonColor("bg-aqua");
                notification.setButtonText("View Your Details");
                notification.setLink("/dashboard/notifications/member/" + member.getMemberId());
                notification.setNotification("Hi '" + member.getFirstName() + " " + member.getLastName()
                        + "' Welcome to Thames IT CLub. we are really excited to have you in our team. "
                        + "feel free to ask us anything");

            }
        }

        return "redirect:/dashboard/members";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String membersEdit(Model model, Model memberModel, Model propicModel, @PathVariable("id") int id) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        memberModel.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        model.addAttribute("members", membersDAO.getById(id));
        return "admin/members/edit";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @Transactional
    public String membersDelete(@PathVariable("id") int id, Notifications notification) {

        Members member = membersDAO.getById(id);
        ProfilePicture proPic = profilePictureDAO.getByMemberId(member);

        for (Posts p : postsDAO.getAllByMemberId(member)) {
            postsDAO.delete(p.getPostId());
        }

        profilePictureDAO.delete(proPic.getPictureId());

        for (Notifications n : notificationsDAO.getAllByMember(member)) {
            notificationsDAO.delete(n.getNotificationId());
        }

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        List<Members> notifiedList = membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER");
        for (Members m : notifiedList) {
            if (m.getMemberId() != member.getMemberId()) {
                notification.setMemberId(m);
               if (m.getMemberId() != loggedInMember.getMemberId()) {
                    notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
                } else {
                    notification.setMemberName("You");
                }
                notification.setNotificationIcon("  fa-user");
                notification.setButtonColor("bg-light-blue");
                notification.setButtonText("View Members");
                notification.setLink("/dashboard/members");
                notification.setNotification("Removed " + member.getFirstName() + " " + member.getLastName() + " from the Systems");
                notificationsDAO.Insert(notification);
            }
        }

        membersDAO.delete(id);

        return "redirect:/dashboard/members";

    }

   @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String membersUpdate(Members member) throws ParseException {
        Notifications notification = new Notifications();
        membersDAO.update(member);
    
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        List<Members> notifiedList = membersDAO.getAllByBOD("ROLE_GENERAL_MEMBER");
        for (Members m : notifiedList) {
            if (m.getMemberId() != member.getMemberId()) {
                notification.setMemberId(m);
                if (m.getMemberId() != loggedInMember.getMemberId()) {
                    notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
                } else {
                    notification.setMemberName("You");
                }
                notification.setNotificationIcon("  fa-user");
                notification.setButtonColor("bg-light-blue");
                notification.setButtonText("View Details");
                notification.setLink("\"/dashboard/notifications/member/\" + member.getMemberId()");
                notification.setNotification("Edited informations of " + member.getFirstName() + " " + member.getLastName());
                notificationsDAO.Insert(notification);
            }
        }
        
        return "redirect:/dashboard/members";
    }

}


