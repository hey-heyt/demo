//
//  MainNavController.swift
//  YiboGameIos
//
//  Created by yibo-johnson on 2017/11/21.
//  Copyright © 2017年 com.lvwenhan. All rights reserved.
//

import UIKit

class MainNavController: UINavigationController {


    // 重写自定义的UINavigationController中的push方法
    // 处理tabbar的显示隐藏
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count == 1{
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
