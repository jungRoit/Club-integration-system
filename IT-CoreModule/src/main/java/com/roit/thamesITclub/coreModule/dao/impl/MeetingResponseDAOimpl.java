/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.MeetingResponseDAO;
import com.roit.thamesITclub.coreModule.entity.EventTeam;
import com.roit.thamesITclub.coreModule.entity.MeetingResponse;
import com.roit.thamesITclub.coreModule.entity.Meetings;
import com.roit.thamesITclub.coreModule.entity.Members;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("meetingResponseDAO")
public class MeetingResponseDAOimpl extends GenericDAOimpl<MeetingResponse> implements MeetingResponseDAO {

    @Override
    public List<MeetingResponse> getAllByMeeting(Meetings m) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        List<MeetingResponse> meetingResponseList = (List<MeetingResponse>) session.createQuery("FROM MeetingResponse as mr WHERE mr.meetingId = :m").setParameter("meetingId", m).list();

        return meetingResponseList;
    }

    @Override
    public List<MeetingResponse> getAllByMember(Members m) {
     session = sessionFactory.openSession();
        trans = session.beginTransaction();
        List<MeetingResponse> meetingResponseList = (List<MeetingResponse>) session.createQuery("FROM MeetingResponse as mr WHERE mr.memberId = :m").setParameter("memberId", m).list();

        return meetingResponseList;
    }

    @Override
    public List<MeetingResponse> getAllByMeetingAndResponse(Meetings m, String response) {
       session = sessionFactory.openSession();
        trans = session.beginTransaction();
        List<MeetingResponse> meetingResponseList = (List<MeetingResponse>) session.createQuery("FROM MeetingResponse as mr WHERE mr.meetingId = :meetingId and mr.response = :response").setParameter("meetingId", m).setParameter("response", response).list();

        return meetingResponseList;
    }
    
}
