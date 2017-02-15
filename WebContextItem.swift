//
//  WebContextItem.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class WebContextItem {
    var isLogin:Bool = false
    var userId:String?
    var accessToken:String?
    var deviceToken:String?
    var userAgent:String?
    var appChannel:String?
    var isDnsEnabled:Bool = false
    
    class func getInstance() -> WebContextItem {
        struct Singleton {
            static let instance = WebContextItem()
        }
        
        return Singleton.instance
    }
    
    public func login( userId:String,  accessToken:String) {
        isLogin = true
        self.userId = userId
        self.accessToken = accessToken  
    }
    
    public func logout() {
        isLogin = false;
        userId = "";
        accessToken = "";
    }
}