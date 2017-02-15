//
//  LogManager.swift
//  日志类管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//友盟埋点
class sendUmengLogHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JLog?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        if params == nil || params?.data == nil { return }
        
        //send umeng log
    }
    
    override func callback(data:AnyObject) {
    }
}

//native算法埋点
class sendYLogHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JLog?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        if params == nil || params?.data == nil { return }

        //send ylog
    }
    
    override func callback(data:AnyObject) {
    }
}