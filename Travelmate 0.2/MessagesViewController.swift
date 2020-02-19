//
//  MessagesViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 1/27/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class MessagesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
        checkIfUserIsLoggedIn()
        // Do any additional setup after loading the view.
         let image = UIImage(named: "new_message_icon")
               navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
    }
    
    @objc func handleNewMessage() {
        let newMessageController = NewMessageController()
       
       let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid != nil {
    
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                                   self.navigationItem.title = dictionary["name"] as? String
                               }
                
                }, withCancel: nil)
        }
    }
    


    @IBOutlet var chatOutlet: UITableView!
  
    
    
    
    
    

}
