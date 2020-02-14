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
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (user,error) in
            
            if error != nil{
                
                let alertController = UIAlertController(title: "Invalid details", message: "Please Try-again", preferredStyle: .alert);
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                
            }else{
                let alertController = UIAlertController(title: "Welcome To", message: "TravelMate", preferredStyle: .alert);
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
               let appDelegate = UIApplication.shared.delegate! as! AppDelegate

               let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "HomeVC")
               appDelegate.window?.rootViewController = initialViewController
               appDelegate.window?.makeKeyAndVisible()
                
                //self.transitionToHome()
            }
            
        }
    }
    

    
   /* func transitionToHome() {
          let storyboard = UIStoryboard(name: "PendingOverview", bundle: nil)
          let tabbarVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? UITabBarController
        if let vcs = tabbarVC?.viewControllers,
             let nc = vcs.first as? UINavigationController,
             let pendingOverVC = nc.topViewController as? PendingOverViewController {

                pendingOverVC.pendingResult = pendingResult
          }
          self.present(tabbarVC, animated: false, completion: nil)
        
        
        
        
        let  loginviewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.LoginViewController) as? LoginViewController
        
        view.window?.rootViewController = loginviewController
        view.window?.makeKeyAndVisible()
      }
      */
}
