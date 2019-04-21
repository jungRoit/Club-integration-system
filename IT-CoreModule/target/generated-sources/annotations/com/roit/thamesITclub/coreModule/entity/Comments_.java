package com.roit.thamesITclub.coreModule.entity;

import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.Posts;
import com.roit.thamesITclub.coreModule.entity.ProfilePicture;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(Comments.class)
public class Comments_ { 

    public static volatile SingularAttribute<Comments, Date> addedDate;
    public static volatile SingularAttribute<Comments, ProfilePicture> pictureId;
    public static volatile SingularAttribute<Comments, Integer> commentId;
    public static volatile SingularAttribute<Comments, String> comment;
    public static volatile SingularAttribute<Comments, Posts> postId;
    public static volatile SingularAttribute<Comments, Members> memberId;

}