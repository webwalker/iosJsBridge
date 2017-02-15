//
//  BridgeUtil.swift
//  JSBridge
//
//  Created by xujian on 16/4/12.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class BridgeUtil {
    var webContext = WebContext.Instance()
    
    func executeJS(script:String) {
        if webContext.isUIWebView(){
            webContext.getUIWebView().stringByEvaluatingJavaScriptFromString(script)
        }
        else{
            webContext.getWKWebView().evaluateJavaScript(script, completionHandler: nil)
        }
    }
}

//临时使用，后面用项目其他的工具集替换
func toJson(obj: AnyObject) -> String {
    let data = try! NSJSONSerialization.dataWithJSONObject(obj, options: NSJSONWritingOptions())
    return String(data: data, encoding: NSUTF8StringEncoding)!
}

func fromJson<T>(json: String) -> T? {
    if let data = json.dataUsingEncoding(NSUTF8StringEncoding) {
        return try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! T
    }
    return nil
}