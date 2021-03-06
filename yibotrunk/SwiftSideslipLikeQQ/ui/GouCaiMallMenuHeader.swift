//
//  GouCaiMallMenuHeader.swift
//  YiboGameIos
//
//  Created by yibo-johnson on 2018/3/26.
//  Copyright © 2018年 com.lvwenhan. All rights reserved.
//

import UIKit

protocol GoucaiBarDelegate {
    func onMenuItemClick(itemTag:Int)
}

class GouCaiMallMenuHeader: UIView {
    
    var menuType:MenuType!
    var menuBarDelegate:SportMenuBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        stepSubViews()
    }
    
    func stepSubViews() -> Void {
        let items = ["滚球","今日赛事","早盘"]
        for index in 0...items.count-1{
            let s = CGFloat(index)
            let item = MenuItem.init(frame: CGRect.init(x: s*(kScreenWidth/CGFloat(items.count)), y: 0, width: kScreenWidth/CGFloat(items.count), height: self.bounds.height))
            item.tag = index
            item.itemTag = String.init(format: "%d%d", MenuType.CAIPIAO_RECORD,index)
            item.menuText.text = items[index]
            item.showIndector(show: false)
            item.bindCustomSelector(target: self,selector: #selector(onMenuItemClick(reg:)))
            self.addSubview(item)
        }
    }
    
    func updateTabs(arr:[String]) -> Void {
        if arr.count != self.subviews.count{
            fatalError("tab array count is not equal to tab view count")
        }
        for index in 0...arr.count-1{
            let menu = self.subviews[index] as! MenuItem
            menu.menuText.text = arr[index]
        }
    }
    
    func onMenuItemClick(reg:UIPanGestureRecognizer) -> Void {
        if let view = reg.view{
            if let delegate = menuBarDelegate{
                delegate.onMenuItemClick(itemTag: view.tag)
            }
        }
    }
    
    
}

