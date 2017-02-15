//
//  WKWebViewController.swift
//
//
//  Created by xujian on 16/4/28.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import WebKit

class WKWebViewController: UIViewController {
    var bridge: WKWebViewJsBridge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        bridge = WKWebViewJsBridge(webView: webView, webViewDelegate: self, resourceBundle: nil)
        bridge.bindController(self)
        
        initController()
        loadExamplePage(webView)
    }
    
    func loadExamplePage(webView: WKWebView) {
        let htmlPath = NSBundle.mainBundle().pathForResource("demo", ofType: "html")!
        let data = NSData(contentsOfFile: htmlPath)!
        let appHtml = String(data: data, encoding: NSUTF8StringEncoding)!
        let baseURL = NSURL(fileURLWithPath: htmlPath)
        webView.loadHTMLString(appHtml, baseURL: baseURL)
    }
    
    func initController(){
        WebViewJsBridge.enableLogging = true
        
        //bridge.setTopBar()
        //bridge.setBottomBar()
        //bridge.setWebView()
        
        app.addEventListener(self, selector: #selector(onEventNotification(_:)), name: BridgeEnum.EventName)
    }
    
    deinit {
        bridge.recycle()
        app.removeEventListener(self)
    }
    
    func onEventNotification(notification:NSNotification) {
        if let result = notification.object as? WebBusItem {
            bridge.notifyCallback(result)
        }
    }
}

extension WKWebViewController: WKNavigationDelegate {
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog("webViewDidFinishLoad")
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        NSLog("webViewDidStartLoad")
    }
}