/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.coreModule.entity.json;

import com.roit.thamesITclub.coreModule.entity.Messages;
import java.util.List;

/**
 *
 * @author User
 */
public class MessagesJson {
    private List<Messages> messagesList;

    public MessagesJson() {
    }

    public MessagesJson(List<Messages> messagesList) {
        this.messagesList = messagesList;
    }

    public List<Messages> getMessagesList() {
        return messagesList;
    }

    public void setMessagesList(List<Messages> messagesList) {
        this.messagesList = messagesList;
    }
    
    
    
}
