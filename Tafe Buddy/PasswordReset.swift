//
//  PasswordReset.swift
//  Tafe Buddy
//
//  Created by Ti Chuot on 10/4/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class PasswordReset: UIViewController {
  
    @IBOutlet var webView:UIWebView!
    //Set Delegate for UIWebView, the Activity Indicator will start animating when web is loading
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://otp.tafesa.edu.au/default.aspx")
        let requestObject = URLRequest(url: url!)
        self.webView.loadRequest(requestObject)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        loadingIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        loadingIndicator.stopAnimating()
    }
}
