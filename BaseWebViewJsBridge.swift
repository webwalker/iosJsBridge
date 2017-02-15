//
//  BaseWebViewJsBridge.swift
//  JSBridge
//
//  Created by xujian on 16/4/27.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import WebKit

class BaseWebViewJsBridge: NSObject {
    var manager: BaseBridgeManager!
    
    static var enableLogging: Bool {
        get {
            return BaseBridgeManager.enableLogging
        }
        set {
            BaseBridgeManager.enableLogging = newValue
        }
    }
    
    func notifyCallback(item:WebBusItem) -> Bool {
        // 100000-199999为bridge消息应用的区间
        if (item.type >= 100000 && item.type <= 200000) {
            BridgeEnum.getByType(item.type).getHandler().callback(item.data!);
            return true;
        }
        return false;
    }
    
    func setTopBar(topBar:UIView) {
        manager.setTopBar(topBar)
    }
    
    func setBottomBar(bottomBar:UIView) {
        manager.setBottomBar(bottomBar)
    }
    
    //recycle memory
    func recycle() {
        manager.recycle()
    }
}
