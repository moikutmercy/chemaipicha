//
//  Login1ViewController.swift
//  Picha
//
//  Created by Edith Dande on 15/06/2023.
//

import UIKit

class Login1ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up secure text entry for password field
        passwordText.isSecureTextEntry = true
        
        // Add a target for text field editing change event
        usernameText.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        passwordText.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        // Disable the login button initially
        buttonLogin.isEnabled = false
    }
    
    // MARK: - Actions
    @IBAction func buttonLoginTap(_ sender: Any) {
        guard let username = usernameText.text, !username.isEmpty,
              let password = passwordText.text, !password.isEmpty else {
            showAlert(with: "Error", message: "Please enter both username and password.")
            return
        }
        UserDefaults.standard.setValue(username, forKey: "username")
        if isValidCredentials(username: username, password: password) {
            performSegue(withIdentifier: "LoginSuccessSegue", sender: nil)
//            self.moveToHomePage()
        } else {
            showAlert(with: "Error", message: "Invalid username or password.")
        }
    }

    
    // MARK: - Helper Methods
    private func isValidCredentials(username: String, password: String) -> Bool {
        // Implement your own logic for validating credentials
        // For example, you can compare against a predefined username and password
        let minUsernameLength = 4
        let minPasswordLength = 6
               
        let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
               
        return trimmedUsername.count >= minUsernameLength && trimmedPassword.count >= minPasswordLength
    }
    
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func textFieldEditingChanged() {
        // Validate text fields and enable/disable login button based on their contents
        let isUsernameValid = !(usernameText.text?.isEmpty ?? true)
        let isPasswordValid = !(passwordText.text?.isEmpty ?? true)
        buttonLogin.isEnabled = isUsernameValid && isPasswordValid
    }
    private func isValidUsername(_ username: String) -> Bool {
            // Implement your own username validation logic here
            // Example validation criteria:
            // - Username must have at least 4 characters
            let minUsernameLength = 4
            
            let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmedUsername.count >= minUsernameLength
        }
        
        private func isValidPassword(_ password: String) -> Bool {
            // Implement your own password validation logic here
            // Example validation criteria:
            // - Password must have at least 6 characters
            let minPasswordLength = 6
            
            let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmedPassword.count >= minPasswordLength
        }
    
    func moveToHomePage() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "home") as! ViewController
        homeVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    // Do any additional setup after loading the view.
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
