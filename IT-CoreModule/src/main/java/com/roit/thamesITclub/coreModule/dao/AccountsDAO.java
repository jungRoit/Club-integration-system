/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao;

import com.roit.thamesITclub.coreModule.entity.Accounts;
import com.roit.thamesITclub.coreModule.entity.Events;
import java.util.List;

/**
 *
 * @author User
 */
public interface AccountsDAO extends GenericDAO<Accounts>{
    public List<Accounts> getAllByTransactionType(String transactionType);
    public List<Accounts> getAllByEventAndTransaction(Events e,String transactionType);
    public List<Accounts> getAllByEvent(Events e);
}
