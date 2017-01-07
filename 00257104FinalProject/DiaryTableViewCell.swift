//
//  DiaryTableViewCell.swift
//  00257104FinalProject
//
//  Created by user_08 on 2017/1/7.
//  Copyright © 2017年 00257104. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var hateProgressView: UIProgressView!
    @IBOutlet weak var hateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
