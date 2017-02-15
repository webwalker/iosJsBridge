//
//  MsgManager.swift
//  消息相关管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//显示消息图标（废弃）
class showMsgIconHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        
        //show msg icon
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//洋管家
class onlineServiceHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        //open 洋管家
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//打开聊天
class openChatHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        //打开聊天
        let jsonResult = JSON(json)
        let chatType = jsonResult["paramType"].intValue
        let toId = jsonResult["toId"].stringValue
        switch chatType {
            case 0: //普通聊天
                
                break
            case 1: //订单
                var params:JChatOrder?; params <-- json
            
                break
            case 2: //商品
                var params:JChatProduct?; params <-- json
            
                break
            default:
                break
        }
    }
    
    override func callback(data:AnyObject) {
    }
}





