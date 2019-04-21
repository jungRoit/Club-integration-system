/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.GenericDAO;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author User
 * @param <T>
 */
public class GenericDAOimpl<T> implements GenericDAO<T> {

    @Autowired
    protected SessionFactory sessionFactory;
    protected Session session;
    protected Transaction trans;
    protected Class<T> paramClass;

    public GenericDAOimpl() {
    paramClass=(Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    
    
    @Override
    public List getAll() {
        session=sessionFactory.openSession();
        Criteria criteria=session.createCriteria(paramClass);
        return criteria.list();
    }

    @Override
    public void Insert(T t) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(t);
        trans.commit();
        session.close();
    }

    @Override
    public void update(T t) {
         session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(t);
        trans.commit();
        session.close();
    }

    @Override
    public boolean delete(int id) {
        T t=getById(id);
        if(t==null){
           return false;
       }
        session=sessionFactory.openSession();
        trans=session.beginTransaction();
        session.delete(t);
        trans.commit();
        session.close();
        return true;
    }

    @Override
    public T getById(int id) {
        session=sessionFactory.openSession();
        trans=session.beginTransaction();
        T t=(T)session.get(paramClass, id);
        return t;
    }

   

}
