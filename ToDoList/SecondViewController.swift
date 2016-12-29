//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Xuehua Chen on 12/29/16.
//  Copyright © 2016 Xuehua Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addToDo(_ sender: Any) {
        print("hello")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("hello1")
        textField.resignFirstResponder()
        return true
    }
}

