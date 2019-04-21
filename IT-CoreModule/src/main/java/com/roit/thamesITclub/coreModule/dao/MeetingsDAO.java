/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.dao;

import com.roit.thamesITclub.coreModule.entity.Meetings;
import java.util.List;

/**
 *
 * @author User
 */
public interface MeetingsDAO extends GenericDAO<Meetings> {
    List<Meetings> getAllByMeetingType(String meetingType);
}
