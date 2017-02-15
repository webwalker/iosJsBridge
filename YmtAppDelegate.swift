//
//  YmtAppDelegate.swift
//  JSBridge
//
//  Created by xujian on 16/4/23.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import UIKit

let app = UIApplication.sharedApplication().delegate as! AppDelegate

extension AppDelegate {
    func addEventListener(observer: AnyObject, selector aSelector: Selector, name aName: String?, object anObject: AnyObject? = nil) {
        NSNotificationCenter.defaultCenter().addObserver(observer, selector:aSelector, name: aName, object: anObject)
    }
    
    func removeEventListener(observer: AnyObject) {
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
    
    func postEvent(aName: String, object anObject: AnyObject?, userInfo aUserInfo: [NSObject : AnyObject]? = nil) {
        NSNotificationCenter.defaultCenter().postNotificationName(aName, object: anObject, userInfo: aUserInfo)
    }
}