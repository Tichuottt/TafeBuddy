//
//  File.swift
//  Tafe Buddy
//
//  Created by Ti Chuot on 11/4/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class Settings: UIViewController {
    
    var array = [AnyObject]()
    
    func numberOfSections(in tableView: UITableView) -> Int {return 1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{return 70}
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{return 60}
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{return 90}
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Settings"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        return "Made by Ti Chuot"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let object = objects[indexPath.row] as! NSDate
       // let campus = array[indexPath.row]
       // cell.textLabel?.text = campus.title
       // cell.detailTextLabel?.text = campus.subTitle //Go to table view cell change style to Subtitle
        return cell
    }
    
    var selectedRow = 0//(1)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedRow = indexPath.row
        print(selectedRow)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
