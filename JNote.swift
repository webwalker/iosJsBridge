//
//  JNote.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JNote: Deserializable {
    var noteId:String?
    var noteVersion:String?
    var activityId:String?
    var activityName:String?
    
    required init(data: JSONDictionary) {
        self.noteId     <-- data["noteId"]
        self.noteVersion     <-- data["noteVersion"]
        self.activityId     <-- data["activityId"]
        self.activityName     <-- data["activityName"]
    }
}