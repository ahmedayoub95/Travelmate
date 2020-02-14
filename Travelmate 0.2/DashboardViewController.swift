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
    override func viewDidLoad() {
        super.viewDidLoad()
         modalPresentationStyle = .fullScreen
        
        CircularImageview.layer.cornerRadius = CircularImageview.frame.size.width/2
        CircularImageview.layer.shadowColor = UIColor.lightGray.cgColor
        CircularImageview.layer.shadowRadius = 10
        // Do additional setup after loading the view.
    }
    

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func EditProfileOptions(_ sender: Any) {
        
        
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
    
    func okHandler(alert: UIAlertAction!) {
        let viewController = EditViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func SignOutPressed(_ sender: UIButton) {
        
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print("Error! Signing out")
        }
    }
    
    func transitionToHome() {
    let  editprofileviewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.EditViewController) as? EditViewController
    
    view.window?.rootViewController = editprofileviewController
    view.window?.makeKeyAndVisible()
    }
    
    
    
}
