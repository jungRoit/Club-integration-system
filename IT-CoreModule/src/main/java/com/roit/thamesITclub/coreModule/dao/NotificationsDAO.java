/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao;

import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Notifications;
import java.util.List;

/**
 *
 * @author User
 */
public interface NotificationsDAO extends GenericDAO<Notifications> {
 
        List<Notifications> getAllByMember(Members member);

}
