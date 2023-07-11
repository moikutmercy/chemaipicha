//
//  ViewController.swift
//  Picha
//
//  Created by Edith Dande on 13/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        
        // Get the current date and time
        let currentDate = Date()
        
        // Create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // Format the date as a string
//        let formattedDate = dateFormatter.string(from: currentDate)
        
        // Set the greeting label text
        let greeting = getGreeting()
        
        if let name = UserDefaults.standard.string(forKey: "username") {
            greetings.text =  greeting + " " + name.capitalized

        }else {
            greetings.text =  greeting
        }
        
    }
    
    func getGreeting() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        
        if hour >= 0 && hour < 12 {
            return "Good morning"
        } else if hour >= 12 && hour < 17 {
            return "Good afternoon"
        } else {
            return "Good evening"
        }
    }
        // Do any additional setup after loading the view.
    }


