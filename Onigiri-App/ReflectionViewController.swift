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
    
    @IBOutlet weak var question1Label: UILabel!
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
        
        
        // Load data
        if let reflection = reflection {
            question1Label.text = reflection.answer1
            question2Label.text = reflection.answer2
            question3Label.text = reflection.answer3
            question4Label.text = reflection.answer4
        } else {
            question1Label.text = answer1
            question2Label.text = answer2
            question3Label.text = answer3
            question4Label.text = answer4
        }
        
        if question1Label.text != "" {
            isExisting = true
        }
        
        // Delegates
        
        //question1Label.delegate = self
        
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
    
    // Save
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if isExisting == false {
            let answer1 = question1Label.text
            let answer2 = question2Label.text
            let answer3 = question3Label.text
            let answer4 = question4Label.text
            
            if let moc = managedObjectContext {
                let reflection = Reflection(context: moc)
            }
            
            reflection?.answer1 = answer1
            reflection?.answer2 = answer2
            reflection?.answer3 = answer3
            reflection?.answer4 = answer4
            
            saveToCoreData {
                let isPresentingInAddReflectionMode = self.presentedViewController is UINavigationController
                
                if isPresentingInAddReflectionMode {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.navigationController!.popViewController(animated: true)
                }
            }
        } else if isExisting == true {
            let reflection = self.reflection
            let managedObject = reflection
            
            managedObject?.setValue(question1Label.text, forKey: "answer1")
            managedObject?.setValue(question2Label.text, forKey: "answer2")
            managedObject?.setValue(question3Label.text, forKey: "answer3")
            managedObject?.setValue(question4Label.text, forKey: "answer4")
            
            do {
                try context.save()
                
                let isPresentingInnAddReflectionMode = self.presentedViewController is UINavigationController
                if isPresentingInnAddReflectionMode {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.navigationController!.popViewController(animated: true)
                }
            }
            
            catch {
                print("Failed to update existing note.")
            }
            
        }
        
    }
    
    
    // Cancel
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let isPresentingInnAddReflectionMode = presentingViewController is UINavigationController
        
        if isPresentingInnAddReflectionMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
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
