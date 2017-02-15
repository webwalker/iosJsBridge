//
//  JSystem.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JSystem: Deserializable {
    var phoneNumber:String?
    
    required init(data: JSONDictionary) {
        self.phoneNumber     <-- data["phoneNumber"]
    }
}