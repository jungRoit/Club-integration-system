/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity;

import java.io.Serializable;
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

/**
 *
 * @author User
 */
@Entity
@Table(name = "tbl_email_templates")
@NamedQueries({
    @NamedQuery(name = "EmailTemplates.findAll", query = "SELECT e FROM EmailTemplates e")})
public class EmailTemplates implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "template_id")
    private Integer templateId;
    @Basic(optional = false)
    @Column(name = "template_title")
    private String templateTitle;
    @Basic(optional = false)
    @Lob
    @Column(name = "template_body")
    private String templateBody;

    public EmailTemplates() {
    }

    public EmailTemplates(Integer templateId) {
        this.templateId = templateId;
    }

    public EmailTemplates(Integer templateId, String templateTitle, String templateBody) {
        this.templateId = templateId;
        this.templateTitle = templateTitle;
        this.templateBody = templateBody;
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public String getTemplateTitle() {
        return templateTitle;
    }

    public void setTemplateTitle(String templateTitle) {
        this.templateTitle = templateTitle;
    }

    public String getTemplateBody() {
        return templateBody;
    }

    public void setTemplateBody(String templateBody) {
        this.templateBody = templateBody;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (templateId != null ? templateId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmailTemplates)) {
            return false;
        }
        EmailTemplates other = (EmailTemplates) object;
        if ((this.templateId == null && other.templateId != null) || (this.templateId != null && !this.templateId.equals(other.templateId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.roit.thamesITclub.coreModule.entity.EmailTemplates[ templateId=" + templateId + " ]";
    }
    
}
