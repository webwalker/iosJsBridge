//
//  PayManager.swift
//  支付相关管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//支付
class payHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JPay?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        //打开支付界面
        //params?.orderId
    }
    
    override func callback(data:AnyObject) {
    }
}

//Web通知支付结果(PayPal)
class notifyPayHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JNotifyPay?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //打开支付结果页
        //params?.payType
        //params?.payStatus
        
    }
    
    override func callback(data:AnyObject) {
    }
}