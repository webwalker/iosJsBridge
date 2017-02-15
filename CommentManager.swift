//
//  CommentManager.swift
//  评论类管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//评论
class commentHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JComment?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        // show comment ui
        
    }
    
    override func callback(data:AnyObject) {
    }
}

//回复评论
class replyCommentHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JComment?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        // show reply comment ui
    }
    
    override func callback(data:AnyObject) {
    }
}