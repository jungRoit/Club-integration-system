package com.roit.thamesITclub.coreModule.entity;

import com.roit.thamesITclub.coreModule.entity.Members;
import com.roit.thamesITclub.coreModule.entity.ProfilePicture;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(Posts.class)
public class Posts_ { 

    public static volatile SingularAttribute<Posts, Date> addedDate;
    public static volatile SingularAttribute<Posts, String> postBody;
    public static volatile SingularAttribute<Posts, ProfilePicture> pictureId;
    public static volatile SingularAttribute<Posts, Integer> postId;
    public static volatile SingularAttribute<Posts, Members> memberId;

}