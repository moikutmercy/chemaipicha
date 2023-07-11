//
//  LoginViewController.swift
//  Picha
//
//  Created by Edith Dande on 15/06/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
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
        func loginButtonTapped(_ sender: UIButton) {
        
        guard let username = usernameText.text, !username.isEmpty,
              let password = passwordText.text, !password.isEmpty else {
            showAlert(with: "Error", message: "Please enter both username and password.")
            return
        }
        
        if isValidCredentials(username: username, password: password) {
            showAlert(with: "Success", message: "Login successful!")
            // Perform additional actions after successful login
        } else {
            showAlert(with: "Error", message: "Invalid username or password.")
        }
    }
    
    // MARK: - Helper Methods
    private func isValidCredentials(username: String, password: String) -> Bool {
        // Implement your own logic for validating credentials
        // For example, you can compare against a predefined username and password
        let validUsername = "admin"
        let validPassword = "password"
        
        return username == validUsername && password == validPassword
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
