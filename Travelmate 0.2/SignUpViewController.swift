//
//  SignUpViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 1/26/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestoreSwift
import FirebaseFirestore

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
      let name = FullNameTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              let phone =  phoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              //  let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              //let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              
              if passwordTextField.text != confirmpasswordTextField.text {let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert);let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                  
                  alertController.addAction(defaultAction)
                  self.present(alertController, animated: true, completion: nil)
              } else{
                  
                  // create a new user in your database
                  Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (AuthDataResult, Error) in
                      
                      if Error != nil{
                          
                          print(Error!, "creating user")
                      }else{
                         //User was created. Now store the remaining data in Firestore
                          //let db = Firestore.firestore()
                          let db = Firestore.firestore()
                          
                          db.collection("users").addDocument(data: ["name" : name, "phone":phone , "uid": AuthDataResult!.user.uid]){(error) in
                              
                              if error != nil{
                                  
                                  let alertController = UIAlertController(title: "Error Ocurred!", message: "User's Data couldn't be saved", preferredStyle: .alert);
                                  
                                  let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                  alertController.addAction(defaultAction)
                                       self.present(alertController, animated: true, completion: nil)
                              }
                              
                          }
                          self.transitionToHome()
                          
                          print("Successfully Registered")
                          
                          
                          
                      }
                  }
                  //ref.child("users").child(users.uid).setValue(["Phone": phoneTextField.text])
                  
                  
                  
              }
              
          }
          func transitionToHome() {
             let  loginviewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.LoginViewController) as? LoginViewController
              
              view.window?.rootViewController = loginviewController
              view.window?.makeKeyAndVisible()
          }
          
          
          
      }

