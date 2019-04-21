/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;

import com.roit.thamesITclub.coreModule.entity.Events;
import java.util.List;

/**
 *
 * @author User
 */
public class EventsJson {
    private List<Events> eventsList;

    public EventsJson() {
    }

    public EventsJson(List<Events> eventsList) {
        this.eventsList = eventsList;
    }

    public List<Events> getEventsList() {
        return eventsList;
    }

    public void setEventsList(List<Events> eventsList) {
        this.eventsList = eventsList;
    }
    
    
}
