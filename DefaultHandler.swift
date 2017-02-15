//
//  DefaultHandler.swift
//  JSBridge
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class DefaultHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        var bridge = getBridge() as! HandlerBridge
        
        sendMsg(BridgeEnum.Default.getType(), data: bridge.handlerName)
    }
    
    override func callback(data:AnyObject) {
        super.callback(SUCCESS, msg: "invoke method [\(data)] is not exist.")
    }
}