//
//  ViewController.swift
//  SwipeTest
//
//  Created by AirMyac on 4/3/16.
//  Copyright © 2016 Myac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    let image: String = "top_jacket.jpg"
    
    let label2Array: NSArray = ["2013/8/23/16:04","2013/8/23/16:15","2013/8/23/16:47","2013/8/23/17:10",
                                "2013/8/23/1715:","2013/8/23/17:21","2013/8/23/17:33","2013/8/23/17:41"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label2Array.count
    }
   
    /*
     Cellが選択された際に呼び出される.
     */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
    }
    
    
    /*
     Editableの状態にする.
     */
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
    
    /*
     特定の行のボタン操作を有効にする.
     */
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        print("commitEdittingStyle:\(editingStyle)")
//    }
   
    /*
     Buttonを拡張する.
     */
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // Shareボタン.
        let myShareButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Share") { (action, index) -> Void in
            
            tableView.editing = false
            print("share")
            
        }
        myShareButton.backgroundColor = UIColor.blueColor()
        
        // Archiveボタン.
        let myArchiveButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Archive") { (action, index) -> Void in
            
            tableView.editing = false
            print("archive")
            
        }
        myArchiveButton.backgroundColor = UIColor.grayColor()
        
        // Deleteボタン.
        let myDeleteButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Delete") { (action, index) -> Void in
            
            tableView.editing = false
            print("delete")
            
        }
        myDeleteButton.backgroundColor = UIColor.redColor()

        return [myShareButton, myArchiveButton, myDeleteButton]
    }
    
    /*
     Move可能な状態にする.
     */
    func tableView(tableView: UITableView, canMoveRowIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        let img = UIImage(named:"\(image)")
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "No.\(indexPath.row + 1)"
        
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

