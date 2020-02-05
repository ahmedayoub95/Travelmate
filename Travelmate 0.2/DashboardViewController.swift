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

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func SignOutPressed(_ sender: UIButton) {
        
        do{
            try Auth.auth().signOut()

           
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print("Error! Signing out")
        }
    }
    
    
    
    
}
