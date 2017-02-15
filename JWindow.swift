//
//  JWindow.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JWindow: Deserializable {
    var refreshType:Int = 0
    
    required init(data: JSONDictionary) {
        self.refreshType     <-- data["refreshType"]
    }
}