//
//  WebViewJSBridgeBase.swift
//
//
//  Created by xujian on 16/4/15.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import UIKit

let kCustomProtocolScheme = "ymtapi"
let kQueueHasMessage = "__QUEUE_MESSAGE__"
let kScriptInject = "init"

typealias JCallBack = (data: AnyObject?) -> Void

protocol WebViewJSBridgeBaseDelegate: NSObjectProtocol {
    func evaluateJavascript(javascriptCommand: String) -> String?
}

class BaseBridgeManager: NSObject {
    var delegate: WebViewJSBridgeBaseDelegate?
    var startupMessageQueue: Array<Message>?
    var responseCallbacks = [String: JCallBack]()
    var numRequestsLoading = 0
    var context = HandlerBridge()
    
    private var webViewDelegate: UIWebViewDelegate!
    private var uniqueId = 0
    private var resourceBundle: NSBundle?
    
    static var enableLogging = false
    
    init(resourceBundle bundle: NSBundle?) {
        resourceBundle = bundle
        startupMessageQueue = Array<Message>()
        BridgeEnum.complile()
    }
    
    func setTopBar(view:UIView) {
        context.topBar = view
    }
    
    func setBottomBar(view:UIView) {
        context.bottomBar = view
    }
    
    func recycle() {
        context.recycle()
        startupMessageQueue = Array<Message>()
        responseCallbacks = [String: JCallBack]()
        uniqueId = 0
    }
    
    func injectJavascriptFile(shouldInject: Bool) {
        if shouldInject {
            let bundle = resourceBundle ?? NSBundle.mainBundle()
            let filePath = bundle.pathForResource("WebViewJavascriptBridge.js", ofType: "txt")!
            
            let data = NSData(contentsOfFile: filePath)!
            let js = String(data: data, encoding: NSUTF8StringEncoding)!
            
            evaluateJavascript(js)
            
            dispatchStartUpMessageQueue()
        }
    }
    
    func isCorrectProcotocolScheme(url: NSURL?) -> Bool {
        if url?.scheme == kCustomProtocolScheme {
            return true
        }
        return false
    }
    
    func isCorrectHost(url: NSURL?) -> Bool {
        if url?.host == kQueueHasMessage {
            return true
        }
        return false
    }
    
    func isScriptInject(url: NSURL?) -> Bool {
        if url?.host == kScriptInject {
            return true
        }
        return false
    }
    
    private func evaluateJavascript(js: String) {
        delegate?.evaluateJavascript(js)
    }
    
    func webViewJavascriptCheckCommand() -> String {
        return "typeof WebViewJavascriptBridge == \'object\';"
    }
    
    func webViewJavascriptFetchQueyCommand() -> String {
        return "WebViewJavascriptBridge._fetchQueue();"
    }
    
    func sendData(data: AnyObject?, handlerName: String?, responseCallback: JCallBack?) {
        let message = Message()
        if let data = data {
            message.data = data as! JSONDictionary
        }
        
        if let callBack = responseCallback {
            uniqueId += 1
            let callbackId = "objc_cb_\(uniqueId)"
            self.responseCallbacks[callbackId] = callBack
            message.callbackId = callbackId
        }
        
        if let name = handlerName {
            message.handlerName = name
        }
        
        queueMessage(message)
    }
    
    func flushMessageQueue(messageQueueString: String) {
        var messages: [Message]?; messages <-- messageQueueString
        for message in messages! {
            if let responseId = message.responseId {
                if let responseCallback = responseCallbacks[responseId] {
                    responseCallback(data: message.responseData)
                    responseCallbacks.removeValueForKey(responseId)
                }
            } else {
                var responseCallback: JCallBack
                if let callbackId = message.callbackId {
                    responseCallback = { responseData in
                        if let data = responseData {
                            let msg = Message()
                            msg.responseId = callbackId
                            msg.responseData = data as? String
                            self.queueMessage(msg)
                        }
                    }
                } else {
                    responseCallback = { ignoreResponseData in
                        // Do nothing
                    }
                }
                
                let handler = BridgeEnum.getByName(message.handlerName!).getHandler()
                context.handlerName = message.handlerName!
                handler.setContext(context)
                handler.handler(message.data, resp:responseCallback)
            }
        }
    }
    
    func dispatchStartUpMessageQueue() {
        if let queue = startupMessageQueue {
            for queuedMessage in queue {
                dispatchMessage(queuedMessage)
            }
            self.startupMessageQueue = nil
        }
    }
    
    private func dispatchMessage(message: Message) {
        var messageJSON = message.toJsonString()
        log("SEND", json: messageJSON!)
        //messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\\\"", withString: "\"")
        messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\\", withString: "\\\\")
        messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\"", withString: "\\\"")
        messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\'", withString: "\\\'")
        messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\n", withString: "\\\n")
        messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\r", withString: "\\\r")
        //        messageJSON = messageJSON.stringByReplacingOccurrencesOfString("\\f", withString: "\\\\f")
        messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\\u2028", withString: "\\\\u2028")
        messageJSON! = messageJSON!.stringByReplacingOccurrencesOfString("\\u2029", withString: "\\\\u2029")
        
        let javascriptCommand = "WebViewJavascriptBridge._handleMessageFromNative('\(messageJSON!)');"
        if NSThread.currentThread().isMainThread {
            evaluateJavascript(javascriptCommand)
            //evaluateJavascript("showResult('\(messageJSON!)');")
        } else {
            dispatch_sync(dispatch_get_main_queue()) {
                self.evaluateJavascript(javascriptCommand)
            }
        }
    }
    
    private func queueMessage(message: Message) {
        if nil != startupMessageQueue {
            startupMessageQueue!.append(message)
        } else {
            dispatchMessage(message)
        }
    }
    
    private func log(action: String, json: AnyObject) {
        if !BaseBridgeManager.enableLogging {
            return
        }
        var log = ""
        if !(json is String) {
            log = toJson(json)
        }
        
        NSLog("WVJB \(action): \(log)")
    }
    
    func logUnkownMessage(url: NSURL?) {
        NSLog("WebViewJavascriptBridge: WARNING: Received unknown WebViewJavascriptBridge command \(kCustomProtocolScheme)://\(url?.path)")
    }
}