//
//  EditViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 2/12/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestoreSwift
import FirebaseFirestore
class EditViewController: UIViewController {

    
    @IBOutlet weak var NameTextfield: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var LocationTextField: UITextField!
    @IBOutlet weak var GenderTxtField: UITextField!
    @IBOutlet weak var InterestTextField: UITextField!
    

    @IBOutlet weak var OccupationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func SubmitDataToFirebase(_ sender: Any) {
        
        let name = NameTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let location = LocationTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let gender = GenderTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let interest = InterestTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let occupation = OccupationTextField.text!
            .trimmingCharacters(in:.whitespacesAndNewlines)
        
       //  Auth.auth(){ (AuthDataResult, Error) in

        
        
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        let userID = user?.uid
        
       // db.collection("users").addDocument(data: ["name" : name, "phone":email , "uid": AuthDataResult?.user.uid]){(error) in
        
       // db.collection("users").addDocument(data: ["name" : name, "phone":email , "uid": AuthDataResult?.user.uid]) 
        db.collection("users").addDocument(data: ["name" : name, "age":email,"location": location,"gender": gender,"interest":interest,"occupation": occupation , "uid": userID!]){(error) in
            
            if error != nil{
                
                let alertController = UIAlertController(title: "Error Ocurred!", message: "User's Data couldn't be saved", preferredStyle: .alert);
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
               self.present(alertController, animated: true, completion: nil)
            }
            
        }
        }
        
        
    }
    
