//
//  ReflectionListTableViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit

class ReflectionListTableViewController: UITableViewController {
    
    @IBAction func unwindReflectionToList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ReflectionViewController
        
        if let reflection = sourceViewController.reflection {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                reflections[selectedIndexPath.row] = reflection
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: reflections.count, section: 0)
                reflections.append(reflection)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        Reflection.saveReflections(reflections)
    }
    
    
    var reflections = [Reflection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedReflections = Reflection.loadReflections() {
            reflections = savedReflections
        } else {return}
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return reflections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reflectionTableViewCell", for: indexPath)
        let reflection = reflections[indexPath.row]
        cell.textLabel?.text = reflection.answer1

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            reflections.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //else if editingStyle == .insert {}    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
