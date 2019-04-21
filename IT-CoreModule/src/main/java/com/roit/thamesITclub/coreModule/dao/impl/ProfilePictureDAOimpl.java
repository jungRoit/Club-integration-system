/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.ProfilePictureDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.ProfilePicture;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("profilePictureDAO")
public class ProfilePictureDAOimpl extends GenericDAOimpl<ProfilePicture> implements ProfilePictureDAO {

    @Override
    public ProfilePicture getByMemberId(Members member) {
       session=sessionFactory.openSession();
       trans=session.beginTransaction();
        ProfilePicture proPic=(ProfilePicture)session.createQuery("FROM ProfilePicture as pro WHERE pro.memberId = :member").setParameter("member", member).uniqueResult();
        
       return proPic;
    
        
    }
    
}
