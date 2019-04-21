/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;

import com.roit.thamesITclub.coreModule.entity.Posts;
import java.util.List;

/**
 *
 * @author User
 */
public class PostsJson {
    private List<Posts> postsList;

    public PostsJson() {
    }

    public PostsJson(List<Posts> postsList) {
        this.postsList = postsList;
    }

    public List<Posts> getPostsList() {
        return postsList;
    }

    public void setPostsList(List<Posts> postsList) {
        this.postsList = postsList;
    }
    
    
}
