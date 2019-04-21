/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.PostsDAO;
import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Posts;
import com.roit.thamesITclub.coreModule.entity.ProfilePicture;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("postsDAO")
public class PostsDAOimpl extends GenericDAOimpl<Posts> implements PostsDAO {
    
    @Override
    public List<Posts> getAllByMemberId(Members member) {
       session=sessionFactory.openSession();
       trans=session.beginTransaction();
        List<Posts> postList=(List<Posts>)session.createQuery("FROM Posts as post WHERE post.memberId = :member").setParameter("member", member).list();
        
       return postList; 
    }
    
}
