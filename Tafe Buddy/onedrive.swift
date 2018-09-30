//
//  onedrive.swift
//  Tafe Buddy
//
//  Created by Sergio TIMPANO (001018133), Adam Seery and Michal STAWIARZ (000927949) on 14/6/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import Foundation
import UIKit

class onedrive: UIViewController {
@IBOutlet weak var webView: UIWebView!
@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!


override func viewDidLoad() {
    super.viewDidLoad()
    let url  = URL(string:"https://tafesaedu-my.sharepoint.com")
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
