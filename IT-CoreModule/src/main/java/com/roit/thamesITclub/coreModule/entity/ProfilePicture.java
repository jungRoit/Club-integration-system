/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "tbl_profile_picture")
@NamedQueries({
    @NamedQuery(name = "ProfilePicture.findAll", query = "SELECT p FROM ProfilePicture p")})
public class ProfilePicture implements Serializable {
   
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    @Column(name = "picture_id")
    private Integer pictureId;
    
    @Column(name = "picture")
    private String picture;
    
    @Column(name = "added_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date addedDate;
    
    @Column(name = "is_current_pic")
    private boolean isCurrentPic;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne(optional = false)
    private Members memberId;

    public ProfilePicture() {
    }

    public ProfilePicture(Integer pictureId) {
        this.pictureId = pictureId;
    }

    public ProfilePicture(Integer pictureId, String picture, Date addedDate, boolean isCurrentPic) {
        this.pictureId = pictureId;
        this.picture = picture;
        this.addedDate = addedDate;
        this.isCurrentPic = isCurrentPic;
    }

    public Integer getPictureId() {
        return pictureId;
    }

    public void setPictureId(Integer pictureId) {
        this.pictureId = pictureId;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public boolean getIsCurrentPic() {
        return isCurrentPic;
    }

    public void setIsCurrentPic(boolean isCurrentPic) {
        this.isCurrentPic = isCurrentPic;
    }


    public Members getMemberId() {
        return memberId;
    }

    public void setMemberId(Members memberId) {
        this.memberId = memberId;
    }

  
   
}
