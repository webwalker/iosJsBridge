//
//  JChat.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JChat<T>: Deserializable {
    var sessionId:String?
    var toId:String?
    var toLoginId:String?
    var toLogoUrl:String?
    var isM2C:Bool = false
    var paramType:Int = 0
    var param:T?
    
    required init(data: JSONDictionary) {
        self.sessionId        <-- data["sessionId"]
        self.toId        <-- data["toId"]
        self.toLoginId        <-- data["toLoginId"]
        self.toLogoUrl        <-- data["toLogoUrl"]
        self.isM2C        <-- data["isM2C"]
        self.paramType        <-- data["paramType"]
        self.param        <-- data["param"]
    }
}