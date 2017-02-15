//
//  BizManager.swift
//  业务类管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//直播详情
class liveDetailHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JLiveDetail?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//产品详情
class productDetailHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JProductDetail?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//反馈
class feedBackHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//通信录
class contactBookHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        // check login status
        
        // open contact book
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//绑定手机
class bindMobileHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        // check login status
        
        // open bind mobile window
    }
    
    override func callback(data:AnyObject) {
    }
}