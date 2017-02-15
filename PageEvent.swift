//
//  PageEvent.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class PageEvent {
    var type:Int = 0
    var data:AnyObject?
    var callback:String?
    
    init(type:Int, data:AnyObject) {
        self.type = type;
        self.data = data;
    }
    
    init(type:Int, data:AnyObject,  callback:String) {
        self.type = type;
        self.data = data;
        self.callback = callback;
    }
}