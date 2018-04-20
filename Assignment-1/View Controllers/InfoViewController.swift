//
//  InfoViewController.swift
//  Assignment-1
//
//  Created by Jatin Rampal on 2018-02-26.
//  Copyright © 2018 Jatin Rampal. All rights reserved.
//

import UIKit
import SQLite3

class InfoViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var i:String = String(0);
    
    var db: OpaquePointer?
    
    
    @IBAction func ageSlidr(_ sender: UISlider) {
        ageLabel.text = String(Int(sender.value))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("UserDB.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK
        {
            print("Error Opening Database")
            return
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Users ( Name TEXT, Address TEXT, CITY TEXT, EMAIL TEXT, PHONE TEXT, AVATAR INT)"
        
        if(sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK)
        {
            print("Error Creating Table")
            return
        }
        print("Everything is fine")
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func avatarSelect(_ sender : Any){
        print("Selecting Avatar....")
        switch (sender as AnyObject).tag
        {
        case 1: i=String(1);
        case 2: i=String(2);
        case 3: i=String(3);
        default: i=String(0);
        }
        print("Avatar Value:" + i)
    }
    
    @IBAction func saveInfo(_ sender : Any)
    {
        /*
         let alert = UIAlertController(title: "Alert", message: "Information Saved \n Thank You " + tfName.text! + " of " + tfEmail.text! + " for your time!" , preferredStyle: .alert)
         
         let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
         alert.addAction(okAction)
         present(alert, animated: true) */
        
        let name = tfName.text
        let address = tfAddress.text
        let city = tfCity.text
        let email = tfEmail.text
        let phone = tfPhone.text
        
        if(name?.isEmpty)!{
            print("Name Error")
            return
        }
        
        var stmt: OpaquePointer?
        
        let insertQuery = "INSERT INTO Users VALUES (?,?,?,?,?,?)"
        
        if (sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK){
            print("Error Bounding Query")
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK{
            print("Error Bounding Name")
        }
        
        if sqlite3_bind_text(stmt, 2, address, -1, nil) != SQLITE_OK{
            print("Error Bounding Address")
        }
        
        if sqlite3_bind_text(stmt, 3, city, -1, nil) != SQLITE_OK{
            print("Error Bounding City")
        }
        
        if sqlite3_bind_text(stmt, 4, email, -1, nil) != SQLITE_OK{
            print("Error Bounding Email")
        }
        
        if sqlite3_bind_text(stmt, 5, phone, -1, nil) != SQLITE_OK{
            print("Error Bounding Phone")
        }
        
        if sqlite3_bind_int(stmt, 6, (i as NSString).intValue) != SQLITE_OK{
            print("Error Bounding Avatar")
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE{
            print("User Saved Successfully")
        }
        //NSLog((NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String )
        
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

