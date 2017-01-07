//
//  DiaryTableViewController.swift
//  00257104FinalProject
//
//  Created by user_08 on 2017/1/7.
//  Copyright © 2017年 00257104. All rights reserved.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var isAddDiary = false
    
    var Diaries = [[String:String]]()
    
    func updateFile() {
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("Diaries.txt")
        print("url \(url)")
        let result = (Diaries as NSArray).write(to: url!, atomically: true)
        print("result \(result)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isAddDiary {
            isAddDiary = false
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func addDiaryNoti(noti:Notification) {
        let dic = noti.userInfo as! [String:String]
        Diaries.insert(dic , at: 0)
        updateFile()
        
        isAddDiary = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("Diaries.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            Diaries = array as! [[String:String]]
        }
        
        
        let notiName = Notification.Name("addDiary")
        NotificationCenter.default.addObserver(self, selector: #selector(DiaryTableViewController.addDiaryNoti(noti:)), name: notiName, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Diaries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryTableViewCell
        let dic = Diaries[indexPath.row]
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(dic["title"]!).png")
        // Configure the cell...

        cell.photoImageView.image = UIImage(contentsOfFile: url!.path)
        
        cell.titleLabel.text = dic["title"]
        cell.hateLabel.text = "厭世指數："
        cell.dateLabel.text = "日期: \(dic["date"])"
        cell.hateProgressView.progressTintColor = UIColor.red
        cell.hateProgressView.progress = (dic["hateRare"]! as NSString).floatValue
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Diaries.remove(at: indexPath.row)
            updateFile()
            
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)

        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let dic:[String:String]
            dic = Diaries[indexPath!.row]
            
            
            let controller = segue.destination as! DiaryDetailViewController
            controller.DiaryInfoDic = dic
        }
    
    }

}
