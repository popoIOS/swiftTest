//
//  RequestManger.swift
//  swiftTest
//
//  Created by jiayx on 2017/7/25.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit


class RequestManger: NSObject {

    
    let awake:Int = 1;
    
    
     class func get(url:String,paramarg:Dictionary<String, String>,progress:Bool,success:@escaping (_ issuccess:Bool , _ dicinfo:Any)->Void,error:(_ error : Error) ->Void){
        
    
        let manger = AFHTTPSessionManager()
        manger.responseSerializer = AFJSONResponseSerializer()
        manger.requestSerializer = AFJSONRequestSerializer()

        SVProgressHUD.show(withStatus: "正在加载")
        
        manger.post(url, parameters: paramarg, progress: nil, success: { (responsed : URLSessionTask, data:Any) in
            
            SVProgressHUD.dismiss();
            
            let dic : Dictionary<String,Any>  = data as! Dictionary<String, Any>;
            
            if let dicinfo : Any = dic["value"]{
               success(true , dicinfo)
            }

        }) { (data:URLSessionDataTask? ,error:Error) in
            
            print(error);
        }
        
        
    }

}
