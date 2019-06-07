//
//  ViewController.swift
//  TableViewMultiSelect
//
//  Created by Soemsak on 7/6/2562 BE.
//  Copyright © 2562 Chatto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    let intervalNames = [
        "Unison",
        "Minor Second",
        "Major Second",
        "Minor Third",
        "Major Third",
        "Perfect Fourth",
        "Tritone",
        "Perfect Fifth",
        "Minor Sixth",
        "Major Sixth",
        "Minor seventh",
        "Major Seventh",
        "Octave",
        "Minor Ninth",
        "Major Ninth",
        "Minor Tenth",
        "Major Tenth",
        "Eleventh",
        "Augmented Eleventh",
        "Minor Thirteenth",
        "Major Thirteenth",
        "Augmented Thirteenth",
    ]
    
    let limit = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intervalNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.titleLabel.text = intervalNames[indexPath.row]
        cell.checkMarkImageView.image = UIImage(named: "un_check_mark")
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let sr = tableView.indexPathsForSelectedRows {
            if sr.count == limit {
                let alertController = UIAlertController(title: "Oops", message:
                    "You are limited to \(limit) selections", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                }))
                self.present(alertController, animated: true, completion: nil)
                
                return nil
            }
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected  \(intervalNames[indexPath.row])")
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell {
            if cell.isSelected {
                cell.checkMarkImageView.image = UIImage(named: "check_mark")
            }
        }
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("deselected  \(intervalNames[indexPath.row])")
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell {
            cell.checkMarkImageView.image = UIImage(named: "un_check_mark")
        }
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
        }
    }
    
}
