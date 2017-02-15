//
//  JComment.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JComment: Deserializable {
    var objectId:String?
    var objectType:Int = 0
    var replyCommentId:String?
    var replyUserName:String?
    
    required init(data: JSONDictionary) {
        self.objectId                   <-- data["objectId"]
        self.objectType                 <-- data["objectType"]
        self.replyCommentId             <-- data["replyCommentId"]
        self.replyUserName              <-- data["replyUserName"]
    }
}