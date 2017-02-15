//
//  IBridgeHandler.swift
//  JSBridge
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

protocol IBridgeHandler {
    
    func handler(json:AnyObject, resp:JCallBack)
    
    func callback(data:AnyObject)
}