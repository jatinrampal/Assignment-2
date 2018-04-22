//
//  TableViewController.swift
//  Assignment-1
//
//  Created by Xcode User on 2018-04-21.
//  Copyright © 2018 Jatin Rampal. All rights reserved.
//

import UIKit
import SQLite3

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var db: OpaquePointer?
    var userData=[User]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewTableViewCell
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let user: User
        user = userData[indexPath.row]
        
        //displaying values
        cell.fName.text = user.name
        cell.email.text = user.email
        
        if(userData[indexPath.row].avatar == 1){
            cell.myImage.image = UIImage(named: "facebook.png")
        }
        if(userData[indexPath.row].avatar == 2){
            cell.myImage.image = UIImage(named: "580b57fcd9996e24bc43c53e.png")
        }
        if(userData[indexPath.row].avatar == 3){
            cell.myImage.image = UIImage(named: "reddit.png")
        }
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        query()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func query(){
        let queryStatementString = "SELECT * FROM USERS"
        var queryStatement: OpaquePointer? = nil
        // 1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("UserDB.sqlite")
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // 2
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                // 3
                
            //name address city email phone avatar
                //var id = sqlite3_column_int(queryStatement, 0)
                var queryResultCol1 = sqlite3_column_text(queryStatement, 0)
                var name = String(cString: queryResultCol1!)
                var queryResultCol2 = sqlite3_column_text(queryStatement, 1)
                var address = String(cString: queryResultCol2!)
                var queryResultCol3 = sqlite3_column_text(queryStatement, 2)
                var city = String(cString: queryResultCol3!)
                var queryResultCol4 = sqlite3_column_text(queryStatement, 3)
                var email = String(cString: queryResultCol4!)
                var queryResultCol5 = sqlite3_column_text(queryStatement, 4)
                var phone = String(cString: queryResultCol5!)
                var avatar = sqlite3_column_int(queryStatement, 5)
                userData.append(User(name: name, address: address, city: city, email: email, phone: phone, avatar: Int(avatar)))
                // 5
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        // 6
        sqlite3_finalize(queryStatement)
    }


}
