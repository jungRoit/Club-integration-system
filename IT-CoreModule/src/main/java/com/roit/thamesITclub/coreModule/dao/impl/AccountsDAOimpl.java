/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.AccountsDAO;
import com.roit.thamesITclub.coreModule.entity.Accounts;
import com.roit.thamesITclub.coreModule.entity.Comments;
import com.roit.thamesITclub.coreModule.entity.Events;
import com.roit.thamesITclub.coreModule.entity.Posts;
import java.util.List;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("accountsDAO")
public class AccountsDAOimpl extends GenericDAOimpl<Accounts> implements AccountsDAO {
    
   @Override
   public List<Accounts> getAllByTransactionType(String transactionType) {
       session = sessionFactory.openSession();
        trans = session.beginTransaction();
        
        return session.createQuery("FROM Accounts as acc WHERE acc.transactionType = :transactionType").setParameter("transactionType", transactionType).list();
    }


    @Override
    public List<Accounts> getAllByEventAndTransaction(Events e, String transactionType) {
      session = sessionFactory.openSession();
        trans = session.beginTransaction();
        List<Accounts> accountsList = (List<Accounts>) session.createQuery("FROM Accounts as acc WHERE acc.eventId = :event and acc.transactionType = :transactionType").setParameter("event", e).setParameter("transactionType", transactionType).list();

        return accountsList;
    }

    @Override
    public List<Accounts> getAllByEvent(Events e) {
       session = sessionFactory.openSession();
        trans = session.beginTransaction();
        List<Accounts> accountsList = (List<Accounts>) session.createQuery("FROM Accounts as acc WHERE acc.eventId = :event").setParameter("event", e).list();

        return accountsList;
    }
    


}
