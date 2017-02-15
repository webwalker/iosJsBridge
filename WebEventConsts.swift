//
//  WebEventConsts.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class WebEventConsts {
    static let REFRESH_PAGE_EVENT:Int = 1001;//页面刷新
    static let CLICK_FAVORITE_EVENT:Int = 1002;//点击我喜欢
    static let SEND_COMMENT_EVENT:Int = 1003;//评论完成
    static let USER_STATUS_CHANGE:Int = 1004;//登录状态改变
    static let SEND_POSITION_EVENT:Int = 1005;//页面位置定位
    static let CALL_PAGE_SHARE_EVENT:Int = 1102;
    
    // get event name
    public static func getEventName(type:Int) ->String {
        switch (type) {
        case REFRESH_PAGE_EVENT:
            return "refreshPageEvent"
        case CLICK_FAVORITE_EVENT:
            return "clickFavoriteEvent"
        case SEND_COMMENT_EVENT:
            return "sendCommentEvent"
        case USER_STATUS_CHANGE:
            return "userStatusChange"
        case SEND_POSITION_EVENT:
            return "sendPositionEvent"
        default:break
        }
        return ""
    }
}