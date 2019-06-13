//
//  QuestionThreeViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit


class QuestionThreeViewController: UIViewController {
    
    @IBOutlet weak var answer3TextField: UITextField!
    @IBAction func weiterTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Question3ToQuestion4", sender: self)
    }
    
    var answer1: String?
    var answer2: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

       
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Question3ToQuestion4" {
            let Question4ViewController = segue.destination as! QuestionFourViewController
            Question4ViewController.answer1 = answer1
            Question4ViewController.answer2 = answer2
            Question4ViewController.answer3 = answer3TextField.text
        }
    }

}
