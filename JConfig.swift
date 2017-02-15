//
//  JConfig.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JConfig:Deserializable {
    var domain:String = "ymatou.com"
    var debug:Bool = false
    var sourceId:String = ""
    var timestamp:String = ""
    var signature:String = ""
    
    required init(data: JSONDictionary) {
        self.debug        <-- data["debug"]
        self.sourceId        <-- data["sourceId"]
        self.timestamp        <-- data["timestamp"]
        self.signature        <-- data["signature"]
    }
}