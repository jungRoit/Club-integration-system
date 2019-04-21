/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.MeetingsDAO;
import com.roit.thamesITclub.coreModule.entity.Meetings;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("meetingsDAO")
public class MeetingsDAOimpl extends GenericDAOimpl<Meetings> implements MeetingsDAO {

    @Override
    public List<Meetings> getAllByMeetingType(String meetingType) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        
        return session.createQuery("FROM Meetings as meeting WHERE meeting.meetingType = :meetingType").setParameter("meetingType", meetingType).list();
    
    }
    
}
