//
//  Video.swift
//  Tafe Buddy
//
//  Created by Trung Le on 14/06/2017.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class Video: UIViewController {
    
    @IBOutlet var webView:UIWebView!
    //Set Delegate for UIWebView, the Activity Indicator will start animating when web is loading
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://youtu.be/kxt2TBktLno")
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
