//
//  PageEventDataItem.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

public class PageEventDataItem {
    public class BaseEventItem{
        var Status:Int = 0
    }
    
    public class UserStatusChangeItem {
        var  UserId:String?
        var  AccessToken:String?
    }
    
    public class RefreshPageItem : BaseEventItem {
        var PageType:String?
    }
    
    public class SendCommentItem : BaseEventItem {
        var CommentType:String?
        var Content:AnyObject?
    }
    
    public class PositionItem : BaseEventItem {
        var PositionType:String?
    }
}