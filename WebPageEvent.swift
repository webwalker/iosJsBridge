//
//  WebPageEvent.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import WebKit

public class WebPageEvent {
    var webView:UIView?
    var events:Array<PageEvent>?
    var callBack = YmtCallBack.getInstance();
    var bridgeUtil:BridgeUtil = BridgeUtil()
    
    class func getInstance() -> WebPageEvent {
        struct Singleton {
            static let instance = WebPageEvent()
        }
        
        return Singleton.instance
    }
    
    init(){
        events = Array<PageEvent>()
    }
    
    public func addQueue( event:PageEvent) {
        let exist = events?.contains{ $0 === event}
        if (exist != nil) {
            events?.append(event);
        }
    }
    
    public func popQueue( event:PageEvent) {
        events!.remove({$0 === event});
    }
    
    // bubble event action for webview visibility changed
    public func bubbleEvent(wv:UIWebView) {
        for pe in events! {
            let webEvent = callBack.notifyCallbackEvent(pe.type, data: pe.data!);
            bridgeUtil.executeJS(webEvent)
        }
        events?.removeAll()
    }
    
    // 用户状态改变
    public func userStatusChangeEvent() {
        var userId:String = "nil"
        var token:String = "nil"
        if (WebContextItem.getInstance().isLogin) {
            userId = WebContextItem.getInstance().userId!
            token = WebContextItem.getInstance().accessToken!
        }
        let dataItem = PageEventDataItem.UserStatusChangeItem()
        dataItem.UserId = userId
        dataItem.AccessToken = token
        let webEvent = callBack.notifyCallbackEvent(WebEventConsts.USER_STATUS_CHANGE, data:dataItem)
        //MessageUtil.shortToast(webView.getContext(), webEvent);
        bridgeUtil.executeJS(webEvent)
    }
    
    // 通知上一级页面刷新
    public func registRefreshPageEvent( pageType:String, status:Int) {
        let dataItem =  PageEventDataItem.RefreshPageItem()
        dataItem.PageType = pageType
        dataItem.Status = status
        addQueue(PageEvent.init(type: WebEventConsts.REFRESH_PAGE_EVENT, data:dataItem))
    }
    
    //刷新页面
    public func refreshPageEvent(pageType:String, status:Int) {
        let dataItem = PageEventDataItem.RefreshPageItem()
        dataItem.PageType = pageType
        dataItem.Status = status
        let webEvent = callBack.notifyCallbackEvent(WebEventConsts.REFRESH_PAGE_EVENT, data:dataItem);
        bridgeUtil.executeJS(webEvent)
    }
    
    // 发送评论后
    public func sendCommentEvent( commentType:Int, content:AnyObject,  status:Int) {
        let dataItem =  PageEventDataItem.SendCommentItem()
        dataItem.CommentType = "\(commentType)"
        dataItem.Content = content
        dataItem.Status = status
        let webEvent = callBack.notifyCallbackEvent(WebEventConsts.SEND_COMMENT_EVENT, data:dataItem)
        bridgeUtil.executeJS(webEvent)
    }
    
    // 定位到页面指定位置
    public func sendPositionEvent( positionType:String) {
        let dataItem =  PageEventDataItem.PositionItem()
        dataItem.PositionType = positionType
        let webEvent = callBack.notifyCallbackEvent(WebEventConsts.SEND_POSITION_EVENT, data:dataItem)
        bridgeUtil.executeJS(webEvent)
    }
    
    // 点击喜欢
    public func clickFavoriteEvent( isFav:Bool) {
        let dataItem =  PageEventDataItem.BaseEventItem()
        dataItem.Status = isFav ? 1 : 0
        let webEvent = callBack.notifyCallbackEvent(WebEventConsts.CLICK_FAVORITE_EVENT, data:dataItem)
        bridgeUtil.executeJS(webEvent)
    }
    
    // 微信分享后调用页面显示弹窗
    public func showShareTip() {
        let webEvent = callBack.createCmdParam("showBlackFivePopup")
        bridgeUtil.executeJS(webEvent)
    }
}