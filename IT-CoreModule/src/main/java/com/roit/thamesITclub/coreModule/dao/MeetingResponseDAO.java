/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao;

import com.roit.thamesITclub.coreModule.entity.MeetingResponse;
import com.roit.thamesITclub.coreModule.entity.Meetings;
import com.roit.thamesITclub.coreModule.entity.Members;
import java.util.List;

/**
 *
 * @author User
 */
public interface MeetingResponseDAO extends GenericDAO<MeetingResponse> {
    List<MeetingResponse> getAllByMeeting(Meetings m);
    List<MeetingResponse> getAllByMember(Members m);
    List<MeetingResponse> getAllByMeetingAndResponse(Meetings m, String response);
    
}
