package com.roit.thamesITclub.coreModule.entity;

import com.roit.thamesITclub.coreModule.entity.Events;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-07-02T13:35:39")
@StaticMetamodel(Accounts.class)
public class Accounts_ { 

    public static volatile SingularAttribute<Accounts, String> transactionType;
    public static volatile SingularAttribute<Accounts, Events> eventId;
    public static volatile SingularAttribute<Accounts, Integer> amount;
    public static volatile SingularAttribute<Accounts, Date> addedDate;
    public static volatile SingularAttribute<Accounts, String> transactionTitle;
    public static volatile SingularAttribute<Accounts, Integer> transactionId;
    public static volatile SingularAttribute<Accounts, String> remarks;

}