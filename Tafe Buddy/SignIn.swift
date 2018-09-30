//
//  SignIn.swift
//  Study Plan v2
//
//  Created by Ti Chuot on 23/2/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit
import AVFoundation //import this to play sound

class SignIn: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var alertController : UIAlertController?
    let signIn = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Keyboard", ofType: "wav")!), fileTypeHint: nil)
    
    @IBAction func signInBtn(_ sender: Any) {
        /* if (userName.text == "" || password.text == "" ){
         //add alert
         alertController = UIAlertController(title: "User name or password incorrect", message: "Please check again ", preferredStyle: .alert)
         let alertAction1 = UIAlertAction(title: "OK", style: .default) { (action) in
         }
         alertController?.addAction(alertAction1)
         self.present(alertController!, animated: true, completion: nil )
         //end alert
         }*/
        //tabBarController?.selectedIndex = 1
        //self.performSegue(withIdentifier: "tabBarController", sender: nil)
        
        //Sign in Segue
        self.performSegue(withIdentifier: "SignInSegue", sender: nil)
        signIn.play()
        signIn.volume = 0.4
        
        //Won't stop music when play sound
        let audioSession = AVAudioSession.sharedInstance()
        try!audioSession.setCategory(AVAudioSessionCategoryPlayback, with: AVAudioSessionCategoryOptions.duckOthers) //Causes audio from other sessions to be ducked (reduced in volume) while audio from this session plays
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //(2)Hide keyboard by tapping anywhere
        self.hideKeyboardWhenTappedAround()
        //Hide navigation bar
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //(1)Hide keyboard by tapping anywhere
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignIn.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
