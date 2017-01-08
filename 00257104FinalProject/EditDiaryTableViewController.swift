//
//  WriteDiaryTableViewController.swift
//  00257104FinalProject
//
//  Created by user_08 on 2017/1/8.
//  Copyright © 2017年 00257104. All rights reserved.
//

import UIKit

class EditDiaryTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var DiaryInfoDic:[String:String]!
    var index:Int!
    
    var isImageSelect = true;
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var selectPhotoBut: UIButton!
    @IBOutlet weak var hateSlider: UISlider!
    @IBOutlet weak var hateRateLabel: UILabel!
    @IBOutlet weak var contextTextView: UITextView!
    @IBOutlet weak var datePiker: UIDatePicker!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectPhotoBut.setBackgroundImage(image, for: .normal)
        selectPhotoBut.setTitle("", for: .normal)
        isImageSelect = true;
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    @IBAction func sliderHateRate(_ sender: Any) {
        hateRateLabel.text="\(Int(hateSlider.value*10))%"
    }
    
    @IBAction func done(_ sender: Any) {
        if titleTextField.text!.characters.count  == 0 || contextTextView.text!.characters.count == 0 || contextTextView.text! == "..." {
            
            let controller = UIAlertController(title: "錯誤", message: "有欄位尚未填寫", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            
            
            present(controller, animated: true, completion: nil)
            
            
            return
        }
        if  isImageSelect == false {
            
            let controller = UIAlertController(title: "錯誤", message: "尚未選取照片", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            
            
            present(controller, animated: true, completion: nil)
            
            
            return
        }
        isImageSelect = false
        let image = selectPhotoBut.backgroundImage(for: .normal)
        
        
        let data = UIImagePNGRepresentation(image!)
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(titleTextField.text!).png")
        
        
        try? data?.write(to: url!)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "YYYY-MM-DD"
        
        let dic = ["title":titleTextField.text!,
                   "hateRate":"\(hateSlider.value / 10.0)",
            "date":dateformatter.string(from: datePiker.date),
            "context":contextTextView.text!]
        
        let notiName = Notification.Name("editDiary")
        NotificationCenter.default.post(name: notiName, object: index, userInfo: dic)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hateSlider.minimumValue = 0.0
        hateSlider.maximumValue = 10.0
        
        let numberFormatter = NumberFormatter()
        
        hateSlider.value = (DiaryInfoDic["hateRate"]! as NSString).floatValue * 10
        
        hateRateLabel.text="\(Int(hateSlider.value*10))%"
        
        titleTextField.text = DiaryInfoDic["title"]!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        datePiker.setDate(dateFormatter.date(from: DiaryInfoDic["date"]!)!, animated: true)
        
        contextTextView.text = DiaryInfoDic["context"]!
        
        //get image
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(DiaryInfoDic["title"]!).png")
        selectPhotoBut.setBackgroundImage(UIImage(contentsOfFile: url!.path), for: .normal)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
     }
     */
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
