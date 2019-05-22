//
//  ViewController.swift
//  TableViewIndexed
//
//  Created by Greeens5 on 21/05/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var teamdict = [String: [String]]()
    var teamSectionTitles = [String]()
    var teams = [String]()
    var teamtitles = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let teamKey = teamSectionTitles[section]
        guard let teamvalues = teamdict[teamKey]
        else
        {
            return 0
        }
            return teamvalues.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        let teamKey = teamSectionTitles[indexPath.section]
        if let teamvalues = teamdict[teamKey] {
            cell.textLabel?.text = teamvalues[indexPath.row]
        }
        return cell
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return teamSectionTitles.count
    }
   
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return teamSectionTitles
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return teamSectionTitles[section]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        teams = ["India", "Australia", "America", "England", "West Indies", "Pakistan", "Ireland", "Sri Lanka", "South Africa", "New Zealand", "Bangladesh"]
        for team in teams {
            let teamKey = String(team.prefix(1))
            if var teamvalues = teamdict[teamKey] {
                teamvalues.append(team)
                teamdict[teamKey] = teamvalues
            } else {
                teamdict[teamKey] = [team]
            }
        }
        teamSectionTitles = [String](teamdict.keys)
        teamSectionTitles = teamSectionTitles.sorted(by: { $0 < $1 })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

