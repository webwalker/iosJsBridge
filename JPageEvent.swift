//
//  JPageEvent.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JPageEvent: Deserializable {
    var back:String?
    
    required init(data: JSONDictionary) {
        self.back     <-- data["back"]
    }
}