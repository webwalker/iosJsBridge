//
//  ChooseImage.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JChooseImage: Deserializable {
    var url:String?
    var userId:String?
    var bridge:Bool = false
    
    required init(data: JSONDictionary) {
        self.url        <-- data["url"]
        self.userId        <-- data["userId"]
        self.bridge        <-- data["bridge"]
    }
}