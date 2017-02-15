//
//  UserManager.swift
//  用户类管理
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//用户登录
class userLoginHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
    }
    
    override func callback(data:AnyObject) {
    }
}

//用户登录状态
class getLoginStatusHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        sendMsg(BridgeEnum.getLoginStatus.getType())
    }
    
    override func callback(data:AnyObject) {
        //super.callback(SUCCESS, data: 是否已登录)
    }
}

//获取用户信息
class getUserInfoHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        
        //check login status
        
        //已登录
        sendMsg(BridgeEnum.getUserInfo.getType())
    }
    
    override func callback(data:AnyObject) {
        let user = UserRespItem()
        /*user.UserId
        user.AccessToken
        user.DeviceId
        user.DeviceToken
        user.IDFA
        user.Wifi*/
        super.callback(SUCCESS, data: user)
    }
}

//上传用户头像
class uploadUserIconHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        //跳转上传头像界面，上传完成后发送消息BridgeEnum.uploadUserIcon.getType()和上传图片地址过来
        
    }
    
    override func callback(data:AnyObject) {
        super.callback(SUCCESS, msg:"success", data:data)
    }
}

//选择相册
class chooseImageHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        let bridge = getBridge() as! HandlerBridge
        
        //选择相册, 发送消息BridgeEnum.chooseImage.getType()和图片本地路径过来
    }
    
    override func callback(data:AnyObject) {
        //将浏览或拍照后的本地图片路径返回给页面
        super.callback(SUCCESS, data:data)
    }
}

//上传图片
class uploadImageHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp: resp)
        var params:JImage?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        
        //check login status
        
        //上传图片
        
    }
    
    override func callback(data:AnyObject) {
        super.callback(SUCCESS, data:data)
    }
}
