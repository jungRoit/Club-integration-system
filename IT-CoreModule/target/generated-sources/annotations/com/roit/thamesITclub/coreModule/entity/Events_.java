package com.roit.thamesITclub.coreModule.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(Events.class)
public class Events_ { 

    public static volatile SingularAttribute<Events, Integer> eventId;
    public static volatile SingularAttribute<Events, String> eventTitle;
    public static volatile SingularAttribute<Events, String> eventVenue;
    public static volatile SingularAttribute<Events, String> eventImage;
    public static volatile SingularAttribute<Events, String> eventcoOrdinator;
    public static volatile SingularAttribute<Events, Boolean> eventStatus;
    public static volatile SingularAttribute<Events, String> eventDescription;
    public static volatile SingularAttribute<Events, Date> eventDate;

}