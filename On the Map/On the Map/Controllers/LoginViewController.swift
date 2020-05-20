//
//  ViewController.swift
//  On the Map
//
//  Created by osama on 5/1/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var ActivityIndictor: UIActivityIndicatorView!
    @IBOutlet weak var SignUp: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Email.delegate = self
        password.delegate = self
        Login.roundCorners()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        ActivityIndictor.startAnimating()
        enableControllers(false)
        
        guard  let email = Email.text, !email.isEmpty else {
            ActivityIndictor.stopAnimating()
            enableControllers(true)
            showInfo(withTitle: "Field required", withMessage: "Please fill in your email.")
            return
    }
        guard  let password = password.text, !password.isEmpty else {
            ActivityIndictor.stopAnimating()
            enableControllers(true)
            showInfo(withTitle: "Field required", withMessage: "Please fill in your password.")
            return
        }
        authenticateUser(email: email, password: password)

}
    
    @IBAction func signupPressed(_ sender: Any) {
         openWithSafari("https://auth.udacity.com/sign-up")
    }
    
    private func authenticateUser(email: String, password: String) {
        Client.shared().authenticateWith(userEmail: email, andPassword: password) { (success, errorMessage) in
            if success {
                self.performUIUpdatesOnMain {
                    self.Email.text = ""
                    self.password.text = ""
                }
                self.performSegue(withIdentifier: "showMap", sender: nil)
            } else {
                self.performUIUpdatesOnMain {
                    self.showInfo(withTitle: "Login falied", withMessage: errorMessage ?? "Error while performing login.")
                }
            }
            self.performUIUpdatesOnMain {
                self.ActivityIndictor.stopAnimating()
            }
            self.enableControllers(true)
        }
    }
    
    private func enableControllers(_ enable: Bool) {
        self.enableUI(views: Email, password, Login, SignUp, enable: enable)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

