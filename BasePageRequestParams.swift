//
//  BasePageRequestParams.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class BasePageRequestParams {
    var pageId:String?
    var pageType:String?    // 刷新的页面类型
    var title:String?
    var msgFlag:String? //是否显示消息
    var refreshFlag:String = "" //表示是否需要刷新
    var pullFlag:String = "" //下拉刷新时，是否刷新当前页
    var shareFlag:String = ""//是否显示分享
    var shareTitle:String?
    var shareContent:String?
    var shareUrl:String?
    var sharePicUrl:String?
    var showWeiboFlag:String? //是否显示新浪微博分享
    var ShowAnim:String?    //
    var topicId:String? //专题ID
    
    public func needRefresh() ->Bool {
        return refreshFlag == "1"
    }
    
    public func refreshCurrentFlag() -> Bool {
        return pullFlag == "1"
    }
}