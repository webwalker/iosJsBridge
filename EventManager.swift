//
//  EventManager.swift
//  事件类处理
//
//  Created by xujian on 16/4/26.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//监听页面事件
class listenPageEventHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params: JPageEvent?; params <-- json
        let bridge = getBridge() as! HandlerBridge

    }
    
    override func callback(data:AnyObject) {
    }
}