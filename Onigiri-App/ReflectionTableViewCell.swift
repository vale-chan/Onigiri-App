//
//  ReflectionTableViewCell.swift
//  Onigiri-App
//
//  Created by Vale-chan on 14.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit

class ReflectionTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(reflection: Reflection) {
        self.dateLabel.text = "do söt's äs datum werde"
        self.previewLabel.text = reflection.answer1
        
    }

}
