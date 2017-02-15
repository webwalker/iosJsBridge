//
//  NoteManager.swift
//  笔记相关管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//日记详情
class noteDetailHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JNote?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //打开UI
    }
    
    override func callback(data:AnyObject) {
    }
}

//发布笔记
class publishNoteHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JNote?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        //打开发布笔记
    }
    
    override func callback(data:AnyObject) {
    }
}

//笔记相关的活动人员
class noteFansListHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JNote?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //打开ui
        //params?.noteId
        //params?.noteVersion
    }
    
    override func callback(data:AnyObject) {
    }
}

//参加活动的人员列表
class activityPartnerListHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JNote?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        if params?.noteId == nil { return }
        
        //打开UI
    }
    
    override func callback(data:AnyObject) {
    }
}