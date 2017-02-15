//
//  WebContext.swift
//  manage web context for single entrance
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import WebKit

public class WebContext {
    var webView:UIView?
    var webViewType:Int = 0 // 1 UIWebView, 2 WKWebView
    
    class func Instance() ->WebContext {
        struct Singleton {
            static let instance = WebContext()
        }
        
        return Singleton.instance
    }
    
    func setWebView(webView: UIView, type:Int){
        self.webView = webView
        self.webViewType = type
    }
    
    func isUIWebView() -> Bool {
        return webViewType == 1
    }
    
    func isWKWebView() -> Bool {
        return webViewType == 2
    }
    
    func getUIWebView() -> UIWebView {
        return webView as! UIWebView
    }
    
    func getWKWebView() -> WKWebView {
        return webView as! WKWebView
    }
}