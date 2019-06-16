//
//  Reflection.swift
//  Onigiri-App
//
//  Created by Vale-chan on 16.06.19.
//  Copyright © 2019 Vale-chan. All rights reserved.
//

import UIKit

struct Reflection: Codable {
    
    var date = Date()
    var answer1: String
    var answer2: String?
    var answer3: String?
    var answer4: String?
    
    static func loadReflections() -> [Reflection]? {
        guard let codedReflections = try? Data(contentsOf: ArchiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Reflection>.self, from: codedReflections)
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("reflections").appendingPathExtension("plist")
    
    static func loadSampleReflections() -> [Reflection]? {
        let reflection1 = Reflection(date: Date(), answer1: "asdf", answer2: "afdg", answer3: "oöih", answer4: "lhbd")
        let reflection2 = Reflection(date: Date(), answer1: "asdf", answer2: "afdg", answer3: "oöih", answer4: "lhbd")
        
        return [reflection1, reflection2]
    }
    
    static func saveReflections(_ reflections: [Reflection]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedReflections = try? propertyListEncoder.encode(reflections)
        try? codedReflections?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    } ()
}
