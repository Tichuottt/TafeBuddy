//
//  CampusDetails.swift
//  Tafe Buddy
//
//  Created by Ti Chuot on 7/4/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import Foundation

public class CampusDetails{
    
    var latitude : Double
    var longtitude : Double
    var title : String
    var subTitle : String
    
    
//    public init(){
//        self.latitude = 0
//        self.longtitude = 0
//        self.title = ""
//        self.subTitle = ""
//    }
    
    public init(latitude:Double,longtitude:Double,title:String,subTitle:String){
        self.latitude = latitude
        self.longtitude = longtitude
        self.title = title
        self.subTitle = subTitle
    }
    
    
}
