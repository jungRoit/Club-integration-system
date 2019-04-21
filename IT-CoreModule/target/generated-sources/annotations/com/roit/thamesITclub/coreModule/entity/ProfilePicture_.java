package com.roit.thamesITclub.coreModule.entity;

import com.roit.thamesITclub.coreModule.entity.Members;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(ProfilePicture.class)
public class ProfilePicture_ { 

    public static volatile SingularAttribute<ProfilePicture, Date> addedDate;
    public static volatile SingularAttribute<ProfilePicture, Integer> pictureId;
    public static volatile SingularAttribute<ProfilePicture, Boolean> isCurrentPic;
    public static volatile SingularAttribute<ProfilePicture, String> picture;
    public static volatile SingularAttribute<ProfilePicture, Members> memberId;

}