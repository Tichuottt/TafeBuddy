//
//  CourseInfo.swift
//  Tafe Buddy
//
//  Created by Trung Le on 14/06/2017.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class CourseInfo: UIViewController {
    
    @IBOutlet var webView:UIWebView!
    //Set Delegate for UIWebView, the Activity Indicator will start animating when web is loading
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://www.tafesa.edu.au/courses")
        let requestObject = URLRequest(url: url!)
        self.webView.loadRequest(requestObject)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        loadingIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        loadingIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        
    }
    
}

/*
 //
 //  StudentInfo.swift
 //  Study Plan v2
 //
 //  Created by Ti Chuot on 23/2/17.
 //  Edited byt Trung Le & Raymond on 7/6/2017
 //  Copyright © 2017 Ti Chuot. All rights reserved.
 //
 
 import UIKit
 
 class CourseInfo: UIViewController {
 
 @IBOutlet weak var websiteView: UIWebView!
 //Set Delegate for UIWebView, the Activity Indicator will start animating when web is loading
 @IBOutlet weak var loadingIndicatorCou: UIActivityIndicatorView!
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 //Change the back button color
 //        self.navigationController?.navigationBar.tintColor = UIColor.white
 
 //CHange navigation item Title color
 // self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
 
 let url  = URL(string:"https://www.tafesa.edu.au/courses")
 let requestObject = URLRequest(url: url!)
 self.websiteView.loadRequest(requestObject)
 
 }
 
 override func viewDidAppear(_ animated: Bool) {
 super.viewDidAppear(animated)
 self.navigationController?.hidesBarsOnSwipe = true
 }
 
 func webViewDidStartLoad(_ webView: UIWebView){
 loadingIndicatorCou.startAnimating()
 }
 
 func webViewDidFinishLoad(_ webView: UIWebView){
 loadingIndicatorCou.stopAnimating()
 }
 
 func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
 
 }
 
 }

 
 */
