//
//  MessageController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 2/19/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import Firebase
class MessageController: UITableViewController {
    
   // var ref: DatabaseReference!
//   let ref = Database.database().reference(fromURL: "")
    
    
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
                print("I am in Database")
                if let dictionary = snapshot.value as? [String: AnyObject]{
                    print(snapshot)
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
//                if let dictionary = snapshot.value as? [String: AnyObject] {
//                                   self.navigationItem.title = dictionary["name"] as? String
//                               }
                
                })
        }
    }
    



}
