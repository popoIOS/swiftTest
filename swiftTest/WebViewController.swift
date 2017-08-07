//
//  WebViewController.swift
//  swiftTest
//
//  Created by jiayx on 2017/7/25.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {

    
    var dic : Dictionary<String,String> = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = dic["title"]!

        let wk = WKWebView.init(frame: self.view.bounds)
        self.view .addSubview(wk)
        wk.navigationDelegate = self
        wk.load(URLRequest.init(url: URL.init(string: self.dic["url"]!)!))
    
    
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
    }
 
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SVProgressHUD.show(withStatus: "正在记载")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        SVProgressHUD.dismiss()
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
