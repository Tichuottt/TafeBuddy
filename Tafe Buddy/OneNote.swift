//
// oneNote.swift
//
// Created by Jonty Svanborg 2/6/2017

import UIKit

class OneNote: UIViewController
{
    @IBOutlet weak var loading2: UIActivityIndicatorView!
    @IBOutlet weak var timeTableWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://www.onenote.com/notebooks")
        let requestObject = URLRequest(url: url!)
        self.timeTableWebView.loadRequest(requestObject)
        timeTableWebView.scrollView.bounces = false
        //self.navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.barTintColor = UIColor.red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        loading2.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        loading2.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        
    }
}
