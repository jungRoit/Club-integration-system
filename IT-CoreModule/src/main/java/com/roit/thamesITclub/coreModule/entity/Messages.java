/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author User
 */
@Entity
@Table(name = "tbl_messages")
@NamedQueries({
    @NamedQuery(name = "Messages.findAll", query = "SELECT m FROM Messages m")})
public class Messages implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   
    @Column(name = "message_id")
    private Integer messageId;
   
    @Column(name = "name")
    private String name;
   
    @Column(name = "email")
    private String email;
   
    @Column(name = "contact_no")
    private String contactNo;
   
    @Column(name = "title")
    private String title;
   
    @Lob
    @Column(name = "message")
    private String message;
   
    @Column(name = "sent_date",insertable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date sentDate;

    public Messages() {
    }

    public Messages(Integer messageId) {
        this.messageId = messageId;
    }

    public Messages(Integer messageId, String name, String email, String contactNo, String title, String message, Date sentDate) {
        this.messageId = messageId;
        this.name = name;
        this.email = email;
        this.contactNo = contactNo;
        this.title = title;
        this.message = message;
        this.sentDate = sentDate;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getSentDate() {
        return sentDate;
    }

    public void setSentDate(Date sentDate) {
        this.sentDate = sentDate;
    }

}
