/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao.impl;

import com.roit.thamesITclub.coreModule.dao.CommentsDAO;
import com.roit.thamesITclub.coreModule.entity.Comments;
import com.roit.thamesITclub.coreModule.entity.Posts;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author User
 */
@Repository("commentsDAO")
public class CommentsDAOimpl extends GenericDAOimpl<Comments> implements CommentsDAO {

    @Override
    public List<Comments> getAllByPost(Posts post) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        List<Comments> commentsList = (List<Comments>) session.createQuery("FROM Comments as cmt WHERE cmt.postId = :post").setParameter("post", post).list();

        return commentsList;
    }

}
