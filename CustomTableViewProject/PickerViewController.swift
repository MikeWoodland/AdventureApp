//
//  PickerViewController.swift
//  CustomTableViewProject
//
//  Created by Woodland on 6/13/17.
//  Copyright © 2017 MikeWoodland. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var locations = [String]()
    var selectedLocation: String = ""
    let vc = MyTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations = ["Oregon", "Seattle", "Hawaii"]

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedLocation = locations[row]
        
        return selectedLocation
    }

    @IBAction func addLocation(_ sender: Any) {
        data.append(selectedLocation)
        
        navigationController?.popViewController(animated: true)
    }


}
