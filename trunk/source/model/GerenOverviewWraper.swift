//
//  GerenOverviewWraper.swift
//  gameplay
//
//  Created by yibo-johnson on 2018/6/21.
//  Copyright © 2018年 yibo. All rights reserved.
//

import UIKit
import HandyJSON

class GerenOverviewWraper: HandyJSON {

    required init(){}
    var success:Bool=false;
    var msg:String="";
    var code:Int = 0;
    var accessToken:String = "";
    var content:GerenOVContent?;
    
}
