//
//  ShareManager.swift
//  分享类管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//分享
class shareHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JShare?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //打开分享
        //params?.title
        //params?.content
        //params?.imgUrl
        //params?.linkUrl
        //params?.hide
    }
    
    override func callback(data:AnyObject) {
    }
}

