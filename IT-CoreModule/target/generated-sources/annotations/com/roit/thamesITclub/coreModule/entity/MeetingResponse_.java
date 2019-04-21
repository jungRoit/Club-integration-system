package com.roit.thamesITclub.coreModule.entity;

import com.roit.thamesITclub.coreModule.entity.Meetings;
import com.roit.thamesITclub.coreModule.entity.Members;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(MeetingResponse.class)
public class MeetingResponse_ { 

    public static volatile SingularAttribute<MeetingResponse, Date> addedDate;
    public static volatile SingularAttribute<MeetingResponse, String> response;
    public static volatile SingularAttribute<MeetingResponse, String> comment;
    public static volatile SingularAttribute<MeetingResponse, Meetings> meetingId;
    public static volatile SingularAttribute<MeetingResponse, Integer> responseId;
    public static volatile SingularAttribute<MeetingResponse, Members> memberId;

}