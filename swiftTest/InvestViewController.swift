//
//  InvestViewController.swift
//  swiftTest
//
//  Created by jiayx on 2017/7/25.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit

fileprivate let width = UIScreen.main.bounds.size.width

class InvestViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var signle: UIView!
    @IBOutlet weak var scrolBig: UIScrollView!
    @IBOutlet weak var invest_curr: UIButton!
    @IBOutlet weak var invest_reguar: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK:----左右按钮
    @IBAction func investAction(_ sender: UIButton) {
        
        let tag = sender.tag;
        var point = self.signle.frame.origin;
        if tag == 101 {
           //活期
            point.x = sender.frame.origin.x + sender.frame.size.width + 30 - self.signle.frame.size.width;
            self.scrolBig.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
        }else{
           //定期
            point.x = sender.frame.origin.x - 30;
            self.scrolBig.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.size.width, y: 0), animated: true)
        }
        UIView.animate(withDuration: 0.3) { 
           self.signle.frame.origin = point;
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let point = invest_reguar.frame.origin.x-30 - (invest_curr.frame.origin.x + invest_curr.frame.size.width + 30 - signle.frame.size.width)
        //0  227
        
        let progress = scrollView.contentOffset.x/width;
        print(point)
        var pointtt = self.signle.frame.origin;
        pointtt.x = point * progress + self.signle.frame.size.width - 30;
        UIView.animate(withDuration: 0.3) {
            self.signle.frame.origin = pointtt
        }
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
