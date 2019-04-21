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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "tbl_meeting_response")
@NamedQueries({
    @NamedQuery(name = "MeetingResponse.findAll", query = "SELECT m FROM MeetingResponse m")})
public class MeetingResponse implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "response_id")
    private Integer responseId;
    @Basic(optional = false)
    @Column(name = "response")
    private String response;
    @Basic(optional = false)
    @Column(name = "added_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date addedDate;
    @Column(name = "comment")
    private String comment;
    @JoinColumn(name = "meeting_id", referencedColumnName = "meeting_id")
    @ManyToOne(optional = false)
    private Meetings meetingId;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne(optional = false)
    private Members memberId;

    public MeetingResponse() {
    }

    public MeetingResponse(Integer responseId) {
        this.responseId = responseId;
    }

    public MeetingResponse(Integer responseId, String response, Date addedDate) {
        this.responseId = responseId;
        this.response = response;
        this.addedDate = addedDate;
    }

    public Integer getResponseId() {
        return responseId;
    }

    public void setResponseId(Integer responseId) {
        this.responseId = responseId;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Meetings getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Meetings meetingId) {
        this.meetingId = meetingId;
    }

    public Members getMemberId() {
        return memberId;
    }

    public void setMemberId(Members memberId) {
        this.memberId = memberId;
    }

   
}
