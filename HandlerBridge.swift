//
//  HandlerBridge.swift
//  用于上下文对象传递(标题栏、底部栏等)
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import WebKit

 class HandlerBridge: BaseBridgeContext {
    var context = JContext()
    var webView:UIWebView?
    var topBar:UIView?
    var bottomBar:UIView?
    
    func getConfig() -> JConfig {
        return JContext.config!
    }
    
    func setConfig(config:JConfig) {
        JContext.config = config
    }

    func setWebView(webView: UIWebView) {
        self.webView = webView
    }
    
    //remember recycle memory
    func recycle() {
        handlerName = ""
        topBar = nil
        bottomBar = nil
    }
}