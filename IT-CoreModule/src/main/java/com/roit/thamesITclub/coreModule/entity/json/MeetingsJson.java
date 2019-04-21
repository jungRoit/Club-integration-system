/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;


import com.roit.thamesITclub.coreModule.entity.Meetings;
import java.util.List;

/**
 *
 * @author User
 */
public class MeetingsJson {
    private List<Meetings> meetingsLlist;

    public MeetingsJson() {
    }

    public MeetingsJson(List<Meetings> meetingsLlist) {
        this.meetingsLlist = meetingsLlist;
    }

    public List<Meetings> getList() {
        return meetingsLlist;
    }

    public void setList(List<Meetings> meetingsLlist) {
        this.meetingsLlist = meetingsLlist;
    }
    
    
}
