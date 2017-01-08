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
    var index:Int!

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var contextTextView: UITextView!
    @IBOutlet weak var hatePrograssView: UIProgressView!
    @IBOutlet weak var hateRateLabel: UILabel!

    
    func editDiaryNoti(noti:Notification) {
        let dic = noti.userInfo as! [String:String]
        DiaryInfoDic = dic
        
        self.navigationItem.title = DiaryInfoDic["title"]!
        datePicker.backgroundColor = UIColor.darkGray
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        datePicker.setDate(dateFormatter.date(from: DiaryInfoDic["date"]!)!, animated: true)
        //datePicker.setDate(dateFormatter.date(from: "2017-01-08")!, animated: false)
        
        contextTextView.text = DiaryInfoDic["context"]!
        
        let hateRate:Float = (DiaryInfoDic["hateRate"]! as NSString).floatValue
        hatePrograssView.progress = hateRate
        
        hateRateLabel.text = "\(Int(hateRate*100))%"
        //print(hateRateLabel.text)
        
        //get image
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(DiaryInfoDic["title"]!).png")
        
        photoImageView.image = UIImage(contentsOfFile: url!.path)
        
        let notiName = Notification.Name("editDiaryTable")
        NotificationCenter.default.post(name: notiName, object: index, userInfo: dic)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = DiaryInfoDic["title"]!
        datePicker.backgroundColor = UIColor.darkGray
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        datePicker.setDate(dateFormatter.date(from: DiaryInfoDic["date"]!)!, animated: true)
        //datePicker.setDate(dateFormatter.date(from: "2017-01-08")!, animated: false)
        
        contextTextView.text = DiaryInfoDic["context"]!
        
        let hateRate:Float = (DiaryInfoDic["hateRate"]! as NSString).floatValue
        hatePrograssView.progress = hateRate
        
        hateRateLabel.text = "\(Int(hateRate*100))%"
        //print(hateRateLabel.text)
        
        //get image
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(DiaryInfoDic["title"]!).png")
        
        photoImageView.image = UIImage(contentsOfFile: url!.path)
        
        // Do any additional setup after loading the view.
        
        let editNoti = Notification.Name("editDiary")
        NotificationCenter.default.addObserver(self, selector: #selector(DiaryTableViewController.editDiaryNoti(noti:)), name: editNoti, object: nil)
       // self.navigationItem.title = DiaryInfoDic["name"]!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "edit" {
            let controller = segue.destination as! EditDiaryTableViewController
            controller.DiaryInfoDic = self.DiaryInfoDic
            controller.index = self.index
        }
        
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
