/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.EventTeamDAO;
import com.roit.thamesITclub.coreModule.entity.Accounts;
import com.roit.thamesITclub.coreModule.entity.EventTeam;
import com.roit.thamesITclub.coreModule.entity.Events;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("eventTeamDAO")
public class EventTeamDAOimpl extends GenericDAOimpl<EventTeam> implements EventTeamDAO {

    @Override
    public List<EventTeam> getAllByEvent(Events e) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        List<EventTeam> eventTeamList = (List<EventTeam>) session.createQuery("FROM EventTeam as et WHERE et.eventId = :event").setParameter("event", e).list();

        return eventTeamList;

    }

}
