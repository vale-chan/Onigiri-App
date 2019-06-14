//
//  ReflectionViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit
import CoreData

class ReflectionViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var question1Label: UITextField!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var question3Label: UILabel!
    @IBOutlet weak var question4Label: UILabel!
    
    var answer1: String?
    var answer2: String?
    var answer3: String?
    var answer4: String?
    
    
    var managedObjectContext: NSManagedObjectContext? {
        return(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    var reflectionFetchedResultsController: NSFetchedResultsController<Reflection>!
    var reflections = [Reflection]()
    var reflection: Reflection?
    var isExisting = false
    var indexPath: Int?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        question1Label.text = answer1
        question2Label.text = answer2
        question3Label.text = answer3
        question4Label.text = answer4
        
        
        // Load data
        if let reflection = reflection {
            question1Label.text = reflection.answer1
            question2Label.text = reflection.answer2
            question3Label.text = reflection.answer3
            question4Label.text = reflection.answer4
        }
        
        if question1Label.text != "" {
            isExisting = true
        }
        
        // Delegates
        
        question1Label.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // CoreData
    
    func saveToCoreData(completion: @escaping() -> Void) {
        managedObjectContext!.perform {
            do {
                try self.managedObjectContext?.save()
                completion()
                print("Reflection saved to CoreData")
            }
            
            catch let error {
                print("Could not save reflection to CoreData: \(error.localizedDescription)")
            }
            
        }
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
