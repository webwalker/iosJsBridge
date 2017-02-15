//
//  JPay.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JPay: Deserializable {
    var orderId:String?
    
    required init(data: JSONDictionary) {
        self.orderId     <-- data["orderId"]
    }
}