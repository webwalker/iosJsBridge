//
//  YmtCallBack.swift
//  webpage callback manager
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class YmtCallBack {
    var TAG:String = "YmtCallBack"
    var callback:String = ""
    var callbackEvent:String?
    
    class func getInstance() -> YmtCallBack {
        struct Singleton {
            static let instance = YmtCallBack()
        }
        
        return Singleton.instance
    }
    
    public func setCallback( callback:String) {
        self.callback = callback;
    }
    
    public func sendNotify( type:Int,  id:Int) {
        sendNotify(type, id: id, status: 0, data: "")
    }
    
    public func sendNotify( type:Int,  id:Int,  status:Int) {
        sendNotify(type, id: id, status: status, data: "")
    }
    
    public func sendNotify( type:Int,  id:Int,  status:Int,  data:String) {
        sendNotify(type, id: id, status: status, msg: "", data: data)
    }
    
    public func sendNotify( type:Int,  id:Int,  status:Int,  msg:String,  data:String) {
        let param = YmtCallBackParam()
        param.type = type;
        param.id = id;
        param.status = status;
        param.message = msg;
        param.data = data;
        sendNotify(param);
    }
    
    public func sendNotify(param:AnyObject) {
        if callback.isEmpty{
            callback = "onCallBack"
        }
        
        if param is YmtCallBackParam {
            let ycbParam =  param as! YmtCallBackParam
            callbackEvent = createCmdParam(callback, param: ycbParam)
        } else {
            callbackEvent = createCmdParam(callback, param:String(param))
        }
        
        BridgeUtil().executeJS(callbackEvent!)
    }
    
    /**
     * 通过JS回调通知
     *
     * @param func
     * @param param
     * @return
     */
    func createCmdParam( method:String,  param:AnyObject) ->String {
        var result:String = ""
        result += "javascript:if(typeof "
        result += method
        result += " != 'undefined')"
        result += method + "('"
        result += toJson(param)
        result += "')"
        
        return result
    }
    
    /**
     * 通过JS回调通知
     *
     * @param func
     * @return
     */
    public func createCmdParam( method:String) ->String {
        var result:String = ""
        result += "javascript:if(typeof "
        result += method
        result += " != 'undefined')"
        result += method + "()"
        
        return result
    }
    
    /**
     * 生成HTTP原始返回信息
     *
     * @param func
     * @param origin
     * @return
     */
    public func createCmdParam(method:String, origin:String) ->String {
        var result:String = ""
        result += "javascript:if(typeof "
        result += method
        result += " != 'undefined')"
        result += method + "('"
        result += origin
        result += "')"
        
        // 过滤回车换行符
        //TODO
        //String result = sb.toString();
        //result = result.replaceAll("[\r|\n]*", ""
        return result;
    }
    
    public func notifyCallbackEvent( type:Int,  data:AnyObject) ->String {
        let name = WebEventConsts.getEventName(type)
        if name.isEmpty {
            return getDefaultCallbackEvent();
        }
        //先兼容以前老的，下期测试验证后，放开新的方式
        return notifyCallbackEvent(name, data: data as! String);
    }
    
    public func notifyCallbackEvent( type:Int, data:AnyObject,  callback:String) ->String {
        let json = toJson(data)
        var result:String = ""
        result += "javascript:try{"
        result += "YmtApi.sendEvent("
        result += "\(type)"
        result += ","
        result += json
        result += ","
        
        if callback.isEmpty{
            result += "\"\""
        } else {
            result += callback
        }
        
        result += ");}"
        result += "catch(e){}"
        return result
    }
    
    public func notifyCallbackEvent( name:String, data:String) ->String {
        let json = toJson(data)
        var result:String = ""
        result += "javascript:try{"
        result += "YmtApi.sendEvent('"
        result += name
        result += "',"
        result += json
        result += ");"
        result += "}"
        result += "catch(e){}"
        return result
    }
    
    func getDefaultCallbackEvent() -> String {
        return "javascript:try{} catch(e){}"
    }
}