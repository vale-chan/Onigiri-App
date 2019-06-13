//
//  QuestionTwoViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit

class QuestionTwoViewController: UIViewController {
    
    @IBOutlet weak var answer2TextField: UITextField!
    @IBAction func weiterTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Question2ToQuestion3", sender: self)
    }
    
    var answer1: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Question2ToQuestion3" {
            let Question3ViewController = segue.destination as! QuestionThreeViewController
            Question3ViewController.answer1 = answer1
            Question3ViewController.answer2 = answer2TextField.text
        }
    }

}
