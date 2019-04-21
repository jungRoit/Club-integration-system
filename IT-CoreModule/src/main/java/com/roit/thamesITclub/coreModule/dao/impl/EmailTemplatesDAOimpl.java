/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.EmailTemplatesDAO;
import com.roit.thamesITclub.coreModule.entity.EmailTemplates;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("emailTemplatesDAO")
public class EmailTemplatesDAOimpl extends GenericDAOimpl<EmailTemplates> implements EmailTemplatesDAO {
    
}
