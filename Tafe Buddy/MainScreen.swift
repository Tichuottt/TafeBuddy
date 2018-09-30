//
//  ViewController.swift
//  Study Plan v2
//
//  Created by Ti Chuot on 22/2/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit
import AVFoundation //import this to play sound


class ViewController: UIViewController {
    
    @IBOutlet weak var menuBtnOL: UIBarButtonItem!
    @IBOutlet weak var countsellingSessions: UIButton!
    @IBOutlet weak var courseInfoBtn: UIButton!
    @IBOutlet weak var buttonViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var oneNoteBtn: UIButton!
    @IBOutlet weak var tasksBtn: UIButton!
    @IBOutlet weak var moodlebtn: UIButton!
    @IBOutlet weak var sView: UIView!
    @IBOutlet weak var oneDrivebtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var x = 2
    //Secret: W>W>N>S>N>E>Menu , 5 taps reset
    
//  let signOut = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Wave", ofType: "wav")!), fileTypeHint: nil)
    var menuShowing = false
    var alertController : UIAlertController?
 
    //signOutBtn{
     /*   //add alert
        alertController = UIAlertController(title: "Sign out", message: nil, preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default) { (action) in
           /* let SignInCV = SignIn()
            self.navigationController?.pushViewController(SignInCV, animated: true)*/
            
            //Set Storyboard Segue with name in the Identifier, then call it here to run
            self.performSegue(withIdentifier: "SignOutSegue", sender: nil)
            //Play sound
            self.signOut.play()
            self.signOut.volume = 0.2
        }
        let Cancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
        }
        alertController?.addAction(OK)
        alertController?.addAction(Cancel)
        self.present(alertController!, animated: true, completion: nil )
        //end alert*/
    
    
    @IBAction func menuBtn(_ sender: Any) {
        if(menuShowing){
           self.menuOut()
        }else{
            self.menuIn()
        }
        menuShowing = !menuShowing
        
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //add gester recognizer
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
       
        //Align button text at center
        self.countsellingSessions.titleLabel?.textAlignment = NSTextAlignment.center
       
        //RGB code 189, 20, 39
        //Change navigation bar color using RGB
        //UINavigationBar.appearance().barTintColor = UIColor(red: 0/189, green: 0/20, blue: 0/39, alpha: 1.0)
        
        //Shadow for the menu
        menuView.layer.shadowOpacity = 2
        menuView.layer.shadowRadius = 6
       
        //Hide the menubar when view loaded
        leadingConstraint.constant = -300
        
        //Swiping 4 direction
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
       
        //Transparent navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        //UIApplication.shared.keyWindow!.bringSubview(toFront: menuView)
        view.bringSubview(toFront: menuView)
        
        //Detect double tap gesture on view (1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 5
        view.addGestureRecognizer(tap)

    }
    
    //Detect double tap gesture on view (2)
    @objc func doubleTapped() {
        // do something here
        x = 2
    }
    
    //Swipe gesture recognizer
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                menuIn()
                menuShowing = true
                x = x + 1
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                x = x - 3
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                x = x * 5
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                x = x + 7
            default:
                break
            }
        }
    }
    
    
    //Dismiss menu by tapping anywhere
    @objc func handleDismiss(){
        leadingConstraint.constant = -300
        buttonViewTrailing.constant = 0
        menuShowing = false
       
        //Animate with velocity
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 6, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func sButton(_ sender: Any) {
        sView.alpha = 0
        x = 2
    }
    
    //Hide menu
    func menuOut(){
        if x == 62{
            sView.alpha = 1
        }
        leadingConstraint.constant = -300
        buttonViewTrailing.constant = 0
       
        //Animate with velocity
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 6, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }  ,completion: nil)
        
    }
    
    //Show menu
    func menuIn(){
        
        leadingConstraint.constant = 0
        buttonViewTrailing.constant = 375
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 6, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        //Animation Button
        courseInfoBtn.frame = CGRect(x:-90,y: 150, width:courseInfoBtn.frame.width,height: courseInfoBtn.frame.height)
        UIView.animate(withDuration: 0.2 , delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowUserInteraction , animations:
            ({
                self.courseInfoBtn.frame = CGRect(x:8,y: 150, width:self.courseInfoBtn.frame.width,height: self.courseInfoBtn.frame.height)
            }), completion: nil)
        
        videoBtn.frame = CGRect(x:-90,y: 190, width:videoBtn.frame.width,height: videoBtn.frame.height)
        UIView.animate(withDuration: 0.3 , delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowUserInteraction , animations:
            ({
                self.videoBtn.frame = CGRect(x:8,y: 190, width:self.videoBtn.frame.width,height: self.videoBtn.frame.height)
            }), completion: nil)
        
        oneNoteBtn.frame = CGRect(x:-90,y: 235, width:oneNoteBtn.frame.width,height: oneNoteBtn.frame.height)
        UIView.animate(withDuration: 0.4 , delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowUserInteraction , animations:
            ({
                self.oneNoteBtn.frame = CGRect(x:8,y: 235, width:self.oneNoteBtn.frame.width,height: self.oneNoteBtn.frame.height)
            }), completion: nil)
        
        oneDrivebtn.frame = CGRect(x:-90,y: 275, width:oneDrivebtn.frame.width,height: oneDrivebtn.frame.height)
        UIView.animate(withDuration: 0.5 , delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowUserInteraction , animations:
            ({
                self.oneDrivebtn.frame = CGRect(x:8,y: 275, width:self.oneDrivebtn.frame.width,height: self.oneDrivebtn.frame.height)
            }), completion: nil)
        
        tasksBtn.frame = CGRect(x:-90,y: 315, width:tasksBtn.frame.width,height: tasksBtn.frame.height)
        UIView.animate(withDuration: 0.6 , delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowUserInteraction , animations:
            ({
                self.tasksBtn.frame = CGRect(x:8,y: 315, width:self.tasksBtn.frame.width,height: self.tasksBtn.frame.height)
            }), completion: nil)
        
        moodlebtn.frame = CGRect(x:-90,y: 355, width:moodlebtn.frame.width,height: moodlebtn.frame.height)
        UIView.animate(withDuration: 0.7 , delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowUserInteraction , animations:
            ({
                self.moodlebtn.frame = CGRect(x:8,y: 355, width:self.moodlebtn.frame.width,height: self.moodlebtn.frame.height)
            }), completion: nil)
        //Animation end
    }
}

