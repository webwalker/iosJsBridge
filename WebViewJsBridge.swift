//
//  WebViewJavascriptBridge.swift
//
//
//  Created by xujian on 16/4/15.
//  Copyright © 2016年 ymatou. All rights reserved.
//
import UIKit

class WebViewJsBridge: BaseWebViewJsBridge {
    var webView: UIWebView!
    var webViewDelegate: UIWebViewDelegate!
    
    init(webView: UIWebView, webViewDelegate: UIWebViewDelegate? = nil, resourceBundle bundle: NSBundle? = nil) {
        super.init()
        self.webView = webView
        self.webViewDelegate = webViewDelegate
        webView.delegate = self
        
        manager = BaseBridgeManager(resourceBundle: bundle)
        manager.delegate = self
        manager.context.webView = webView
    }
}

extension WebViewJsBridge: WebViewJSBridgeBaseDelegate {
    func evaluateJavascript(javascriptCommand: String) -> String? {
        return webView.stringByEvaluatingJavaScriptFromString(javascriptCommand)
    }
}

extension WebViewJsBridge: UIWebViewDelegate {
    func webViewDidFinishLoad(webView: UIWebView) {
        if webView != self.webView {
            return
        }
        
        manager.dispatchStartUpMessageQueue()
        
        if let delegate = webViewDelegate {
            if delegate.respondsToSelector("webViewDidFinishLoad:") {
                delegate.webViewDidFinishLoad!(webView)
            }
        }
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        if webView != self.webView {
            return
        }
        if let delegate = webViewDelegate {
            if delegate.respondsToSelector("webView:didFailLoadWithError:") {
                delegate.webView!(webView, didFailLoadWithError: error)
            }
        }
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if webView != self.webView {
            return true
        }
        
        let url = request.URL
        
        if manager.isCorrectProcotocolScheme(url) {
            
            if manager.isScriptInject(url) {
                manager.injectJavascriptFile(true)
            } else if manager.isCorrectHost(url) {
                if let messageQueueString = evaluateJavascript(manager.webViewJavascriptFetchQueyCommand()) {
                    manager.flushMessageQueue(messageQueueString)
                }
            } else {
                manager.logUnkownMessage(url)
            }
            
            return false
            
        } else if let delegate = webViewDelegate {
            if delegate.respondsToSelector("webView:shouldStartLoadWithRequest:navigationType:") {
                return delegate.webView!(webView, shouldStartLoadWithRequest: request, navigationType: navigationType)
            }
        }
        
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        if webView != self.webView {
            return
        }
        if let delegate = webViewDelegate {
            if delegate.respondsToSelector("webViewDidStartLoad:") {
                delegate.webViewDidStartLoad!(webView)
            }
        }
    }
}