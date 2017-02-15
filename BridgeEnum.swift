//
//  BridgeEnum.swift
//  模拟一个OO枚举类
//
//  Created by xujian on 16/4/18.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class BridgeEnum { //扩展时请在这里增加声明即可
    //基础接口
    static var Default = BridgeEnum.build("default", type:100000, handler:DefaultHandler())
    static var Config = BridgeEnum.build("config", type:100005, handler:configHandler())
    static var closeWin = BridgeEnum.build("closeWin", type:100010, handler:closeWinHandler())
    static var openWin = BridgeEnum.build("openWin", type:100015, handler:openWinHandler())
    static var tabHome = BridgeEnum.build("tabHome", type:100020, handler:tabHomeHandler())
    static var titleBar = BridgeEnum.build("titleBar", type:100025, handler:titleBarHandler())
    static var bottomBar = BridgeEnum.build("bottomBar", type:100026, handler:bottomBarHandler())
    static var pageRefreshType = BridgeEnum.build("pageRefreshType", type:100030, handler:pageRefreshTypeHandler())
    //用户接口
    static var userLogin = BridgeEnum.build("userLogin", type:100035, handler:userLoginHandler())
    static var getLoginStatus = BridgeEnum.build("getLoginStatus", type:100040, handler:getLoginStatusHandler())
    static var getUserInfo = BridgeEnum.build("getUserInfo", type:100045, handler:getUserInfoHandler())
    static var uploadUserIcon = BridgeEnum.build("uploadUserIcon", type:100050, handler:uploadUserIconHandler())
    //图像接口
    static var chooseImage = BridgeEnum.build("chooseImage", type:100055, handler:chooseImageHandler())
    static var uploadImage = BridgeEnum.build("uploadImage", type:100060, handler:uploadImageHandler())
    //支付接口
    static var pay = BridgeEnum.build("pay", type:100065, handler:payHandler())
    static var notifyPay = BridgeEnum.build("notifyPay", type:100070, handler:notifyPayHandler())
    //分享接口
    static var share = BridgeEnum.build("share", type:100080, handler:shareHandler())
    //评论接口
    static var comment = BridgeEnum.build("comment", type:100085, handler:commentHandler())
    static var replyComment = BridgeEnum.build("replyComment", type:100090, handler:replyCommentHandler())
    //日记接口
    static var noteDetail = BridgeEnum.build("noteDetail", type:100095, handler:noteDetailHandler())
    static var publishNote = BridgeEnum.build("publishNote", type:100100, handler:publishNoteHandler())
    static var noteFansList = BridgeEnum.build("noteFansList", type:100105, handler:noteFansListHandler())
    static var activityPartnerList = BridgeEnum.build("activityPartnerList", type:100106, handler:activityPartnerListHandler())
    //消息接口
    static var showMsgIcon = BridgeEnum.build("showMsgIcon", type:100110, handler:showMsgIconHandler())
    static var onlineService = BridgeEnum.build("onlineService", type:100115, handler:onlineServiceHandler())
    static var openChat = BridgeEnum.build("openChat", type:100120, handler:openChatHandler())
    //业务接口
    static var liveDetail = BridgeEnum.build("liveDetail", type:100125, handler:liveDetailHandler())
    static var productDetail = BridgeEnum.build("productDetail", type:100130, handler:productDetailHandler())
    static var feedBack = BridgeEnum.build("feedBack", type:100135, handler:feedBackHandler())
    static var contactBook = BridgeEnum.build("contactBook", type:100140, handler:contactBookHandler())
    static var bindMobile = BridgeEnum.build("bindMobile", type:100145, handler:bindMobileHandler())
    //事件接口
    static var listenPageEvent = BridgeEnum.build("listenPageEvent", type:100150, handler:listenPageEventHandler())
    //系统接口
    static var getDeviceInfo = BridgeEnum.build("getDeviceInfo", type:100155, handler:getDeviceInfoHandler())
    static var callPhone = BridgeEnum.build("callPhone", type:100160, handler:callPhoneHandler())
    static var screenShot = BridgeEnum.build("screenShot", type:100165, handler:screenShotHandler())
    static var getNetworkType = BridgeEnum.build("getNetworkType", type:100170, handler:getNetworkTypeHandler())
    //监控接口
    static var sendUmengLog = BridgeEnum.build("sendUmengLog", type:100175, handler:sendUmengLogHandler())
    static var sendYLog = BridgeEnum.build("sendYLog", type:100180, handler:sendYLogHandler())
    
    var name:String?
    var type:Int = 0
    var handler:AbstractBridgeHandler?
    static var handlers = Array<BridgeEnum>()
    static let EventName = "event_js_bridge"
    
    init(){
    }
    
    class func complile() {
        if !handlers.isEmpty { return }
        handlers.append(Default)
        handlers.append(Config)
        handlers.append(closeWin)
        handlers.append(openWin)
        handlers.append(tabHome)
        handlers.append(titleBar)
        handlers.append(bottomBar)
        handlers.append(pageRefreshType)
        handlers.append(userLogin)
        handlers.append(getLoginStatus)
        handlers.append(getUserInfo)
        handlers.append(uploadUserIcon)
        handlers.append(chooseImage)
        handlers.append(uploadImage)
        handlers.append(pay)
        handlers.append(notifyPay)
        handlers.append(share)
        handlers.append(comment)
        handlers.append(replyComment)
        handlers.append(noteDetail)
        handlers.append(publishNote)
        handlers.append(noteFansList)
        handlers.append(activityPartnerList)
        handlers.append(showMsgIcon)
        handlers.append(onlineService)
        handlers.append(openChat)
        handlers.append(liveDetail)
        handlers.append(productDetail)
        handlers.append(feedBack)
        handlers.append(contactBook)
        handlers.append(bindMobile)
        handlers.append(listenPageEvent)
        handlers.append(getDeviceInfo)
        handlers.append(callPhone)
        handlers.append(screenShot)
        handlers.append(getNetworkType)
        handlers.append(sendUmengLog)
        handlers.append(sendYLog)
    }
    
    class func build(name:String, type:Int, handler:AbstractBridgeHandler) -> BridgeEnum {
        let bridge = BridgeEnum()
        bridge.name = name
        bridge.type = type
        bridge.handler = handler
        return bridge
    }
    
    class func getByName(name:String) -> BridgeEnum {
        for bridge in BridgeEnum.values() {
            if (bridge.getName() == name) {
                return bridge;
            }
        }
        return BridgeEnum.Default;
    }
    
    class func getByType(type:Int) -> BridgeEnum {
        for bridge in BridgeEnum.values() {
            if (bridge.getType() == type) {
                return bridge;
            }
        }
        return BridgeEnum.Default;
    }
    
    class func values() -> Array<BridgeEnum> {
        return handlers
    }
    
    func getName() -> String{
        return name!
    }
    
    func getType() -> Int {
        return type
    }
    
    func getHandler() -> AbstractBridgeHandler{
        return handler!
    }
}

enum BridgeEnumType {
    case Build(String, Int, AbstractBridgeHandler)
}