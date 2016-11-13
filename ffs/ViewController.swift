//
//  ViewController.swift
//  ffs
//
//  Created by Valerie Chen on 11/11/16.
//  Copyright © 2016 Valerie Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: properties
    @IBOutlet weak var queryTextField: UITextField!
    @IBOutlet weak var runButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // handle text field's user input through delegate callbacks
        queryTextField.delegate = self
        checkValidInput()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidInput()
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Run button while editing.
        runButton.isEnabled = false
    }
    
    func checkValidInput() {
        // Disable the Save button if the text field is empty.
        let text = queryTextField.text ?? ""
        runButton.isEnabled = !text.isEmpty
    }
    
    // MARK: navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new item view controller
        
            print("correct sender")
            let query = queryTextField.text ?? ""
            if let NextViewController = segue.destination as? ItemViewController {
                print("correct view controller")
                NextViewController.query = query
                print("query should be set")
            }
            

        
        
    }


}

