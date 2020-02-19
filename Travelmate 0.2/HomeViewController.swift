//
//  HomeViewController.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 2/18/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var DateTextField: UITextField!
    
    private var DatePicker: UIDatePicker?
    
        
    let datePicker = UIDatePicker()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        // Do any additional setup after loading the view.
     let image = UIImage(contentsOfFile:"square.and.pencil")
               navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
           }
           
           @objc func handleNewMessage() {
               
           }
    
    
    func showDatePicker(){
       //Formate Date
       datePicker.datePickerMode = .date

      //ToolBar
      let toolbar = UIToolbar();
      toolbar.sizeToFit()
      let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

     DateTextField.inputAccessoryView = toolbar
     DateTextField.inputView = datePicker

    }
    @objc func donedatePicker(){

      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      DateTextField.text = formatter.string(from: datePicker.date)
      self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }

    

    
}
