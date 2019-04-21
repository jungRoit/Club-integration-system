/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;

import com.roit.thamesITclub.coreModule.entity.EventTeam;
import java.util.List;

/**
 *
 * @author User
 */
public class EventTeamJson {
    private List<EventTeam> eventsList;

    public EventTeamJson() {
    }

    public EventTeamJson(List<EventTeam> eventsList) {
        this.eventsList = eventsList;
    }

    public List<EventTeam> getEventTeamList() {
        return eventsList;
    }

    public void setEventTeamList(List<EventTeam> eventsList) {
        this.eventsList = eventsList;
    }
    
    
}
