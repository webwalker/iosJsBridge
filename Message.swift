//
//  Message.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class Message: Serializable, Deserializable {
    var callbackId:String? //callbackId
    var responseId:String? //responseId
    var responseData:String? //responseData
    var data:JSONDictionary = [:] //data of message
    var handlerName:String? //name of handler
    
    override init(){}
    
    required init(data: JSONDictionary){
        self.callbackId <-- data["callbackId"]
        self.responseId <-- data["responseId"]
        self.responseData <-- data["responseData"]
        self.data <-- data["data"]
        self.handlerName <-- data["handlerName"]
    }
}