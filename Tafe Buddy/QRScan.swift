//
//  ViewController.swift
//  QRReaderDemo
//
//  Created by Simon Ng on 23/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit
import AVFoundation

class QRScan: UIViewController, AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    
    // Define and provide a usage description of all the system’s privacy-sensitive data accessed by your app in Info.plist
    //    Key    :  Privacy - Camera Usage Description
    //    Value  :  $(PRODUCT_NAME) camera use
   
    @IBOutlet weak var messageLabel:UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var libraryBtnOL: UIButton!
    var historyArray = [String]()
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    // Added to support different barcodes
    let supportedBarCodes = [AVMetadataObject.ObjectType.qr, AVMetadataObject.ObjectType.code128, AVMetadataObject.ObjectType.code39, AVMetadataObject.ObjectType.code93, AVMetadataObject.ObjectType.upce, AVMetadataObject.ObjectType.pdf417, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.aztec]

    override func viewDidLoad() {
        super.viewDidLoad()
        //Add right bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: .plain, target: self, action: #selector(showHistory))
        //QR code scan
        qrCodeScaned()
    }
  
    @IBAction func libraryBtn(_ sender: Any) {
        pickImage()
    }
    
    //Pick image from library, add UIImagePickerControllerDelegate & UINavigationControllerDelegate
    var imagePicker = UIImagePickerController()

    func pickImage() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    var image : UIImage?
  
    //Did Finish picking image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
       // imageView.image = image
        self.dismiss(animated: true, completion: { () -> Void in
        })
        scanImage()
    }//end
    
    //Scan QR from image
    func scanImage(){

        let detector:CIDetector=CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])!
        //Scan image using Image View on Story board with Outlet
        //let ciImage:CIImage=CIImage(image:imageView.image!)!
        
        //Scan image using parameter
        let ciImage:CIImage=CIImage(image:image!)!
       
        //Scan image using name
       // let image = UIImage(named: "pic1.png")
       // let ciImage:CIImage = CIImage(image: image!)!
        
        var qrCodeLink=""
        let features=detector.features(in: ciImage)
        for feature in features as! [CIQRCodeFeature] {
            qrCodeLink += feature.messageString!
        }
        if qrCodeLink=="" {
            print("nothing")
            messageLabel.text = "No QR code detected"
        }else{
            print("message: \(qrCodeLink)")
            messageLabel.text = qrCodeLink
            historyArray.insert(qrCodeLink, at: 0)
            UserDefaults.standard.set(historyArray, forKey : "history" )
            showHistory()
        }
    }//end
    
    @objc func showHistory(){
        self.performSegue(withIdentifier: "showHistory", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let history : QRHistory = segue.destination as! QRHistory
//        history.historyArraySegue = historyArray
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (captureSession?.isRunning == false) {
            //captureSession?.startRunning()
            viewDidLoad()
        }
        self.navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (captureSession?.isRunning == true) {
            captureSession?.stopRunning()
        }
    }
    
    //QR Code scan
    func qrCodeScaned(){
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
        // as the media type parameter.
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            // Detect all the supported bar code
            captureMetadataOutput.metadataObjectTypes = supportedBarCodes
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture
            captureSession?.startRunning()
            
            // Move the message label and library button to the top view
            view.bringSubview(toFront: messageLabel)
            view.bringSubview(toFront: libraryBtnOL )

            
            // Initialize QR Code Frame to highlight the QR code
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
    }
    
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code detected"
            return
        }
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        // Here we use filter method to check if the type of metadataObj is supported
        // Instead of hardcoding the AVMetadataObjectTypeQRCode, we check if the type
        // can be found in the array of supported bar codes.
        if supportedBarCodes.contains(metadataObj.type) {
            //        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            // Stop capture session
            videoPreviewLayer?.isHidden = true
            qrCodeFrameView?.isHidden = true
            self.captureSession?.stopRunning()
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
                historyArray.insert(metadataObj.stringValue!, at: 0)
                UserDefaults.standard.set(historyArray, forKey : "history" )
                showHistory()
            }
        }
    }
    
}

