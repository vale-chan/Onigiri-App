//
//  QuestionOneViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


class QuestionOneViewController: UIViewController {
    
    @IBOutlet weak var answer1TextField: UITextField!
    @IBAction func weiterTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Question1ToQuestion2", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Question1ToQuestion2" {
            let Question2ViewController = segue.destination as! QuestionTwoViewController
            Question2ViewController.answer1 = answer1TextField.text
        }
    }

}
