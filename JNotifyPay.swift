//
//  JNotifyPay.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JNotifyPay: Deserializable {
    var orderId:String?
    var payType:Int = 0
    var payStatus:Int = 0
    var payMessage:String?
    
    required init(data: JSONDictionary) {
        self.orderId     <-- data["orderId"]
        self.payType     <-- data["payType"]
        self.payStatus     <-- data["payStatus"]
        self.payMessage     <-- data["payMessage"]
    }
}