//
//  WebViewController.swift
//  Assignment-1
//
//  Created by Jatin Rampal on 2018-02-26.
//  Copyright © 2018 Jatin Rampal. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet var webView : UIWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let urlAddress = URL(string: "https://jatinrampal.myportfolio.com/resume")
        let url = URLRequest(url: urlAddress!)
        webView?.loadRequest(url as URLRequest)
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
