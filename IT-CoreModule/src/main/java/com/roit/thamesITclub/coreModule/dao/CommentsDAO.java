/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao;

import com.roit.thamesITclub.coreModule.entity.Comments;
import com.roit.thamesITclub.coreModule.entity.Posts;
import java.util.List;

/**
 *
 * @author User
 */
public interface CommentsDAO extends GenericDAO<Comments> {
    
    List<Comments> getAllByPost(Posts post);
            

    
}
