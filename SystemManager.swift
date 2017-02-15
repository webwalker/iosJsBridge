//
//  SystemManager.swift
//  系统类管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//设备信息
class getDeviceInfoHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        sendMsg(BridgeEnum.getDeviceInfo.getType())
    }
    
    override func callback(data:AnyObject) {
        let bridge = getBridge() as! HandlerBridge

        //获取设备信息
        var deviceInfo = "{}"
        
        super.callback(SUCCESS, data: deviceInfo)
    }
}

//呼叫电话
class callPhoneHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JSystem?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        if params?.phoneNumber == nil { return }
        
        //呼叫电话
    }
    
    override func callback(data:AnyObject) {
    }
}

//截图
class screenShotHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        
        //显示截图对话框
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//网络类型
class getNetworkTypeHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        sendMsg(BridgeEnum.getNetworkType.getType())
    }
    
    override func callback(data:AnyObject) {
        let bridge = getBridge() as! HandlerBridge
        
        //获取网络类型
        var network:AnyObject = "{}"
        
        super.callback(SUCCESS, data: network)
    }
}
