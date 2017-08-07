//
//  HomeViewController.swift
//  swiftTest
//
//  Created by jiayx on 2017/7/25.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var page = 1;
    var veriCode : String = "";
    var arraryDaya : Array<Dictionary<String,String>> = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTabUI()
        self.getListFromNet(isRefre: true)
        self.getVersyCode()

    }

    func setTabUI() {
        self.table.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        self.table.mj_header = MJRefreshStateHeader.init(refreshingBlock: {
            self.getListFromNet(isRefre: true)
            self.table.mj_header.endRefreshing()
        })
        self.table.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.getListFromNet(isRefre: false)
            self.table.mj_footer.endRefreshing()
        })
        
    }
    
    // MARK:  ----tableviewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arraryDaya.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        let dic:Dictionary<String,String> = self.arraryDaya[indexPath.row];
        if let cella : HomeTableViewCell = cell as? HomeTableViewCell {
            cella.setCell(dic: dic)
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
        let dic:Dictionary<String,String> = self.arraryDaya[indexPath.row];
        let  web = WebViewController()
        web.hidesBottomBarWhenPushed = true;
        web.dic = ["title":dic["newsType"]!,"url":dic["url"]!]
        self.navigationController?.pushViewController(web, animated: true)
        
    }
    
    // MARK:  ----获取网络请求
    
    func getListFromNet(isRefre:Bool) {

        page = isRefre == true ? 1 : page+1
        let para = ["rows":"10","page":"\(page)"]
        
        RequestManger.get(url: "http://www.yanketong.com:90/api/Hospital/GetNews", paramarg: para, progress: false, success: { (succ : Bool, dicinfo : Any) in
            
            print(dicinfo);
            if let dicrow : Dictionary<String,Any> = dicinfo as? Dictionary<String,Any>{
                if let arr : Array<Dictionary<String,String>> = dicrow["rows"] as? Array<Dictionary<String,String>> {
                    if isRefre {
                        self.arraryDaya = arr;
                    }else{
                        if arr.count < 10{
                            self.page += 1
                            self.table.mj_footer.state = .noMoreData;
                            return;
                        }else{
                            self.arraryDaya = self.arraryDaya + arr;
                        }
                    }
                    self.table.reloadData();
                }
            }
        }) { (error : Error?) in
            
        }
    }
    
    
    func getVersyCode()  {
        
        let para = ["loginId":"15980859163","password":"111111"]
        RequestManger.get(url: "http://www.yanketong.com:90/api/Patient/PatientLogin", paramarg: para, progress: false, success: { (succ : Bool, dicinfo : Any) -> Void in
            print(dicinfo);
            if let dicAA:Dictionary<String,Any> = dicinfo as? Dictionary<String,Any> {
                
                self.veriCode = dicAA["verifyCode"]! as! String;
                
//                self.getListFromNet()
                
            }else{
                print("BBBBBBBB")
                
            }
        }) { (error : Error?) -> Void in
            
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
