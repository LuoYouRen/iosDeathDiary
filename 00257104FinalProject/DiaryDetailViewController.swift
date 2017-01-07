//
//  DiaryDetailViewController.swift
//  00257104FinalProject
//
//  Created by user_08 on 2017/1/7.
//  Copyright © 2017年 00257104. All rights reserved.
//

import UIKit

class DiaryDetailViewController: UIViewController {

    var DiaryInfoDic:[String:String]!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        weightLabel.text = DiaryInfoDic["weight"]!
        heightLabel.text = DiaryInfoDic["height"]!
        interestLabel.text = DiaryInfoDic["interest"]!
        
        self.navigationItem.title = DiaryInfoDic["name"]!
        
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
