//
//  GuildeViewController.swift
//  swiftTest
//
//  Created by jiayx on 2017/8/2.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit

class GuildeViewController: UIViewController {

    
    
    @IBOutlet weak var skip: UIButton!
    var  total : Int = 3
    var timer : DispatchSourceTimer? = nil;
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTimer()
        self.setAntimation();
    }

     //MARK: 设置定时器
   fileprivate  func setTimer() {
        timer =  DispatchSource.makeTimerSource(flags: [], queue:DispatchQueue.main)
        timer?.scheduleRepeating(deadline: .now(), interval: .seconds(1), leeway: .milliseconds(self.total))
        timer?.setEventHandler {
            DispatchQueue.main.async(execute: {
                self.total -= 1
                self.skip.titleLabel?.text = "  \(self.total) 跳过  "
                self.skip.setTitle("  \(self.total) 跳过  ", for: .normal)
                if self.total == -1 {
                    self.timer?.cancel();
                    self.goToHome()
                }
            })
        }
        timer?.activate()
    }
    
    //MARK: 设置动画
    
    fileprivate func setAntimation() {
        
        let berpath = UIBezierPath.init(rect: skip.bounds)
        let  shap = CAShapeLayer()
        shap.path = berpath.cgPath;
        shap.lineWidth = 2;
        shap.strokeColor = UIColor.red.cgColor
        shap.fillColor = UIColor.orange.cgColor
        let an = CABasicAnimation.init(keyPath: "strokeStart")
        an.duration = CFTimeInterval(self.total)
        an.fromValue = 1
        an.toValue = 0
        an.fillMode = kCAFillModeForwards
        shap.add(an, forKey: nil)
        skip.layer.addSublayer(shap)
    }
    
    //MARK: 设置rootviewController
    
    @IBAction func skipAction(_ sender: Any) {
        self.timer?.cancel();
        self.goToHome();
        
    }
    fileprivate func goToHome()  {

        UserDefaults.standard.set("1", forKey: "first")
        
        let vc : TabbarViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBar") as! TabbarViewController
        
        UIView.transition(from: self.view, to: vc.view, duration: 1, options: .transitionFlipFromLeft, completion: { (isFinsh : Bool) in
            
            UIApplication.shared.keyWindow?.rootViewController = vc
        })
    }
    
    deinit {
        print("AAAAAAAAAAAAAAAA")
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
