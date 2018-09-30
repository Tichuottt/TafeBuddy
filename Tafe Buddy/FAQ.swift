//
//  FAQ.swift
//  Tafe Buddy
//
//  Created by Sergio TIMPANO (001018133), Adam Seery on 31/5/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import Foundation
import UIKit

class FAQ: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://www.tafesa.edu.au/mytafe-sa/help")
        let requestObject = URLRequest(url: url!)
        self.webView.loadRequest(requestObject)
        webView.scrollView.bounces = false
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
