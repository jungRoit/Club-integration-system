/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao;

import java.util.List;

/**
 *
 * @author User
 */
public interface GenericDAO<T> {
    List<T> getAll();
    void Insert(T t);
    void update(T t);
    boolean delete(int id);
    T getById(int id);
    
}
