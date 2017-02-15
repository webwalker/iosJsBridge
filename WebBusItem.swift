//
//  WebBusItem.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class WebBusItem {
    var type:Int = 0
    var data:AnyObject?
    
    init(){}
    
    init(type:Int, data:AnyObject) {
        self.type = type;
        self.data = data;
    }
}