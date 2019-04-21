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
@Table(name = "tbl_events")
@NamedQueries({
    @NamedQuery(name = "Events.findAll", query = "SELECT e FROM Events e")})
public class Events implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    @Column(name = "event_id")
    private Integer eventId;
    
    @Column(name = "event_title")
    private String eventTitle;
    
    @Column(name = "event_venue")
    private String eventVenue;
    
    @Column(name = "event_date")
    @Temporal(TemporalType.DATE)
    private Date eventDate;
    
    @Column(name = "event_coOrdinator")
    private String eventcoOrdinator;
    
    @Lob
    @Column(name = "event_description")
    private String eventDescription;
    
    @Column(name = "event_status")
    private boolean eventStatus;
    
    @Lob
    @Column(name = "event_image")
    private String eventImage;

    public Events() {
    }

    public Events(Integer eventId) {
        this.eventId = eventId;
    }

    public Events(Integer eventId, String eventTitle, String eventVenue, Date eventDate, String eventcoOrdinator, String eventDescription, boolean eventStatus, String eventImage) {
        this.eventId = eventId;
        this.eventTitle = eventTitle;
        this.eventVenue = eventVenue;
        this.eventDate = eventDate;
        this.eventcoOrdinator = eventcoOrdinator;
        this.eventDescription = eventDescription;
        this.eventStatus = eventStatus;
        this.eventImage = eventImage;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public String getEventVenue() {
        return eventVenue;
    }

    public void setEventVenue(String eventVenue) {
        this.eventVenue = eventVenue;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventcoOrdinator() {
        return eventcoOrdinator;
    }

    public void setEventcoOrdinator(String eventcoOrdinator) {
        this.eventcoOrdinator = eventcoOrdinator;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public boolean getEventStatus() {
        return eventStatus;
    }

    public void setEventStatus(boolean eventStatus) {
        this.eventStatus = eventStatus;
    }

    public String getEventImage() {
        return eventImage;
    }

    public void setEventImage(String eventImage) {
        this.eventImage = eventImage;
    }


    
}
