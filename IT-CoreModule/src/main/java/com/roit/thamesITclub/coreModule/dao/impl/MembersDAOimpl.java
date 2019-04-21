/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.MembersDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("membersDAO")
public class MembersDAOimpl extends GenericDAOimpl<Members> implements MembersDAO {

    @Override
    public List<Members> getAllByDesignation(String designation) {
         session = sessionFactory.openSession();
        trans = session.beginTransaction();
        
        return session.createQuery("FROM Members as mem WHERE mem.designation = :designation").setParameter("designation", designation).list();
    }

    @Override
    public Members getByUsername(String username) {
       session=sessionFactory.openSession();
       trans=session.beginTransaction();
        Members member=(Members)session.createQuery("FROM Members as mem WHERE mem.username = :username").setParameter("username", username).uniqueResult();
        
       return member;
    }

    @Override
    public List<Members> getAllByBOD(String designation) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        
        return session.createQuery("FROM Members as mem WHERE mem.designation != :designation").setParameter("designation", designation).list();
    }
}
 