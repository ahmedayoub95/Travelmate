//
//  SignUpViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 1/26/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpViewController: UIViewController {

       var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        joinButtonOutlet.layer.cornerRadius = 15
      
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var FullNameTextFeild: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmpasswordTextField: UITextField!
    
 

    
    @IBOutlet weak var joinButtonOutlet: UIButton!
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        // create a new user in your database
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (AuthDataResult, Error) in
            
            if Error != nil{
                print(Error!)
            }else{
                print("Successfully Registered")
            }
                   }
      //  ref?.child("users").childByAutoId().child("Phone").setValue(phoneTextField.text)
        
    }
    
    
   
}
