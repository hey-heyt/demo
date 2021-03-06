//
//  SportHeader.swift
//  YiboGameIos
//
//  Created by yibo-johnson on 2018/1/22.
//  Copyright © 2018年 com.lvwenhan. All rights reserved.
//

import UIKit

class SportHeader: UIView {
    
    var timeUI:UILabel!
    var leagueUI:UILabel!
    var indictor:UIImageView!
    var headerSection = 0
    
    var sportHeaderDelegate:SportHeaderDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.white
        timeUI = UILabel.init(frame: CGRect.init(x: 10, y: (self.bounds.height)/2-10, width: 40, height: 20))
        timeUI.textColor = UIColor.lightGray
        timeUI.font = UIFont.systemFont(ofSize: 14)
        leagueUI = UILabel.init(frame: CGRect.init(x: 60, y: (self.bounds.height)/2-10, width: self.bounds.width - 60-32, height: 20))
        leagueUI.textColor = UIColor.lightGray
        leagueUI.font = UIFont.systemFont(ofSize: 14)
        indictor = UIImageView.init(frame: CGRect.init(x: self.bounds.width - 19.5, y: (self.bounds.height)/2-2, width: 7, height:4))
        let line = UIView.init(frame: CGRect.init(x: 0, y: self.bounds.height-0.5, width: self.bounds.width, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        self.addSubview(timeUI)
        self.addSubview(leagueUI)
        self.addSubview(indictor)
        self.addSubview(line)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(onHeaderClickEvent(_:)))
        self.addGestureRecognizer(tap)
    }
    
    func setupSection(section:Int) -> Void {
        self.headerSection = section
    }
    
    func updateIndictor(expand:Bool) -> Void {
        if expand{
            indictor.image = UIImage.init(named: "arrow_up")
        }else{
            indictor.image = UIImage.init(named: "arrow_down")
        }
    }
    
    @objc func onHeaderClickEvent(_ recongnizer: UIPanGestureRecognizer) {
        if let delegate = self.sportHeaderDelegate{
            delegate.onHeaderClick(section: headerSection)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
