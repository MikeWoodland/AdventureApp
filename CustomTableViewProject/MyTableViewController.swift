//
//  MyTableViewController.swift
//  CustomTableViewProject
//
//  Created by Woodland on 6/13/17.
//  Copyright © 2017 MikeWoodland. All rights reserved.
//

import UIKit

var data = [String]()

class MyTableViewController: UITableViewController {

    let reuseIdentifier = "cell"
    var images = ["hawaii.jpg", "oregon.jpg", "seattle.jpg"]
    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    @IBOutlet var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(item, at: destinationIndexPath.row)
        
        
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        
        myTableView.isEditing = !myTableView.isEditing
        
        switch myTableView.isEditing {
        case true:
            editButton.title = "Done"
        default:
            editButton.title = "Edit"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyTableViewCell

        // Configure the cell...
        
        let destination = data[indexPath.row]
        cell.destLabel?.text = destination
        
        
        switch destination {
            case "Oregon":
                cell.destImage.image = UIImage(named: "oregon.jpg")
            case "Seattle":
                cell.destImage.image = UIImage(named: "seattle.jpg")
            case "Hawaii":
                cell.destImage.image = UIImage(named: "hawaii.jpg")
            default:
                cell.destImage.image = UIImage(named: "oregon.jpg")
            
        }

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}
