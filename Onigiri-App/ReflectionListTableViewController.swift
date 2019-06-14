//
//  ReflectionListTableViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit
import CoreData

class ReflectionListTableViewController: UITableViewController {
    
    var reflections = [Reflection]()
    
    var managedObjectContext: NSManagedObjectContext? {
        return(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        retriveReflections()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reflections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ReflectionTableViewCell", for: indexPath)
        let cell: ReflectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReflectionTableViewCell", for: indexPath) as! ReflectionTableViewCell
        
        let reflection: Reflection = reflections[indexPath.row]
        cell.configureCell(reflection: reflection)
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: <#T##[IndexPath]#>, with: .fade)
        }
        tableView.reloadData()
    }
    
    
    func retriveReflections() {
        managedObjectContext?.perform {
           
            self.fetchReflectionsFromCoreData { (reflections) in
                if let reflections = reflections {
                    self.reflections = reflections
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func fetchReflectionsFromCoreData(completion: @escaping([Reflection]?) -> Void) {
        managedObjectContext?.perform {
            var reflections = [Reflection]()
            let request: NSFetchRequest<Reflection> = Reflection.fetchRequest()
            
            do {
                reflections = try self.managedObjectContext!.fetch(request)
                completion(reflections)
            }
            
            catch {
                print("Could not reflections from CoreData: \(error.localizedDescription)")
            }
        
        }
    }
    

    
}
