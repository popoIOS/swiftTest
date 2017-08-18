//
//  DiscoverViewController.swift
//  swiftTest
//
//  Created by jiayx on 2017/7/25.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit

fileprivate let width = UIScreen.main.bounds.size.width

class DiscoverViewController: UIViewController {

    let viewBg : UIView = {
        
        let v = UIView.init(frame: CGRect.init(x: width/2-80, y: 400, width: 160, height: 160))
//        v.backgroundColor = UIColor.cyan;
        return v;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.cyan;
        
        self.stoketLineForAntimation()
        self.getAArc()
    }

    
    //MARK: 划线
    
    func stoketLineForAntimation() {
        
        let bezier = UIBezierPath.init()
        bezier.move(to: CGPoint.init(x: Width(), y: 0))
        bezier.addLine(to: CGPoint.init(x: Width(), y: 300))
        bezier.addCurve(to: CGPoint.init(x: Width()/2, y: 300), controlPoint1: CGPoint.init(x: Width(), y:300), controlPoint2: CGPoint.init(x: Width()*3/4, y: 200))
        bezier.addCurve(to: CGPoint.init(x: 0, y: 300), controlPoint1: CGPoint.init(x: Width()/2, y: 300), controlPoint2: CGPoint.init(x: Width()/4, y: 400))
        bezier.addLine(to: CGPoint.init(x: 0, y: 0))
        
        let shap = CAShapeLayer();
        shap.path = bezier.cgPath;
        shap.strokeColor = UIColor.red.cgColor;
        shap.fillColor = UIColor.orange.cgColor

        self.view.layer.addSublayer(shap)

    }
    
    
    func getAArc() {
        self.view .addSubview(self.viewBg)
        
        let wid : CGFloat = self.viewBg.bounds.size.height

        let bezierL = UIBezierPath.init(arcCenter: CGPoint.init(x: wid/2, y: wid/2), radius: wid/2, startAngle: CGFloat(Double.pi*3/2), endAngle: CGFloat(Double.pi/2), clockwise: false)
        let shaL = CAShapeLayer()
        shaL.path = bezierL.cgPath
//        shaL.strokeColor = UIColor.clear.cgColor;
        shaL.fillColor = UIColor.white.cgColor
        self.viewBg.layer.addSublayer(shaL)
        
        
        let bezierR = UIBezierPath.init(arcCenter: CGPoint.init(x: wid/2, y: wid/2), radius: wid/2, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi*3/2), clockwise: false)
        let shaR = CAShapeLayer()
        shaR.path = bezierR.cgPath
//        shaR.strokeColor = UIColor.clear.cgColor;
        shaR.fillColor = UIColor.black.cgColor
        self.viewBg.layer.addSublayer(shaR)
        
        
        let bezierSS = UIBezierPath.init(arcCenter: CGPoint.init(x: wid/2, y: wid/4), radius: wid/4, startAngle: CGFloat(Double.pi*3/2), endAngle: CGFloat(Double.pi/2), clockwise: false)
        let shapSS = CAShapeLayer()
        shapSS.path = bezierSS.cgPath
//        shapSS.strokeColor = UIColor.black.cgColor;
        shapSS.fillColor = UIColor.black.cgColor
        self.viewBg.layer.addSublayer(shapSS)
        
        let bezierSX = UIBezierPath.init(arcCenter: CGPoint.init(x: wid/2, y: wid*3/4), radius: wid/4, startAngle: CGFloat(Double.pi*3/2), endAngle: CGFloat(Double.pi/2), clockwise: true)
        let shapSX = CAShapeLayer()
        shapSX.path = bezierSX.cgPath
//        shapSX.strokeColor = UIColor.white.cgColor;
        shapSX.fillColor = UIColor.white.cgColor
        self.viewBg.layer.addSublayer(shapSX)
        
        
        let bezierW = UIBezierPath.init(roundedRect: CGRect.init(x: wid/2-15, y: wid/4-15, width: 30, height: 30), cornerRadius: 15)
        let shapW = CAShapeLayer()
        shapW.path = bezierW.cgPath
//        shapW.strokeColor = UIColor.clear.cgColor;
        shapW.fillColor = UIColor.white.cgColor
        self.viewBg.layer.addSublayer(shapW)
        
        let bezierB = UIBezierPath.init(roundedRect: CGRect.init(x: wid/2-15, y: wid*3/4-15, width: 30, height: 30), cornerRadius: 15)
        let shapB = CAShapeLayer()
        shapB.path = bezierB.cgPath
//        shapB.strokeColor = UIColor.clear.cgColor;
        shapB.fillColor = UIColor.black.cgColor
        self.viewBg.layer.addSublayer(shapB)
        
        let animation = CABasicAnimation.init(keyPath: "transform.rotation")
        animation.toValue = Double.pi*2;
        animation.duration = 5;
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        self.viewBg.layer.add(animation, forKey: "")
        
    }
    
    
   fileprivate func Width() -> CGFloat{
        return UIScreen.main.bounds.size.width;
    }
    
    fileprivate func Height()  -> CGFloat {
        return UIScreen.main.bounds.size.height;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabl")
        
        self.navigationController?.pushViewController(vc, animated: true)
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
