//
//  MyAccount.swift
//  Tafe Buddy
//
//  Created by Michal STAWIARZ (000927949) on 1/6/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class MyAccount: UIViewController {

    @IBOutlet weak var accountWebView: UIWebView!
    @IBOutlet weak var accountIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://my.tafesa.edu.au/PROD/bwsksphs.P_ViewStatement")
        let requestObject = URLRequest(url: url!)
        self.accountWebView.loadRequest(requestObject)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        accountIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        accountIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        
    }
}
