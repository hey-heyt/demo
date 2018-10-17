//
//  GuideViewController.swift
//  YiboGameIos
//
//  Created by yibo-johnson on 2017/12/13.
//  Copyright © 2017年 com.lvwenhan. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    fileprivate var scrollView: UIScrollView!
    fileprivate let numOfPages = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let frame = self.view.bounds
        scrollView = UIScrollView(frame: frame)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.contentOffset = CGPoint.zero
        // 将 scrollView 的 contentSize 设为屏幕宽度的3倍(根据实际情况改变)
        scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numOfPages), height: frame.size.height)
        scrollView.delegate = self
        
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.isHidden = true
        pageControl.numberOfPages = numOfPages
        
        for index  in 0..<numOfPages {
            let imageView = UIImageView(image: UIImage(named: "welcome_\(index)"))
            imageView.frame = CGRect(x: frame.size.width * CGFloat(index), y: 0, width: frame.size.width, height: frame.size.height)
            scrollView.addSubview(imageView)
        }
        
        self.view.insertSubview(scrollView, at: 0)
        // 给开始按钮设置圆角
        // 隐藏开始按钮
        startButton.alpha = 0.0
        startButton.addTarget(self,action:#selector(gotoMain),for:.touchUpInside)
    }

    func gotoMain() -> Void {
        UserDefaults.standard.setValue(true, forKey: "showedPicture")
        goMainScreen(controller: self)
    }

    // 隐藏状态栏
    override var prefersStatusBarHidden : Bool {
        return true
    }
}

// MARK: - UIScrollViewDelegate
extension GuideViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / view.bounds.width)
        // 因为currentPage是从0开始，所以numOfPages减1
        if pageControl.currentPage == numOfPages-1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.startButton.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.startButton.alpha = 0.0
            })
        }
    }
}
