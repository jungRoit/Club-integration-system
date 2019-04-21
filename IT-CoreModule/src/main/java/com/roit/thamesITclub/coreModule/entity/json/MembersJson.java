/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;

import com.roit.thamesITclub.coreModule.entity.Members;
import java.util.List;

/**
 *
 * @author User
 */
public class MembersJson {
    private List<Members> membersList;

    public MembersJson() {
    }

    public MembersJson(List<Members> membersList) {
        this.membersList = membersList;
    }

    public List<Members> getMembersList() {
        return membersList;
    }

    public void setMembersList(List<Members> membersList) {
        this.membersList = membersList;
    }
    
    
    
}
