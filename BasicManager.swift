//
//  BasicManager.swift
//  基础管理接口
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

//配置(预留接口)
class configHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        super.handler(json, resp:resp)
        var params: JConfig?; params <-- json
        
        sendMsg(BridgeEnum.Config.getType())
    }
    
    override func callback(data:AnyObject) {
        super.callback(SUCCESS)
    }
}

//打开窗口
class openWinHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JOpenWindow?; params <-- json
        if params == nil || params!.url.isEmpty { return }
        
        let bridge = getBridge() as! HandlerBridge
        switch params!.winType {
            case 2: //打开笔记(android中笔记单独写了一套逻辑)
                break
            default: //打开普通Web页面
                //WebPageLoader.getInstance().openWebPage(bridge.context, params.url);
                break
        }
    }
    
    override func callback(data:AnyObject) {
    }
}

//关闭窗口
class closeWinHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        let bridge = getBridge() as! HandlerBridge
        
        //to-do close web window
    }
    
    override func callback(data:AnyObject) {
    }
}

//Tab跳转
class tabHomeHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params: JCommon.TabHome?; params <-- json
        
        var name = params?.name
        var tabIndex = "" //设置默认值
        var subTabIndex = params?.subName
        if name == "live" {
            tabIndex = "" //赋值ios内部的Tab标识
        } else if name == "jyh" {
            tabIndex = ""
        } else if name == "activity" {
            tabIndex = ""
        } else if name == "diary" {
            tabIndex = ""
        } else if name == "me" {
            tabIndex = ""
        }

        let bridge = getBridge() as! HandlerBridge
        //to-do 作跳转处理
        
    }
    
    override func callback(data:AnyObject) {
    }
}

// 标题栏处理
class titleBarHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JTitleBar?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        if params == nil { return }
        
        //visible
        if params!.getVisible() {
        }
        
        var topManager = TopBarManager()
        switch params!.theme {
        case 0:
            topManager.showDefaultTopBar(params, bridge: bridge)
            break;
        case 1:
            topManager.showSecondTopBar(params, bridge: bridge)
            break;
        default:
            break;
        }
    }
    
    override func callback(data:AnyObject) {
    }
}

// 底部栏
class bottomBarHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JBottomBar?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        if params == nil { return }
        
        var bottomBar = bridge.bottomBar
        if params!.getVisible() {
        }
        else {
        }
        
        // 不同类型的底部栏位处理
        switch params!.type {
            case 1: //专题
                break
            case 2: //笔记
                break
            default:break
        }
    }
    
    override func callback(data:AnyObject) {
    }
}

//下拉刷新类型(废弃)
class pageRefreshTypeHandler: AbstractBridgeHandler {
    override func handler(json:AnyObject, resp:JCallBack) {
        var params:JWindow?; params <-- json
        let bridge = getBridge() as! HandlerBridge
        bridge.context.refreshType = (params?.refreshType)!
    }
    
    override func callback(data:AnyObject) {
    }
}

