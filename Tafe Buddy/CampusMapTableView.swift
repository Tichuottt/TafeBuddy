//
//  CampusMapTableView.swift
//  Tafe Buddy
//
//  Created by Ti Chuot on 7/4/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class CampusMapTableView: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    var campusArray : [CampusDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add Campus Location
        campusLocation()
    }
    
    // Table view
    func numberOfSections(in tableView: UITableView) -> Int {return 1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Add multiple lines for table cell
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
        let campus = campusArray[indexPath.row]
        cell.textLabel?.text = campus.title
        cell.detailTextLabel?.text = campus.subTitle //Go to table view cell change style to Subtitle
        return cell
    }// End table view
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{return 70}
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{return 40}
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{return 60}
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Campus Map"}
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        return "Made by Hứa Cát Lượng"}
    
    //var selectedRow = 0//(1)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let indexPath = tableView.indexPathForSelectedRow
                let campus = campusArray[(indexPath?.row)!]
                let controller : CampusMap = segue.destination as! CampusMap
                controller.detailItem = campus
      
    }
    
    //Campus Location
    func campusLocation(){
        let map1 = CampusDetails(latitude:-34.923990,longtitude: 138.59492,title:"Adelaide City Campus",subTitle:"Adult education school in the Adelaide city centre, South Australia")
        let map2 = CampusDetails(latitude:-34.924345,longtitude: 138.592337,title:"Adelaide College of the Arts",subTitle:"Art School in Adelaide South Australia")
        let map3 = CampusDetails(latitude:-34.762962,longtitude: 138.647457,title:"Salisbury Campus",subTitle:"Adult education in Salisbury, South Australia")
        let map4 = CampusDetails(latitude:-34.873225,longtitude: 138.568542,title:"Regency Campus",subTitle:"College in Regency Park, South Australia")
        let map5 = CampusDetails(latitude:-34.789226,longtitude: 138.635041,title:"Parafield Campus",subTitle:"Technical school in Parafield, South Australia")
        let map6 = CampusDetails(latitude:-34.970137,longtitude: 138.626863,title:"Urrbrae Campus",subTitle:"Adult education in Netherby, South Australia")
        let map7 = CampusDetails(latitude:-34.712285, longtitude: 138.671369, title: "Elizabeth Campus", subTitle: "College in Woodford, South Australia")
        let map8 = CampusDetails(latitude:-34.851231, longtitude: 138.651734, title: "Gilles Plains Campus", subTitle: "Adult Education in Gilles Plains, South Australia")
        let map9 = CampusDetails(latitude:-34.843514, longtitude: 138.500064, title: "Port Adelaide Campus", subTitle: "Adult Education in Port Adelaide, South Australia")
        let map10 = CampusDetails(latitude:-34.832087, longtitude: 138.695673, title: "Modbury Campus", subTitle: "Adult Education in Modbury, South Australia")
        let map11 = CampusDetails(latitude:-35.008670, longtitude: 138.571015, title: "Clovelly Park Campus", subTitle: "Adult Education in Clovelly, South Australia")
        let map12 = CampusDetails(latitude:-35.139967, longtitude: 138.497292, title: "Noarlunga Campus", subTitle: "Adult Education in Noarlunga, South Australia")
        let map13 = CampusDetails(latitude:-34.462525, longtitude: 138.984110, title: "Nuriootpa Campus", subTitle: "Adult Education in Nuriootpa, South Australia")
        let map14 = CampusDetails(latitude:-35.068789, longtitude: 138.854308, title: "Mount Barker Campus", subTitle: "Adult Education in Mount Barker, South Australia")
        let map15 = CampusDetails(latitude:-35.125573, longtitude: 139.277821, title: "Murray Bridge Campus", subTitle: "Adult Education in Murray Bridge, South Australia")
        campusArray=[map1,map2,map3,map4,map5,map6,map7,map8,map9,map10,map11,map12,map13,map14,map15]
        campusArray.sort( by: {$0.title < $1.title})
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
    }
    
    
}
