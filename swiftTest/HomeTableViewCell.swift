//
//  HomeTableViewCell.swift
//  swiftTest
//
//  Created by jiayx on 2017/7/25.
//  Copyright © 2017年 jiayx. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageForHeader: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageForHeader.backgroundColor = UIColor.red;
        // Initialization code
    }

    
    
    func setCell(dic:Dictionary<String,String>) {
        
        self.lbl.text = dic["newsTitle"];
        var str : String  = dic["picFileName"]!;
        str = str.replacingOccurrences(of: "\\", with: "/")
        self.imageForHeader.sd_setImage(with: URL.init(string: str));
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
