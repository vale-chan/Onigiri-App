//
//  ReflectionViewController.swift
//  Onigiri-App
//
//  Created by Vale-chan on 13.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit

class ReflectionViewController: UIViewController {
    
    @IBOutlet weak var question1Label: UILabel!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var question3Label: UILabel!
    @IBOutlet weak var question4Label: UILabel!
    
    var answer1: String?
    var answer2: String?
    var answer3: String?
    var answer4: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        question1Label.text = answer1
        question2Label.text = answer2
        question3Label.text = answer3
        question4Label.text = answer4
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
