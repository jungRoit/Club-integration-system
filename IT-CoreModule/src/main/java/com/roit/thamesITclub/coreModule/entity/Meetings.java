/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author User
 */
@Entity
@Table(name = "tbl_meetings")
@NamedQueries({
    @NamedQuery(name = "Meetings.findAll", query = "SELECT m FROM Meetings m")})
public class Meetings implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "meeting_id")
    private Integer meetingId;
    @Basic(optional = false)
    @Column(name = "meeting_title")
    private String meetingTitle;
    @Basic(optional = false)
    @Column(name = "meeting_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date meetingDate;
    @Basic(optional = false)
    @Column(name = "meeting_venue")
    private String meetingVenue;
    @Basic(optional = false)
    @Lob
    @Column(name = "meeting_agenda")
    private String meetingAgenda;
    @Lob
    @Column(name = "meeting_decisions")
    private String meetingDecisions;
    @Basic(optional = false)
    @Column(name = "meeting_type")
    private String meetingType;


    public Meetings() {
    }

    public Meetings(Integer meetingId) {
        this.meetingId = meetingId;
    }

    public Meetings(Integer meetingId, String meetingTitle, Date meetingDate, String meetingVenue, String meetingAgenda, String meetingType) {
        this.meetingId = meetingId;
        this.meetingTitle = meetingTitle;
        this.meetingDate = meetingDate;
        this.meetingVenue = meetingVenue;
        this.meetingAgenda = meetingAgenda;
        this.meetingType = meetingType;
    }

    public Integer getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
    }

    public String getMeetingTitle() {
        return meetingTitle;
    }

    public void setMeetingTitle(String meetingTitle) {
        this.meetingTitle = meetingTitle;
    }

    public Date getMeetingDate() {
        return meetingDate;
    }

    public void setMeetingDate(Date meetingDate) {
        this.meetingDate = meetingDate;
    }

    public String getMeetingVenue() {
        return meetingVenue;
    }

    public void setMeetingVenue(String meetingVenue) {
        this.meetingVenue = meetingVenue;
    }

    public String getMeetingAgenda() {
        return meetingAgenda;
    }

    public void setMeetingAgenda(String meetingAgenda) {
        this.meetingAgenda = meetingAgenda;
    }

    public String getMeetingDecisions() {
        return meetingDecisions;
    }

    public void setMeetingDecisions(String meetingDecisions) {
        this.meetingDecisions = meetingDecisions;
    }

    public String getMeetingType() {
        return meetingType;
    }

    public void setMeetingType(String meetingType) {
        this.meetingType = meetingType;
    }

   
}
