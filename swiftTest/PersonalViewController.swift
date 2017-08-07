//
//  PersonalViewController.swift
//  swiftTest
//
//  Created by jiayx on 2017/7/25.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit

let wid = UIScreen.main.bounds.size.width


class PersonalViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var viewH: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1;
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        return cell
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset : CGFloat = scrollView.contentOffset.y  ;
        if (yOffset < 0) {
            if (yOffset > -700 && yOffset < 0) {
                let totalOffset : CGFloat = 300 + abs(yOffset);
                let f = totalOffset / 300;
                self.imgH.frame = CGRect.init(x: -(wid * f - wid) / 2, y: yOffset, width: wid * f, height: totalOffset)
            }
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
