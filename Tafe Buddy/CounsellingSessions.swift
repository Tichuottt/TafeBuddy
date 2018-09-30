//
//  CounsellingSessions.swift
//  Tafe Buddy
//
//  Created by Hai LIN & Jakia on 29/5/17.
//

import UIKit

class CounsellingSessions: UIViewController {
    @IBOutlet weak var webView: UIWebView!    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://www.tafesa.edu.au/services/counselling")
        let requestObject = URLRequest(url: url!)
        self.webView.loadRequest(requestObject)
        webView.scrollView.bounces = false
        //self.navigationController?.navigationBar.isTranslucent = false
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
