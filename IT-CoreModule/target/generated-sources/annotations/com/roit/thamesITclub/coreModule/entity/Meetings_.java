package com.roit.thamesITclub.coreModule.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(Meetings.class)
public class Meetings_ { 

    public static volatile SingularAttribute<Meetings, String> meetingVenue;
    public static volatile SingularAttribute<Meetings, String> meetingDecisions;
    public static volatile SingularAttribute<Meetings, Date> meetingDate;
    public static volatile SingularAttribute<Meetings, Integer> meetingId;
    public static volatile SingularAttribute<Meetings, String> meetingTitle;
    public static volatile SingularAttribute<Meetings, String> meetingAgenda;
    public static volatile SingularAttribute<Meetings, String> meetingType;

}