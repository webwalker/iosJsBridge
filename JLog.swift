//
//  JLog.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JLog: Deserializable {
    var data:String?
    
    required init(data: JSONDictionary) {
        self.data     <-- data["data"]
    }
}