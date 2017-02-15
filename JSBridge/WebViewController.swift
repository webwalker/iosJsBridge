//
//  WebViewController.swift
//  
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var bridge: WebViewJsBridge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = UIWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        bridge = WebViewJsBridge(webView: webView, webViewDelegate: self, resourceBundle: nil)        
        initController()
        loadExamplePage(webView)
    }
    
    func loadExamplePage(webView: UIWebView) {
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

extension WebViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog("webViewDidFinishLoad")
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        NSLog("webViewDidStartLoad")
    }
}