//
//  AbstractBridgeHandler.swift
//  base Bridge Interactive handler
//
//  Created by xujian on 16/4/12.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class AbstractBridgeHandler: IBridgeHandler {
    var js:JCallBack?
    var context:BaseBridgeContext?
    
    let SUCCESS:Int = 1
    let FAIL:Int = 2
    let COMPLETE:Int = 3
    let CANCEL:Int = 4
    
    func handler(json:AnyObject, resp:JCallBack){
        self.js = resp;
    }
    
    func callback(data:AnyObject){}

    func callback(code:Int) {
        let result = getResp(code, msg: "")
        js!(data:result)
    }
    
    func callback(code:Int, msg:String) {
        let result = getResp(code, msg: msg)
        js!(data:result)
    }
    
    func callback(code:Int, data:AnyObject) {
        let result = getResp(code, msg: "", data: data)
        js!(data:result)
    }
    
    func callback(code:Int, msg:String, data:AnyObject) {
        js!(data:getResp(code, msg: msg, data: data))
    }
    
    func sendMsg(type:Int) {
        let handler = BridgeEnum.getByType(type)
        NSLog("sendMsg--->\(handler.getName())")
        
        app.postEvent(BridgeEnum.EventName, object: WebBusItem(type: type, data: ""))
    }
    
    func sendMsg(type:Int, data:AnyObject) {
        app.postEvent(BridgeEnum.EventName, object: WebBusItem(type: type, data: data))
    }
    
    func buildParams(resp:JCallBack){
        self.js = resp
    }

    func buildParams(inout property: AnyObject?, json:AnyObject, resp:JCallBack) -> AnyObject? {
        var params: AnyObject?; params <-- json
        return params
    }
    
    func getResp(code:Int, msg:String) -> String {
        let resp = ResponseItem()
        resp.code = code
        resp.msg = msg
        resp.data = ""
        return resp.toJsonString()!
    }
    
    func getResp(code:Int, msg:String,  data:AnyObject) -> String {
        let resp = ResponseItem()
        resp.code = code
        resp.msg = msg
        resp.data = data
        return resp.toJsonString()!
    }
    
    public func getBridge() -> BaseBridgeContext {
        return context!;
    }
    
    public func setContext(context:BaseBridgeContext) {
        self.context = context;
    }
}