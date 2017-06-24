//
//  MenuViewController.swift
//  CustomTableViewProject
//
//  Created by Woodland on 6/19/17.
//  Copyright © 2017 MikeWoodland. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var menuNameArr: Array = [String]()
    var iconImage: Array = [UIImage]()
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menuNameArr = ["HOME","DISCOVER","PAST TRIPS","PROFILE","SETTINGS"]
        iconImage = [UIImage(named: "homeicon")!,UIImage(named:"adventureicon")!,UIImage(named: "globeicon")!,UIImage(named:"usericon")!,UIImage(named:"settingsicon")!]
        
        imgProfile.layer.borderColor = UIColor.white.cgColor
        imgProfile.layer.borderWidth = 2
        imgProfile.layer.cornerRadius = 50
        imgProfile.layer.masksToBounds = false
        imgProfile.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuNameArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.imgIcon.image = iconImage[indexPath.row]
        cell.lblMenuName.text = menuNameArr[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealViewController: SWRevealViewController = self.revealViewController()
        
        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.lblMenuName.text! == "HOME" {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "ViewControllerHome") as! ViewControllerHome
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.lblMenuName.text! == "DISCOVER" {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "MyTableViewController") as! MyTableViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.lblMenuName.text! == "PAST TRIPS" {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.lblMenuName.text! == "SETTINGS" {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
