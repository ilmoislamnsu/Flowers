//
//  MasterViewController.swift
//  Flower
//
//  Created by Shafiqul  Islam on 10/29/19.
//  Copyright © 2019 Shafiqul  Islam. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    // MARK: - Segues

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! ImagePresentationVc
                controller.image = imgArray[indexPath.row]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return imgArray.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel!.text = namesArray[indexPath.row]
            cell.backgroundColor = colorsArray[indexPath.row]
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if let navBarHeight = navigationController?.navigationBar.frame.height {
                 return (tableView.frame.height - navBarHeight) / CGFloat(imgArray.count)
                }
            else{
                return (tableView.frame.height - 60 ) / CGFloat(imgArray.count)
                }
        }
        
    }
