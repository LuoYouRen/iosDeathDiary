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
    

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var contextTextView: UITextView!
    @IBOutlet weak var hatePrograssView: UIProgressView!
    @IBOutlet weak var hateRateLabel: UILabel!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "厭世標題"
        datePicker.backgroundColor = UIColor.darkGray
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        //datePicker.setDate(dateFormatter.date(from: DiaryInfoDic["Date"]!)!, animated: true)
        datePicker.setDate(dateFormatter.date(from: "2017-01-08")!, animated: false)
        
        contextTextView.text = "人生好難"//DiaryInfoDic["context"]!
        
        let hateRate:Float = 0.5//(DiaryInfoDic["hateRate"]! as NSString).floatValue
        hatePrograssView.progress = hateRate
        
        hateRateLabel.text = "\(Int(hateRate*100))%"
        print(hateRateLabel.text)
        /*
        //get image
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(DiaryInfoDic["title"]!).png")
        
        photoImageView.image = UIImage(contentsOfFile: url!.path)
        */
        // Do any additional setup after loading the view.
        
       // self.navigationItem.title = DiaryInfoDic["name"]!
        
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
