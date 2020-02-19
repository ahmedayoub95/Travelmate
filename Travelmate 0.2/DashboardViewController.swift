//
//  DashboardViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 1/27/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class DashboardViewController: UIViewController{
    @IBOutlet weak var CircularImageview: UIImageView!
        @IBOutlet weak var ViewUserDetails: UIView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         modalPresentationStyle = .fullScreen
        
        CircularImageview.layer.cornerRadius = CircularImageview.frame.size.width/2
        CircularImageview.layer.shadowColor = UIColor.lightGray.cgColor
        CircularImageview.layer.shadowRadius = 10
        checkIfUserIsLoggedIn()
        
        
        // Do additional setup after loading the view.
    }
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid != nil{
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value ,with: { (snapshot) in
                if let dictionary = snapshot.value as? [String?: AnyObject]{
                    self.userNameLabel.text = dictionary["name"] as? String
                }
                })
        }
    }


    
    
    @IBAction func ActionsheetOptions(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Select Option", message: "", preferredStyle: .actionSheet)
        // let actionSheet = UIAlertController(nibName: "Select Option",bundle: .actionSheet)
         
         let EditAccount = UIAlertAction(title: "My Account", style: .default){ action in
             
         }
         
         let EditProfile = UIAlertAction(title: "Edit Profile", style: .default) { (action) in
             
             print("EDit Profile")
           //  self.transitionToHome()
             //self.performSegue(withIdentifier: "EditProfileVC", sender: Any?.self)
             //let viewController = EditViewController()
             //self.navigationController?.pushViewController(viewController, animated: true)
         }
         let login = UIAlertAction(title: "Logout", style: .destructive) { action in
             
             
         }
         let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
         
         actionSheet.addAction(EditProfile)
         actionSheet.addAction(EditAccount)
         actionSheet.addAction(login)
         actionSheet.addAction(Cancel)
         
         present(actionSheet,animated: true, completion: nil)
         
    }
    
//    @IBAction func EditProfileOptions(_ sender: Any) {
//        
//        
//        let actionSheet = UIAlertController(title: "Select Option", message: "", preferredStyle: .actionSheet)
//       // let actionSheet = UIAlertController(nibName: "Select Option",bundle: .actionSheet)
//        
//        let EditAccount = UIAlertAction(title: "My Account", style: .default){ action in
//            
//        }
//        
//        let EditProfile = UIAlertAction(title: "Edit Profile", style: .default) { (action) in
//            
//            print("EDit Profile")
//          //  self.transitionToHome()
//            //self.performSegue(withIdentifier: "EditProfileVC", sender: Any?.self)
//            //let viewController = EditViewController()
//            //self.navigationController?.pushViewController(viewController, animated: true)
//        }
//        let login = UIAlertAction(title: "Logout", style: .destructive) { action in
//            
//            
//        }
//        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        
//        actionSheet.addAction(EditProfile)
//        actionSheet.addAction(EditAccount)
//        actionSheet.addAction(login)
//        actionSheet.addAction(Cancel)
//        
//        present(actionSheet,animated: true, completion: nil)
//        
//    }
    
    func okHandler(alert: UIAlertAction!) {
        let viewController = EditViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
  
    @IBAction func SignOutPressed(_ sender: Any) {
        do{
                try Auth.auth().signOut()
               // let loginviewController = LoginViewController()
//        let viewController = LoginViewController()
//        self.navigationController?.pushViewController(viewController, animated: true)
            self.transitionToHome()
            }catch{
                print("Error! Signing out")
            }
    }
    
        
        
    
    
    func transitionToHome() {
        let  loginviewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.LoginViewController) as? LoginViewController
        
        view.window?.rootViewController = loginviewController
        view.window?.makeKeyAndVisible()
    }
    
    
    
}
