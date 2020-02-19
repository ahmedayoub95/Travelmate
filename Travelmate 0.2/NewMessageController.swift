//
//  NewMessageController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 2/19/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import  Firebase
class NewMessageController: UITableViewController {

    let cellId = "cellId"
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        //tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
       fetchUser()
    }
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in

            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User(dictionary: dictionary)
                self.users.append(user)

                //this will crash because of background thread, so lets use dispatch_async to fix
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }

            }, withCancel: nil)
    }

   @objc func handleCancel() {
       dismiss(animated: true, completion: nil)
  }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = "Dumm Text Here!"
        return cell
        
    }

}
