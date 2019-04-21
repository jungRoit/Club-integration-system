/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.NotificationsDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("notificationsDAO")
public class NotificationsDAOimpl extends GenericDAOimpl<Notifications> implements NotificationsDAO {
    
    @Override
    public List<Notifications> getAllByMember(Members member){
        session=sessionFactory.openSession();
       trans=session.beginTransaction();
        List<Notifications> notificationsList=(List<Notifications>)session.createQuery("FROM Notifications as nots WHERE nots.memberId = :member").setParameter("member", member).list();
        
       return notificationsList; 
    }
}
