//
//  NewMessageViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 2/19/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit
import Firebase
class NewMessageViewController: UITableViewController {

    
    
    let cellId = "cellId"
      
      var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
fetchUser()
        // Do any additional setup after loading the view.
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
    }
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func fetchUser()  {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
            let user = User(dictionary: dictionary)
            self.users.append(user)
               
                DispatchQueue.main.async(execute:{
                    self.tableView.reloadData()
                })
            
            }
        }, withCancel: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return users.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // let use a hack for now, we actually need to dequeue our cells for memory efficiency
    //        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            
            let user = users[indexPath.row]
            cell.textLabel?.text = user.name
            cell.detailTextLabel?.text = user.email
            
            return cell
        }

}
