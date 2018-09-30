//
//  QRHistory.swift
//  Tafe Buddy
//
//  Created by Ti Chuot on 4/5/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit
class QRHistory: UIViewController,UITableViewDataSource {
    
   //var historyArraySegue = [String]()
    var history = UserDefaults.standard.object(forKey: "history") as? [String]
    let date = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.full, timeStyle: DateFormatter.Style.none)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(historyArraySegue.count)
        UserDefaults.standard.set(date, forKey: "dateScaned")
       
        //Self-sizing Table View Cells, doesn't need func heightForRowAt.
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    // Table view
    func numberOfSections(in tableView: UITableView) -> Int {return 1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if history == nil{
            return 0
        }
        else{
            return history!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text = historyArraySegue[indexPath.row]
       
        //Add multiple lines for table cell
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping

        cell.textLabel?.text = history?[indexPath.row]
        let dateTime = UserDefaults.standard.object(forKey: "dateScaned") as? String
        cell.detailTextLabel?.text = dateTime
        return cell
    }
    // End table view
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{return 60}
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{return 90}
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Scan History"}
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        return "Made by Ti Chuot"}

    //Delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            history?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
}
