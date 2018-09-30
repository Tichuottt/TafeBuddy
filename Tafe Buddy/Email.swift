//
//  Email.swift
//  Tafe Buddy
//
//  Created by Sean Cannon-Cutting on 7/6/17.
//  Copyright © 2017 Sean Cannon-Cutting. All rights reserved.
//
import UIKit

class Email: UIViewController {
    @IBOutlet weak var webView: UIWebView!    
    @IBOutlet weak var loading25: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://outlook.office.com")
        let requestObject = URLRequest(url: url!)
        self.webView.loadRequest(requestObject)
        webView.scrollView.bounces = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        loading25.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        loading25.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        
    }

}
