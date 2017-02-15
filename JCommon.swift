//
//  JCommon.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JCommon: Deserializable {
    required init(data: JSONDictionary) {
    }
    
    class TabHome: Deserializable {
        var name:String?
        var subName:String?
        
        required init(data: JSONDictionary) {
            self.name                   <-- data["name"]
            self.subName                <-- data["subName"]
        }
    }
}