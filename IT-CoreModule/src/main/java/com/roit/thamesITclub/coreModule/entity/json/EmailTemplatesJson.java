/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;

import com.roit.thamesITclub.coreModule.entity.EmailTemplates;
import com.roit.thamesITclub.coreModule.entity.Events;
import java.util.List;

/**
 *
 * @author User
 */
public class EmailTemplatesJson {
    private List<EmailTemplates> emailTemplateList;

    public EmailTemplatesJson() {
    }

    public EmailTemplatesJson(List<EmailTemplates> emailTemplateList) {
        this.emailTemplateList = emailTemplateList;
    }

    public List<EmailTemplates> getEmailList() {
        return emailTemplateList;
    }

    public void setEmailList(List<EmailTemplates> emailTemplateList) {
        this.emailTemplateList = emailTemplateList;
    }
    
    
}
