/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.controller;

import com.roit.thamesITclub.coreModule.dao.CommentsDAO;
import com.roit.thamesITclub.coreModule.dao.EmailTemplatesDAO;
import com.roit.thamesITclub.coreModule.dao.EventTeamDAO;
import com.roit.thamesITclub.coreModule.dao.EventsDAO;
import com.roit.thamesITclub.coreModule.dao.MeetingsDAO;
import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.dao.MessagesDAO;
import com.roit.thamesITclub.coreModule.dao.PostsDAO;
import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Comments;
import com.roit.thamesITclub.coreModule.entity.EmailTemplates;
import com.roit.thamesITclub.coreModule.entity.EventTeam;
import com.roit.thamesITclub.coreModule.entity.Events;
import com.roit.thamesITclub.coreModule.entity.Meetings;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Messages;
import com.roit.thamesITclub.coreModule.entity.Posts;
import com.roit.thamesITclub.coreModule.entity.ProfilePicture;
import com.roit.thamesITclub.coreModule.entity.json.CommentsJson;
import com.roit.thamesITclub.coreModule.entity.json.EmailTemplatesJson;
import com.roit.thamesITclub.coreModule.entity.json.EventsJson;
import com.roit.thamesITclub.coreModule.entity.json.MeetingsJson;
import com.roit.thamesITclub.coreModule.entity.json.MembersJson;
import com.roit.thamesITclub.coreModule.entity.json.MessagesJson;
import com.roit.thamesITclub.coreModule.entity.json.PostsJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author User
 */
@RestController
@RequestMapping(value = "/graph")
public class APIController {
    @Autowired
    EventsDAO eventsDAO;
    @Autowired
    MessagesDAO messagesDAO;
    @Autowired
    MembersDAO membersDAO;
    @Autowired
    EmailTemplatesDAO emailTemplateDAO;
    @Autowired
    MeetingsDAO meetingsDAO;
    @Autowired
    PostsDAO postsDAO;
    @Autowired
    CommentsDAO commentsDAO;
    @Autowired
    ProfilePictureDAO profilePictureDAO;
    @Autowired
    EventTeamDAO eventTeamDAO;
    
    @RequestMapping(value = "/events",method = RequestMethod.GET)
    @ResponseBody
    public EventsJson events(){
        EventsJson events=new EventsJson();
        events.setEventsList(eventsDAO.getAll());
        return events;
        
    }
    
    @RequestMapping(value = "/events/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Events eventById(@PathVariable("id")int id){
        return eventsDAO.getById(id);
        
    }
    
     @RequestMapping(value = "/messages",method = RequestMethod.GET)
    @ResponseBody
    public MessagesJson messages(){
         MessagesJson messages=new MessagesJson();
        
         messages.setMessagesList(messagesDAO.getAll());
        return messages;
        
    }
    
    @RequestMapping(value = "/messages/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Messages messagesById(@PathVariable("id")int id){
        return messagesDAO.getById(id);
        
    }
    
       @RequestMapping(value = "/members",method = RequestMethod.GET)
    @ResponseBody
    public MembersJson members(){
         MembersJson members=new MembersJson();
        
         members.setMembersList(membersDAO.getAll());
        return members;
        
    }
    
    @RequestMapping(value = "/members/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Members membersById(@PathVariable("id")int id){
        return membersDAO.getById(id);
        
    }
    
       @RequestMapping(value = "/propic/members/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ProfilePicture profilePictureByMemberId(@PathVariable("id")int id){
        
        
        return profilePictureDAO.getByMemberId(membersDAO.getById(id));
        
    }
    
    
    
    
    
     @RequestMapping(value = "/emailTemplates",method = RequestMethod.GET)
    @ResponseBody
    public EmailTemplatesJson emailTemplates(){
        EmailTemplatesJson emails=new EmailTemplatesJson();
        emails.setEmailList(emailTemplateDAO.getAll());
        return emails;
        
    }
    
    @RequestMapping(value = "/emailTemplates/{id}",method = RequestMethod.GET)
    @ResponseBody
    public EmailTemplates emailTemplateById(@PathVariable("id")int id){
        return emailTemplateDAO.getById(id);
        
    }
    
     @RequestMapping(value = "/meetings",method = RequestMethod.GET)
    @ResponseBody
    public MeetingsJson meetings(){
        MeetingsJson meetings=new MeetingsJson();
        meetings.setList(meetingsDAO.getAll());
        return meetings;
        
    }
    
    @RequestMapping(value = "/meetings/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Meetings meetingById(@PathVariable("id")int id){
        return meetingsDAO.getById(id);
        
    }
    
      @RequestMapping(value = "/posts",method = RequestMethod.GET)
    @ResponseBody
    public PostsJson posts(){
        PostsJson post=new PostsJson();
        post.setPostsList(postsDAO.getAll());
        return post;
    }
    
    @RequestMapping(value = "/posts/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Posts postsById(@PathVariable("id")int id){
        return postsDAO.getById(id);
    }
    
        @RequestMapping(value = "/comments",method = RequestMethod.GET)
    @ResponseBody
    public CommentsJson comments(){
            CommentsJson comments=new CommentsJson();
        comments.setCommentsList(commentsDAO.getAll());
        return comments;
    }
    
    @RequestMapping(value = "/comments/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Comments commentsById(@PathVariable("id")int id){
        return commentsDAO.getById(id);
    }
    
     @RequestMapping(value = "/eventTeam/{id}",method = RequestMethod.GET)
    @ResponseBody
    public EventTeam eventTeamById(@PathVariable("id")int id){
        return eventTeamDAO.getById(id);
    }
        
    
    
}
