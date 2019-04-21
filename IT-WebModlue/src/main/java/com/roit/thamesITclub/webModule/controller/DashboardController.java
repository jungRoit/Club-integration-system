/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.CommentsDAO;
import com.roit.thamesITclub.coreModule.dao.EventsDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.dao.PostsDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Comments;
import com.roit.thamesITclub.coreModule.entity.Events;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import com.roit.thamesITclub.coreModule.entity.Posts;
import com.roit.thamesITclub.coreModule.entity.ProfilePicture;
import com.roit.thamesITclub.coreModule.entity.json.EventsJson;
import com.roit.thamesITclub.coreModule.util.ImageUploader;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author User
 */
@Controller
@RequestMapping(value = "/dashboard")
public class DashboardController {

    @Autowired
    EventsDAO eventsDAO;
    ImageUploader uploader;
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    ProfilePictureDAO profilePictureDAO;
    @Autowired
    PostsDAO postsDAO;
    @Autowired
    CommentsDAO commentsDAO;
    @Autowired
    NotificationsDAO notificationsDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String dashboard(Model model, Model notificationModel, Model propicModel, Model postsModel, Model commentsModel) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("member", loggedInMember);
        propicModel.addAttribute("proPic", profilePictureDAO.getByMemberId(loggedInMember));
        commentsModel.addAttribute("comments", commentsDAO.getAll());
        List<Posts> postList = postsDAO.getAll();
        Comparator<Posts> comparePost = new Comparator<Posts>() {

            @Override
            public int compare(Posts t, Posts t1) {
                return t1.getPostId() - t.getPostId();
            }
        };

        Collections.sort(postList, comparePost);

        postsModel.addAttribute("post", postList);

        List<Notifications> notificationList = notificationsDAO.getAllByMember(loggedInMember);
        Comparator<Notifications> compareNotification = new Comparator<Notifications>() {

            @Override
            public int compare(Notifications t, Notifications t1) {
                return t1.getNotificationId() - t.getNotificationId();
            }
        };

        Collections.sort(notificationList, compareNotification);

        notificationModel.addAttribute("notification", notificationList);

        return "admin/index";
    }

    @RequestMapping(value = "/newPost/save", method = RequestMethod.POST)
    public String newPost(Posts post) {

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        ProfilePicture proPic = profilePictureDAO.getByMemberId(loggedInMember);
        post.setMemberId(loggedInMember);
        post.setPictureId(proPic);
        postsDAO.Insert(post);
        return "redirect:/dashboard";

    }

    @RequestMapping(value = "/newPost/update", method = RequestMethod.POST)
    public String editPost(Posts post, Notifications notification, @ModelAttribute("post_id") int id) {
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        ProfilePicture proPic = profilePictureDAO.getByMemberId(loggedInMember);

        Posts posts = postsDAO.getById(id);

        if (posts.getPostId() == post.getPostId()) {

            post.setMemberId(loggedInMember);
            post.setPictureId(proPic);

            postsDAO.update(post);

            notification.setMemberId(loggedInMember);

            notification.setMemberName("You");
            notification.setNotificationIcon("  fa-edit");
            notification.setButtonColor("bg-gray");
            notification.setButtonText("view Post");
            notification.setLink("/dashboard/notifications/post/" + post.getPostId());
            notification.setNotification("Edited a Post '" + post.getPostBody() + "'");
            notificationsDAO.Insert(notification);

            return "redirect:/dashboard";
        } else {
            return "admin/403";
        }

    }

    @RequestMapping(value = "/newPost/delete/{id}")
    public String deletePost(@PathVariable("id") int id, Notifications notification) {

        Posts post = postsDAO.getById(id);
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        if (post.getMemberId().getMemberId() == loggedInMember.getMemberId()) {

            List<Comments> commentsList = commentsDAO.getAllByPost(post);

            for (Comments cmt : commentsList) {
                commentsDAO.delete(cmt.getCommentId());
            }

            postsDAO.delete(id);

            notification.setMemberId(loggedInMember);

            notification.setMemberName("You");
            notification.setNotificationIcon("fa-warning");
            notification.setButtonColor("bg-red");
            notification.setButtonText("back");
            notification.setLink("/dashboard");
            notification.setNotification("Deleted a Post");
            notificationsDAO.Insert(notification);

            return "redirect:/dashboard";
        } else {
            return "admin/403";
        }

    }

    @RequestMapping(value = "/comment/save", method = RequestMethod.POST)
    public String newComment(Comments comment, @ModelAttribute("id") int postId, Notifications notification) {

        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        ProfilePicture proPic = profilePictureDAO.getByMemberId(loggedInMember);
        comment.setMemberId(loggedInMember);
        comment.setPictureId(proPic);
        comment.setPostId(postsDAO.getById(postId));

        commentsDAO.Insert(comment);

        Posts post = postsDAO.getById(postId);
        if (post.getMemberId().getMemberId() != loggedInMember.getMemberId()) {
            notification.setMemberId(post.getMemberId());
            notification.setMemberName(loggedInMember.getFirstName() + " " + loggedInMember.getLastName());
            notification.setNotificationIcon("fa-comment-o");
            notification.setButtonColor("bg-gray");
            notification.setButtonText("View Comments");
            notification.setLink("/dashboard/notifications/post/" + post.getPostId());
            notification.setNotification("Commented on Your Post");
            notificationsDAO.Insert(notification);
        }

        return "redirect:/dashboard";

    }

    @RequestMapping(value = "/comment/update", method = RequestMethod.POST)
    public String editComment(Comments comment, @ModelAttribute("id") int postId, @ModelAttribute("comment_id") int id) {
        Comments testComment = commentsDAO.getById(id);
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        ProfilePicture proPic = profilePictureDAO.getByMemberId(loggedInMember);

        if (comment.getCommentId() == testComment.getCommentId() && testComment.getPostId().getPostId() == postId) {
                comment.setMemberId(loggedInMember);
                comment.setPictureId(proPic);
                comment.setPostId(postsDAO.getById(postId));

                commentsDAO.update(comment);
            
            return "redirect:/dashboard";
        } else {
            return "admin/403";
        }

    }

    @RequestMapping(value = "/comment/delete/{id}")
    public String deleteComment(@PathVariable("id") int id, @ModelAttribute("comment_id") int commentId) {
        Comments comment = commentsDAO.getById(commentId);
        Members loggedInMember = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        if (comment.getMemberId().getMemberId() == loggedInMember.getMemberId()) {
            commentsDAO.delete(id);

            return "redirect:/dashboard";
        } else {
            return "admin/403";
        }

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String membersUpdate(Members member) throws ParseException {

        membersDAO.update(member);
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String calendar() {
        return "admin/calendar/index";
    }

    @RequestMapping(value = "/uploadProfilePic", method = RequestMethod.POST)
    public String uploadProfilePic(Notifications notification, @ModelAttribute("file") MultipartFile file) throws FileNotFoundException, IOException {
        Members member = membersDAO.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        ProfilePicture proPic = profilePictureDAO.getByMemberId(member);
        proPic.setMemberId(member);
        proPic.setIsCurrentPic(true);

      
                BufferedOutputStream outputStream = new BufferedOutputStream(
                        new FileOutputStream(new File("C:/Users/Rahul/Documents/NetBeansProjects/ThamesITClub/IT-WebModlue/src/main/webapp/WEB-INF/assets/img/profilePic", file.getOriginalFilename())));
                    outputStream.write(file.getBytes());
                    outputStream.flush();
                
                proPic.setPicture("img/profilePic/" + file.getOriginalFilename());

                profilePictureDAO.update(proPic);

                notification.setMemberId(member);
                notification.setMemberName("You");
                notification.setNotificationIcon("fa-picture-o");
                notification.setButtonColor("bg-black");
                notification.setButtonText("View");
                notification.setLink("/dashboard");
                notification.setNotification("Updated Your Profile Picture");
                notificationsDAO.Insert(notification);

                return "redirect:/dashboard";
    }

}
