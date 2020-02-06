//
//  LoginViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 1/28/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonOutlet.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func SignInPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user,error) in
            
            if error != nil{
                print("Error..!!")
            }else{
                print("Successfully Logged In..!!")
                
                self.performSegue(withIdentifier: "goToTabBarController", sender: self)
            }
            
        }
    }
    
    
}
