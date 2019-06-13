//
//  QuestionFourViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit

class QuestionFourViewController: UIViewController {
    
    @IBOutlet weak var answer4TextField: UITextField!
    @IBAction func weiterTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Question4ToReflection", sender: self)
    }
    
    var answer1: String!
    var answer2: String!
    var answer3: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Question4ToReflection" {
            let ReflectionViewController = segue.destination as! ReflectionViewController
            ReflectionViewController.answer1 = answer1
            ReflectionViewController.answer2 = answer2
            ReflectionViewController.answer3 = answer3
            ReflectionViewController.answer4 = answer4TextField.text
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
