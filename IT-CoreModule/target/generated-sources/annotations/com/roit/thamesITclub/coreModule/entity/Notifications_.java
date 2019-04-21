package com.roit.thamesITclub.coreModule.entity;

import com.roit.thamesITclub.coreModule.entity.Members;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(Notifications.class)
public class Notifications_ { 

    public static volatile SingularAttribute<Notifications, String> notification;
    public static volatile SingularAttribute<Notifications, String> buttonText;
    public static volatile SingularAttribute<Notifications, Date> addedDate;
    public static volatile SingularAttribute<Notifications, String> buttonColor;
    public static volatile SingularAttribute<Notifications, String> link;
    public static volatile SingularAttribute<Notifications, String> memberName;
    public static volatile SingularAttribute<Notifications, Integer> notificationId;
    public static volatile SingularAttribute<Notifications, String> notificationIcon;
    public static volatile SingularAttribute<Notifications, Members> memberId;

}