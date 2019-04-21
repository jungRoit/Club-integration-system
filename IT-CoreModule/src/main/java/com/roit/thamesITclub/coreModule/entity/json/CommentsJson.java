/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;

import com.roit.thamesITclub.coreModule.entity.Comments;
import java.util.List;

/**
 *
 * @author User
 */
public class CommentsJson {
    private List<Comments> commentsList;

    public CommentsJson() {
    }

    public CommentsJson(List<Comments> commentsList) {
        this.commentsList = commentsList;
    }

    public List<Comments> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<Comments> commentsList) {
        this.commentsList = commentsList;
    }
    
    
}
