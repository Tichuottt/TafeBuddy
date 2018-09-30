//
// oneNote.swift
//
// Created by Jonty Svanborg 5/6/2017

import UIKit

class Tasks: UIViewController
{
    @IBOutlet weak var loadingTasks: UIActivityIndicatorView!
    @IBOutlet weak var timeTableWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://tafesaedu-my.sharepoint.com/_layouts/15/MySite.aspx?MySiteRedirect=AllDocuments")
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
        loadingTasks.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        loadingTasks.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        
    }
}
