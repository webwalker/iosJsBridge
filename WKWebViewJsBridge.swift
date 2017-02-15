//
//  WKWebViewJavascriptBridge.swift
//  JSBridge
//
//  Created by xujian on 16/4/27.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import WebKit

class WKWebViewJsBridge: BaseWebViewJsBridge {
    var webView: WKWebView!
    var webViewDelegate: WKNavigationDelegate!
    var viewController: UIViewController!
    
    init(webView: WKWebView, webViewDelegate: WKNavigationDelegate? = nil, resourceBundle bundle: NSBundle? = nil) {
        super.init()
        self.webView = webView
        self.webViewDelegate = webViewDelegate
        webView.navigationDelegate = self
        webView.UIDelegate = self
        
        manager = BaseBridgeManager(resourceBundle: bundle)
        manager.delegate = self
        //manager.context.webView = webView
    }
    
    func bindController(controller:UIViewController) {
        self.viewController = controller
    }
}

extension WKWebViewJsBridge: WebViewJSBridgeBaseDelegate {
    func evaluateJavascript(javascriptCommand: String) -> String? {
        webView.evaluateJavaScript(javascriptCommand, completionHandler: { (object, error) -> Void in
            if object != nil {
                self.manager.flushMessageQueue(String(object!))
            }
            if (error != nil) {
                print(error)
            }
        })
        return ""
    }
}

extension WKWebViewJsBridge: WKNavigationDelegate {
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        // When webView is loaded we can execute JS function
        //let template = "doSmthWithJS('Hello from Swift')"
        
        manager.dispatchStartUpMessageQueue()
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        
        if webView != self.webView {
            decisionHandler(WKNavigationActionPolicy.Allow)
        }
        
        let url = navigationAction.request.URL
        
        if manager.isCorrectProcotocolScheme(url) {
            if manager.isScriptInject(url) {
                manager.injectJavascriptFile(true)
            } else if manager.isCorrectHost(url) {
                evaluateJavascript(manager.webViewJavascriptFetchQueyCommand())
            } else {
                manager.logUnkownMessage(url)
            }
            decisionHandler(WKNavigationActionPolicy.Cancel)
        }
        decisionHandler(WKNavigationActionPolicy.Allow)
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog(error.debugDescription)
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog(error.debugDescription)
    }
}

extension WKWebViewJsBridge: WKUIDelegate {
    //HTML页面Alert出内容
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        let ac = UIAlertController(title: webView.title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        ac.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: { (a) -> Void in
            completionHandler()
        }))
        
        viewController.presentViewController(ac, animated: true, completion: nil)
    }
    
    //HTML页面弹出Confirm时调用此方法
    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void) {
        let ac = UIAlertController(title: webView.title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        ac.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:
            { (ac) -> Void in
                completionHandler(true)  //按确定的时候传true
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:
            { (ac) -> Void in
                completionHandler(false)  //取消传false
        }))
        
        viewController.presentViewController(ac, animated: true, completion: nil)
    }
}